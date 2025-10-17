#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class RichEdit {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static cchTextLimitDefault => 32767

    /**
     * @type {String}
     */
    static MSFTEDIT_CLASS => "RICHEDIT50W"

    /**
     * @type {String}
     */
    static CERICHEDIT_CLASSA => "RichEditCEA"

    /**
     * @type {String}
     */
    static CERICHEDIT_CLASSW => "RichEditCEW"

    /**
     * @type {String}
     */
    static RICHEDIT_CLASSA => "RichEdit20A"

    /**
     * @type {String}
     */
    static RICHEDIT_CLASS10A => "RICHEDIT"

    /**
     * @type {String}
     */
    static RICHEDIT_CLASSW => "RichEdit20W"

    /**
     * @type {String}
     */
    static RICHEDIT_CLASS => "RichEdit20W"

    /**
     * @type {Integer (UInt32)}
     */
    static EM_CANPASTE => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static EM_DISPLAYBAND => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static EM_EXGETSEL => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static EM_EXLIMITTEXT => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static EM_EXLINEFROMCHAR => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static EM_EXSETSEL => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static EM_FINDTEXT => 1080

    /**
     * @type {Integer (UInt32)}
     */
    static EM_FORMATRANGE => 1081

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETCHARFORMAT => 1082

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETEVENTMASK => 1083

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETOLEINTERFACE => 1084

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETPARAFORMAT => 1085

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETSELTEXT => 1086

    /**
     * @type {Integer (UInt32)}
     */
    static EM_HIDESELECTION => 1087

    /**
     * @type {Integer (UInt32)}
     */
    static EM_PASTESPECIAL => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static EM_REQUESTRESIZE => 1089

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SELECTIONTYPE => 1090

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETBKGNDCOLOR => 1091

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETCHARFORMAT => 1092

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETEVENTMASK => 1093

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETOLECALLBACK => 1094

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETPARAFORMAT => 1095

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETTARGETDEVICE => 1096

    /**
     * @type {Integer (UInt32)}
     */
    static EM_STREAMIN => 1097

    /**
     * @type {Integer (UInt32)}
     */
    static EM_STREAMOUT => 1098

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETTEXTRANGE => 1099

    /**
     * @type {Integer (UInt32)}
     */
    static EM_FINDWORDBREAK => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETOPTIONS => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETOPTIONS => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static EM_FINDTEXTEX => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETWORDBREAKPROCEX => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETWORDBREAKPROCEX => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETUNDOLIMIT => 1106

    /**
     * @type {Integer (UInt32)}
     */
    static EM_REDO => 1108

    /**
     * @type {Integer (UInt32)}
     */
    static EM_CANREDO => 1109

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETUNDONAME => 1110

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETREDONAME => 1111

    /**
     * @type {Integer (UInt32)}
     */
    static EM_STOPGROUPTYPING => 1112

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETTEXTMODE => 1113

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETTEXTMODE => 1114

    /**
     * @type {Integer (UInt32)}
     */
    static EM_AUTOURLDETECT => 1115

    /**
     * @type {Integer (UInt32)}
     */
    static AURL_ENABLEURL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AURL_ENABLEEMAILADDR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AURL_ENABLETELNO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AURL_ENABLEEAURLS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AURL_ENABLEDRIVELETTERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AURL_DISABLEMIXEDLGC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETAUTOURLDETECT => 1116

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETPALETTE => 1117

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETTEXTEX => 1118

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETTEXTLENGTHEX => 1119

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SHOWSCROLLBAR => 1120

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETTEXTEX => 1121

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETPUNCTUATION => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETPUNCTUATION => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETWORDWRAPMODE => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETWORDWRAPMODE => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETIMECOLOR => 1128

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETIMECOLOR => 1129

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETIMEOPTIONS => 1130

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETIMEOPTIONS => 1131

    /**
     * @type {Integer (UInt32)}
     */
    static EM_CONVPOSITION => 1132

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETLANGOPTIONS => 1144

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETLANGOPTIONS => 1145

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETIMECOMPMODE => 1146

    /**
     * @type {Integer (UInt32)}
     */
    static EM_FINDTEXTW => 1147

    /**
     * @type {Integer (UInt32)}
     */
    static EM_FINDTEXTEXW => 1148

    /**
     * @type {Integer (UInt32)}
     */
    static EM_RECONVERSION => 1149

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETIMEMODEBIAS => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETIMEMODEBIAS => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETBIDIOPTIONS => 1224

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETBIDIOPTIONS => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETTYPOGRAPHYOPTIONS => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETTYPOGRAPHYOPTIONS => 1227

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETEDITSTYLE => 1228

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETEDITSTYLE => 1229

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EMULATESYSEDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SES_BEEPONMAXTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EXTENDBACKCOLOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SES_MAPCPS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SES_HYPERLINKTOOLTIPS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EMULATE10 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SES_DEFAULTLATINLIGA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SES_USECRLF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SES_NOFOCUSLINKNOTIFY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SES_USEAIMM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SES_NOIME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SES_ALLOWBEEPS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SES_UPPERCASE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SES_LOWERCASE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SES_NOINPUTSEQUENCECHK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SES_BIDI => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SES_SCROLLONKILLFOCUS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SES_XLTCRCRLFTOCR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SES_DRAFTMODE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SES_USECTF => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SES_HIDEGRIDLINES => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SES_USEATFONT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SES_CUSTOMLOOK => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SES_LBSCROLLNOTIFY => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SES_CTFALLOWEMBED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SES_CTFALLOWSMARTTAG => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SES_CTFALLOWPROOFING => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SES_LOGICALCARET => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SES_WORDDRAGDROP => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SES_SMARTDRAGDROP => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SES_MULTISELECT => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SES_CTFNOLOCK => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SES_NOEALINEHEIGHTADJUST => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SES_MAX => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_AUTOKEYBOARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_AUTOFONT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_IMECANCELCOMPLETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_IMEALWAYSSENDNOTIFY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_AUTOFONTSIZEADJUST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_UIFONTS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_NOIMPLICITLANG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_DUALFONT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_NOKBDLIDFIXUP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_NORTFFONTSUBSTITUTE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_SPELLCHECKING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_TKBPREDICTION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_IMEUIINTEGRATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_NOTOPEN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_LEVEL3 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_LEVEL2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_LEVEL2_5 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_LEVEL2_SUI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_CTF => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TO_ADVANCEDTYPOGRAPHY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TO_SIMPLELINEBREAK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TO_DISABLECUSTOMTEXTOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TO_ADVANCEDLAYOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EM_OUTLINE => 1244

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETSCROLLPOS => 1245

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETSCROLLPOS => 1246

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETFONTSIZE => 1247

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETZOOM => 1248

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETZOOM => 1249

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETVIEWKIND => 1250

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETVIEWKIND => 1251

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETPAGE => 1252

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETPAGE => 1253

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETHYPHENATEINFO => 1254

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETHYPHENATEINFO => 1255

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETPAGEROTATE => 1259

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETPAGEROTATE => 1260

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETCTFMODEBIAS => 1261

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETCTFMODEBIAS => 1262

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETCTFOPENSTATUS => 1264

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETCTFOPENSTATUS => 1265

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETIMECOMPTEXT => 1266

    /**
     * @type {Integer (UInt32)}
     */
    static EM_ISIME => 1267

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETIMEPROPERTY => 1268

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETQUERYRTFOBJ => 1293

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETQUERYRTFOBJ => 1294

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETQUERYCONVERTOLELINKCALLBACK => 1427

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETDISABLEOLELINKCONVERSION => 1428

    /**
     * @type {Integer (UInt32)}
     */
    static EPR_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EPR_270 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EPR_180 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EPR_90 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EPR_SE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_FILENAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_READING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_DATETIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_CONVERSATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_NUMERIC => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_HIRAGANA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_KATAKANA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_HANGUL => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_HALFWIDTHKATAKANA => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_FULLWIDTHALPHANUMERIC => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CTFMODEBIAS_HALFWIDTHALPHANUMERIC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_SMODE_PLAURALCLAUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_SMODE_NONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_EXIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_ENTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_PROMOTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_EXPAND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_MOVESELECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_GETVIEWMODE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_EXPANDSELECTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EMO_EXPANDDOCUMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VM_NORMAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VM_OUTLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VM_PAGE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EM_INSERTTABLE => 1256

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETAUTOCORRECTPROC => 1257

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETAUTOCORRECTPROC => 1258

    /**
     * @type {Integer (UInt32)}
     */
    static EM_CALLAUTOCORRECTPROC => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static ATP_NOCHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ATP_CHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATP_NODELIMITER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ATP_REPLACEALLTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETTABLEPARMS => 1289

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETEDITSTYLEEX => 1299

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETEDITSTYLEEX => 1300

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_NOTABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_NOMATH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_HANDLEFRIENDLYURL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_NOTHEMING => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_NOACETATESELECTION => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_USESINGLELINE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_MULTITOUCH => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_HIDETEMPFORMAT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SES_EX_USEMOUSEWPARAM => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETSTORYTYPE => 1314

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETSTORYTYPE => 1315

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETELLIPSISMODE => 1329

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETELLIPSISMODE => 1330

    /**
     * @type {Integer (UInt32)}
     */
    static ELLIPSIS_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ELLIPSIS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ELLIPSIS_END => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ELLIPSIS_WORD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETTABLEPARMS => 1331

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETTOUCHOPTIONS => 1334

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETTOUCHOPTIONS => 1335

    /**
     * @type {Integer (UInt32)}
     */
    static EM_INSERTIMAGE => 1338

    /**
     * @type {Integer (UInt32)}
     */
    static EM_SETUIANAME => 1344

    /**
     * @type {Integer (UInt32)}
     */
    static EM_GETELLIPSISSTATE => 1346

    /**
     * @type {Integer (UInt32)}
     */
    static RTO_SHOWHANDLES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTO_DISABLEHANDLES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTO_READINGMODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EN_MSGFILTER => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static EN_REQUESTRESIZE => 1793

    /**
     * @type {Integer (UInt32)}
     */
    static EN_SELCHANGE => 1794

    /**
     * @type {Integer (UInt32)}
     */
    static EN_DROPFILES => 1795

    /**
     * @type {Integer (UInt32)}
     */
    static EN_PROTECTED => 1796

    /**
     * @type {Integer (UInt32)}
     */
    static EN_CORRECTTEXT => 1797

    /**
     * @type {Integer (UInt32)}
     */
    static EN_STOPNOUNDO => 1798

    /**
     * @type {Integer (UInt32)}
     */
    static EN_IMECHANGE => 1799

    /**
     * @type {Integer (UInt32)}
     */
    static EN_SAVECLIPBOARD => 1800

    /**
     * @type {Integer (UInt32)}
     */
    static EN_OLEOPFAILED => 1801

    /**
     * @type {Integer (UInt32)}
     */
    static EN_OBJECTPOSITIONS => 1802

    /**
     * @type {Integer (UInt32)}
     */
    static EN_LINK => 1803

    /**
     * @type {Integer (UInt32)}
     */
    static EN_DRAGDROPDONE => 1804

    /**
     * @type {Integer (UInt32)}
     */
    static EN_PARAGRAPHEXPANDED => 1805

    /**
     * @type {Integer (UInt32)}
     */
    static EN_PAGECHANGE => 1806

    /**
     * @type {Integer (UInt32)}
     */
    static EN_LOWFIRTF => 1807

    /**
     * @type {Integer (UInt32)}
     */
    static EN_ALIGNLTR => 1808

    /**
     * @type {Integer (UInt32)}
     */
    static EN_ALIGNRTL => 1809

    /**
     * @type {Integer (UInt32)}
     */
    static EN_CLIPFORMAT => 1810

    /**
     * @type {Integer (UInt32)}
     */
    static EN_STARTCOMPOSITION => 1811

    /**
     * @type {Integer (UInt32)}
     */
    static EN_ENDCOMPOSITION => 1812

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_CHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_UPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_SCROLL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_SCROLLEVENTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_DRAGDROPDONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_PARAGRAPHEXPANDED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_PAGECHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_CLIPFORMAT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_KEYEVENTS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_MOUSEEVENTS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_REQUESTRESIZE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_SELCHANGE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_DROPFILES => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_PROTECTED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_CORRECTTEXT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_IMECHANGE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_LANGCHANGE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_OBJECTPOSITIONS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_LINK => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_LOWFIRTF => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_STARTCOMPOSITION => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_ENDCOMPOSITION => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_GROUPTYPINGCHANGE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static ENM_HIDELINKTOOLTIP => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ES_SAVESEL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ES_SUNKEN => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ES_DISABLENOSCROLL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ES_SELECTIONBAR => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ES_NOOLEDRAGDROP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ES_EX_NOCALLOLEINIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ES_VERTICAL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ES_NOIME => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ES_SELFIME => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_AUTOWORDSELECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_AUTOVSCROLL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_AUTOHSCROLL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_NOHIDESEL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_READONLY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_WANTRETURN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_SAVESEL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_SELECTIONBAR => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ECO_VERTICAL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ECOOP_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ECOOP_OR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ECOOP_AND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ECOOP_XOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WB_MOVEWORDPREV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WB_MOVEWORDNEXT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WB_PREVBREAK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WB_NEXTBREAK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PC_FOLLOWING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PC_LEADING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PC_OVERFLOW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PC_DELIMITER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WBF_WORDWRAP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WBF_WORDBREAK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WBF_OVERFLOW => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WBF_LEVEL1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WBF_LEVEL2 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WBF_CUSTOM => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_FORCENONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_FORCEENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_FORCEDISABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_CLOSESTATUSWINDOW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_VERTICAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_FORCEACTIVE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_FORCEINACTIVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_FORCEREMEMBER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMF_MULTIPLEEDIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static yHeightCharPtsMost => 1638

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_SELECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_WORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_ALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_USEUIRULES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_ASSOCIATEFONT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_NOKBUPDATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_ASSOCIATEFONT2 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_SMARTFONT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCF_CHARREPFROMLCID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SPF_DONTSETDEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPF_SETDEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SF_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SF_RTF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SF_RTFNOOBJS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SF_TEXTIZED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SF_UNICODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SF_USECODEPAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NCRFORNONASCII => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SFF_WRITEXTRAPAR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SFF_SELECTION => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SFF_PLAINRTF => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SFF_PERSISTVIEWSCALE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SFF_KEEPDOCINFO => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SFF_PWD => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SF_RTFVAL => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_TAB_STOPS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static lDefaultTab => 720

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_TABLE_CELLS => 63

    /**
     * @type {Integer (UInt32)}
     */
    static GCMF_GRIPPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GCMF_SPELLING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GCMF_TOUCHMENU => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GCMF_MOUSEMENU => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static OLEOP_DOVERB => 1

    /**
     * @type {String}
     */
    static CF_RTF => "Rich Text Format"

    /**
     * @type {String}
     */
    static CF_RTFNOOBJS => "Rich Text Format Without Objects"

    /**
     * @type {String}
     */
    static CF_RETEXTOBJ => "RichEdit Text and Objects"

    /**
     * @type {Integer (UInt32)}
     */
    static ST_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ST_KEEPUNDO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ST_SELECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ST_NEWCHARS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ST_UNICODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BOM_DEFPARADIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BOM_PLAINTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BOM_NEUTRALOVERRIDE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BOM_CONTEXTREADING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BOM_CONTEXTALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BOM_LEGACYBIDICLASS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BOM_UNICODEBIDI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_RTLDIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_PLAINTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_NEUTRALOVERRIDE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_CONTEXTREADING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_CONTEXTALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_FORCERECALC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_LEGACYBIDICLASS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BOE_UNICODEBIDI => 128

    /**
     * @type {String}
     */
    static RICHEDIT60_CLASS => "RICHEDIT60W"

    /**
     * @type {Integer (UInt32)}
     */
    static AURL_ENABLEEA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GCM_TOUCHMENU => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GCM_MOUSEMENU => 8192

    /**
     * @type {Integer (Int32)}
     */
    static S_MSG_KEY_IGNORED => 262657

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_RICHTEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_MULTILINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_READONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_SHOWACCELERATOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_USEPASSWORD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_HIDESELECTION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_SAVESELECTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_AUTOWORDSEL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_VERTICAL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_SELBARCHANGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_WORDWRAP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_ALLOWBEEP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_DISABLEDRAG => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_VIEWINSETCHANGE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_BACKSTYLECHANGE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_MAXLENGTHCHANGE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_SCROLLBARCHANGE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_CHARFORMATCHANGE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_PARAFORMATCHANGE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_EXTENTCHANGE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_CLIENTRECTCHANGE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_USECURRENTBKG => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_NOTHREADREFCOUNT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_SHOWPASSWORD => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_D2DDWRITE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_D2DSIMPLETYPOGRAPHY => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_D2DPIXELSNAPPED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_D2DSUBPIXELLINES => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_FLASHLASTPASSWORDCHAR => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static TXTBIT_ADVANCEDINPUT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static TXES_ISDIALOG => 1

    /**
     * @type {Integer (Int32)}
     */
    static REO_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static REO_READWRITEMASK => 2047
;@endregion Constants

;@region Methods
;@endregion Methods
}
