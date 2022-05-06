import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  KrediDropdownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'Kredi',
            style: TextStyle(fontSize: 12, color: Sabitler.anaRenk),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: Sabitler.dropDownPadding,
          decoration: BoxDecoration(
            color: Sabitler.anaRenk.shade100.withOpacity(0.3),
            borderRadius: Sabitler.borderRadius,
          ),
          child: DropdownButton<double>(
            value: secilenKrediDegeri,
            elevation: 16,
            iconEnabledColor: Sabitler.anaRenk.shade200,
            onChanged: (deger) {
              setState(() {
                secilenKrediDegeri = deger!;
                widget.onKrediSecildi(secilenKrediDegeri);
              });
            },
            underline: Container(),
            items: DataHelper.tumDerslerinKredileri(),
          ),
        ),
      ],
    );
  }
}
