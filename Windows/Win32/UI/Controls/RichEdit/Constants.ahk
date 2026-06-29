#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global cchTextLimitDefault := 32767

/**
 * @type {String}
 */
export global MSFTEDIT_CLASS := "RICHEDIT50W"

/**
 * @type {String}
 */
export global CERICHEDIT_CLASSA := "RichEditCEA"

/**
 * @type {String}
 */
export global CERICHEDIT_CLASSW := "RichEditCEW"

/**
 * @type {String}
 */
export global RICHEDIT_CLASSA := "RichEdit20A"

/**
 * @type {String}
 */
export global RICHEDIT_CLASS10A := "RICHEDIT"

/**
 * @type {String}
 */
export global RICHEDIT_CLASSW := "RichEdit20W"

/**
 * @type {String}
 */
export global RICHEDIT_CLASS := "RichEdit20W"

/**
 * @type {Integer (UInt32)}
 */
export global EM_CANPASTE := 1074

/**
 * @type {Integer (UInt32)}
 */
export global EM_DISPLAYBAND := 1075

/**
 * @type {Integer (UInt32)}
 */
export global EM_EXGETSEL := 1076

/**
 * @type {Integer (UInt32)}
 */
export global EM_EXLIMITTEXT := 1077

/**
 * @type {Integer (UInt32)}
 */
export global EM_EXLINEFROMCHAR := 1078

/**
 * @type {Integer (UInt32)}
 */
export global EM_EXSETSEL := 1079

/**
 * @type {Integer (UInt32)}
 */
export global EM_FINDTEXT := 1080

/**
 * @type {Integer (UInt32)}
 */
export global EM_FORMATRANGE := 1081

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETCHARFORMAT := 1082

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETEVENTMASK := 1083

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETOLEINTERFACE := 1084

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETPARAFORMAT := 1085

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETSELTEXT := 1086

/**
 * @type {Integer (UInt32)}
 */
export global EM_HIDESELECTION := 1087

/**
 * @type {Integer (UInt32)}
 */
export global EM_PASTESPECIAL := 1088

/**
 * @type {Integer (UInt32)}
 */
export global EM_REQUESTRESIZE := 1089

/**
 * @type {Integer (UInt32)}
 */
export global EM_SELECTIONTYPE := 1090

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETBKGNDCOLOR := 1091

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETCHARFORMAT := 1092

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETEVENTMASK := 1093

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETOLECALLBACK := 1094

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETPARAFORMAT := 1095

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETTARGETDEVICE := 1096

/**
 * @type {Integer (UInt32)}
 */
export global EM_STREAMIN := 1097

/**
 * @type {Integer (UInt32)}
 */
export global EM_STREAMOUT := 1098

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTEXTRANGE := 1099

/**
 * @type {Integer (UInt32)}
 */
export global EM_FINDWORDBREAK := 1100

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETOPTIONS := 1101

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETOPTIONS := 1102

/**
 * @type {Integer (UInt32)}
 */
export global EM_FINDTEXTEX := 1103

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETWORDBREAKPROCEX := 1104

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETWORDBREAKPROCEX := 1105

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETUNDOLIMIT := 1106

/**
 * @type {Integer (UInt32)}
 */
export global EM_REDO := 1108

/**
 * @type {Integer (UInt32)}
 */
export global EM_CANREDO := 1109

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETUNDONAME := 1110

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETREDONAME := 1111

/**
 * @type {Integer (UInt32)}
 */
export global EM_STOPGROUPTYPING := 1112

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETTEXTMODE := 1113

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTEXTMODE := 1114

/**
 * @type {Integer (UInt32)}
 */
export global EM_AUTOURLDETECT := 1115

/**
 * @type {Integer (UInt32)}
 */
export global AURL_ENABLEURL := 1

/**
 * @type {Integer (UInt32)}
 */
export global AURL_ENABLEEMAILADDR := 2

/**
 * @type {Integer (UInt32)}
 */
export global AURL_ENABLETELNO := 4

/**
 * @type {Integer (UInt32)}
 */
export global AURL_ENABLEEAURLS := 8

/**
 * @type {Integer (UInt32)}
 */
export global AURL_ENABLEDRIVELETTERS := 16

/**
 * @type {Integer (UInt32)}
 */
