#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */

;@region Constants

/**
 * @type {Guid}
 */
export global CATID_MSIME_IImePadApplet_VER7 := Guid("{4a0f8e31-c3ee-11d1-afef-00805f0c8b6d}")

/**
 * @type {Guid}
 */
export global CATID_MSIME_IImePadApplet_VER80 := Guid("{56f7a792-fef1-11d3-8463-00c04f7a06e5}")

/**
 * @type {Guid}
 */
export global CATID_MSIME_IImePadApplet_VER81 := Guid("{656520b0-bb88-11d4-84c0-00c04f7a06e5}")

/**
 * @type {Guid}
 */
export global CATID_MSIME_IImePadApplet900 := Guid("{faae51bf-5e5b-4a1d-8de1-17c1d9e1728d}")

/**
 * @type {Guid}
 */
export global CATID_MSIME_IImePadApplet1000 := Guid("{e081e1d6-2389-43cb-b66f-609f823d9f9c}")

/**
 * @type {Guid}
 */
export global CATID_MSIME_IImePadApplet1200 := Guid("{a47fb5fc-7d15-4223-a789-b781bf9ae667}")

/**
 * @type {Guid}
 */
export global CATID_MSIME_IImePadApplet := Guid("{7566cad1-4ec9-4478-9fe9-8ed766619edf}")

/**
 * @type {Integer (UInt32)}
 */
export global FEID_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FEID_CHINESE_TRADITIONAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global FEID_CHINESE_SIMPLIFIED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FEID_CHINESE_HONGKONG := 3

/**
 * @type {Integer (UInt32)}
 */
export global FEID_CHINESE_SINGAPORE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FEID_JAPANESE := 5

/**
 * @type {Integer (UInt32)}
 */
export global FEID_KOREAN := 6

/**
 * @type {Integer (UInt32)}
 */
export global FEID_KOREAN_JOHAB := 7

/**
 * @type {Integer (UInt32)}
 */
export global INFOMASK_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global INFOMASK_QUERY_CAND := 1

/**
 * @type {Integer (UInt32)}
 */
export global INFOMASK_APPLY_CAND := 2

/**
 * @type {Integer (UInt32)}
 */
export global INFOMASK_APPLY_CAND_EX := 4

/**
 * @type {Integer (UInt32)}
 */
export global INFOMASK_STRING_FIX := 65536

/**
 * @type {Integer (UInt32)}
 */
export global INFOMASK_HIDE_CAND := 131072

/**
 * @type {Integer (UInt32)}
 */
export global INFOMASK_BLOCK_CAND := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IMEFAREASTINFO_TYPE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global IMEFAREASTINFO_TYPE_READING := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMEFAREASTINFO_TYPE_COMMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMEFAREASTINFO_TYPE_COSTTIME := 3

/**
 * @type {Integer (UInt32)}
 */
export global CHARINFO_APPLETID_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global CHARINFO_FEID_MASK := 15728640

/**
 * @type {Integer (UInt32)}
 */
export global CHARINFO_CHARID_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global MAX_APPLETTITLE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_FONTFACE := 32

/**
 * @type {Integer (Int32)}
 */
export global IPACFG_NONE := 0

/**
 * @type {Integer (Int32)}
 */
export global IPACFG_PROPERTY := 1

/**
 * @type {Integer (Int32)}
 */
export global IPACFG_HELP := 2

/**
 * @type {Integer (Int32)}
 */
export global IPACFG_TITLE := 65536

/**
 * @type {Integer (Int32)}
 */
export global IPACFG_TITLEFONTFACE := 131072

/**
 * @type {Integer (Int32)}
 */
export global IPACFG_CATEGORY := 262144

/**
 * @type {Integer (Int32)}
 */
export global IPACFG_LANG := 16

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_SOFTKEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_HANDWRITING := 2

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_STROKESEARCH := 3

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_RADICALSEARCH := 4

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_SYMBOLSEARCH := 5

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_VOICE := 6

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_EPWING := 7

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_OCR := 8

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_CHARLIST := 9

