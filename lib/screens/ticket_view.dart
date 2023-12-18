import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/layout_builder.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/models.dart';
import '../widgets/column_layout.dart';

class TicketView extends StatefulWidget {
  final Ticket ticket;
  final bool? isColor;
  const TicketView({Key? key,required this.ticket,this.isColor}) : super(key: key);

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(162),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //blue part of card
            Container(
              decoration: BoxDecoration(
                color: widget.isColor == null ? Color(0xFF526799) : Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)),topRight: Radius.circular(AppLayout.getHeight(21)))
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(widget.ticket.from.code.toString(),style: widget.isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3,),
                      Expanded(child: Container()),
                      ThickContainer(isColor: widget.isColor,),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child: AppLayoutBuilderWidget(sections: 6,isColor: widget.isColor,),
                            // LayoutBuilder(
                            //   builder: (BuildContext context, BoxConstraints constraints) {
                            //     print('the width is ${constraints.constrainWidth()}');
                            //     return Flex(
                            //       direction: Axis.horizontal,
                            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //       mainAxisSize: MainAxisSize.max,
                            //       children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                            //         width: 3,
                            //         height: 1,
                            //         child: DecoratedBox(decoration: BoxDecoration(
                            //           color:  isColor == null ? Colors.white : Colors.grey.shade300
                            //         ),),
                            //       )),
                            //     );
                            //   },
                            // ),
                          ),
                          Center(child: Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport_rounded,color:  widget.isColor == null ? Colors.white : Color(0xFF8ACCF7),))),
                        ],
                      )),
                      ThickContainer(isColor: widget.isColor,),
                      Expanded(child: Container()),
                      Text(
                        widget.ticket.to.code.toString(),
                          // widget.ticket['to']['code'],
                          style: widget.isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                            // widget.ticket['from']['name'],
                          widget.ticket.from.name.toString(),
                            style: widget.isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4),
                      ),
                      Text(
                          // widget.ticket['flying_time'],
                          widget.ticket.flying_time.toString(),
                          style: widget.isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white,) : Styles.headLineStyle4 ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          widget.ticket.to.name.toString(),
                            // widget.ticket['to']['name'],
                          textAlign: TextAlign.end, style: widget.isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //between circle part of card
            Container(
              color:  widget.isColor == null ? Styles.orangeColor : Colors.white,
              child: Row(
                children: [
                  //left side circle
                   SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:  widget.isColor == null ? Colors.grey.shade200 : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.max,
                            children: List.generate((constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                              width: 5,height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color:  widget.isColor == null ? Colors.white : Colors.grey.shade300,
                                ),
                              ),
                            ))
                        );
                      },
                    ),
                  )),
                  //rigth side circle
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:  widget.isColor == null ? Colors.grey.shade200 : Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //bottom part of card
            Container(
              decoration: BoxDecoration(
                  color:  widget.isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(widget.isColor == null ? 21 : 0),
                      bottomRight: Radius.circular(widget.isColor == null ? 21 : 0)),
              ),
              padding: const EdgeInsets.only(left: 16,top: 10,right: 16,bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                        firstText: widget.ticket.date.toString(),
                        secondText: 'Date',
                        alignment: CrossAxisAlignment.start,
                        isColor: widget.isColor,
                      ),
                      AppColumnLayout(
                        firstText: widget.ticket.departure_time.toString(),
                        secondText: 'Departure time',
                        alignment: CrossAxisAlignment.center,
                        isColor: widget.isColor,
                      ),
                      AppColumnLayout(
                        firstText: widget.ticket.number.toString(),
                        secondText: 'Number',
                        alignment: CrossAxisAlignment.end,
                        isColor: widget.isColor,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