export global AURL_DISABLEMIXEDLGC := 32

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETAUTOURLDETECT := 1116

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETPALETTE := 1117

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTEXTEX := 1118

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTEXTLENGTHEX := 1119

/**
 * @type {Integer (UInt32)}
 */
export global EM_SHOWSCROLLBAR := 1120

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETTEXTEX := 1121

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETPUNCTUATION := 1124

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETPUNCTUATION := 1125

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETWORDWRAPMODE := 1126

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETWORDWRAPMODE := 1127

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETIMECOLOR := 1128

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETIMECOLOR := 1129

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETIMEOPTIONS := 1130

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETIMEOPTIONS := 1131

/**
 * @type {Integer (UInt32)}
 */
export global EM_CONVPOSITION := 1132

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETLANGOPTIONS := 1144

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETLANGOPTIONS := 1145

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETIMECOMPMODE := 1146

/**
 * @type {Integer (UInt32)}
 */
export global EM_FINDTEXTW := 1147

/**
 * @type {Integer (UInt32)}
 */
export global EM_FINDTEXTEXW := 1148

/**
 * @type {Integer (UInt32)}
 */
export global EM_RECONVERSION := 1149

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETIMEMODEBIAS := 1150

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETIMEMODEBIAS := 1151

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETBIDIOPTIONS := 1224

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETBIDIOPTIONS := 1225

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETTYPOGRAPHYOPTIONS := 1226

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTYPOGRAPHYOPTIONS := 1227

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETEDITSTYLE := 1228

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETEDITSTYLE := 1229

/**
 * @type {Integer (UInt32)}
 */
export global SES_EMULATESYSEDIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SES_BEEPONMAXTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SES_EXTENDBACKCOLOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SES_MAPCPS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SES_HYPERLINKTOOLTIPS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SES_EMULATE10 := 16

/**
 * @type {Integer (UInt32)}
 */
export global SES_DEFAULTLATINLIGA := 16

/**
 * @type {Integer (UInt32)}
 */
export global SES_USECRLF := 32

/**
 * @type {Integer (UInt32)}
 */
export global SES_NOFOCUSLINKNOTIFY := 32

/**
 * @type {Integer (UInt32)}
 */
export global SES_USEAIMM := 64

/**
 * @type {Integer (UInt32)}
 */
export global SES_NOIME := 128

/**
 * @type {Integer (UInt32)}
 */
export global SES_ALLOWBEEPS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SES_UPPERCASE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SES_LOWERCASE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SES_NOINPUTSEQUENCECHK := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SES_BIDI := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SES_SCROLLONKILLFOCUS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SES_XLTCRCRLFTOCR := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SES_DRAFTMODE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SES_USECTF := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SES_HIDEGRIDLINES := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SES_USEATFONT := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SES_CUSTOMLOOK := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SES_LBSCROLLNOTIFY := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SES_CTFALLOWEMBED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SES_CTFALLOWSMARTTAG := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SES_CTFALLOWPROOFING := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SES_LOGICALCARET := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SES_WORDDRAGDROP := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SES_SMARTDRAGDROP := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SES_MULTISELECT := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SES_CTFNOLOCK := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SES_NOEALINEHEIGHTADJUST := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SES_MAX := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IMF_AUTOKEYBOARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMF_AUTOFONT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMF_IMECANCELCOMPLETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMF_IMEALWAYSSENDNOTIFY := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMF_AUTOFONTSIZEADJUST := 16

/**
 * @type {Integer (UInt32)}
 */
export global IMF_UIFONTS := 32

/**
 * @type {Integer (UInt32)}
 */
export global IMF_NOIMPLICITLANG := 64

/**
 * @type {Integer (UInt32)}
 */
export global IMF_DUALFONT := 128

/**
 * @type {Integer (UInt32)}
 */
export global IMF_NOKBDLIDFIXUP := 512

/**
 * @type {Integer (UInt32)}
 */
export global IMF_NORTFFONTSUBSTITUTE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IMF_SPELLCHECKING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IMF_TKBPREDICTION := 4096

/**
 * @type {Integer (UInt32)}
 */
export global IMF_IMEUIINTEGRATION := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ICM_NOTOPEN := 0