/**
 * @type {Integer (UInt32)}
 */
export global IPACID_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_FIRST := 4096

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_INSERTSTRINGCANDIDATE := 4098

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_INSERTITEMCANDIDATE := 4099

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_SENDKEYCONTROL := 4101

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_GETSELECTEDSTRING := 4103

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_SETAPPLETDATA := 4105

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_GETAPPLETDATA := 4106

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_SETTITLEFONT := 4107

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_GETCOMPOSITIONSTRINGID := 4109

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_INSERTSTRINGCANDIDATEINFO := 4110

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_CHANGESTRINGCANDIDATEINFO := 4111

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_INSERTSTRINGINFO := 4114

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_CHANGESTRINGINFO := 4115

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADREQ_GETCURRENTUILANGID := 4120

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CONVERTALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_DETERMINALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_DETERMINCHAR := 3

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CLEARALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CARETSET := 5

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CARETLEFT := 6

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CARETRIGHT := 7

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CARETTOP := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CARETBOTTOM := 9

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CARETBACKSPACE := 10

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_CARETDELETE := 11

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_PHRASEDELETE := 12

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_INSERTSPACE := 13

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_INSERTFULLSPACE := 14

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_INSERTHALFSPACE := 15

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_ONIME := 16

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_OFFIME := 17

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_ONPRECONVERSION := 18

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_OFFPRECONVERSION := 19

/**
 * @type {Integer (UInt32)}
 */
export global IMEPADCTRL_PHONETICCANDIDATE := 20

/**
 * @type {Integer (UInt32)}
 */
export global IMEKEYCTRLMASK_ALT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMEKEYCTRLMASK_CTRL := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMEKEYCTRLMASK_SHIFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMEKEYCTRL_UP := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMEKEYCTRL_DOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_FIRST := 256

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_ACTIVATE := 257

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_INACTIVATE := 258

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_SHOW := 260

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_HIDE := 261

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_SIZECHANGING := 262

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_SIZECHANGED := 263

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_CONFIG := 264

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_HELP := 265

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_QUERYCAND := 266

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_APPLYCAND := 267

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_APPLYCANDEX := 268

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_SETTINGCHANGED := 269

/**
 * @type {Integer (UInt32)}
 */
export global IMEPN_USER := 356

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_ENABLED := 1

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_SIZINGNOTIFY := 4

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_VERTICALFIXED := 256

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_HORIZONTALFIXED := 512

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_SIZEFIXED := 768

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_MAXWIDTHFIXED := 4096

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_MAXHEIGHTFIXED := 8192

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_MAXSIZEFIXED := 12288

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_MINWIDTHFIXED := 65536

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_MINHEIGHTFIXED := 131072

/**
 * @type {Integer (Int32)}
 */
export global IPAWS_MINSIZEFIXED := 196608

/**
 * @type {Integer (UInt32)}
 */
export global STYLE_DESCRIPTION_SIZE := 32

/**
 * @type {Integer (UInt32)}
 */
export global IMEMENUITEM_STRING_SIZE := 80

/**
 * @type {Integer (UInt32)}
 */
export global IMC_GETCANDIDATEPOS := 7

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETCANDIDATEPOS := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMC_GETCOMPOSITIONFONT := 9

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETCOMPOSITIONFONT := 10

/**
 * @type {Integer (UInt32)}
 */
export global IMC_GETCOMPOSITIONWINDOW := 11

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETCOMPOSITIONWINDOW := 12

/**
 * @type {Integer (UInt32)}
 */
export global IMC_GETSTATUSWINDOWPOS := 15

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETSTATUSWINDOWPOS := 16

/**
 * @type {Integer (UInt32)}
 */
export global IMC_CLOSESTATUSWINDOW := 33

/**
 * @type {Integer (UInt32)}
 */
export global IMC_OPENSTATUSWINDOW := 34

