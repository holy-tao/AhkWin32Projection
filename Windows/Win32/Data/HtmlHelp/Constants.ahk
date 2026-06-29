#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_AUTOHIDESHOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_ONTOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_NOTITLEBAR := 4

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_NODEF_STYLES := 8

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_NODEF_EXSTYLES := 16

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TRI_PANE := 32

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_NOTB_TEXT := 64

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_POST_QUIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_AUTO_SYNC := 256

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TRACKING := 512

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_SEARCH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_HISTORY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_FAVORITES := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_CHANGE_TITLE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_NAV_ONLY_WIN := 16384

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_NO_TOOLBAR := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_MENU := 65536

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_ADVSEARCH := 131072

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_USER_POS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM1 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM2 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM3 := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM4 := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM5 := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM6 := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM7 := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM8 := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PROP_TAB_CUSTOM9 := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_TB_MARGIN := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_PROPERTIES := 2

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_STYLES := 4

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_EXSTYLES := 8

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_RECT := 16

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_NAV_WIDTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_SHOWSTATE := 64

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_INFOTYPES := 128

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_TB_FLAGS := 256

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_EXPANSION := 512

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_TABPOS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_TABORDER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_HISTORY_COUNT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_PARAM_CUR_TAB := 8192

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_EXPAND := 2

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_BACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_FORWARD := 8

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_STOP := 16

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_REFRESH := 32

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_HOME := 64

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_BROWSE_FWD := 128

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_BROWSE_BCK := 256

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_NOTES := 512

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_CONTENTS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_SYNC := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_OPTIONS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_PRINT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_INDEX := 16384

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_SEARCH := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_HISTORY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_FAVORITES := 131072

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_JUMP1 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_JUMP2 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_ZOOM := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_TOC_NEXT := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global HHWIN_BUTTON_TOC_PREV := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_EXPAND := 200

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_CONTRACT := 201

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_STOP := 202

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_REFRESH := 203

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_BACK := 204

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_HOME := 205

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_SYNC := 206

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_PRINT := 207

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_OPTIONS := 208

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_FORWARD := 209

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_NOTES := 210

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_BROWSE_FWD := 211

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_BROWSE_BACK := 212

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_CONTENTS := 213

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_INDEX := 214

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_SEARCH := 215

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_HISTORY := 216

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_FAVORITES := 217

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_JUMP1 := 218

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_JUMP2 := 219

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_CUSTOMIZE := 221

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_ZOOM := 222

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_TOC_NEXT := 223

/**
 * @type {Integer (UInt32)}
 */
export global IDTB_TOC_PREV := 224

/**
 * @type {Integer (UInt32)}
 */
export global HHN_FIRST := 4294966436

/**
 * @type {Integer (UInt32)}
 */
export global HHN_LAST := 4294966417

/**
 * @type {Integer (UInt32)}
 */
export global HHN_NAVCOMPLETE := 4294966436

/**
 * @type {Integer (UInt32)}
 */
export global HHN_TRACK := 4294966435

/**
 * @type {Integer (UInt32)}
 */
export global HHN_WINDOW_CREATE := 4294966434

/**
 * @type {Guid}
 */