/**
 * @type {Integer (UInt32)}
 */
export global ICM_LEVEL3 := 1

/**
 * @type {Integer (UInt32)}
 */
export global ICM_LEVEL2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ICM_LEVEL2_5 := 3

/**
 * @type {Integer (UInt32)}
 */
export global ICM_LEVEL2_SUI := 4

/**
 * @type {Integer (UInt32)}
 */
export global ICM_CTF := 5

/**
 * @type {Integer (UInt32)}
 */
export global TO_ADVANCEDTYPOGRAPHY := 1

/**
 * @type {Integer (UInt32)}
 */
export global TO_SIMPLELINEBREAK := 2

/**
 * @type {Integer (UInt32)}
 */
export global TO_DISABLECUSTOMTEXTOUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TO_ADVANCEDLAYOUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global EM_OUTLINE := 1244

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETSCROLLPOS := 1245

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETSCROLLPOS := 1246

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETFONTSIZE := 1247

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETZOOM := 1248

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETZOOM := 1249

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETVIEWKIND := 1250

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETVIEWKIND := 1251

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETPAGE := 1252

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETPAGE := 1253

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETHYPHENATEINFO := 1254

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETHYPHENATEINFO := 1255

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETPAGEROTATE := 1259

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETPAGEROTATE := 1260

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETCTFMODEBIAS := 1261

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETCTFMODEBIAS := 1262

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETCTFOPENSTATUS := 1264

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETCTFOPENSTATUS := 1265

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETIMECOMPTEXT := 1266

/**
 * @type {Integer (UInt32)}
 */
export global EM_ISIME := 1267

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETIMEPROPERTY := 1268

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETQUERYRTFOBJ := 1293

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETQUERYRTFOBJ := 1294

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETQUERYCONVERTOLELINKCALLBACK := 1427

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETDISABLEOLELINKCONVERSION := 1428

/**
 * @type {Integer (UInt32)}
 */
export global EPR_0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global EPR_270 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EPR_180 := 2

/**
 * @type {Integer (UInt32)}
 */
export global EPR_90 := 3

/**
 * @type {Integer (UInt32)}
 */
export global EPR_SE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_FILENAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_READING := 3

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_DATETIME := 4

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_CONVERSATION := 5

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_NUMERIC := 6

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_HIRAGANA := 7

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_KATAKANA := 8

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_HANGUL := 9

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_HALFWIDTHKATAKANA := 10

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_FULLWIDTHALPHANUMERIC := 11

/**
 * @type {Integer (UInt32)}
 */
export global CTFMODEBIAS_HALFWIDTHALPHANUMERIC := 12

/**
 * @type {Integer (UInt32)}
 */
export global IMF_SMODE_PLAURALCLAUSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMF_SMODE_NONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EMO_EXIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global EMO_ENTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global EMO_PROMOTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EMO_EXPAND := 3

/**
 * @type {Integer (UInt32)}
 */
export global EMO_MOVESELECTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global EMO_GETVIEWMODE := 5

/**
 * @type {Integer (UInt32)}
 */
export global EMO_EXPANDSELECTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global EMO_EXPANDDOCUMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global VM_NORMAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global VM_OUTLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global VM_PAGE := 9

/**
 * @type {Integer (UInt32)}
 */
export global EM_INSERTTABLE := 1256

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETAUTOCORRECTPROC := 1257

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETAUTOCORRECTPROC := 1258

/**
 * @type {Integer (UInt32)}
 */
export global EM_CALLAUTOCORRECTPROC := 1279

/**
 * @type {Integer (UInt32)}
 */
export global ATP_NOCHANGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ATP_CHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATP_NODELIMITER := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATP_REPLACEALLTEXT := 4

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTABLEPARMS := 1289

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETEDITSTYLEEX := 1299

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETEDITSTYLEEX := 1300

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_NOTABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_NOMATH := 64

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_HANDLEFRIENDLYURL := 256

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_NOTHEMING := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_NOACETATESELECTION := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_USESINGLELINE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_MULTITOUCH := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_HIDETEMPFORMAT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SES_EX_USEMOUSEWPARAM := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETSTORYTYPE := 1314

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETSTORYTYPE := 1315

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETELLIPSISMODE := 1329

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETELLIPSISMODE := 1330