/**
 * @type {Integer (UInt32)}
 */
export global NI_FINALIZECONVERSIONRESULT := 20

/**
 * @type {Integer (UInt32)}
 */
export global ISC_SHOWUICANDIDATEWINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISC_SHOWUICOMPOSITIONWINDOW := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global ISC_SHOWUIGUIDELINE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ISC_SHOWUIALLCANDIDATEWINDOW := 15

/**
 * @type {Integer (UInt32)}
 */
export global ISC_SHOWUIALL := 3221225487

/**
 * @type {Integer (UInt32)}
 */
export global MOD_LEFT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global MOD_RIGHT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MOD_ON_KEYUP := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MOD_IGNORE_ALL_MODIFIER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IME_HOTKEY_DSWITCH_FIRST := 256

/**
 * @type {Integer (UInt32)}
 */
export global IME_HOTKEY_DSWITCH_LAST := 287

/**
 * @type {Integer (UInt32)}
 */
export global IME_HOTKEY_PRIVATE_FIRST := 512

/**
 * @type {Integer (UInt32)}
 */
export global IME_HOTKEY_PRIVATE_LAST := 543

/**
 * @type {Integer (UInt32)}
 */
export global CS_INSERTCHAR := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CS_NOMOVECARET := 16384

/**
 * @type {Integer (UInt32)}
 */
export global IMEVER_0310 := 196618

/**
 * @type {Integer (UInt32)}
 */
export global IMEVER_0400 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_AT_CARET := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_SPECIAL_UI := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_CANDLIST_START_FROM_1 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_UNICODE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_COMPLETE_ON_UNSELECT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global UI_CAP_2700 := 1

/**
 * @type {Integer (UInt32)}
 */
export global UI_CAP_ROT90 := 2

/**
 * @type {Integer (UInt32)}
 */
export global UI_CAP_ROTANY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCS_CAP_COMPSTR := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCS_CAP_MAKEREAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCS_CAP_SETRECONVERTSTRING := 4

/**
 * @type {Integer (UInt32)}
 */
export global SELECT_CAP_CONVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SELECT_CAP_SENTENCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GL_LEVEL_NOGUIDELINE := 0

/**
 * @type {Integer (UInt32)}
 */
export global GL_LEVEL_FATAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_LEVEL_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global GL_LEVEL_WARNING := 3

/**
 * @type {Integer (UInt32)}
 */
export global GL_LEVEL_INFORMATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_NOMODULE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_NODICTIONARY := 16

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_CANNOTSAVE := 17

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_NOCONVERT := 32

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_TYPINGERROR := 33

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_TOOMANYSTROKE := 34

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_READINGCONFLICT := 35

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_INPUTREADING := 36

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_INPUTRADICAL := 37

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_INPUTCODE := 38

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_INPUTSYMBOL := 39

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_CHOOSECANDIDATE := 40

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_REVERSECONVERSION := 41

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_PRIVATE_FIRST := 32768

/**
 * @type {Integer (UInt32)}
 */
export global GL_ID_PRIVATE_LAST := 65535

/**
 * @type {Integer (UInt32)}
 */
export global ATTR_INPUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ATTR_TARGET_CONVERTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATTR_CONVERTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATTR_TARGET_NOTCONVERTED := 3

/**
 * @type {Integer (UInt32)}
 */
export global ATTR_INPUT_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global ATTR_FIXEDCONVERTED := 5

/**
 * @type {Integer (UInt32)}
 */
export global CFS_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CFS_RECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CFS_POINT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CFS_FORCE_POSITION := 32

/**
 * @type {Integer (UInt32)}
 */
export global CFS_CANDIDATEPOS := 64

/**
 * @type {Integer (UInt32)}
 */
export global CFS_EXCLUDE := 128

/**
 * @type {Integer (UInt32)}
 */
export global IME_CAND_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global IME_CAND_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global IME_CAND_CODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IME_CAND_MEANING := 3

