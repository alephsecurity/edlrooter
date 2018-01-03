# edlrooter

By Roee Hay ([@roeehay](https://twitter.com/roeehay)), Aleph Research

`adb` shell -> root exploit for Google Nexus 6 using a [leaked](https://forum.xda-developers.com/nexus-6/general/fix-fix-qhusbbulk-cm12-t3059518) Qualcomm Emergency Download (EDL) Mode programmer

Exploits CVE-2017-13174 for downgrading ABOOT to a CVE-2016-10277 ([initroot](https://github.com/alephsecurity/initroot) susceptible version).

Please note:
1. Google could not reproduce our PoC (getting into EDL).
2. Our test device has a relocked bootloader.

More details:
1. [Blog](https://alephsecurity.com/2018/01/22/qualcomm-edl-1/)
2. [Advisory](https://alephsecurity.com/vulns/aleph-2017025)