/**
 * @type {Integer (UInt32)}
 */
export global ELLIPSIS_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global ELLIPSIS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ELLIPSIS_END := 1

/**
 * @type {Integer (UInt32)}
 */
export global ELLIPSIS_WORD := 3

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETTABLEPARMS := 1331

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETTOUCHOPTIONS := 1334

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETTOUCHOPTIONS := 1335

/**
 * @type {Integer (UInt32)}
 */
export global EM_INSERTIMAGE := 1338

/**
 * @type {Integer (UInt32)}
 */
export global EM_SETUIANAME := 1344

/**
 * @type {Integer (UInt32)}
 */
export global EM_GETELLIPSISSTATE := 1346

/**
 * @type {Integer (UInt32)}
 */
export global RTO_SHOWHANDLES := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTO_DISABLEHANDLES := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTO_READINGMODE := 3

/**
 * @type {Integer (UInt32)}
 */
export global EN_MSGFILTER := 1792

/**
 * @type {Integer (UInt32)}
 */
export global EN_REQUESTRESIZE := 1793

/**
 * @type {Integer (UInt32)}
 */
export global EN_SELCHANGE := 1794

/**
 * @type {Integer (UInt32)}
 */
export global EN_DROPFILES := 1795

/**
 * @type {Integer (UInt32)}
 */
export global EN_PROTECTED := 1796

/**
 * @type {Integer (UInt32)}
 */
export global EN_CORRECTTEXT := 1797

/**
 * @type {Integer (UInt32)}
 */
export global EN_STOPNOUNDO := 1798

/**
 * @type {Integer (UInt32)}
 */
export global EN_IMECHANGE := 1799

/**
 * @type {Integer (UInt32)}
 */
export global EN_SAVECLIPBOARD := 1800

/**
 * @type {Integer (UInt32)}
 */
export global EN_OLEOPFAILED := 1801

/**
 * @type {Integer (UInt32)}
 */
export global EN_OBJECTPOSITIONS := 1802

/**
 * @type {Integer (UInt32)}
 */
export global EN_LINK := 1803

/**
 * @type {Integer (UInt32)}
 */
export global EN_DRAGDROPDONE := 1804

/**
 * @type {Integer (UInt32)}
 */
export global EN_PARAGRAPHEXPANDED := 1805

/**
 * @type {Integer (UInt32)}
 */
export global EN_PAGECHANGE := 1806

/**
 * @type {Integer (UInt32)}
 */
export global EN_LOWFIRTF := 1807

/**
 * @type {Integer (UInt32)}
 */
export global EN_ALIGNLTR := 1808

/**
 * @type {Integer (UInt32)}
 */
export global EN_ALIGNRTL := 1809

/**
 * @type {Integer (UInt32)}
 */
export global EN_CLIPFORMAT := 1810

/**
 * @type {Integer (UInt32)}
 */
export global EN_STARTCOMPOSITION := 1811

/**
 * @type {Integer (UInt32)}
 */
export global EN_ENDCOMPOSITION := 1812

/**
 * @type {Integer (UInt32)}
 */
export global ENM_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ENM_CHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENM_UPDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ENM_SCROLL := 4

/**
 * @type {Integer (UInt32)}
 */
export global ENM_SCROLLEVENTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global ENM_DRAGDROPDONE := 16

/**
 * @type {Integer (UInt32)}
 */
export global ENM_PARAGRAPHEXPANDED := 32

/**
 * @type {Integer (UInt32)}
 */
export global ENM_PAGECHANGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global ENM_CLIPFORMAT := 128

/**
 * @type {Integer (UInt32)}
 */
export global ENM_KEYEVENTS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ENM_MOUSEEVENTS := 131072

/**
 * @type {Integer (UInt32)}
 */
export global ENM_REQUESTRESIZE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global ENM_SELCHANGE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global ENM_DROPFILES := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global ENM_PROTECTED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global ENM_CORRECTTEXT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global ENM_IMECHANGE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global ENM_LANGCHANGE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global ENM_OBJECTPOSITIONS := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global ENM_LINK := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global ENM_LOWFIRTF := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global ENM_STARTCOMPOSITION := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global ENM_ENDCOMPOSITION := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global ENM_GROUPTYPINGCHANGE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ENM_HIDELINKTOOLTIP := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global ES_SAVESEL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ES_SUNKEN := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ES_DISABLENOSCROLL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ES_SELECTIONBAR := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global ES_NOOLEDRAGDROP := 8

