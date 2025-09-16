#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class Ime {

;@region Constants

    /**
     * @type {String}
     */
    static CATID_MSIME_IImePadApplet_VER7 => "{4a0f8e31-c3ee-11d1-afef-00805f0c8b6d}"

    /**
     * @type {String}
     */
    static CATID_MSIME_IImePadApplet_VER80 => "{56f7a792-fef1-11d3-8463-00c04f7a06e5}"

    /**
     * @type {String}
     */
    static CATID_MSIME_IImePadApplet_VER81 => "{656520b0-bb88-11d4-84c0-00c04f7a06e5}"

    /**
     * @type {String}
     */
    static CATID_MSIME_IImePadApplet900 => "{faae51bf-5e5b-4a1d-8de1-17c1d9e1728d}"

    /**
     * @type {String}
     */
    static CATID_MSIME_IImePadApplet1000 => "{e081e1d6-2389-43cb-b66f-609f823d9f9c}"

    /**
     * @type {String}
     */
    static CATID_MSIME_IImePadApplet1200 => "{a47fb5fc-7d15-4223-a789-b781bf9ae667}"

    /**
     * @type {String}
     */
    static CATID_MSIME_IImePadApplet => "{7566cad1-4ec9-4478-9fe9-8ed766619edf}"

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_CHINESE_TRADITIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_CHINESE_SIMPLIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_CHINESE_HONGKONG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_CHINESE_SINGAPORE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_JAPANESE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_KOREAN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FEID_KOREAN_JOHAB => 7

    /**
     * @type {Integer (UInt32)}
     */
    static INFOMASK_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INFOMASK_QUERY_CAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INFOMASK_APPLY_CAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INFOMASK_APPLY_CAND_EX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INFOMASK_STRING_FIX => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static INFOMASK_HIDE_CAND => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static INFOMASK_BLOCK_CAND => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IMEFAREASTINFO_TYPE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMEFAREASTINFO_TYPE_READING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEFAREASTINFO_TYPE_COMMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMEFAREASTINFO_TYPE_COSTTIME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CHARINFO_APPLETID_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static CHARINFO_FEID_MASK => 15728640

    /**
     * @type {Integer (UInt32)}
     */
    static CHARINFO_CHARID_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_APPLETTITLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FONTFACE => 32

    /**
     * @type {Integer (Int32)}
     */
    static IPACFG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IPACFG_PROPERTY => 1

    /**
     * @type {Integer (Int32)}
     */
    static IPACFG_HELP => 2

    /**
     * @type {Integer (Int32)}
     */
    static IPACFG_TITLE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static IPACFG_TITLEFONTFACE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static IPACFG_CATEGORY => 262144

    /**
     * @type {Integer (Int32)}
     */
    static IPACFG_LANG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_SOFTKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_HANDWRITING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_STROKESEARCH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_RADICALSEARCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_SYMBOLSEARCH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_VOICE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_EPWING => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_OCR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_CHARLIST => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IPACID_USER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_FIRST => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_INSERTSTRINGCANDIDATE => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_INSERTITEMCANDIDATE => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_SENDKEYCONTROL => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_GETSELECTEDSTRING => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_SETAPPLETDATA => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_GETAPPLETDATA => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_SETTITLEFONT => 4107

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_GETCOMPOSITIONSTRINGID => 4109

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_INSERTSTRINGCANDIDATEINFO => 4110

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_CHANGESTRINGCANDIDATEINFO => 4111

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_INSERTSTRINGINFO => 4114

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_CHANGESTRINGINFO => 4115

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADREQ_GETCURRENTUILANGID => 4120

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CONVERTALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_DETERMINALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_DETERMINCHAR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CLEARALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CARETSET => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CARETLEFT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CARETRIGHT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CARETTOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CARETBOTTOM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CARETBACKSPACE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_CARETDELETE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_PHRASEDELETE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_INSERTSPACE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_INSERTFULLSPACE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_INSERTHALFSPACE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_ONIME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_OFFIME => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_ONPRECONVERSION => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_OFFPRECONVERSION => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPADCTRL_PHONETICCANDIDATE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKEYCTRLMASK_ALT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKEYCTRLMASK_CTRL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKEYCTRLMASK_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKEYCTRL_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKEYCTRL_DOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_FIRST => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_ACTIVATE => 257

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_INACTIVATE => 258

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_SHOW => 260

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_HIDE => 261

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_SIZECHANGING => 262

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_SIZECHANGED => 263

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_CONFIG => 264

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_HELP => 265

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_QUERYCAND => 266

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_APPLYCAND => 267

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_APPLYCANDEX => 268

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_SETTINGCHANGED => 269

    /**
     * @type {Integer (UInt32)}
     */
    static IMEPN_USER => 356

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_SIZINGNOTIFY => 4

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_VERTICALFIXED => 256

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_HORIZONTALFIXED => 512

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_SIZEFIXED => 768

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_MAXWIDTHFIXED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_MAXHEIGHTFIXED => 8192

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_MAXSIZEFIXED => 12288

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_MINWIDTHFIXED => 65536

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_MINHEIGHTFIXED => 131072

    /**
     * @type {Integer (Int32)}
     */
    static IPAWS_MINSIZEFIXED => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static STYLE_DESCRIPTION_SIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMENUITEM_STRING_SIZE => 80

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_GETCANDIDATEPOS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETCANDIDATEPOS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_GETCOMPOSITIONFONT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETCOMPOSITIONFONT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_GETCOMPOSITIONWINDOW => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETCOMPOSITIONWINDOW => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_GETSTATUSWINDOWPOS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETSTATUSWINDOWPOS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_CLOSESTATUSWINDOW => 33

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_OPENSTATUSWINDOW => 34

    /**
     * @type {Integer (UInt32)}
     */
    static NI_FINALIZECONVERSIONRESULT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_SHOWUICANDIDATEWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_SHOWUICOMPOSITIONWINDOW => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_SHOWUIGUIDELINE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_SHOWUIALLCANDIDATEWINDOW => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ISC_SHOWUIALL => 3221225487

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_LEFT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_RIGHT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_ON_KEYUP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_IGNORE_ALL_MODIFIER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IME_HOTKEY_DSWITCH_FIRST => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IME_HOTKEY_DSWITCH_LAST => 287

    /**
     * @type {Integer (UInt32)}
     */
    static IME_HOTKEY_PRIVATE_FIRST => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IME_HOTKEY_PRIVATE_LAST => 543

    /**
     * @type {Integer (UInt32)}
     */
    static CS_INSERTCHAR => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CS_NOMOVECARET => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IMEVER_0310 => 196618

    /**
     * @type {Integer (UInt32)}
     */
    static IMEVER_0400 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_AT_CARET => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_SPECIAL_UI => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_CANDLIST_START_FROM_1 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_UNICODE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_COMPLETE_ON_UNSELECT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static UI_CAP_2700 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UI_CAP_ROT90 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UI_CAP_ROTANY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_CAP_COMPSTR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_CAP_MAKEREAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_CAP_SETRECONVERTSTRING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SELECT_CAP_CONVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SELECT_CAP_SENTENCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LEVEL_NOGUIDELINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LEVEL_FATAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LEVEL_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LEVEL_WARNING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GL_LEVEL_INFORMATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_NOMODULE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_NODICTIONARY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_CANNOTSAVE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_NOCONVERT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_TYPINGERROR => 33

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_TOOMANYSTROKE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_READINGCONFLICT => 35

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_INPUTREADING => 36

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_INPUTRADICAL => 37

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_INPUTCODE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_INPUTSYMBOL => 39

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_CHOOSECANDIDATE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_REVERSECONVERSION => 41

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_PRIVATE_FIRST => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static GL_ID_PRIVATE_LAST => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static ATTR_INPUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ATTR_TARGET_CONVERTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATTR_CONVERTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ATTR_TARGET_NOTCONVERTED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ATTR_INPUT_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ATTR_FIXEDCONVERTED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CFS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CFS_RECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CFS_POINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CFS_FORCE_POSITION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CFS_CANDIDATEPOS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CFS_EXCLUDE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CAND_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CAND_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CAND_CODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CAND_MEANING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CAND_RADICAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CAND_STROKE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_CLOSESTATUSWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_OPENSTATUSWINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_CHANGECANDIDATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_CLOSECANDIDATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_OPENCANDIDATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SETCONVERSIONMODE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SETSENTENCEMODE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SETOPENSTATUS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SETCANDIDATEPOS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SETCOMPOSITIONFONT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SETCOMPOSITIONWINDOW => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SETSTATUSWINDOWPOS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_GUIDELINE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_PRIVATE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMR_COMPOSITIONWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMR_CANDIDATEWINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMR_COMPOSITIONFONT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMR_RECONVERTSTRING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMR_CONFIRMRECONVERTSTRING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMR_QUERYCHARPOSITION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMR_DOCUMENTFEED => 7

    /**
     * @type {Integer (Int32)}
     */
    static IMM_ERROR_NODATA => -1

    /**
     * @type {Integer (Int32)}
     */
    static IMM_ERROR_GENERAL => -2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CONFIG_GENERAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CONFIG_REGISTERWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_CONFIG_SELECTDICTIONARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IME_REGWORD_STYLE_EUDC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_REGWORD_STYLE_USER_FIRST => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IME_REGWORD_STYLE_USER_LAST => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static IACE_CHILDREN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IACE_DEFAULT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IACE_IGNORENOCONTEXT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMIF_RIGHTMENU => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMII_CMODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMII_SMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMII_CONFIGURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMII_TOOLS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMII_HELP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMII_OTHER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IGIMII_INPUTTOOLS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IMFT_RADIOCHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMFT_SEPARATOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMFT_SUBMENU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTKEYBOARD_TYPE_T1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTKEYBOARD_TYPE_C1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMMGWL_IMC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMMGWLP_IMC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETCONVERSIONMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETSENTENCEMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETOPENSTATUS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_GETSOFTKBDFONT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETSOFTKBDFONT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_GETSOFTKBDPOS => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETSOFTKBDPOS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_GETSOFTKBDSUBTYPE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETSOFTKBDSUBTYPE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IMC_SETSOFTKBDDATA => 24

    /**
     * @type {Integer (UInt32)}
     */
    static NI_CONTEXTUPDATED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IME_SYSINFO_WINLOGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_STATUSWNDPOS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_CONVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_SENTENCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_LOGFONT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_COMPFORM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_SOFTKBDPOS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_END_UNLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_KBD_CHAR_FIRST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_IGNORE_UPKEYS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_NEED_ALTKEY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_NO_KEYS_ON_CLOSE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_PROP_ACCEPT_WIDE_VKEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static UI_CAP_SOFTKBD => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IMN_SOFTKBDDESTROYED => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IME_UI_CLASS_NAME_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_STRING_BUFFER_SIZE => 80

    /**
     * @type {String}
     */
    static szImeJapan => "MSIME.Japan"

    /**
     * @type {String}
     */
    static szImeKorea => "MSIME.Korea"

    /**
     * @type {String}
     */
    static szImeChina => "MSIME.China"

    /**
     * @type {String}
     */
    static szImeTaiwan => "MSIME.Taiwan"

    /**
     * @type {String}
     */
    static CLSID_VERSION_DEPENDENT_MSIME_JAPANESE => "{6a91029e-aa49-471b-aee7-7d332785660d}"

    /**
     * @type {Integer (Int32)}
     */
    static IFEC_S_ALREADY_DEFAULT => 291840

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_REQ_CONV => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_REQ_RECONV => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_REQ_REV => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_MONORUBY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_NOPRUNING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_KATAKANAOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_HIRAGANAOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_HALFWIDTHOUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_FULLWIDTHOUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_BOPOMOFO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_HANGUL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_PINYIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_PRECONV => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_RADICAL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_UNKNOWNREADING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_MERGECAND => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_ROMAN => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_BESTFIRST => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_USENOREVWORDS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_NONE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_PLAURALCLAUSE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_SINGLECONVERT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_AUTOMATIC => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_PHRASEPREDICT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_CONVERSATION => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_NAME => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CMODE_NOINVISIBLECHAR => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static E_NOCAND => 48

    /**
     * @type {Integer (UInt32)}
     */
    static E_NOTENOUGH_BUFFER => 49

    /**
     * @type {Integer (UInt32)}
     */
    static E_NOTENOUGH_WDD => 50

    /**
     * @type {Integer (UInt32)}
     */
    static E_LARGEINPUT => 51

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CLMN_WBREAK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CLMN_NOWBREAK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CLMN_PBREAK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CLMN_NOPBREAK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CLMN_FIXR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_CLMN_FIXD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FELANG_INVALD_PO => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_NOUN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_VERB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_ADJECTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_ADJECTIVE_VERB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_ADVERB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_ADNOUN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_CONJUNCTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_INTERJECTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_INDEPENDENT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_INFLECTIONALSUFFIX => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_PREFIX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_SUFFIX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_AFFIX => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_TANKANJI => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_IDIOMS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_SYMBOLS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_PARTICLE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_AUXILIARY_VERB => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_SUB_VERB => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_DEPENDENT => 114688

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_POS_ALL => 131071

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_SELECT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_SELECT_READING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_SELECT_DISPLAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_SELECT_POS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_SELECT_COMMENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_SELECT_ALL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_REG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_REG_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_REG_AUTO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_REG_GRAMMAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_REG_ALL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_TYPE_GENERAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_TYPE_NAMEPLACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_TYPE_SPEECH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_TYPE_REVERSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_TYPE_ENGLISH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IFED_TYPE_ALL => 31

    /**
     * @type {Integer (Int32)}
     */
    static IFED_S_MORE_ENTRIES => 291328

    /**
     * @type {Integer (Int32)}
     */
    static IFED_S_EMPTY_DICTIONARY => 291329

    /**
     * @type {Integer (Int32)}
     */
    static IFED_S_WORD_EXISTS => 291330

    /**
     * @type {Integer (Int32)}
     */
    static IFED_S_COMMENT_CHANGED => 291331

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_NOT_FOUND => -2147192064

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_INVALID_FORMAT => -2147192063

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_OPEN_FAILED => -2147192062

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_WRITE_FAILED => -2147192061

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_NO_ENTRY => -2147192060

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_REGISTER_FAILED => -2147192059

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_NOT_USER_DIC => -2147192058

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_NOT_SUPPORTED => -2147192057

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_USER_COMMENT => -2147192056

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_REGISTER_ILLEGAL_POS => -2147192055

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_REGISTER_IMPROPER_WORD => -2147192054

    /**
     * @type {Integer (Int32)}
     */
    static IFED_E_REGISTER_DISCONNECTED => -2147192053

    /**
     * @type {Integer (UInt32)}
     */
    static cbCommentMax => 256

    /**
     * @type {Integer (UInt32)}
     */
    static wchPrivate1 => 57344

    /**
     * @type {Integer (UInt32)}
     */
    static POS_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_MEISHI_FUTSU => 100

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_MEISHI_SAHEN => 101

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_MEISHI_ZAHEN => 102

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_MEISHI_KEIYOUDOUSHI => 103

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_HUKUSIMEISHI => 104

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_MEISA_KEIDOU => 105

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_JINMEI => 106

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_JINMEI_SEI => 107

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_JINMEI_MEI => 108

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI => 109

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_KUNI => 110

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_KEN => 111

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_GUN => 112

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_KU => 113

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_SHI => 114

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_MACHI => 115

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_MURA => 116

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CHIMEI_EKI => 117

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SONOTA => 118

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SHAMEI => 119

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SOSHIKI => 120

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KENCHIKU => 121

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_BUPPIN => 122

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_DAIMEISHI => 123

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_DAIMEISHI_NINSHOU => 124

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_DAIMEISHI_SHIJI => 125

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KAZU => 126

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KAZU_SURYOU => 127

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KAZU_SUSHI => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_AWA => 200

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_KA => 201

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_GA => 202

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_SA => 203

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_TA => 204

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_NA => 205

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_BA => 206

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_MA => 207

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_RA => 208

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_AWAUON => 209

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_KASOKUON => 210

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_5DAN_RAHEN => 211

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_4DAN_HA => 212

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_1DAN => 213

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TOKUSHU_KAHEN => 214

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TOKUSHU_SAHENSURU => 215

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TOKUSHU_SAHEN => 216

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TOKUSHU_ZAHEN => 217

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TOKUSHU_NAHEN => 218

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KI => 219

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KITA => 220

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KITARA => 221

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KITARI => 222

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KITAROU => 223

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KITE => 224

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KUREBA => 225

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KO => 226

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KOI => 227

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KURU_KOYOU => 228

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SA => 229

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SI => 230

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SITA => 231

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SITARA => 232

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SIATRI => 233

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SITAROU => 234

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SITE => 235

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SIYOU => 236

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SUREBA => 237

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SE => 238

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SURU_SEYO => 239

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIYOU => 300

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIYOU_GARU => 301

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIYOU_GE => 302

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIYOU_ME => 303

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIYOU_YUU => 304

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIYOU_U => 305

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIDOU => 400

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIDOU_NO => 401

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIDOU_TARU => 402

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KEIDOU_GARU => 403

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUKUSHI => 500

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUKUSHI_SAHEN => 501

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUKUSHI_NI => 502

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUKUSHI_NANO => 503

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUKUSHI_DA => 504

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUKUSHI_TO => 505

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUKUSHI_TOSURU => 506

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_RENTAISHI => 600

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_RENTAISHI_SHIJI => 601

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUZOKUSHI => 650

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KANDOUSHI => 670

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU => 700

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_KAKU => 701

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_SAI => 702

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_FUKU => 703

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_MI => 704

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_DAISHOU => 705

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_KOUTEI => 706

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_CHOUTAN => 707

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_SHINKYU => 708

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_JINMEI => 709

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_CHIMEI => 710

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_SONOTA => 711

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_JOSUSHI => 712

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_TEINEI_O => 713

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_TEINEI_GO => 714

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETTOU_TEINEI_ON => 715

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI => 800

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_TEKI => 801

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SEI => 802

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_KA => 803

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_CHU => 804

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_FU => 805

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_RYU => 806

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_YOU => 807

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_KATA => 808

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_MEISHIRENDAKU => 809

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_JINMEI => 810

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_CHIMEI => 811

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_KUNI => 812

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_KEN => 813

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_GUN => 814

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_KU => 815

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SHI => 816

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_MACHI => 817

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_CHOU => 818

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_MURA => 819

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SON => 820

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_EKI => 821

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SONOTA => 822

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SHAMEI => 823

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SOSHIKI => 824

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_KENCHIKU => 825

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_RENYOU_SETSUBI => 826

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_JOSUSHI => 827

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_JOSUSHIPLUS => 828

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_JIKAN => 829

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_JIKANPLUS => 830

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_TEINEI => 831

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SAN => 832

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_KUN => 833

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_SAMA => 834

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_DONO => 835

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_FUKUSU => 836

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_TACHI => 837

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_SETSUBI_RA => 838

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TANKANJI => 900

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TANKANJI_KAO => 901

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KANYOUKU => 902

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_DOKURITSUGO => 903

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_FUTEIGO => 904

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KIGOU => 905

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_EIJI => 906

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KUTEN => 907

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TOUTEN => 908

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_KANJI => 909

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_OPENBRACE => 910

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_CLOSEBRACE => 911

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_YOKUSEI => 912

    /**
     * @type {Integer (UInt32)}
     */
    static JPOS_TANSHUKU => 913

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_ID_JAPANESE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_ID_KOREAN => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_ID_CHINESE_TRADITIONAL => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_ID_CHINESE_SIMPLIFIED => 134217728

    /**
     * @type {String}
     */
    static RWM_SERVICE => "MSIMEService"

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_VERSION => 0

    /**
     * @type {String}
     */
    static RWM_UIREADY => "MSIMEUIReady"

    /**
     * @type {String}
     */
    static RWM_MOUSE => "MSIMEMouseOperation"

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_MOUSE_OPERATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMEMOUSERET_NOTHANDLED => -1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMOUSE_VERSION => 255

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMOUSE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMOUSE_LDOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMOUSE_RDOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMOUSE_MDOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMOUSE_WUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMEMOUSE_WDOWN => 32

    /**
     * @type {String}
     */
    static RWM_RECONVERT => "MSIMEReconvert"

    /**
     * @type {Integer (UInt32)}
     */
    static FID_RECONVERT_VERSION => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_RECONVERSION => 1

    /**
     * @type {String}
     */
    static RWM_RECONVERTREQUEST => "MSIMEReconvertRequest"

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_DOCUMENTFEED => 1

    /**
     * @type {String}
     */
    static RWM_DOCUMENTFEED => "MSIMEDocumentFeed"

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_QUERYPOSITION => 1

    /**
     * @type {String}
     */
    static RWM_QUERYPOSITION => "MSIMEQueryPosition"

    /**
     * @type {String}
     */
    static RWM_MODEBIAS => "MSIMEModeBias"

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_MODEBIAS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MODEBIAS_GETVERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MODEBIAS_SETVALUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MODEBIAS_GETVALUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MODEBIASMODE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MODEBIASMODE_FILENAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MODEBIASMODE_READING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MODEBIASMODE_DIGIT => 4

    /**
     * @type {String}
     */
    static RWM_SHOWIMEPAD => "MSIMEShowImePad"

    /**
     * @type {Integer (UInt32)}
     */
    static SHOWIMEPAD_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHOWIMEPAD_CATEGORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHOWIMEPAD_GUID => 2

    /**
     * @type {String}
     */
    static RWM_KEYMAP => "MSIMEKeyMap"

    /**
     * @type {String}
     */
    static RWM_CHGKEYMAP => "MSIMEChangeKeyMap"

    /**
     * @type {String}
     */
    static RWM_NTFYKEYMAP => "MSIMENotifyKeyMap"

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_INIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_TERM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_DEL_KEYLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_NOTIFY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_GETMAP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_INVOKE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_SETMAP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_FUNCDESC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_GETMAPSEAMLESS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FID_MSIME_KMS_GETMAPFAST => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_NOCOMPOSITION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_COMPOSITION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_SELECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_IMEOFF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_2NDLEVEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_INPTGL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_CANDIDATE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMEKMS_TYPECAND => 7

    /**
     * @type {String}
     */
    static RWM_RECONVERTOPTIONS => "MSIMEReconvertOptions"

    /**
     * @type {Integer (UInt32)}
     */
    static RECONVOPT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RECONVOPT_USECANCELNOTIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GCSEX_CANCELRECONVERT => 268435456

    /**
     * @type {String}
     */
    static CLSID_ImePlugInDictDictionaryList_CHS => "{7bf0129b-5bef-4de4-9b0b-5edb66ac2fa6}"

    /**
     * @type {String}
     */
    static CLSID_ImePlugInDictDictionaryList_JPN => "{4fe2776b-b0f9-4396-b5fc-e9d4cf1ec195}"