/**
 * @type {Integer (UInt32)}
 */
export global IME_CAND_RADICAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global IME_CAND_STROKE := 5

/**
 * @type {Integer (UInt32)}
 */
export global IMN_CLOSESTATUSWINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMN_OPENSTATUSWINDOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMN_CHANGECANDIDATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global IMN_CLOSECANDIDATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMN_OPENCANDIDATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SETCONVERSIONMODE := 6

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SETSENTENCEMODE := 7

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SETOPENSTATUS := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SETCANDIDATEPOS := 9

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SETCOMPOSITIONFONT := 10

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SETCOMPOSITIONWINDOW := 11

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SETSTATUSWINDOWPOS := 12

/**
 * @type {Integer (UInt32)}
 */
export global IMN_GUIDELINE := 13

/**
 * @type {Integer (UInt32)}
 */
export global IMN_PRIVATE := 14

/**
 * @type {Integer (UInt32)}
 */
export global IMR_COMPOSITIONWINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMR_CANDIDATEWINDOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMR_COMPOSITIONFONT := 3

/**
 * @type {Integer (UInt32)}
 */
export global IMR_RECONVERTSTRING := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMR_CONFIRMRECONVERTSTRING := 5

/**
 * @type {Integer (UInt32)}
 */
export global IMR_QUERYCHARPOSITION := 6

/**
 * @type {Integer (UInt32)}
 */
export global IMR_DOCUMENTFEED := 7

/**
 * @type {Integer (Int32)}
 */
export global IMM_ERROR_NODATA := -1

/**
 * @type {Integer (Int32)}
 */
export global IMM_ERROR_GENERAL := -2

/**
 * @type {Integer (UInt32)}
 */
export global IME_CONFIG_GENERAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global IME_CONFIG_REGISTERWORD := 2

/**
 * @type {Integer (UInt32)}
 */
export global IME_CONFIG_SELECTDICTIONARY := 3

/**
 * @type {Integer (UInt32)}
 */
export global IME_REGWORD_STYLE_EUDC := 1

/**
 * @type {Integer (UInt32)}
 */
export global IME_REGWORD_STYLE_USER_FIRST := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global IME_REGWORD_STYLE_USER_LAST := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IACE_CHILDREN := 1

/**
 * @type {Integer (UInt32)}
 */
export global IACE_DEFAULT := 16

/**
 * @type {Integer (UInt32)}
 */
export global IACE_IGNORENOCONTEXT := 32

/**
 * @type {Integer (UInt32)}
 */
export global IGIMIF_RIGHTMENU := 1

/**
 * @type {Integer (UInt32)}
 */
export global IGIMII_CMODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IGIMII_SMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IGIMII_CONFIGURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IGIMII_TOOLS := 8

/**
 * @type {Integer (UInt32)}
 */
export global IGIMII_HELP := 16

/**
 * @type {Integer (UInt32)}
 */
export global IGIMII_OTHER := 32

/**
 * @type {Integer (UInt32)}
 */
export global IGIMII_INPUTTOOLS := 64

/**
 * @type {Integer (UInt32)}
 */
export global IMFT_RADIOCHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMFT_SEPARATOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMFT_SUBMENU := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOFTKEYBOARD_TYPE_T1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOFTKEYBOARD_TYPE_C1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMMGWL_IMC := 0

/**
 * @type {Integer (UInt32)}
 */
export global IMMGWLP_IMC := 0

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETCONVERSIONMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETSENTENCEMODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETOPENSTATUS := 6

/**
 * @type {Integer (UInt32)}
 */
export global IMC_GETSOFTKBDFONT := 17

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETSOFTKBDFONT := 18

/**
 * @type {Integer (UInt32)}
 */
export global IMC_GETSOFTKBDPOS := 19

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETSOFTKBDPOS := 20

/**
 * @type {Integer (UInt32)}
 */
export global IMC_GETSOFTKBDSUBTYPE := 21

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETSOFTKBDSUBTYPE := 22

/**
 * @type {Integer (UInt32)}
 */
export global IMC_SETSOFTKBDDATA := 24

/**
 * @type {Integer (UInt32)}
 */
export global NI_CONTEXTUPDATED := 3

/**
 * @type {Integer (UInt32)}
 */
export global IME_SYSINFO_WINLOGON := 1

/**
 * @type {Integer (UInt32)}
 */
export global INIT_STATUSWNDPOS := 1

/**
 * @type {Integer (UInt32)}
 */
export global INIT_CONVERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global INIT_SENTENCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global INIT_LOGFONT := 8

/**
 * @type {Integer (UInt32)}
 */
export global INIT_COMPFORM := 16

/**
 * @type {Integer (UInt32)}
 */
export global INIT_SOFTKBDPOS := 32

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_END_UNLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_KBD_CHAR_FIRST := 2

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_IGNORE_UPKEYS := 4

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_NEED_ALTKEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_NO_KEYS_ON_CLOSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global IME_PROP_ACCEPT_WIDE_VKEY := 32

/**
 * @type {Integer (UInt32)}
 */
export global UI_CAP_SOFTKBD := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IMN_SOFTKBDDESTROYED := 17

/**
 * @type {Integer (UInt32)}
 */
export global IME_UI_CLASS_NAME_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global IME_ESC_STRING_BUFFER_SIZE := 80

/**
 * @type {String}
 */
export global szImeJapan := "MSIME.Japan"

/**
 * @type {String}
 */
export global szImeKorea := "MSIME.Korea"

/**
 * @type {String}
 */
export global szImeChina := "MSIME.China"

/**
 * @type {String}
 */
export global szImeTaiwan := "MSIME.Taiwan"

/**
 * @type {Guid}
 */
export global CLSID_VERSION_DEPENDENT_MSIME_JAPANESE := Guid("{6a91029e-aa49-471b-aee7-7d332785660d}")

/**
 * @type {Integer (Int32)}
 */
export global IFEC_S_ALREADY_DEFAULT := 291840

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_REQ_CONV := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_REQ_RECONV := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_REQ_REV := 196608

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_MONORUBY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_NOPRUNING := 4

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_KATAKANAOUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_HIRAGANAOUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_HALFWIDTHOUT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_FULLWIDTHOUT := 32

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_BOPOMOFO := 64

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_HANGUL := 128

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_PINYIN := 256

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_PRECONV := 512

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_RADICAL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_UNKNOWNREADING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_MERGECAND := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_ROMAN := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_BESTFIRST := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_USENOREVWORDS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_NONE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_PLAURALCLAUSE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_SINGLECONVERT := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_AUTOMATIC := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_PHRASEPREDICT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_CONVERSATION := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_NAME := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CMODE_NOINVISIBLECHAR := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global E_NOCAND := 48

/**
 * @type {Integer (UInt32)}
 */
export global E_NOTENOUGH_BUFFER := 49

/**
 * @type {Integer (UInt32)}
 */
export global E_NOTENOUGH_WDD := 50

/**
 * @type {Integer (UInt32)}
 */
export global E_LARGEINPUT := 51

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CLMN_WBREAK := 1

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CLMN_NOWBREAK := 2

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CLMN_PBREAK := 4

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CLMN_NOPBREAK := 8

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CLMN_FIXR := 16

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_CLMN_FIXD := 32

/**
 * @type {Integer (UInt32)}
 */
export global FELANG_INVALD_PO := 65535

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_NOUN := 1

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_VERB := 2

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_ADJECTIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_ADJECTIVE_VERB := 8

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_ADVERB := 16

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_ADNOUN := 32

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_CONJUNCTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_INTERJECTION := 128

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_INDEPENDENT := 255

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_INFLECTIONALSUFFIX := 256

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_PREFIX := 512

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_SUFFIX := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_AFFIX := 1536

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_TANKANJI := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_IDIOMS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_SYMBOLS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_PARTICLE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_AUXILIARY_VERB := 32768

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_SUB_VERB := 65536

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_DEPENDENT := 114688