/**
 * @type {Integer (UInt32)}
 */
export global ES_EX_NOCALLOLEINIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ES_VERTICAL := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global ES_NOIME := 524288

/**
 * @type {Integer (UInt32)}
 */
export global ES_SELFIME := 262144

/**
 * @type {Integer (UInt32)}
 */
export global ECO_AUTOWORDSELECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global ECO_AUTOVSCROLL := 64

/**
 * @type {Integer (UInt32)}
 */
export global ECO_AUTOHSCROLL := 128

/**
 * @type {Integer (UInt32)}
 */
export global ECO_NOHIDESEL := 256

/**
 * @type {Integer (UInt32)}
 */
export global ECO_READONLY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ECO_WANTRETURN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ECO_SAVESEL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ECO_SELECTIONBAR := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global ECO_VERTICAL := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global ECOOP_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global ECOOP_OR := 2

/**
 * @type {Integer (UInt32)}
 */
export global ECOOP_AND := 3

/**
 * @type {Integer (UInt32)}
 */
export global ECOOP_XOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global WB_MOVEWORDPREV := 4

/**
 * @type {Integer (UInt32)}
 */
export global WB_MOVEWORDNEXT := 5

/**
 * @type {Integer (UInt32)}
 */
export global WB_PREVBREAK := 6

/**
 * @type {Integer (UInt32)}
 */
export global WB_NEXTBREAK := 7

/**
 * @type {Integer (UInt32)}
 */
export global PC_FOLLOWING := 1

/**
 * @type {Integer (UInt32)}
 */
export global PC_LEADING := 2

/**
 * @type {Integer (UInt32)}
 */
export global PC_OVERFLOW := 3

/**
 * @type {Integer (UInt32)}
 */
export global PC_DELIMITER := 4

/**
 * @type {Integer (UInt32)}
 */
export global WBF_WORDWRAP := 16

/**
 * @type {Integer (UInt32)}
 */
export global WBF_WORDBREAK := 32

/**
 * @type {Integer (UInt32)}
 */
export global WBF_OVERFLOW := 64

/**
 * @type {Integer (UInt32)}
 */
export global WBF_LEVEL1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global WBF_LEVEL2 := 256

/**
 * @type {Integer (UInt32)}
 */
export global WBF_CUSTOM := 512

/**
 * @type {Integer (UInt32)}
 */
export global IMF_FORCENONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMF_FORCEENABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMF_FORCEDISABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMF_CLOSESTATUSWINDOW := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMF_VERTICAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global IMF_FORCEACTIVE := 64

/**
 * @type {Integer (UInt32)}
 */
export global IMF_FORCEINACTIVE := 128

/**
 * @type {Integer (UInt32)}
 */
export global IMF_FORCEREMEMBER := 256

/**
 * @type {Integer (UInt32)}
 */
export global IMF_MULTIPLEEDIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global yHeightCharPtsMost := 1638

/**
 * @type {Integer (UInt32)}
 */
export global SCF_SELECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCF_WORD := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCF_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCF_ALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCF_USEUIRULES := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCF_ASSOCIATEFONT := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCF_NOKBUPDATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SCF_ASSOCIATEFONT2 := 64

/**
 * @type {Integer (UInt32)}
 */
export global SCF_SMARTFONT := 128

/**
 * @type {Integer (UInt32)}
 */
export global SCF_CHARREPFROMLCID := 256

/**
 * @type {Integer (UInt32)}
 */
export global SPF_DONTSETDEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPF_SETDEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SF_TEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SF_RTF := 2

/**
 * @type {Integer (UInt32)}
 */
export global SF_RTFNOOBJS := 3

/**
 * @type {Integer (UInt32)}
 */
export global SF_TEXTIZED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SF_UNICODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SF_USECODEPAGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SF_NCRFORNONASCII := 64

/**
 * @type {Integer (UInt32)}
 */
export global SFF_WRITEXTRAPAR := 128

/**
 * @type {Integer (UInt32)}
 */