;@endregion Constants

;@region Methods
    /**
     * The ImmInstallIMEA (ANSI) function (immdev.h) installs an IME.
     * @remarks
     * This function is intended to be used by IME setup applications only.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmInstallIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpszIMEFileName Pointer to a null-terminated string that specifies the full path of the IME.
     * @param {Pointer<PSTR>} lpszLayoutText Pointer to a null-terminated string that specifies the name of the IME and the associated layout text.
     * @returns {Pointer<HKL>} Returns the input locale identifier for the IME.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-imminstallimea
     * @since windows5.1.2600
     */
    static ImmInstallIMEA(lpszIMEFileName, lpszLayoutText) {
        result := DllCall("IMM32.dll\ImmInstallIMEA", "ptr", lpszIMEFileName, "ptr", lpszLayoutText, "ptr")
        return result
    }

    /**
     * The ImmInstallIMEW (Unicode) function (immdev.h) installs an IME.
     * @remarks
     * This function is intended to be used by IME setup applications only.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmInstallIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpszIMEFileName Pointer to a null-terminated string that specifies the full path of the IME.
     * @param {Pointer<PWSTR>} lpszLayoutText Pointer to a null-terminated string that specifies the name of the IME and the associated layout text.
     * @returns {Pointer<HKL>} Returns the input locale identifier for the IME.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-imminstallimew
     * @since windows5.1.2600
     */
    static ImmInstallIMEW(lpszIMEFileName, lpszLayoutText) {
        result := DllCall("IMM32.dll\ImmInstallIMEW", "ptr", lpszIMEFileName, "ptr", lpszLayoutText, "ptr")
        return result
    }

    /**
     * The ImmGetDefaultIMEWnd function (immdev.h) retrieves the default window handle to the IME class.
     * @remarks
     * The operating system creates a default IME window for every thread. The window is created based on the IME class. The application can send the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-control">WM_IME_CONTROL</a> message to this window.
     * @param {Pointer<HWND>} param0 
     * @returns {Pointer<HWND>} Returns the default window handle to the IME class if successful, or <b>NULL</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetdefaultimewnd
     * @since windows5.1.2600
     */
    static ImmGetDefaultIMEWnd(param0) {
        result := DllCall("IMM32.dll\ImmGetDefaultIMEWnd", "ptr", param0, "ptr")
        return result
    }

    /**
     * The ImmGetDescriptionA (ANSI) function (immdev.h) copies the description of the IME to the specified buffer.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetDescription as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PSTR>} lpszDescription Pointer to a buffer in which the function retrieves the null-terminated string describing the IME.
     * @param {Integer} uBufLen Size, in characters, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed for the complete description, excluding the terminating null character.
     * 
     * <b>Windows NT, Windows 2000, Windows XP:</b> The size of the buffer is in Unicode characters, each consisting of two bytes. If the parameter is set to 0, the function returns the size of the buffer required in Unicode characters, excluding the Unicode terminating null character.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetdescriptiona
     * @since windows5.1.2600
     */
    static ImmGetDescriptionA(param0, lpszDescription, uBufLen) {
        DllCall("IMM32.dll\ImmGetDescriptionA", "ptr", param0, "ptr", lpszDescription, "uint", uBufLen)
    }

    /**
     * The ImmGetDescriptionW (Unicode) function (immdev.h) copies the description of the IME to the specified buffer.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetDescription as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PWSTR>} lpszDescription Pointer to a buffer in which the function retrieves the null-terminated string describing the IME.
     * @param {Integer} uBufLen Size, in characters, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed for the complete description, excluding the terminating null character.
     * 
     * <b>Windows NT, Windows 2000, Windows XP:</b> The size of the buffer is in Unicode characters, each consisting of two bytes. If the parameter is set to 0, the function returns the size of the buffer required in Unicode characters, excluding the Unicode terminating null character.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetdescriptionw
     * @since windows5.1.2600
     */
    static ImmGetDescriptionW(param0, lpszDescription, uBufLen) {
        DllCall("IMM32.dll\ImmGetDescriptionW", "ptr", param0, "ptr", lpszDescription, "uint", uBufLen)
    }

    /**
     * The ImmGetIMEFileNameA (ANSI) function (immdev.h) retrieves the file name of the IME associated with the specified input locale.
     * @remarks
     * In the registry, the operating system stores the file name as the "IME name value" in the registry key HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Keyboard Layouts\HKL.
     *       
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetIMEFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PSTR>} lpszFileName Pointer to a buffer in which the function retrieves the file name. This parameter contains <b>NULL</b> when <i>uBufLen</i> is set to <b>NULL</b>.
     * @param {Integer} uBufLen Size, in bytes, of the output buffer. The application specifies 0 if the function is to return the buffer size needed to receive the file name, not including the terminating null character. For Unicode, <i>uBufLen</i> specifies the size in Unicode characters, not including the terminating null character.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimefilenamea
     * @since windows5.1.2600
     */
    static ImmGetIMEFileNameA(param0, lpszFileName, uBufLen) {
        DllCall("IMM32.dll\ImmGetIMEFileNameA", "ptr", param0, "ptr", lpszFileName, "uint", uBufLen)
    }

    /**
     * The ImmGetIMEFileNameW (Unicode) function (immdev.h) retrieves the file name of the IME associated with the specified input locale.
     * @remarks
     * In the registry, the operating system stores the file name as the "IME name value" in the registry key HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Keyboard Layouts\HKL.
     *       
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetIMEFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PWSTR>} lpszFileName Pointer to a buffer in which the function retrieves the file name. This parameter contains <b>NULL</b> when <i>uBufLen</i> is set to <b>NULL</b>.
     * @param {Integer} uBufLen Size, in bytes, of the output buffer. The application specifies 0 if the function is to return the buffer size needed to receive the file name, not including the terminating null character. For Unicode, <i>uBufLen</i> specifies the size in Unicode characters, not including the terminating null character.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimefilenamew
     * @since windows5.1.2600
     */
    static ImmGetIMEFileNameW(param0, lpszFileName, uBufLen) {
        DllCall("IMM32.dll\ImmGetIMEFileNameW", "ptr", param0, "ptr", lpszFileName, "uint", uBufLen)
    }

    /**
     * The ImmGetProperty function (immdev.h) retrieves the property and capabilities of the IME associated with the specified input locale.
     * @param {Pointer<HKL>} param0 
     * @param {Integer} param1 
     * @returns {Integer} Returns the property or capability value, depending on the value of the <i>dwIndex</i> parameter. If <i>dwIndex</i> is set to IGP_PROPERTY, the function returns one or more of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>IME_PROP_AT_CARET</td>
     * <td>If set, conversion window is at the caret position. If clear, the window is near the caret position.</td>
     * </tr>
     * <tr>
     * <td>IME_PROP_SPECIAL_UI</td>
     * <td>If set, the IME has a nonstandard user interface. The application should not draw in the IME window.</td>
     * </tr>
     * <tr>
     * <td>IME_PROP_CANDLIST_START_FROM_1</td>
     * <td>If set, strings in the candidate list are numbered starting at 1. If clear, strings start at 0.</td>
     * </tr>
     * <tr>
     * <td>IME_PROP_UNICODE</td>
     * <td>If set, the IME is viewed as a Unicode IME. The operating system and the IME communicate through the Unicode IME interface. If clear, the IME uses the ANSI interface to communicate with the operating system.</td>
     * </tr>
     * <tr>
     * <td>IME_PROP_COMPLETE_ON_UNSELECT</td>
     * <td>If set, the IME completes the composition string when the IME is deactivated. If clear, the IME cancels the composition string when the IME is deactivated, for example, from a keyboard layout change.</td>
     * </tr>
     * <tr>
     * <td>IME_PROP_ACCEPT_WIDE_VKEY</td>
     * <td>If set, the IME processes the injected Unicode that came from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> function by using VK_PACKET. If clear, the IME might not process the injected Unicode, and might send the injected Unicode to the application directly.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is set to IGP_UI, the function returns one or more of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>UI_CAP_2700</td>
     * <td>Support text escapement values of 0 or 2700. For more information, see the <b>lfEscapement</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.</td>
     * </tr>
     * <tr>
     * <td>UI_CAP_ROT90</td>
     * <td>Support text escapement values of 0, 900, 1800, or 2700. For more information, see <b>lfEscapement</b>.</td>
     * </tr>
     * <tr>
     * <td>UI_CAP_ROTANY</td>
     * <td>Support any text escapement value. For more information, see <b>lfEscapement</b>.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is set to IGP_SETCOMPSTR, the function returns one or more of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>SCS_CAP_COMPSTR</td>
     * <td>Create the composition string by calling the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> function with the SCS_SETSTR value.</td>
     * </tr>
     * <tr>
     * <td>SCS_CAP_MAKEREAD</td>
     * <td>Create the reading string from corresponding composition string when using the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> function with SCS_SETSTR and without setting <i>lpRead</i>.</td>
     * </tr>
     * <tr>
     * <td>SCS_CAP_SETRECONVERTSTRING:</td>
     * <td>This IME can support reconversion. Use <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> to do reconversion.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is set to IGP_SELECT, the function returns one or more of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>SELECT_CAP_CONVMODE</td>
     * <td>Inherit conversion mode when a new IME is selected.</td>
     * </tr>
     * <tr>
     * <td>SELECT_CAP_SENTENCE</td>
     * <td>Inherit sentence mode when a new IME is selected.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is set to IGP_GETIMEVERSION, the function returns one or more of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>IMEVER_0310</td>
     * <td>The IME was created for Windows 3.1.</td>
     * </tr>
     * <tr>
     * <td>IMEVER_0400</td>
     * <td>The IME was created for Windows Me/98/95.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetproperty
     * @since windows5.1.2600
     */
    static ImmGetProperty(param0, param1) {
        result := DllCall("IMM32.dll\ImmGetProperty", "ptr", param0, "uint", param1, "uint")
        return result
    }

    /**
     * The ImmIsIME function (immdev.h) determines if the specified input locale has an IME.
     * @param {Pointer<HKL>} param0 
     * @returns {Integer} Returns a nonzero value if the specified locale has an IME, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immisime
     * @since windows5.1.2600
     */
    static ImmIsIME(param0) {
        result := DllCall("IMM32.dll\ImmIsIME", "ptr", param0, "int")
        return result
    }

    /**
     * The ImmSimulateHotKey function (immdev.h) simulates the specified IME hot key, causing the same response as if the user presses the hot key in the specified window.
     * @param {Pointer<HWND>} param0 
     * @param {Integer} param1 
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsimulatehotkey
     * @since windows5.1.2600
     */
    static ImmSimulateHotKey(param0, param1) {
        result := DllCall("IMM32.dll\ImmSimulateHotKey", "ptr", param0, "uint", param1, "int")
        return result
    }

    /**
     * The ImmCreateContext function (immdev.h) creates a new input context, allocating memory for the context and initializing it.
     * @returns {Pointer<HIMC>} Returns the handle to the new input context if successful, or <b>NULL</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immcreatecontext
     * @since windows5.1.2600
     */
    static ImmCreateContext() {
        result := DllCall("IMM32.dll\ImmCreateContext", "ptr")
        return result
    }

    /**
     * The ImmDestroyContext function (immdev.h) releases the input context and frees associated memory.
     * @remarks
     * Any application that creates an input context by using the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immcreatecontext">ImmCreateContext</a> function must call this function to free the context before it terminates. However, before calling <b>ImmDestroyContext</b>, the application must remove the input context from any association with windows in the thread by using the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immassociatecontext">ImmAssociateContext</a> function.
     * @param {Pointer<HIMC>} param0 
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdestroycontext
     * @since windows5.1.2600
     */
    static ImmDestroyContext(param0) {
        result := DllCall("IMM32.dll\ImmDestroyContext", "ptr", param0, "int")
        return result
    }

    /**
     * The ImmGetContext function (immdev.h) returns the input context associated with the specified window.
     * @remarks
     * An application should routinely use this function to retrieve the current input context before attempting to access information in the context.
     * 
     * The application must call <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immreleasecontext">ImmReleaseContext</a> when it is finished with the input context.
     * @param {Pointer<HWND>} param0 
     * @returns {Pointer<HIMC>} Returns the handle to the input context.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcontext
     * @since windows5.1.2600
     */
    static ImmGetContext(param0) {
        result := DllCall("IMM32.dll\ImmGetContext", "ptr", param0, "ptr")
        return result
    }

    /**
     * The ImmReleaseContext function (immdev.h) releases the input context and unlocks the memory associated in the input context.
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<HIMC>} param1 
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immreleasecontext
     * @since windows5.1.2600
     */
    static ImmReleaseContext(param0, param1) {
        result := DllCall("IMM32.dll\ImmReleaseContext", "ptr", param0, "ptr", param1, "int")
        return result
    }

    /**
     * The ImmAssociateContext function (immdev.h) associates the specified input context with the specified window.
     * @remarks
     * When associating an input context with a window, an application must remove the association before destroying the input context. One way to do this is to save the handle and reassociate it to the default input context with the window.
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<HIMC>} param1 
     * @returns {Pointer<HIMC>} Returns the handle to the input context previously associated with the window.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immassociatecontext
     * @since windows5.1.2600
     */
    static ImmAssociateContext(param0, param1) {
        result := DllCall("IMM32.dll\ImmAssociateContext", "ptr", param0, "ptr", param1, "ptr")
        return result
    }

    /**
     * The ImmAssociateContextEx function (immdev.h) changes the association between the input method context and the specified window or its children.
     * @remarks
     * If the application calls this function with IACE_CHILDREN, the operating system associates the specified input method context with child windows of the window indicated by <i>hWnd</i>. It associates the input method context only with child windows of the thread that creates <i>hWnd</i>. Any child window that is created after this function has been called will not be affected. Instead, the default input method context will be associated with it.
     * 
     * If the application calls this function with IACE_DEFAULT, the operating system restores the default input method context for the window. In this case, the <i>hIMC</i> parameter is ignored.
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<HIMC>} param1 
     * @param {Integer} param2 
     * @returns {Integer} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immassociatecontextex
     * @since windows5.1.2600
     */
    static ImmAssociateContextEx(param0, param1, param2) {
        result := DllCall("IMM32.dll\ImmAssociateContextEx", "ptr", param0, "ptr", param1, "uint", param2, "int")
        return result
    }

    /**
     * The ImmGetCompositionStringA (ANSI) function (immdev.h) retrieves information about the composition string.
     * @remarks
     * An application calls this function in response to the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-startcomposition">WM_IME_STARTCOMPOSITION</a> message. The IMM removes the information when the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immreleasecontext">ImmReleaseContext</a> function.
     * 
     * <div class="alert"><b>Note</b>  You must write code to handle both full-width Hiragana and half-width Katakana if your application is used with the Soft Input Panel (SIP).</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} lpBuf Pointer to a buffer in which the function retrieves the composition string information.
     * @param {Integer} dwBufLen Size, in bytes, of the output buffer, even if the output is a Unicode string. The application sets this parameter to 0 if the function is to return the size of the required output buffer.
     * @returns {Integer} Returns the number of bytes copied to the output buffer. If <i>dwBufLen</i> is set to 0, the function returns the buffer size, in bytes, required to receive all requested information, excluding the terminating null character. The return value is always the size, in bytes, even if the requested data is a Unicode string.
     * 
     * This function returns one of the following negative error codes if it does not succeed:
     * 
     * 
     * <ul>
     * <li>IMM_ERROR_NODATA. Composition data is not ready in the input context.</li>
     * <li>IMM_ERROR_GENERAL. General error detected by IME.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionstringa
     * @since windows5.1.2600
     */
    static ImmGetCompositionStringA(param0, param1, lpBuf, dwBufLen) {
        result := DllCall("IMM32.dll\ImmGetCompositionStringA", "ptr", param0, "uint", param1, "ptr", lpBuf, "uint", dwBufLen, "int")
        return result
    }

    /**
     * The ImmGetCompositionStringW (Unicode) function (immdev.h) retrieves information about the composition string.
     * @remarks
     * An application calls this function in response to the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-startcomposition">WM_IME_STARTCOMPOSITION</a> message. The IMM removes the information when the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immreleasecontext">ImmReleaseContext</a> function.
     * 
     * <div class="alert"><b>Note</b>  You must write code to handle both full-width Hiragana and half-width Katakana if your application is used with the Soft Input Panel (SIP).</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} lpBuf Pointer to a buffer in which the function retrieves the composition string information.
     * @param {Integer} dwBufLen Size, in bytes, of the output buffer, even if the output is a Unicode string. The application sets this parameter to 0 if the function is to return the size of the required output buffer.
     * @returns {Integer} Returns the number of bytes copied to the output buffer. If <i>dwBufLen</i> is set to 0, the function returns the buffer size, in bytes, required to receive all requested information, excluding the terminating null character. The return value is always the size, in bytes, even if the requested data is a Unicode string.
     * 
     * This function returns one of the following negative error codes if it does not succeed:
     * 
     * 
     * <ul>
     * <li>IMM_ERROR_NODATA. Composition data is not ready in the input context.</li>
     * <li>IMM_ERROR_GENERAL. General error detected by IME.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionstringw
     * @since windows5.1.2600
     */
    static ImmGetCompositionStringW(param0, param1, lpBuf, dwBufLen) {
        result := DllCall("IMM32.dll\ImmGetCompositionStringW", "ptr", param0, "uint", param1, "ptr", lpBuf, "uint", dwBufLen, "int")
        return result
    }

    /**
     * The ImmSetCompositionStringA (ANSI) function (immdev.h) sets the characters, attributes, and clauses of the composition and reading strings.
     * @remarks
     * The application can set <i>lpComp</i>, <i>lpRead</i>, or both. If the application does not specify a value for <i>lpComp</i>, it must set this parameter to <b>NULL</b> and set <i>dwCompLen</i> to 0.
     * 
     * When the application is changing attributes, all characters in a clause must have the same attribute. Converted characters must have the attribute ATTR_CONVERTED or ATTR_TARGET_CONVERTED. Unconverted characters must have the attribute ATTR_INPUT or ATTR_TARGET_NOTCONVERTED.
     * 
     * When the application is changing clause information, it can change only the target clause, just affecting one boundary at a time. The target clause has the attribute ATTR_TARGET_CONVERTED or ATTR_TARGET_NOTCONVERTED.
     * 
     * For additional information about attributes (ATTR_* values), see <a href="https://docs.microsoft.com/windows/desktop/Intl/composition-string">Composition String</a>.
     * 
     * When the IME completes the changes, it sends a <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> message to the application to notify it of the changes.
     * 
     * <b>Windows Me/98, Windows 2000, Windows XP:</b> The SCS_*CONVERTSTRING values are used for reconversion. They can only be used for an IME that has the SCS_CAP_SETRECONVERTSTRING property. The application uses these values as follows:
     * 
     * <ol>
     * <li>Call <b>ImmSetCompositionString</b> with SCS_QUERYRECONVERTSTRING, so that IME adjusts the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure for the reconversion.</li>
     * <li>Call <b>ImmSetCompositionString</b> with SCS_SETRECONVERTSTRING, so that IME generates a new composition string. After this, <i>lpComp</i> and <i>lpRead</i> indicate a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure that contains the updated composition and reading string. Use the value of <i>lpRead</i> only when the selected IME has SCS_CAP_MAKEREAD set.</li>
     * </ol>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmSetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} lpComp Pointer to a buffer containing the information to set for the composition string, as specified by the value of <i>dwIndex</i>.
     * @param {Integer} dwCompLen Size, in bytes, of the information buffer for the composition string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
     * @param {Pointer<Void>} lpRead Pointer to a buffer containing the information to set for the reading string, as specified by the value of <i>dwIndex</i>. The application can set this parameter to <b>NULL</b>.
     * @param {Integer} dwReadLen Size, in bytes, of the information buffer for the reading string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionstringa
     * @since windows5.1.2600
     */
    static ImmSetCompositionStringA(param0, dwIndex, lpComp, dwCompLen, lpRead, dwReadLen) {
        result := DllCall("IMM32.dll\ImmSetCompositionStringA", "ptr", param0, "uint", dwIndex, "ptr", lpComp, "uint", dwCompLen, "ptr", lpRead, "uint", dwReadLen, "int")
        return result
    }

    /**
     * The ImmSetCompositionStringW (Unicode) function (immdev.h) sets the characters, attributes, and clauses of the composition and reading strings.
     * @remarks
     * The application can set <i>lpComp</i>, <i>lpRead</i>, or both. If the application does not specify a value for <i>lpComp</i>, it must set this parameter to <b>NULL</b> and set <i>dwCompLen</i> to 0.
     * 
     * When the application is changing attributes, all characters in a clause must have the same attribute. Converted characters must have the attribute ATTR_CONVERTED or ATTR_TARGET_CONVERTED. Unconverted characters must have the attribute ATTR_INPUT or ATTR_TARGET_NOTCONVERTED.
     * 
     * When the application is changing clause information, it can change only the target clause, just affecting one boundary at a time. The target clause has the attribute ATTR_TARGET_CONVERTED or ATTR_TARGET_NOTCONVERTED.
     * 
     * For additional information about attributes (ATTR_* values), see <a href="https://docs.microsoft.com/windows/desktop/Intl/composition-string">Composition String</a>.
     * 
     * When the IME completes the changes, it sends a <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> message to the application to notify it of the changes.
     * 
     * <b>Windows Me/98, Windows 2000, Windows XP:</b> The SCS_*CONVERTSTRING values are used for reconversion. They can only be used for an IME that has the SCS_CAP_SETRECONVERTSTRING property. The application uses these values as follows:
     * 
     * <ol>
     * <li>Call <b>ImmSetCompositionString</b> with SCS_QUERYRECONVERTSTRING, so that IME adjusts the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure for the reconversion.</li>
     * <li>Call <b>ImmSetCompositionString</b> with SCS_SETRECONVERTSTRING, so that IME generates a new composition string. After this, <i>lpComp</i> and <i>lpRead</i> indicate a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure that contains the updated composition and reading string. Use the value of <i>lpRead</i> only when the selected IME has SCS_CAP_MAKEREAD set.</li>
     * </ol>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmSetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} dwIndex 
     * @param {Pointer<Void>} lpComp Pointer to a buffer containing the information to set for the composition string, as specified by the value of <i>dwIndex</i>.
     * @param {Integer} dwCompLen Size, in bytes, of the information buffer for the composition string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
     * @param {Pointer<Void>} lpRead Pointer to a buffer containing the information to set for the reading string, as specified by the value of <i>dwIndex</i>. The application can set this parameter to <b>NULL</b>.
     * @param {Integer} dwReadLen Size, in bytes, of the information buffer for the reading string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionstringw
     * @since windows5.1.2600
     */
    static ImmSetCompositionStringW(param0, dwIndex, lpComp, dwCompLen, lpRead, dwReadLen) {
        result := DllCall("IMM32.dll\ImmSetCompositionStringW", "ptr", param0, "uint", dwIndex, "ptr", lpComp, "uint", dwCompLen, "ptr", lpRead, "uint", dwReadLen, "int")
        return result
    }

    /**
     * The ImmGetCandidateListCountA (ANSI) function (immdev.h) retrieves the size of the candidate lists.
     * @remarks
     * Applications typically call this function in response to an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-opencandidate">IMN_OPENCANDIDATE</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-changecandidate">IMN_CHANGECANDIDATE</a> command.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCandidateListCount as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<UInt32>} lpdwListCount Pointer to the buffer in which this function retrieves the size of the candidate lists.
     * @returns {Integer} Returns the number of bytes required for all candidate lists if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelistcounta
     * @since windows5.1.2600
     */
    static ImmGetCandidateListCountA(param0, lpdwListCount) {
        result := DllCall("IMM32.dll\ImmGetCandidateListCountA", "ptr", param0, "ptr", lpdwListCount, "uint")
        return result
    }

    /**
     * The ImmGetCandidateListCountW (Unicode) function (immdev.h) retrieves the size of the candidate lists.
     * @remarks
     * Applications typically call this function in response to an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-opencandidate">IMN_OPENCANDIDATE</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-changecandidate">IMN_CHANGECANDIDATE</a> command.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCandidateListCount as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<UInt32>} lpdwListCount Pointer to the buffer in which this function retrieves the size of the candidate lists.
     * @returns {Integer} Returns the number of bytes required for all candidate lists if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelistcountw
     * @since windows5.1.2600
     */
    static ImmGetCandidateListCountW(param0, lpdwListCount) {
        result := DllCall("IMM32.dll\ImmGetCandidateListCountW", "ptr", param0, "ptr", lpdwListCount, "uint")
        return result
    }

    /**
     * The ImmGetCandidateListA (ANSI) function (immdev.h) retrieves a candidate list.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCandidateList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} deIndex Zero-based index of the candidate list.
     * @param {Pointer<CANDIDATELIST>} lpCandList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the candidate list.
     * @param {Integer} dwBufLen Size, in bytes, of the buffer to receive the candidate list. The application can specify 0 for this parameter if the function is to return the required size of the output buffer only.
     * @returns {Integer} Returns the number of bytes copied to the candidate list buffer if successful. If the application has supplied 0 for the <i>dwBufLen</i> parameter, the function returns the size required for the candidate list buffer.
     * 
     * The function returns 0 if it does not succeed.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelista
     * @since windows5.1.2600
     */
    static ImmGetCandidateListA(param0, deIndex, lpCandList, dwBufLen) {
        result := DllCall("IMM32.dll\ImmGetCandidateListA", "ptr", param0, "uint", deIndex, "ptr", lpCandList, "uint", dwBufLen, "uint")
        return result
    }

    /**
     * The ImmGetCandidateListW (Unicode) function (immdev.h) retrieves a candidate list.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCandidateList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} deIndex Zero-based index of the candidate list.
     * @param {Pointer<CANDIDATELIST>} lpCandList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the candidate list.
     * @param {Integer} dwBufLen Size, in bytes, of the buffer to receive the candidate list. The application can specify 0 for this parameter if the function is to return the required size of the output buffer only.
     * @returns {Integer} Returns the number of bytes copied to the candidate list buffer if successful. If the application has supplied 0 for the <i>dwBufLen</i> parameter, the function returns the size required for the candidate list buffer.
     * 
     * The function returns 0 if it does not succeed.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelistw
     * @since windows5.1.2600
     */
    static ImmGetCandidateListW(param0, deIndex, lpCandList, dwBufLen) {
        result := DllCall("IMM32.dll\ImmGetCandidateListW", "ptr", param0, "uint", deIndex, "ptr", lpCandList, "uint", dwBufLen, "uint")
        return result
    }

    /**
     * The ImmGetGuideLineA (ANSI) function (immdev.h) retrieves information about errors. Applications use the information for user notifications.
     * @remarks
     * Applications typically call this function after receiving an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-guideline">IMN_GUIDELINE</a> command.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetGuideLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} dwIndex 
     * @param {Pointer<PSTR>} lpBuf Pointer to a buffer in which the function retrieves the error message string. This parameter contains <b>NULL</b> if <i>dwIndex</i> is not GGL_STRING or GGL_PRIVATE or if <i>dwBufLen</i> is set to 0.
     * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed to receive the error message string, not including the terminating null character.
     * @returns {Integer} Returns an error level, an error index, or the size of an error message string, depending on the value of the <i>dwIndex</i> parameter. If <i>dwIndex</i> is GGL_LEVEL, the return is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_ERROR</td>
     * <td>Error. The IME might not be able to continue.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_FATAL</td>
     * <td>Fatal error. The IME cannot continue, and data might be lost.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_INFORMATION</td>
     * <td>No error. Information is available for the user.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_NOGUIDELINE</td>
     * <td>No error. Remove previous error message if still visible.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_WARNING</td>
     * <td>Unexpected input or other result. The user should be warned, but the IME can continue.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is GGL_INDEX, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>GL_ID_CANNOTSAVE</td>
     * <td>The dictionary or the statistics data cannot be saved.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_NOCONVERT</td>
     * <td>The IME cannot convert any more.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_NODICTIONARY</td>
     * <td>The IME cannot find the dictionary, or the dictionary has an unexpected format.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_NOMODULE</td>
     * <td>The IME cannot find the module that is needed.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_READINGCONFLICT</td>
     * <td>A reading conflict occurred. For example, some vowels cannot be put together to form one character.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_TOOMANYSTROKE</td>
     * <td>There are too many strokes for one character or one clause.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_TYPINGERROR</td>
     * <td>Typing error. The IME cannot handle this typing.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_UNKNOWN</td>
     * <td>Unknown error. Refer to the error message string.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_INPUTREADING</td>
     * <td>The IME is accepting reading character input from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_INPUTRADICAL</td>
     * <td>The IME is accepting radical character input from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_INPUTCODE</td>
     * <td>The IME is accepting character code input from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_CHOOSECANDIDATE</td>
     * <td>The IME is accepting candidate string selection from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_REVERSECONVERSION</td>
     * <td>Information about reverse conversion is available by calling <b>ImmGetGuideLine</b>, specifying GGL_PRIVATE. The information retrieved is in <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> format.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is GGL_STRING, the return value is the number of bytes of the string copied to the buffer. However, if <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the string, not including the terminating null character. For Unicode, if <i>dwBufLen</i> is 0, the return value is the size, in bytes not including the Unicode terminating null character.
     * 
     * If <i>dwIndex</i> is GGL_PRIVATE, the return value is the number of bytes of information copied to the buffer. If <i>dwIndex</i> is GGL_PRIVATE and <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the information.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetguidelinea
     * @since windows5.1.2600
     */
    static ImmGetGuideLineA(param0, dwIndex, lpBuf, dwBufLen) {
        result := DllCall("IMM32.dll\ImmGetGuideLineA", "ptr", param0, "uint", dwIndex, "ptr", lpBuf, "uint", dwBufLen, "uint")
        return result
    }

    /**
     * The ImmGetGuideLineW (Unicode) function (immdev.h) retrieves information about errors. Applications use the information for user notifications.
     * @remarks
     * Applications typically call this function after receiving an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-guideline">IMN_GUIDELINE</a> command.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmGetGuideLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} dwIndex 
     * @param {Pointer<PWSTR>} lpBuf Pointer to a buffer in which the function retrieves the error message string. This parameter contains <b>NULL</b> if <i>dwIndex</i> is not GGL_STRING or GGL_PRIVATE or if <i>dwBufLen</i> is set to 0.
     * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed to receive the error message string, not including the terminating null character.
     * @returns {Integer} Returns an error level, an error index, or the size of an error message string, depending on the value of the <i>dwIndex</i> parameter. If <i>dwIndex</i> is GGL_LEVEL, the return is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_ERROR</td>
     * <td>Error. The IME might not be able to continue.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_FATAL</td>
     * <td>Fatal error. The IME cannot continue, and data might be lost.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_INFORMATION</td>
     * <td>No error. Information is available for the user.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_NOGUIDELINE</td>
     * <td>No error. Remove previous error message if still visible.</td>
     * </tr>
     * <tr>
     * <td>GL_LEVEL_WARNING</td>
     * <td>Unexpected input or other result. The user should be warned, but the IME can continue.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is GGL_INDEX, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>GL_ID_CANNOTSAVE</td>
     * <td>The dictionary or the statistics data cannot be saved.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_NOCONVERT</td>
     * <td>The IME cannot convert any more.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_NODICTIONARY</td>
     * <td>The IME cannot find the dictionary, or the dictionary has an unexpected format.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_NOMODULE</td>
     * <td>The IME cannot find the module that is needed.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_READINGCONFLICT</td>
     * <td>A reading conflict occurred. For example, some vowels cannot be put together to form one character.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_TOOMANYSTROKE</td>
     * <td>There are too many strokes for one character or one clause.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_TYPINGERROR</td>
     * <td>Typing error. The IME cannot handle this typing.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_UNKNOWN</td>
     * <td>Unknown error. Refer to the error message string.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_INPUTREADING</td>
     * <td>The IME is accepting reading character input from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_INPUTRADICAL</td>
     * <td>The IME is accepting radical character input from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_INPUTCODE</td>
     * <td>The IME is accepting character code input from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_CHOOSECANDIDATE</td>
     * <td>The IME is accepting candidate string selection from the end user.</td>
     * </tr>
     * <tr>
     * <td>GL_ID_REVERSECONVERSION</td>
     * <td>Information about reverse conversion is available by calling <b>ImmGetGuideLine</b>, specifying GGL_PRIVATE. The information retrieved is in <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> format.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwIndex</i> is GGL_STRING, the return value is the number of bytes of the string copied to the buffer. However, if <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the string, not including the terminating null character. For Unicode, if <i>dwBufLen</i> is 0, the return value is the size, in bytes not including the Unicode terminating null character.
     * 
     * If <i>dwIndex</i> is GGL_PRIVATE, the return value is the number of bytes of information copied to the buffer. If <i>dwIndex</i> is GGL_PRIVATE and <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the information.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetguidelinew
     * @since windows5.1.2600
     */
    static ImmGetGuideLineW(param0, dwIndex, lpBuf, dwBufLen) {
        result := DllCall("IMM32.dll\ImmGetGuideLineW", "ptr", param0, "uint", dwIndex, "ptr", lpBuf, "uint", dwBufLen, "uint")
        return result
    }

    /**
     * The ImmGetConversionStatus function (immdev.h) retrieves the current conversion status.
     * @remarks
     * Conversion and sentence mode values are set only if the IME supports those modes.
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<UInt32>} lpfdwConversion Pointer to a variable in which the function retrieves a combination of conversion mode values. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-conversion-mode-values">IME Conversion Mode Values</a>.
     * @param {Pointer<UInt32>} lpfdwSentence Pointer to a variable in which the function retrieves a sentence mode value. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME Sentence Mode Values</a>.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetconversionstatus
     * @since windows5.1.2600
     */
    static ImmGetConversionStatus(param0, lpfdwConversion, lpfdwSentence) {
        result := DllCall("IMM32.dll\ImmGetConversionStatus", "ptr", param0, "ptr", lpfdwConversion, "ptr", lpfdwSentence, "int")
        return result
    }

    /**
     * The ImmSetConversionStatus function (immdev.h) sets the current conversion status.
     * @remarks
     * This function sends the <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setconversionmode">IMN_SETCONVERSIONMODE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setsentencemode">IMN_SETSENTENCEMODE</a> commands to the application.
     * 
     * <div class="alert"><b>Note</b>  <b>Beginning with Windows 8:</b> By default, the input switch is set per user instead of per thread. 
     * The Microsoft IME (Japanese) respects the mode globally, and therefore  <b>ImmSetConversionStatus</b> fails when getting focus.</div>
     * <div> </div>
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetconversionstatus
     * @since windows5.1.2600
     */
    static ImmSetConversionStatus(param0, param1, param2) {
        result := DllCall("IMM32.dll\ImmSetConversionStatus", "ptr", param0, "uint", param1, "uint", param2, "int")
        return result
    }

    /**
     * The ImmGetOpenStatus function (immdev.h) determines whether the IME is open or closed.
     * @param {Pointer<HIMC>} param0 
     * @returns {Integer} Returns a nonzero value if the IME is open, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetopenstatus
     * @since windows5.1.2600
     */
    static ImmGetOpenStatus(param0) {
        result := DllCall("IMM32.dll\ImmGetOpenStatus", "ptr", param0, "int")
        return result
    }

    /**
     * The ImmSetOpenStatus function (immdev.h) opens or closes the IME.
     * @remarks
     * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setopenstatus">IMN_SETOPENSTATUS</a> command to be sent to the application.
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} param1 
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetopenstatus
     * @since windows5.1.2600
     */
    static ImmSetOpenStatus(param0, param1) {
        result := DllCall("IMM32.dll\ImmSetOpenStatus", "ptr", param0, "int", param1, "int")
        return result
    }

    /**
     * The ImmGetCompositionFontA (ANSI) function (immdev.h) retrieves information about the logical font currently used to display characters in the composition window.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<LOGFONTA>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure in which this function retrieves the font information.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionfonta
     * @since windows5.1.2600
     */
    static ImmGetCompositionFontA(param0, lplf) {
        result := DllCall("IMM32.dll\ImmGetCompositionFontA", "ptr", param0, "ptr", lplf, "int")
        return result
    }

    /**
     * The ImmGetCompositionFontW (Unicode) function (immdev.h) retrieves information about the logical font currently used to display characters in the composition window.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<LOGFONTW>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure in which this function retrieves the font information.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionfontw
     * @since windows5.1.2600
     */
    static ImmGetCompositionFontW(param0, lplf) {
        result := DllCall("IMM32.dll\ImmGetCompositionFontW", "ptr", param0, "ptr", lplf, "int")
        return result
    }

    /**
     * The ImmSetCompositionFontA (ANSI) function (immdev.h) sets the logical font to use to display characters in the composition window.
     * @remarks
     * This function causes a <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcompositionfont">IMN_SETCOMPOSITIONFONT</a> command to be sent to an application. Even if the application never uses the composition window, it must set the appropriate font to ensure that characters are displayed properly. This is especially true for vertical writing.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmSetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<LOGFONTA>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure containing the font information to set.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionfonta
     * @since windows5.1.2600
     */
    static ImmSetCompositionFontA(param0, lplf) {
        result := DllCall("IMM32.dll\ImmSetCompositionFontA", "ptr", param0, "ptr", lplf, "int")
        return result
    }

    /**
     * The ImmSetCompositionFontW (Unicode) function (immdev.h) sets the logical font to use to display characters in the composition window.
     * @remarks
     * This function causes a <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcompositionfont">IMN_SETCOMPOSITIONFONT</a> command to be sent to an application. Even if the application never uses the composition window, it must set the appropriate font to ensure that characters are displayed properly. This is especially true for vertical writing.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmSetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<LOGFONTW>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure containing the font information to set.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionfontw
     * @since windows5.1.2600
     */
    static ImmSetCompositionFontW(param0, lplf) {
        result := DllCall("IMM32.dll\ImmSetCompositionFontW", "ptr", param0, "ptr", lplf, "int")
        return result
    }

    /**
     * The ImmConfigureIMEA (ANSI) function (immdev.h) displays the configuration dialog box for the IME of the specified input locale identifier.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmConfigureIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<HWND>} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immconfigureimea
     * @since windows5.1.2600
     */
    static ImmConfigureIMEA(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmConfigureIMEA", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "int")
        return result
    }

    /**
     * The ImmConfigureIMEW (Unicode) function (immdev.h) displays the configuration dialog box for the IME of the specified input locale identifier.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmConfigureIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<HWND>} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immconfigureimew
     * @since windows5.1.2600
     */
    static ImmConfigureIMEW(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmConfigureIMEW", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "int")
        return result
    }

    /**
     * The ImmEscapeA (ANSI) function (immdev.h) accesses capabilities of particular IMEs that are not available through other IME API functions.
     * @remarks
     * When <i>uEscape</i> is set to IME_ESC_QUERY_SUPPORT, <i>lpData</i> indicates the buffer containing the IME escape value. For example, to see if the current IME supports IME_ESC_GETHELPFILENAME, your application uses the following call:
     * 
     * 
     * ```cpp
     * DWORD dwEsc = IME_ESC_GETHELPFILENAME;
     * LRESULT lRet = ImmEscape(hKL,
     *                          hIMC,
     *                          IME_ESC_QUERY_SUPPORT,
     *                          (LPVOID)&dwEsc);
     * 
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmEscape as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<HIMC>} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Pointer} Returns an operation-specific value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immescapea
     * @since windows5.1.2600
     */
    static ImmEscapeA(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmEscapeA", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "ptr")
        return result
    }

    /**
     * The ImmEscapeW (Unicode) function (immdev.h) accesses capabilities of particular IMEs that are not available through other IME API functions.
     * @remarks
     * When <i>uEscape</i> is set to IME_ESC_QUERY_SUPPORT, <i>lpData</i> indicates the buffer containing the IME escape value. For example, to see if the current IME supports IME_ESC_GETHELPFILENAME, your application uses the following call:
     * 
     * 
     * ```cpp
     * DWORD dwEsc = IME_ESC_GETHELPFILENAME;
     * LRESULT lRet = ImmEscape(hKL,
     *                          hIMC,
     *                          IME_ESC_QUERY_SUPPORT,
     *                          (LPVOID)&dwEsc);
     * 
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmEscape as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<HIMC>} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Pointer} Returns an operation-specific value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immescapew
     * @since windows5.1.2600
     */
    static ImmEscapeW(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmEscapeW", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "ptr")
        return result
    }

    /**
     * The ImmGetConversionListA (ANSI) function (immdev.h) retrieves the conversion result list of characters or words without generating any IME-related messages.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetConversionList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<HIMC>} param1 
     * @param {Pointer<PSTR>} lpSrc Pointer to a null-terminated character string specifying the source of the list.
     * @param {Pointer<CANDIDATELIST>} lpDst Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the list.
     * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size required for the complete conversion result list.
     * @param {Integer} uFlag 
     * @returns {Integer} Returns the number of bytes copied to the output buffer. If the application sets the <i>dwBufLen</i> parameter to 0, the function returns the size, in bytes, of the required output buffer.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetconversionlista
     * @since windows5.1.2600
     */
    static ImmGetConversionListA(param0, param1, lpSrc, lpDst, dwBufLen, uFlag) {
        result := DllCall("IMM32.dll\ImmGetConversionListA", "ptr", param0, "ptr", param1, "ptr", lpSrc, "ptr", lpDst, "uint", dwBufLen, "uint", uFlag, "uint")
        return result
    }

    /**
     * The ImmGetConversionListW (Unicode) function (immdev.h) retrieves the conversion result list of characters or words without generating any IME-related messages.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetConversionList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<HIMC>} param1 
     * @param {Pointer<PWSTR>} lpSrc Pointer to a null-terminated character string specifying the source of the list.
     * @param {Pointer<CANDIDATELIST>} lpDst Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the list.
     * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size required for the complete conversion result list.
     * @param {Integer} uFlag 
     * @returns {Integer} Returns the number of bytes copied to the output buffer. If the application sets the <i>dwBufLen</i> parameter to 0, the function returns the size, in bytes, of the required output buffer.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetconversionlistw
     * @since windows5.1.2600
     */
    static ImmGetConversionListW(param0, param1, lpSrc, lpDst, dwBufLen, uFlag) {
        result := DllCall("IMM32.dll\ImmGetConversionListW", "ptr", param0, "ptr", param1, "ptr", lpSrc, "ptr", lpDst, "uint", dwBufLen, "uint", uFlag, "uint")
        return result
    }

    /**
     * The ImmNotifyIME function (immdev.h) notifies the IME about changes to the status of the input context.
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} dwAction 
     * @param {Integer} dwIndex 
     * @param {Integer} dwValue Index of a candidate string. The application can set this parameter or ignore it, depending on the value of the <i>dwAction</i> parameter.
     * @returns {Integer} Returns nonzero if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immnotifyime
     * @since windows5.1.2600
     */
    static ImmNotifyIME(param0, dwAction, dwIndex, dwValue) {
        result := DllCall("IMM32.dll\ImmNotifyIME", "ptr", param0, "uint", dwAction, "uint", dwIndex, "uint", dwValue, "int")
        return result
    }

    /**
     * The ImmGetStatusWindowPos function (immdev.h) retrieves the position of the status window.
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<POINT>} lpptPos Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure in which the function retrieves the position coordinates. These are screen coordinates, relative to the upper left corner of the screen.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetstatuswindowpos
     * @since windows5.1.2600
     */
    static ImmGetStatusWindowPos(param0, lpptPos) {
        result := DllCall("IMM32.dll\ImmGetStatusWindowPos", "ptr", param0, "ptr", lpptPos, "int")
        return result
    }

    /**
     * The ImmSetStatusWindowPos function (immdev.h) sets the position of the status window.
     * @remarks
     * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setstatuswindowpos">IMN_SETSTATUSWINDOWPOS</a> command to be sent to the application.
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<POINT>} lpptPos Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the new position of the status window, in screen coordinates relative to the upper left corner of the display screen.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetstatuswindowpos
     * @since windows5.1.2600
     */
    static ImmSetStatusWindowPos(param0, lpptPos) {
        result := DllCall("IMM32.dll\ImmSetStatusWindowPos", "ptr", param0, "ptr", lpptPos, "int")
        return result
    }

    /**
     * The ImmGetCompositionWindow function (immdev.h) retrieves information about the composition window.
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<COMPOSITIONFORM>} lpCompForm Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-compositionform">COMPOSITIONFORM</a> structure in which the function retrieves information about the composition window.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionwindow
     * @since windows5.1.2600
     */
    static ImmGetCompositionWindow(param0, lpCompForm) {
        result := DllCall("IMM32.dll\ImmGetCompositionWindow", "ptr", param0, "ptr", lpCompForm, "int")
        return result
    }

    /**
     * The ImmSetCompositionWindow function (immdev.h) sets the position of the composition window.
     * @remarks
     * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcompositionwindow">IMN_SETCOMPOSITIONWINDOW</a> command to be sent to the application.
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<COMPOSITIONFORM>} lpCompForm Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-compositionform">COMPOSITIONFORM</a> structure that contains the new position and other related information about the composition window.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionwindow
     * @since windows5.1.2600
     */
    static ImmSetCompositionWindow(param0, lpCompForm) {
        result := DllCall("IMM32.dll\ImmSetCompositionWindow", "ptr", param0, "ptr", lpCompForm, "int")
        return result
    }

    /**
     * The ImmGetCandidateWindow function (immdev.h) retrieves information about the candidates window.
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} param1 
     * @param {Pointer<CANDIDATEFORM>} lpCandidate Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidateform">CANDIDATEFORM</a> structure in which this function retrieves information about the candidates window.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatewindow
     * @since windows5.1.2600
     */
    static ImmGetCandidateWindow(param0, param1, lpCandidate) {
        result := DllCall("IMM32.dll\ImmGetCandidateWindow", "ptr", param0, "uint", param1, "ptr", lpCandidate, "int")
        return result
    }

    /**
     * The ImmSetCandidateWindow function (immdev.h) sets information about the candidates window.
     * @remarks
     * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcandidatepos">IMN_SETCANDIDATEPOS</a> command to be sent. Both the IME and the application call this function.
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer<CANDIDATEFORM>} lpCandidate Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidateform">CANDIDATEFORM</a> structure that contains information about the candidates window.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcandidatewindow
     * @since windows5.1.2600
     */
    static ImmSetCandidateWindow(param0, lpCandidate) {
        result := DllCall("IMM32.dll\ImmSetCandidateWindow", "ptr", param0, "ptr", lpCandidate, "int")
        return result
    }

    /**
     * The ImmIsUIMessageA (ANSI) function (immdev.h) checks for messages intended for the IME window and sends those messages to the window.
     * @remarks
     * An application typically uses this function to display a composition string or candidate list specified by the IME. If <i>hWndIME</i> is <b>NULL</b>, the function determines if the message is a user interface message.
     * 
     * <b>Windows Me/98:</b> This function has only an ANSI version. To receive Unicode characters from a Unicode-based IME, the application should use <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immgetcompositionstringa">ImmGetCompositionString</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmIsUIMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HWND>} param0 
     * @param {Integer} param1 
     * @param {Pointer} param2 
     * @param {Pointer} param3 
     * @returns {Integer} Returns a nonzero value if the message is processed by the IME window, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immisuimessagea
     * @since windows5.1.2600
     */
    static ImmIsUIMessageA(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmIsUIMessageA", "ptr", param0, "uint", param1, "ptr", param2, "ptr", param3, "int")
        return result
    }

    /**
     * The ImmIsUIMessageW (Unicode) function (immdev.h) checks for messages intended for the IME window and sends those messages to the window.
     * @remarks
     * An application typically uses this function to display a composition string or candidate list specified by the IME. If <i>hWndIME</i> is <b>NULL</b>, the function determines if the message is a user interface message.
     * 
     * <b>Windows Me/98:</b> This function has only an ANSI version. To receive Unicode characters from a Unicode-based IME, the application should use <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immgetcompositionstringa">ImmGetCompositionString</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmIsUIMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HWND>} param0 
     * @param {Integer} param1 
     * @param {Pointer} param2 
     * @param {Pointer} param3 
     * @returns {Integer} Returns a nonzero value if the message is processed by the IME window, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immisuimessagew
     * @since windows5.1.2600
     */
    static ImmIsUIMessageW(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmIsUIMessageW", "ptr", param0, "uint", param1, "ptr", param2, "ptr", param3, "int")
        return result
    }

    /**
     * The ImmGetVirtualKey function (immdev.h) retrieves the original virtual key value associated with a key input message that the IME has already processed.
     * @remarks
     * Although the IME sets the virtual key value to VK_PROCESSKEY after processing a key input message, an application can recover the original virtual key value with the <b>ImmGetVirtualKey</b> function. This function is used only for key input messages containing the VK_PROCESSKEY value. Applications can only get the original virtual key by using this function after receiving 
     * 
     * the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a> (VK_PROCESSKEY) message, and before <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> is called in its own 
     * 
     * message loop.
     * @param {Pointer<HWND>} param0 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetvirtualkey
     * @since windows5.1.2600
     */
    static ImmGetVirtualKey(param0) {
        DllCall("IMM32.dll\ImmGetVirtualKey", "ptr", param0)
    }

    /**
     * The ImmRegisterWordA (ANSI) function (immdev.h) registers a string with the dictionary of the IME associated with the specified input locale.
     * @remarks
     * An IME independent software vendor (ISV) can define private styles for an IME in the IME_REGWORD_STYLE_USER_FIRST and IME_REGWORD_STYLE_USER_LAST values. For example:
     * 
     * 
     * ```cpp
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PSTR>} lpszReading Pointer to a null-terminated reading string associated with the string to register.
     * @param {Integer} param2 
     * @param {Pointer<PSTR>} lpszRegister Pointer to the null-terminated string to register.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immregisterworda
     * @since windows5.1.2600
     */
    static ImmRegisterWordA(param0, lpszReading, param2, lpszRegister) {
        result := DllCall("IMM32.dll\ImmRegisterWordA", "ptr", param0, "ptr", lpszReading, "uint", param2, "ptr", lpszRegister, "int")
        return result
    }

    /**
     * The ImmRegisterWordW (Unicode) function (immdev.h) registers a string with the dictionary of the IME associated with the specified input locale.
     * @remarks
     * An IME independent software vendor (ISV) can define private styles for an IME in the IME_REGWORD_STYLE_USER_FIRST and IME_REGWORD_STYLE_USER_LAST values. For example:
     * 
     * 
     * ```cpp
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PWSTR>} lpszReading Pointer to a null-terminated reading string associated with the string to register.
     * @param {Integer} param2 
     * @param {Pointer<PWSTR>} lpszRegister Pointer to the null-terminated string to register.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immregisterwordw
     * @since windows5.1.2600
     */
    static ImmRegisterWordW(param0, lpszReading, param2, lpszRegister) {
        result := DllCall("IMM32.dll\ImmRegisterWordW", "ptr", param0, "ptr", lpszReading, "uint", param2, "ptr", lpszRegister, "int")
        return result
    }

    /**
     * The ImmUnregisterWordA (ANSI) function (immdev.h) removes a register string from the dictionary of the IME associated with the specified input locale.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmUnregisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PSTR>} lpszReading Pointer to a null-terminated reading string associated with the string to remove.
     * @param {Integer} param2 
     * @param {Pointer<PSTR>} lpszUnregister Pointer to a null-terminated string specifying the register string to remove.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immunregisterworda
     * @since windows5.1.2600
     */
    static ImmUnregisterWordA(param0, lpszReading, param2, lpszUnregister) {
        result := DllCall("IMM32.dll\ImmUnregisterWordA", "ptr", param0, "ptr", lpszReading, "uint", param2, "ptr", lpszUnregister, "int")
        return result
    }

    /**
     * The ImmUnregisterWordW (Unicode) function (immdev.h) removes a register string from the dictionary of the IME associated with the specified input locale.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmUnregisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<PWSTR>} lpszReading Pointer to a null-terminated reading string associated with the string to remove.
     * @param {Integer} param2 
     * @param {Pointer<PWSTR>} lpszUnregister Pointer to a null-terminated string specifying the register string to remove.
     * @returns {Integer} Returns a nonzero value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immunregisterwordw
     * @since windows5.1.2600
     */
    static ImmUnregisterWordW(param0, lpszReading, param2, lpszUnregister) {
        result := DllCall("IMM32.dll\ImmUnregisterWordW", "ptr", param0, "ptr", lpszReading, "uint", param2, "ptr", lpszUnregister, "int")
        return result
    }

    /**
     * The ImmGetRegisterWordStyleA (ANSI) function (immdev.h) retrieves a list of the styles supported by the IME associated with the specified input locale.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetRegisterWordStyle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Integer} nItem Maximum number of styles that the output buffer can hold. The application sets this parameter to 0 if the function is to count the number of styles available in the IME.
     * @param {Pointer<STYLEBUFA>} lpStyleBuf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-stylebufa">STYLEBUF</a> structure in which the function retrieves the style information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetregisterwordstylea
     * @since windows5.1.2600
     */
    static ImmGetRegisterWordStyleA(param0, nItem, lpStyleBuf) {
        DllCall("IMM32.dll\ImmGetRegisterWordStyleA", "ptr", param0, "uint", nItem, "ptr", lpStyleBuf)
    }

    /**
     * The ImmGetRegisterWordStyleW (Unicode) function (immdev.h) retrieves a list of the styles supported by the IME associated with the specified input locale.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetRegisterWordStyle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Integer} nItem Maximum number of styles that the output buffer can hold. The application sets this parameter to 0 if the function is to count the number of styles available in the IME.
     * @param {Pointer<STYLEBUFW>} lpStyleBuf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-stylebufa">STYLEBUF</a> structure in which the function retrieves the style information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetregisterwordstylew
     * @since windows5.1.2600
     */
    static ImmGetRegisterWordStyleW(param0, nItem, lpStyleBuf) {
        DllCall("IMM32.dll\ImmGetRegisterWordStyleW", "ptr", param0, "uint", nItem, "ptr", lpStyleBuf)
    }

    /**
     * The ImmEnumRegisterWordA (ANSI) function (immdev.h) enumerates the register strings having the specified reading string, style, and register string.
     * @remarks
     * If <i>dwStyle</i> is set to 0 and both <i>lpszReading</i> and <i>lpszRegister</i> are set to <b>NULL</b>, this function enumerates all register strings in the IME dictionary.
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmEnumRegisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<REGISTERWORDENUMPROCA>} param1 
     * @param {Pointer<PSTR>} lpszReading Pointer to the reading string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all available reading strings that match the <i>dwStyle</i> and <i>lpszRegister</i> settings.
     * @param {Integer} param3 
     * @param {Pointer<PSTR>} lpszRegister Pointer to the register string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all register strings that match the <i>lpszReading</i> and <i>dwStyle</i> settings.
     * @param {Pointer<Void>} param5 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immenumregisterworda
     * @since windows5.1.2600
     */
    static ImmEnumRegisterWordA(param0, param1, lpszReading, param3, lpszRegister, param5) {
        DllCall("IMM32.dll\ImmEnumRegisterWordA", "ptr", param0, "ptr", param1, "ptr", lpszReading, "uint", param3, "ptr", lpszRegister, "ptr", param5)
    }

    /**
     * The ImmEnumRegisterWordW (Unicode) function (immdev.h) enumerates the register strings having the specified reading string, style, and register string.
     * @remarks
     * If <i>dwStyle</i> is set to 0 and both <i>lpszReading</i> and <i>lpszRegister</i> are set to <b>NULL</b>, this function enumerates all register strings in the IME dictionary.
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmEnumRegisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HKL>} param0 
     * @param {Pointer<REGISTERWORDENUMPROCW>} param1 
     * @param {Pointer<PWSTR>} lpszReading Pointer to the reading string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all available reading strings that match the <i>dwStyle</i> and <i>lpszRegister</i> settings.
     * @param {Integer} param3 
     * @param {Pointer<PWSTR>} lpszRegister Pointer to the register string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all register strings that match the <i>lpszReading</i> and <i>dwStyle</i> settings.
     * @param {Pointer<Void>} param5 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immenumregisterwordw
     * @since windows5.1.2600
     */
    static ImmEnumRegisterWordW(param0, param1, lpszReading, param3, lpszRegister, param5) {
        DllCall("IMM32.dll\ImmEnumRegisterWordW", "ptr", param0, "ptr", param1, "ptr", lpszReading, "uint", param3, "ptr", lpszRegister, "ptr", param5)
    }

    /**
     * The ImmDisableIME function (immdev.h) disables the IME for a thread or for all threads in a process.
     * @remarks
     * The application must call this function before the first top-level window in the thread receives the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a> message. Thus, the application must call this function in one of the following places:
     * 
     * <ul>
     * <li>Any time before calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> to create the first top-level window</li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-nccreate">WM_NCCREATE</a> handler for first top-level window</li>
     * </ul>
     * @param {Integer} param0 
     * @returns {Integer} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdisableime
     * @since windows5.1.2600
     */
    static ImmDisableIME(param0) {
        result := DllCall("IMM32.dll\ImmDisableIME", "uint", param0, "int")
        return result
    }

    /**
     * The ImmEnumInputContext function (immdev.h) retrieves the input context for the specified thread.
     * @remarks
     * This function calls the application callback function for each enumerated input context, and passes the specified <i>lParam</i> value.
     * @param {Integer} idThread 
     * @param {Pointer<IMCENUMPROC>} lpfn Pointer to the enumeration callback function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/imm/nc-imm-imcenumproc">EnumInputContext</a>.
     * @param {Pointer} lParam Application-supplied data. The function passes this data to the callback function.
     * @returns {Integer} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immenuminputcontext
     * @since windows5.1.2600
     */
    static ImmEnumInputContext(idThread, lpfn, lParam) {
        result := DllCall("IMM32.dll\ImmEnumInputContext", "uint", idThread, "ptr", lpfn, "ptr", lParam, "int")
        return result
    }

    /**
     * The ImmGetImeMenuItemsA (ANSI) function (immdev.h) retrieves the menu items that are registered in the IME menu of a specified input context.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetImeMenuItems as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<IMEMENUITEMINFOA>} lpImeParentMenu Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure in which the function retrieves parent menu information. To retrieve information about the submenu items of this parent menu, the application sets the <b>fType</b> member to MFT_SUBMENU. This parameter contains <b>NULL</b> if the function retrieves only top-level menu items.
     * @param {Pointer<IMEMENUITEMINFOA>} lpImeMenu Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structures in which the function retrieves information about the menu items. This parameter contains <b>NULL</b> if the function retrieves the number of registered menu items.
     * @param {Integer} dwSize Size of the buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure.
     * @returns {Integer} Returns the number of menu items copied into <i>lpImeMenu</i>. If <i>lpImeMenu</i> specifies <b>NULL</b>, the function returns the number of registered menu items in the specified input context.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimemenuitemsa
     * @since windows5.1.2600
     */
    static ImmGetImeMenuItemsA(param0, param1, param2, lpImeParentMenu, lpImeMenu, dwSize) {
        result := DllCall("IMM32.dll\ImmGetImeMenuItemsA", "ptr", param0, "uint", param1, "uint", param2, "ptr", lpImeParentMenu, "ptr", lpImeMenu, "uint", dwSize, "uint")
        return result
    }

    /**
     * The ImmGetImeMenuItemsW (Unicode) function (immdev.h) retrieves the menu items that are registered in the IME menu of a specified input context.
     * @remarks
     * > [!NOTE]
     * > The immdev.h header defines ImmGetImeMenuItems as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<IMEMENUITEMINFOW>} lpImeParentMenu Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure in which the function retrieves parent menu information. To retrieve information about the submenu items of this parent menu, the application sets the <b>fType</b> member to MFT_SUBMENU. This parameter contains <b>NULL</b> if the function retrieves only top-level menu items.
     * @param {Pointer<IMEMENUITEMINFOW>} lpImeMenu Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structures in which the function retrieves information about the menu items. This parameter contains <b>NULL</b> if the function retrieves the number of registered menu items.
     * @param {Integer} dwSize Size of the buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure.
     * @returns {Integer} Returns the number of menu items copied into <i>lpImeMenu</i>. If <i>lpImeMenu</i> specifies <b>NULL</b>, the function returns the number of registered menu items in the specified input context.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimemenuitemsw
     * @since windows5.1.2600
     */
    static ImmGetImeMenuItemsW(param0, param1, param2, lpImeParentMenu, lpImeMenu, dwSize) {
        result := DllCall("IMM32.dll\ImmGetImeMenuItemsW", "ptr", param0, "uint", param1, "uint", param2, "ptr", lpImeParentMenu, "ptr", lpImeMenu, "uint", dwSize, "uint")
        return result
    }

    /**
     * The ImmDisableTextFrameService function (immdev.h) is no longer available for use as of Windows Vista.
     * @remarks
     * An application calls this function if it has a thread that is incompatible with TSF.
     * 
     * Note that TSF functionality is provided to applications that are not specifically written to use TSF, Input Method Manager (IMM32), or Active Input Method Manager (AIMM 1.2). Although an application can be written to use TSF, IMM32, and AIMM 1.2, there can be specific controls within the application that do not use these technologies. TSF support is provided to these specific controls as well. This TSF feature is available beginning with Windows XP when all of these dynamic-link libraries (DLLs) are loaded: system modules User32.dll, Imm32.dll, and Win32k.sys, and TSF modules Msctf.dll and Msimtf.dll.
     * @param {Integer} idThread Identifier of the thread for which to disable the text service. The thread must be in the same process as the application. The application sets this parameter to 0 to disable the service for the current thread. The application sets the parameter to –1 to disable the service for all threads in the current process.
     * @returns {Integer} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdisabletextframeservice
     * @since windows5.1.2600
     */
    static ImmDisableTextFrameService(idThread) {
        result := DllCall("IMM32.dll\ImmDisableTextFrameService", "uint", idThread, "int")
        return result
    }

    /**
     * The ImmDisableLegacyIME function (immdev.h) indicates that this thread is a Windows Store app UI thread.
     * @remarks
     * Windows Store app brokers such as explorer.exe should call this function in Windows Store app UI threads to ensure that only IMEs that are compatible with  Windows Store apps are made available.  Those Windows Store app threads that don't require IME input should call <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immdisableime">ImmDisableIME</a> to disable IMM entirely for that thread.
     * 
     * The app must call this function before the first top-level window in the thread receives the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a> message. Thus, the app must call this function in one of the following places:
     * 
     * <ul>
     * <li>Any time before  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> is called to create the first top-level window.</li>
     * <li>In the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-nccreate">WM_NCCREATE</a> handler for the first top-level window.</li>
     * </ul>
     * @returns {Integer} Returns <b>TRUE</b> if successful;   otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdisablelegacyime
     * @since windows8.0
     */
    static ImmDisableLegacyIME() {
        result := DllCall("IMM32.dll\ImmDisableLegacyIME", "int")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<UInt32>} lpuModifiers 
     * @param {Pointer<UInt32>} lpuVKey 
     * @param {Pointer<HKL>} phKL 
     * @returns {Integer} 
     */
    static ImmGetHotKey(param0, lpuModifiers, lpuVKey, phKL) {
        result := DllCall("IMM32.dll\ImmGetHotKey", "uint", param0, "ptr", lpuModifiers, "ptr", lpuVKey, "ptr", phKL, "int")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<HKL>} param3 
     * @returns {Integer} 
     */
    static ImmSetHotKey(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmSetHotKey", "uint", param0, "uint", param1, "uint", param2, "ptr", param3, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMC>} param0 
     * @returns {Integer} 
     */
    static ImmGenerateMessage(param0) {
        result := DllCall("IMM32.dll\ImmGenerateMessage", "ptr", param0, "int")
        return result
    }

    /**
     * Generates a WM_IME_REQUEST message. (ANSI)
     * @remarks
     * IME must use this function instead of sending the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-request">WM_IME_REQUEST</a> message to the application in a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-ihttpmailtransport-sendmessage">SendMessage</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmRequestMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer} param1 
     * @param {Pointer} param2 
     * @returns {Pointer} Returns an operation-specific value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immrequestmessagea
     * @since windows5.1.2600
     */
    static ImmRequestMessageA(param0, param1, param2) {
        result := DllCall("IMM32.dll\ImmRequestMessageA", "ptr", param0, "ptr", param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * Generates a WM_IME_REQUEST message. (Unicode)
     * @remarks
     * IME must use this function instead of sending the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-request">WM_IME_REQUEST</a> message to the application in a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-ihttpmailtransport-sendmessage">SendMessage</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The immdev.h header defines ImmRequestMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HIMC>} param0 
     * @param {Pointer} param1 
     * @param {Pointer} param2 
     * @returns {Pointer} Returns an operation-specific value if successful, or 0 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immrequestmessagew
     * @since windows5.1.2600
     */
    static ImmRequestMessageW(param0, param1, param2) {
        result := DllCall("IMM32.dll\ImmRequestMessageW", "ptr", param0, "ptr", param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<HWND>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {Pointer<HWND>} 
     */
    static ImmCreateSoftKeyboard(param0, param1, param2, param3) {
        result := DllCall("IMM32.dll\ImmCreateSoftKeyboard", "uint", param0, "ptr", param1, "int", param2, "int", param3, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @returns {Integer} 
     */
    static ImmDestroySoftKeyboard(param0) {
        result := DllCall("IMM32.dll\ImmDestroySoftKeyboard", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @param {Integer} param1 
     * @returns {Integer} 
     */
    static ImmShowSoftKeyboard(param0, param1) {
        result := DllCall("IMM32.dll\ImmShowSoftKeyboard", "ptr", param0, "int", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMC>} param0 
     * @returns {Pointer<INPUTCONTEXT>} 
     */
    static ImmLockIMC(param0) {
        result := DllCall("IMM32.dll\ImmLockIMC", "ptr", param0, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMC>} param0 
     * @returns {Integer} 
     */
    static ImmUnlockIMC(param0) {
        result := DllCall("IMM32.dll\ImmUnlockIMC", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMC>} param0 
     * @returns {Integer} 
     */
    static ImmGetIMCLockCount(param0) {
        result := DllCall("IMM32.dll\ImmGetIMCLockCount", "ptr", param0, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {Pointer<HIMCC>} 
     */
    static ImmCreateIMCC(param0) {
        result := DllCall("IMM32.dll\ImmCreateIMCC", "uint", param0, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMCC>} param0 
     * @returns {Pointer<HIMCC>} 
     */
    static ImmDestroyIMCC(param0) {
        result := DllCall("IMM32.dll\ImmDestroyIMCC", "ptr", param0, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMCC>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    static ImmLockIMCC(param0) {
        DllCall("IMM32.dll\ImmLockIMCC", "ptr", param0)
    }

    /**
     * 
     * @param {Pointer<HIMCC>} param0 
     * @returns {Integer} 
     */
    static ImmUnlockIMCC(param0) {
        result := DllCall("IMM32.dll\ImmUnlockIMCC", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMCC>} param0 
     * @returns {Integer} 
     */
    static ImmGetIMCCLockCount(param0) {
        result := DllCall("IMM32.dll\ImmGetIMCCLockCount", "ptr", param0, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMCC>} param0 
     * @param {Integer} param1 
     * @returns {Pointer<HIMCC>} 
     */
    static ImmReSizeIMCC(param0, param1) {
        result := DllCall("IMM32.dll\ImmReSizeIMCC", "ptr", param0, "uint", param1, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HIMCC>} param0 
     * @returns {Integer} 
     */
    static ImmGetIMCCSize(param0) {
        result := DllCall("IMM32.dll\ImmGetIMCCSize", "ptr", param0, "uint")
        return result
    }

;@endregion Methods
}