/**
 * @type {Integer (UInt32)}
 */
export global IFED_POS_ALL := 131071

/**
 * @type {Integer (UInt32)}
 */
export global IFED_SELECT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IFED_SELECT_READING := 1

/**
 * @type {Integer (UInt32)}
 */
export global IFED_SELECT_DISPLAY := 2

/**
 * @type {Integer (UInt32)}
 */
export global IFED_SELECT_POS := 4

/**
 * @type {Integer (UInt32)}
 */
export global IFED_SELECT_COMMENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IFED_SELECT_ALL := 15

/**
 * @type {Integer (UInt32)}
 */
export global IFED_REG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IFED_REG_USER := 1

/**
 * @type {Integer (UInt32)}
 */
export global IFED_REG_AUTO := 2

/**
 * @type {Integer (UInt32)}
 */
export global IFED_REG_GRAMMAR := 4

/**
 * @type {Integer (UInt32)}
 */
export global IFED_REG_ALL := 7

/**
 * @type {Integer (UInt32)}
 */
export global IFED_TYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IFED_TYPE_GENERAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global IFED_TYPE_NAMEPLACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IFED_TYPE_SPEECH := 4

/**
 * @type {Integer (UInt32)}
 */
export global IFED_TYPE_REVERSE := 8

/**
 * @type {Integer (UInt32)}
 */
export global IFED_TYPE_ENGLISH := 16

/**
 * @type {Integer (UInt32)}
 */
export global IFED_TYPE_ALL := 31

/**
 * @type {Integer (Int32)}
 */
export global IFED_S_MORE_ENTRIES := 291328

/**
 * @type {Integer (Int32)}
 */
export global IFED_S_EMPTY_DICTIONARY := 291329

/**
 * @type {Integer (Int32)}
 */
export global IFED_S_WORD_EXISTS := 291330

/**
 * @type {Integer (Int32)}
 */
export global IFED_S_COMMENT_CHANGED := 291331

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_NOT_FOUND := -2147192064

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_INVALID_FORMAT := -2147192063

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_OPEN_FAILED := -2147192062

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_WRITE_FAILED := -2147192061

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_NO_ENTRY := -2147192060

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_REGISTER_FAILED := -2147192059

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_NOT_USER_DIC := -2147192058

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_NOT_SUPPORTED := -2147192057

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_USER_COMMENT := -2147192056

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_REGISTER_ILLEGAL_POS := -2147192055

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_REGISTER_IMPROPER_WORD := -2147192054

/**
 * @type {Integer (Int32)}
 */
export global IFED_E_REGISTER_DISCONNECTED := -2147192053

/**
 * @type {Integer (UInt32)}
 */
export global cbCommentMax := 256

/**
 * @type {Integer (UInt32)}
 */
export global wchPrivate1 := 57344

/**
 * @type {Integer (UInt32)}
 */