export global CLSID_IITPropList := Guid("{4662daae-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Integer (UInt32)}
 */
export global PROP_ADD := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROP_DELETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROP_UPDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_POINTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TYPE_STRING := 2

/**
 * @type {Guid}
 */
export global CLSID_IITDatabase := Guid("{66673452-8c23-11d0-a84e-00aa006c7d01}")

/**
 * @type {Guid}
 */
export global CLSID_IITDatabaseLocal := Guid("{4662daa9-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_UID := 1

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_TITLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_USERDATA := 3

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_SORTKEY := 100

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_DISPLAYKEY := 101

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_SORTORDINAL := 102

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_INDEX_TEXT := 200

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_INDEX_VFLD := 201

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_INDEX_DTYPE := 202

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_INDEX_LENGTH := 203

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_INDEX_BREAK := 204

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_INDEX_TERM := 210

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_INDEX_TERM_RAW_LENGTH := 211

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_USERPROP_BASE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global STDPROP_USERPROP_MAX := 2147483647

/**
 * @type {String}
 */
export global SZ_WWDEST_GLOBAL := "GLOBAL"

/**
 * @type {String}
 */
export global SZ_WWDEST_KEY := "KEY"

/**
 * @type {String}
 */
export global SZ_WWDEST_OCC := "OCC"

/**
 * @type {Guid}
 */
export global CLSID_IITCmdInt := Guid("{4662daa2-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Guid}
 */
export global CLSID_IITSvMgr := Guid("{4662daa3-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Guid}
 */
export global CLSID_IITWordWheelUpdate := Guid("{4662daa5-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Guid}
 */
export global CLSID_IITGroupUpdate := Guid("{4662daa4-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Guid}
 */
export global CLSID_IITIndexBuild := Guid("{8fa0d5aa-dedf-11d0-9a61-00c04fb68bf7}")

/**
 * @type {Guid}
 */
export global CLSID_IITWWFilterBuild := Guid("{8fa0d5ab-dedf-11d0-9a61-00c04fb68bf7}")

/**
 * @type {Guid}
 */
export global CLSID_IITWordWheel := Guid("{d73725c2-8c12-11d0-a84e-00aa006c7d01}")

/**
 * @type {Guid}
 */
export global CLSID_IITWordWheelLocal := Guid("{4662daa8-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Integer (UInt32)}
 */
export global ITWW_OPEN_NOCONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ITWW_CBKEY_MAX := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IITWBC_BREAK_ACCEPT_WILDCARDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IITWBC_BREAK_AND_STEM := 2

/**
 * @type {Integer (Int32)}
 */
export global E_NOTEXIST := -2147479552

/**
 * @type {Integer (Int32)}
 */
export global E_DUPLICATE := -2147479551

/**
 * @type {Integer (Int32)}
 */
export global E_BADVERSION := -2147479550

/**
 * @type {Integer (Int32)}
 */
export global E_BADFILE := -2147479549

/**
 * @type {Integer (Int32)}
 */
export global E_BADFORMAT := -2147479548

/**
 * @type {Integer (Int32)}
 */
export global E_NOPERMISSION := -2147479547

/**
 * @type {Integer (Int32)}
 */
export global E_ASSERT := -2147479546

/**
 * @type {Integer (Int32)}
 */
export global E_INTERRUPT := -2147479545

/**
 * @type {Integer (Int32)}
 */
export global E_NOTSUPPORTED := -2147479544

/**
 * @type {Integer (Int32)}
 */
export global E_OUTOFRANGE := -2147479543

/**
 * @type {Integer (Int32)}
 */
export global E_GROUPIDTOOBIG := -2147479542

/**
 * @type {Integer (Int32)}
 */
export global E_TOOMANYTITLES := -2147479541

/**
 * @type {Integer (Int32)}
 */
export global E_NOMERGEDDATA := -2147479540

/**
 * @type {Integer (Int32)}
 */
export global E_NOTFOUND := -2147479539

/**
 * @type {Integer (Int32)}
 */
export global E_CANTFINDDLL := -2147479538

/**
 * @type {Integer (Int32)}
 */
export global E_NOHANDLE := -2147479537

/**
 * @type {Integer (Int32)}
 */
export global E_GETLASTERROR := -2147479536

/**
 * @type {Integer (Int32)}
 */
export global E_BADPARAM := -2147479535

/**
 * @type {Integer (Int32)}
 */
export global E_INVALIDSTATE := -2147479534

/**
 * @type {Integer (Int32)}
 */
export global E_NOTOPEN := -2147479533

/**
 * @type {Integer (Int32)}
 */
export global E_ALREADYOPEN := -2147479533

/**
 * @type {Integer (Int32)}
 */
export global E_UNKNOWN_TRANSPORT := -2147479530

/**
 * @type {Integer (Int32)}
 */
export global E_UNSUPPORTED_TRANSPORT := -2147479529

/**
 * @type {Integer (Int32)}
 */
export global E_BADFILTERSIZE := -2147479528

/**
 * @type {Integer (Int32)}
 */
export global E_TOOMANYOBJECTS := -2147479527

/**
 * @type {Integer (Int32)}
 */
export global E_NAMETOOLONG := -2147479520

/**
 * @type {Integer (Int32)}
 */
export global E_FILECREATE := -2147479504

/**
 * @type {Integer (Int32)}
 */
export global E_FILECLOSE := -2147479503

/**
 * @type {Integer (Int32)}
 */
export global E_FILEREAD := -2147479502

/**
 * @type {Integer (Int32)}
 */
export global E_FILESEEK := -2147479501

/**
 * @type {Integer (Int32)}
 */
export global E_FILEWRITE := -2147479500

/**
 * @type {Integer (Int32)}
 */
export global E_FILEDELETE := -2147479499

/**
 * @type {Integer (Int32)}
 */
export global E_FILEINVALID := -2147479498

/**
 * @type {Integer (Int32)}
 */
export global E_FILENOTFOUND := -2147479497

/**
 * @type {Integer (Int32)}
 */
export global E_DISKFULL := -2147479496

/**
 * @type {Integer (Int32)}
 */
export global E_TOOMANYTOPICS := -2147479472

/**
 * @type {Integer (Int32)}
 */
export global E_TOOMANYDUPS := -2147479471

/**
 * @type {Integer (Int32)}
 */
export global E_TREETOOBIG := -2147479470

/**
 * @type {Integer (Int32)}
 */
export global E_BADBREAKER := -2147479469

/**
 * @type {Integer (Int32)}
 */
export global E_BADVALUE := -2147479468

/**
 * @type {Integer (Int32)}
 */
export global E_ALL_WILD := -2147479467

/**
 * @type {Integer (Int32)}
 */
export global E_TOODEEP := -2147479466

/**
 * @type {Integer (Int32)}
 */
export global E_EXPECTEDTERM := -2147479465

/**
 * @type {Integer (Int32)}
 */
export global E_MISSLPAREN := -2147479464

/**
 * @type {Integer (Int32)}
 */
export global E_MISSRPAREN := -2147479463

/**
 * @type {Integer (Int32)}
 */
export global E_MISSQUOTE := -2147479462

/**
 * @type {Integer (Int32)}
 */
export global E_NULLQUERY := -2147479461

/**
 * @type {Integer (Int32)}
 */
export global E_STOPWORD := -2147479460

/**
 * @type {Integer (Int32)}
 */
export global E_BADRANGEOP := -2147479459

/**
 * @type {Integer (Int32)}
 */
export global E_UNMATCHEDTYPE := -2147479458

/**
 * @type {Integer (Int32)}
 */
export global E_WORDTOOLONG := -2147479457

/**
 * @type {Integer (Int32)}
 */
export global E_BADINDEXFLAGS := -2147479456

/**
 * @type {Integer (Int32)}
 */
export global E_WILD_IN_DTYPE := -2147479455

/**
 * @type {Integer (Int32)}
 */
export global E_NOSTEMMER := -2147479454

/**
 * @type {Integer (Int32)}
 */
export global E_MISSINGPROP := -2147479424

/**
 * @type {Integer (Int32)}
 */
export global E_PROPLISTNOTEMPTY := -2147479423

/**
 * @type {Integer (Int32)}
 */
export global E_PROPLISTEMPTY := -2147479422

/**
 * @type {Integer (Int32)}
 */
export global E_ALREADYINIT := -2147479421

/**
 * @type {Integer (Int32)}
 */
export global E_NOTINIT := -2147479420

/**
 * @type {Integer (Int32)}
 */
export global E_RESULTSETEMPTY := -2147479419

/**
 * @type {Integer (Int32)}
 */
export global E_TOOMANYCOLUMNS := -2147479418

/**
 * @type {Integer (Int32)}
 */
export global E_NOKEYPROP := -2147479417

/**
 * @type {Guid}
 */
export global CLSID_IITResultSet := Guid("{4662daa7-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Integer (UInt32)}
 */
export global MAX_COLUMNS := 256

/**
 * @type {Guid}
 */
export global CLSID_ITStdBreaker := Guid("{4662daaf-d393-11d0-9a56-00c04fb68bf7}")

/**
 * @type {Guid}
 */
export global CLSID_ITEngStemmer := Guid("{8fa0d5a8-dedf-11d0-9a61-00c04fb68bf7}")

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTYPE_TOC := 0

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTYPE_INDEX := 1

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTYPE_SEARCH := 2

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTYPE_FAVORITES := 3

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTYPE_HISTORY := 4

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTYPE_AUTHOR := 5

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTYPE_CUSTOM_FIRST := 11

/**
 * @type {Integer (Int32)}
 */
export global IT_INCLUSIVE := 0

/**
 * @type {Integer (Int32)}
 */
export global IT_EXCLUSIVE := 1

/**
 * @type {Integer (Int32)}
 */
export global IT_HIDDEN := 2

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTAB_TOP := 0

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTAB_LEFT := 1

/**
 * @type {Integer (Int32)}
 */
export global HHWIN_NAVTAB_BOTTOM := 2

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_CONTENTS := 0

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_INDEX := 1

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_SEARCH := 2

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_FAVORITES := 3

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_HISTORY := 4

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_AUTHOR := 5

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_CUSTOM_FIRST := 11

/**
 * @type {Integer (Int32)}
 */
export global HH_TAB_CUSTOM_LAST := 19

/**
 * @type {Integer (Int32)}
 */
export global HHACT_TAB_CONTENTS := 0

/**
 * @type {Integer (Int32)}
 */
export global HHACT_TAB_INDEX := 1

/**
 * @type {Integer (Int32)}
 */
export global HHACT_TAB_SEARCH := 2

/**
 * @type {Integer (Int32)}
 */
export global HHACT_TAB_HISTORY := 3

/**
 * @type {Integer (Int32)}
 */
export global HHACT_TAB_FAVORITES := 4

/**
 * @type {Integer (Int32)}
 */
export global HHACT_EXPAND := 5

/**
 * @type {Integer (Int32)}
 */
export global HHACT_CONTRACT := 6

/**
 * @type {Integer (Int32)}
 */
export global HHACT_BACK := 7

/**
 * @type {Integer (Int32)}
 */
export global HHACT_FORWARD := 8

/**
 * @type {Integer (Int32)}
 */
export global HHACT_STOP := 9

/**
 * @type {Integer (Int32)}
 */
export global HHACT_REFRESH := 10

/**
 * @type {Integer (Int32)}
 */
export global HHACT_HOME := 11

/**
 * @type {Integer (Int32)}
 */
export global HHACT_SYNC := 12

/**
 * @type {Integer (Int32)}
 */
export global HHACT_OPTIONS := 13

/**
 * @type {Integer (Int32)}
 */
export global HHACT_PRINT := 14

/**
 * @type {Integer (Int32)}
 */
export global HHACT_HIGHLIGHT := 15

/**
 * @type {Integer (Int32)}
 */
export global HHACT_CUSTOMIZE := 16

/**
 * @type {Integer (Int32)}
 */
export global HHACT_JUMP1 := 17

/**
 * @type {Integer (Int32)}
 */
export global HHACT_JUMP2 := 18

/**
 * @type {Integer (Int32)}
 */
export global HHACT_ZOOM := 19

/**
 * @type {Integer (Int32)}
 */
export global HHACT_TOC_NEXT := 20

/**
 * @type {Integer (Int32)}
 */
export global HHACT_TOC_PREV := 21

/**
 * @type {Integer (Int32)}
 */
export global HHACT_NOTES := 22

/**
 * @type {Integer (Int32)}
 */
export global HHACT_LAST_ENUM := 23
;@endregion Constants