export global SFF_SELECTION := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SFF_PLAINRTF := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SFF_PERSISTVIEWSCALE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SFF_KEEPDOCINFO := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SFF_PWD := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SF_RTFVAL := 1792

/**
 * @type {Integer (UInt32)}
 */
export global MAX_TAB_STOPS := 32

/**
 * @type {Integer (UInt32)}
 */
export global lDefaultTab := 720

/**
 * @type {Integer (UInt32)}
 */
export global MAX_TABLE_CELLS := 63

/**
 * @type {Integer (UInt32)}
 */
export global GCMF_GRIPPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCMF_SPELLING := 2

/**
 * @type {Integer (UInt32)}
 */
export global GCMF_TOUCHMENU := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GCMF_MOUSEMENU := 8192

/**
 * @type {Integer (UInt32)}
 */
export global OLEOP_DOVERB := 1

/**
 * @type {String}
 */
export global CF_RTF := "Rich Text Format"

/**
 * @type {String}
 */
export global CF_RTFNOOBJS := "Rich Text Format Without Objects"

/**
 * @type {String}
 */
export global CF_RETEXTOBJ := "RichEdit Text and Objects"

/**
 * @type {Integer (UInt32)}
 */
export global ST_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ST_KEEPUNDO := 1

/**
 * @type {Integer (UInt32)}
 */
export global ST_SELECTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global ST_NEWCHARS := 4

/**
 * @type {Integer (UInt32)}
 */
export global ST_UNICODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global BOM_DEFPARADIR := 1

/**
 * @type {Integer (UInt32)}
 */
export global BOM_PLAINTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global BOM_NEUTRALOVERRIDE := 4

/**
 * @type {Integer (UInt32)}
 */
export global BOM_CONTEXTREADING := 8

/**
 * @type {Integer (UInt32)}
 */
export global BOM_CONTEXTALIGNMENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global BOM_LEGACYBIDICLASS := 64

/**
 * @type {Integer (UInt32)}
 */
export global BOM_UNICODEBIDI := 128

/**
 * @type {Integer (UInt32)}
 */
export global BOE_RTLDIR := 1

/**
 * @type {Integer (UInt32)}
 */
export global BOE_PLAINTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global BOE_NEUTRALOVERRIDE := 4

/**
 * @type {Integer (UInt32)}
 */
export global BOE_CONTEXTREADING := 8

/**
 * @type {Integer (UInt32)}
 */
export global BOE_CONTEXTALIGNMENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global BOE_FORCERECALC := 32

/**
 * @type {Integer (UInt32)}
 */
export global BOE_LEGACYBIDICLASS := 64

/**
 * @type {Integer (UInt32)}
 */
export global BOE_UNICODEBIDI := 128

/**
 * @type {String}
 */
export global RICHEDIT60_CLASS := "RICHEDIT60W"

/**
 * @type {Integer (UInt32)}
 */
export global AURL_ENABLEEA := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCM_TOUCHMENU := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GCM_MOUSEMENU := 8192

/**
 * @type {Integer (Int32)}
 */
export global S_MSG_KEY_IGNORED := 262657

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_RICHTEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_MULTILINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_READONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_SHOWACCELERATOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_USEPASSWORD := 16

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_HIDESELECTION := 32

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_SAVESELECTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_AUTOWORDSEL := 128

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_VERTICAL := 256

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_SELBARCHANGE := 512

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_WORDWRAP := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_ALLOWBEEP := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_DISABLEDRAG := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_VIEWINSETCHANGE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_BACKSTYLECHANGE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_MAXLENGTHCHANGE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_SCROLLBARCHANGE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_CHARFORMATCHANGE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_PARAFORMATCHANGE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_EXTENTCHANGE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_CLIENTRECTCHANGE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_USECURRENTBKG := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_NOTHREADREFCOUNT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_SHOWPASSWORD := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_D2DDWRITE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_D2DSIMPLETYPOGRAPHY := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_D2DPIXELSNAPPED := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_D2DSUBPIXELLINES := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_FLASHLASTPASSWORDCHAR := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global TXTBIT_ADVANCEDINPUT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global TXES_ISDIALOG := 1

/**
 * @type {Integer (Int32)}
 */
export global REO_NULL := 0

/**
 * @type {Integer (Int32)}
 */
export global REO_READWRITEMASK := 2047
;@endregion Constants