export global POS_UNDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_UNDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_MEISHI_FUTSU := 100

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_MEISHI_SAHEN := 101

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_MEISHI_ZAHEN := 102

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_MEISHI_KEIYOUDOUSHI := 103

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_HUKUSIMEISHI := 104

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_MEISA_KEIDOU := 105

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_JINMEI := 106

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_JINMEI_SEI := 107

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_JINMEI_MEI := 108

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI := 109

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_KUNI := 110

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_KEN := 111

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_GUN := 112

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_KU := 113

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_SHI := 114

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_MACHI := 115

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_MURA := 116

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CHIMEI_EKI := 117

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SONOTA := 118

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SHAMEI := 119

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SOSHIKI := 120

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KENCHIKU := 121

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_BUPPIN := 122

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_DAIMEISHI := 123

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_DAIMEISHI_NINSHOU := 124

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_DAIMEISHI_SHIJI := 125

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KAZU := 126

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KAZU_SURYOU := 127

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KAZU_SUSHI := 128

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_AWA := 200

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_KA := 201

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_GA := 202

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_SA := 203

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_TA := 204

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_NA := 205

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_BA := 206

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_MA := 207

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_RA := 208

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_AWAUON := 209

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_KASOKUON := 210

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_5DAN_RAHEN := 211

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_4DAN_HA := 212

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_1DAN := 213

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TOKUSHU_KAHEN := 214

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TOKUSHU_SAHENSURU := 215

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TOKUSHU_SAHEN := 216

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TOKUSHU_ZAHEN := 217

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TOKUSHU_NAHEN := 218

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KI := 219

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KITA := 220

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KITARA := 221

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KITARI := 222

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KITAROU := 223

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KITE := 224

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KUREBA := 225

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KO := 226

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KOI := 227

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KURU_KOYOU := 228

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SA := 229

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SI := 230

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SITA := 231

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SITARA := 232

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SIATRI := 233

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SITAROU := 234

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SITE := 235

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SIYOU := 236

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SUREBA := 237

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SE := 238

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SURU_SEYO := 239

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIYOU := 300

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIYOU_GARU := 301

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIYOU_GE := 302

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIYOU_ME := 303

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIYOU_YUU := 304

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIYOU_U := 305

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIDOU := 400

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIDOU_NO := 401

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIDOU_TARU := 402

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KEIDOU_GARU := 403

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUKUSHI := 500

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUKUSHI_SAHEN := 501

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUKUSHI_NI := 502

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUKUSHI_NANO := 503

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUKUSHI_DA := 504

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUKUSHI_TO := 505

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUKUSHI_TOSURU := 506

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_RENTAISHI := 600

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_RENTAISHI_SHIJI := 601

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUZOKUSHI := 650

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KANDOUSHI := 670

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU := 700

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_KAKU := 701

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_SAI := 702

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_FUKU := 703

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_MI := 704

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_DAISHOU := 705

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_KOUTEI := 706

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_CHOUTAN := 707

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_SHINKYU := 708

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_JINMEI := 709

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_CHIMEI := 710

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_SONOTA := 711

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_JOSUSHI := 712

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_TEINEI_O := 713

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_TEINEI_GO := 714

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETTOU_TEINEI_ON := 715

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI := 800

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_TEKI := 801

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SEI := 802

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_KA := 803

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_CHU := 804

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_FU := 805

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_RYU := 806

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_YOU := 807

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_KATA := 808

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_MEISHIRENDAKU := 809

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_JINMEI := 810

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_CHIMEI := 811

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_KUNI := 812

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_KEN := 813

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_GUN := 814

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_KU := 815

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SHI := 816

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_MACHI := 817

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_CHOU := 818

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_MURA := 819

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SON := 820

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_EKI := 821

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SONOTA := 822

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SHAMEI := 823

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SOSHIKI := 824

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_KENCHIKU := 825

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_RENYOU_SETSUBI := 826

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_JOSUSHI := 827

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_JOSUSHIPLUS := 828

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_JIKAN := 829

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_JIKANPLUS := 830

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_TEINEI := 831

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SAN := 832

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_KUN := 833

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_SAMA := 834

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_DONO := 835

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_FUKUSU := 836

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_TACHI := 837

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_SETSUBI_RA := 838

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TANKANJI := 900

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TANKANJI_KAO := 901

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KANYOUKU := 902

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_DOKURITSUGO := 903

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_FUTEIGO := 904

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KIGOU := 905

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_EIJI := 906

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KUTEN := 907

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TOUTEN := 908

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_KANJI := 909

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_OPENBRACE := 910

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_CLOSEBRACE := 911

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_YOKUSEI := 912

/**
 * @type {Integer (UInt32)}
 */
export global JPOS_TANSHUKU := 913

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_ID_JAPANESE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_ID_KOREAN := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_ID_CHINESE_TRADITIONAL := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_ID_CHINESE_SIMPLIFIED := 134217728

/**
 * @type {String}
 */
export global RWM_SERVICE := "MSIMEService"

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_VERSION := 0

/**
 * @type {String}
 */
export global RWM_UIREADY := "MSIMEUIReady"

/**
 * @type {String}
 */
export global RWM_MOUSE := "MSIMEMouseOperation"

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_MOUSE_OPERATION := 1

/**
 * @type {Integer (Int32)}
 */
export global IMEMOUSERET_NOTHANDLED := -1

/**
 * @type {Integer (UInt32)}
 */
export global IMEMOUSE_VERSION := 255

/**
 * @type {Integer (UInt32)}
 */
export global IMEMOUSE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IMEMOUSE_LDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMEMOUSE_RDOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMEMOUSE_MDOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMEMOUSE_WUP := 16

/**
 * @type {Integer (UInt32)}
 */
export global IMEMOUSE_WDOWN := 32

/**
 * @type {String}
 */
export global RWM_RECONVERT := "MSIMEReconvert"

/**
 * @type {Integer (UInt32)}
 */
export global FID_RECONVERT_VERSION := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_RECONVERSION := 1

/**
 * @type {String}
 */
export global RWM_RECONVERTREQUEST := "MSIMEReconvertRequest"

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_DOCUMENTFEED := 1

/**
 * @type {String}
 */
export global RWM_DOCUMENTFEED := "MSIMEDocumentFeed"

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_QUERYPOSITION := 1

/**
 * @type {String}
 */
export global RWM_QUERYPOSITION := "MSIMEQueryPosition"

/**
 * @type {String}
 */
export global RWM_MODEBIAS := "MSIMEModeBias"

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_MODEBIAS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MODEBIAS_GETVERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global MODEBIAS_SETVALUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MODEBIAS_GETVALUE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MODEBIASMODE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global MODEBIASMODE_FILENAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global MODEBIASMODE_READING := 2

/**
 * @type {Integer (UInt32)}
 */
export global MODEBIASMODE_DIGIT := 4

/**
 * @type {String}
 */
export global RWM_SHOWIMEPAD := "MSIMEShowImePad"

/**
 * @type {Integer (UInt32)}
 */
export global SHOWIMEPAD_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHOWIMEPAD_CATEGORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHOWIMEPAD_GUID := 2

/**
 * @type {String}
 */
export global RWM_KEYMAP := "MSIMEKeyMap"

/**
 * @type {String}
 */
export global RWM_CHGKEYMAP := "MSIMEChangeKeyMap"

/**
 * @type {String}
 */
export global RWM_NTFYKEYMAP := "MSIMENotifyKeyMap"

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_INIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_TERM := 3

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_DEL_KEYLIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_NOTIFY := 5

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_GETMAP := 6

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_INVOKE := 7

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_SETMAP := 8

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_FUNCDESC := 9

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_GETMAPSEAMLESS := 10

/**
 * @type {Integer (UInt32)}
 */
export global FID_MSIME_KMS_GETMAPFAST := 11

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_NOCOMPOSITION := 0

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_COMPOSITION := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_SELECTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_IMEOFF := 3

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_2NDLEVEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_INPTGL := 5

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_CANDIDATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global IMEKMS_TYPECAND := 7

/**
 * @type {String}
 */
export global RWM_RECONVERTOPTIONS := "MSIMEReconvertOptions"

/**
 * @type {Integer (UInt32)}
 */
export global RECONVOPT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RECONVOPT_USECANCELNOTIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCSEX_CANCELRECONVERT := 268435456

/**
 * @type {Guid}
 */
export global CLSID_ImePlugInDictDictionaryList_CHS := Guid("{7bf0129b-5bef-4de4-9b0b-5edb66ac2fa6}")

/**
 * @type {Guid}
 */
export global CLSID_ImePlugInDictDictionaryList_JPN := Guid("{4fe2776b-b0f9-4396-b5fc-e9d4cf1ec195}")
;@endregion Constants
