#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HtmlHelp {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_AUTOHIDESHOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_ONTOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_NOTITLEBAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_NODEF_STYLES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_NODEF_EXSTYLES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TRI_PANE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_NOTB_TEXT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_POST_QUIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_AUTO_SYNC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TRACKING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_SEARCH => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_HISTORY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_FAVORITES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_CHANGE_TITLE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_NAV_ONLY_WIN => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_NO_TOOLBAR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_MENU => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_ADVSEARCH => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_USER_POS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM1 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM2 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM3 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM4 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM5 => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM6 => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM7 => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM8 => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PROP_TAB_CUSTOM9 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_TB_MARGIN => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_PROPERTIES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_STYLES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_EXSTYLES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_RECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_NAV_WIDTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_SHOWSTATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_INFOTYPES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_TB_FLAGS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_EXPANSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_TABPOS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_TABORDER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_HISTORY_COUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_PARAM_CUR_TAB => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_EXPAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_BACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_FORWARD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_STOP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_REFRESH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_HOME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_BROWSE_FWD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_BROWSE_BCK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_NOTES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_CONTENTS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_SYNC => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_OPTIONS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_PRINT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_INDEX => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_SEARCH => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_HISTORY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_FAVORITES => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_JUMP1 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_JUMP2 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_ZOOM => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_TOC_NEXT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static HHWIN_BUTTON_TOC_PREV => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_EXPAND => 200

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_CONTRACT => 201

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_STOP => 202

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_REFRESH => 203

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_BACK => 204

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_HOME => 205

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_SYNC => 206

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_PRINT => 207

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_OPTIONS => 208

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_FORWARD => 209

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_NOTES => 210

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_BROWSE_FWD => 211

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_BROWSE_BACK => 212

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_CONTENTS => 213

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_INDEX => 214

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_SEARCH => 215

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_HISTORY => 216

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_FAVORITES => 217

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_JUMP1 => 218

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_JUMP2 => 219

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_CUSTOMIZE => 221

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_ZOOM => 222

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_TOC_NEXT => 223

    /**
     * @type {Integer (UInt32)}
     */
    static IDTB_TOC_PREV => 224

    /**
     * @type {Integer (UInt32)}
     */
    static HHN_FIRST => 4294966436

    /**
     * @type {Integer (UInt32)}
     */
    static HHN_LAST => 4294966417

    /**
     * @type {Integer (UInt32)}
     */
    static HHN_NAVCOMPLETE => 4294966436

    /**
     * @type {Integer (UInt32)}
     */
    static HHN_TRACK => 4294966435

    /**
     * @type {Integer (UInt32)}
     */
    static HHN_WINDOW_CREATE => 4294966434

    /**
     * @type {String}
     */
    static CLSID_IITPropList => "{4662daae-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {Integer (UInt32)}
     */
    static PROP_ADD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROP_DELETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROP_UPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_POINTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE_STRING => 2

    /**
     * @type {String}
     */
    static CLSID_IITDatabase => "{66673452-8c23-11d0-a84e-00aa006c7d01}"

    /**
     * @type {String}
     */
    static CLSID_IITDatabaseLocal => "{4662daa9-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_UID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_TITLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_USERDATA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_KEY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_SORTKEY => 100

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_DISPLAYKEY => 101

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_SORTORDINAL => 102

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_INDEX_TEXT => 200

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_INDEX_VFLD => 201

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_INDEX_DTYPE => 202

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_INDEX_LENGTH => 203

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_INDEX_BREAK => 204

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_INDEX_TERM => 210

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_INDEX_TERM_RAW_LENGTH => 211

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_USERPROP_BASE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static STDPROP_USERPROP_MAX => 2147483647

    /**
     * @type {String}
     */
    static SZ_WWDEST_GLOBAL => "GLOBAL"

    /**
     * @type {String}
     */
    static SZ_WWDEST_KEY => "KEY"

    /**
     * @type {String}
     */
    static SZ_WWDEST_OCC => "OCC"

    /**
     * @type {String}
     */
    static CLSID_IITCmdInt => "{4662daa2-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {String}
     */
    static CLSID_IITSvMgr => "{4662daa3-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {String}
     */
    static CLSID_IITWordWheelUpdate => "{4662daa5-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {String}
     */
    static CLSID_IITGroupUpdate => "{4662daa4-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {String}
     */
    static CLSID_IITIndexBuild => "{8fa0d5aa-dedf-11d0-9a61-00c04fb68bf7}"

    /**
     * @type {String}
     */
    static CLSID_IITWWFilterBuild => "{8fa0d5ab-dedf-11d0-9a61-00c04fb68bf7}"

    /**
     * @type {String}
     */
    static CLSID_IITWordWheel => "{d73725c2-8c12-11d0-a84e-00aa006c7d01}"

    /**
     * @type {String}
     */
    static CLSID_IITWordWheelLocal => "{4662daa8-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {Integer (UInt32)}
     */
    static ITWW_OPEN_NOCONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ITWW_CBKEY_MAX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IITWBC_BREAK_ACCEPT_WILDCARDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IITWBC_BREAK_AND_STEM => 2

    /**
     * @type {Integer (Int32)}
     */
    static E_NOTEXIST => -2147479552

    /**
     * @type {Integer (Int32)}
     */
    static E_DUPLICATE => -2147479551

    /**
     * @type {Integer (Int32)}
     */
    static E_BADVERSION => -2147479550

    /**
     * @type {Integer (Int32)}
     */
    static E_BADFILE => -2147479549

    /**
     * @type {Integer (Int32)}
     */
    static E_BADFORMAT => -2147479548

    /**
     * @type {Integer (Int32)}
     */
    static E_NOPERMISSION => -2147479547

    /**
     * @type {Integer (Int32)}
     */
    static E_ASSERT => -2147479546

    /**
     * @type {Integer (Int32)}
     */
    static E_INTERRUPT => -2147479545

    /**
     * @type {Integer (Int32)}
     */
    static E_NOTSUPPORTED => -2147479544

    /**
     * @type {Integer (Int32)}
     */
    static E_OUTOFRANGE => -2147479543

    /**
     * @type {Integer (Int32)}
     */
    static E_GROUPIDTOOBIG => -2147479542

    /**
     * @type {Integer (Int32)}
     */
    static E_TOOMANYTITLES => -2147479541

    /**
     * @type {Integer (Int32)}
     */
    static E_NOMERGEDDATA => -2147479540

    /**
     * @type {Integer (Int32)}
     */
    static E_NOTFOUND => -2147479539

    /**
     * @type {Integer (Int32)}
     */
    static E_CANTFINDDLL => -2147479538

    /**
     * @type {Integer (Int32)}
     */
    static E_NOHANDLE => -2147479537

    /**
     * @type {Integer (Int32)}
     */
    static E_GETLASTERROR => -2147479536

    /**
     * @type {Integer (Int32)}
     */
    static E_BADPARAM => -2147479535

    /**
     * @type {Integer (Int32)}
     */
    static E_INVALIDSTATE => -2147479534

    /**
     * @type {Integer (Int32)}
     */
    static E_NOTOPEN => -2147479533

    /**
     * @type {Integer (Int32)}
     */
    static E_ALREADYOPEN => -2147479533

    /**
     * @type {Integer (Int32)}
     */
    static E_UNKNOWN_TRANSPORT => -2147479530

    /**
     * @type {Integer (Int32)}
     */
    static E_UNSUPPORTED_TRANSPORT => -2147479529

    /**
     * @type {Integer (Int32)}
     */
    static E_BADFILTERSIZE => -2147479528

    /**
     * @type {Integer (Int32)}
     */
    static E_TOOMANYOBJECTS => -2147479527

    /**
     * @type {Integer (Int32)}
     */
    static E_NAMETOOLONG => -2147479520

    /**
     * @type {Integer (Int32)}
     */
    static E_FILECREATE => -2147479504

    /**
     * @type {Integer (Int32)}
     */
    static E_FILECLOSE => -2147479503

    /**
     * @type {Integer (Int32)}
     */
    static E_FILEREAD => -2147479502

    /**
     * @type {Integer (Int32)}
     */
    static E_FILESEEK => -2147479501

    /**
     * @type {Integer (Int32)}
     */
    static E_FILEWRITE => -2147479500

    /**
     * @type {Integer (Int32)}
     */
    static E_FILEDELETE => -2147479499

    /**
     * @type {Integer (Int32)}
     */
    static E_FILEINVALID => -2147479498

    /**
     * @type {Integer (Int32)}
     */
    static E_FILENOTFOUND => -2147479497

    /**
     * @type {Integer (Int32)}
     */
    static E_DISKFULL => -2147479496

    /**
     * @type {Integer (Int32)}
     */
    static E_TOOMANYTOPICS => -2147479472

    /**
     * @type {Integer (Int32)}
     */
    static E_TOOMANYDUPS => -2147479471

    /**
     * @type {Integer (Int32)}
     */
    static E_TREETOOBIG => -2147479470

    /**
     * @type {Integer (Int32)}
     */
    static E_BADBREAKER => -2147479469

    /**
     * @type {Integer (Int32)}
     */
    static E_BADVALUE => -2147479468

    /**
     * @type {Integer (Int32)}
     */
    static E_ALL_WILD => -2147479467

    /**
     * @type {Integer (Int32)}
     */
    static E_TOODEEP => -2147479466

    /**
     * @type {Integer (Int32)}
     */
    static E_EXPECTEDTERM => -2147479465

    /**
     * @type {Integer (Int32)}
     */
    static E_MISSLPAREN => -2147479464

    /**
     * @type {Integer (Int32)}
     */
    static E_MISSRPAREN => -2147479463

    /**
     * @type {Integer (Int32)}
     */
    static E_MISSQUOTE => -2147479462

    /**
     * @type {Integer (Int32)}
     */
    static E_NULLQUERY => -2147479461

    /**
     * @type {Integer (Int32)}
     */
    static E_STOPWORD => -2147479460

    /**
     * @type {Integer (Int32)}
     */
    static E_BADRANGEOP => -2147479459

    /**
     * @type {Integer (Int32)}
     */
    static E_UNMATCHEDTYPE => -2147479458

    /**
     * @type {Integer (Int32)}
     */
    static E_WORDTOOLONG => -2147479457

    /**
     * @type {Integer (Int32)}
     */
    static E_BADINDEXFLAGS => -2147479456

    /**
     * @type {Integer (Int32)}
     */
    static E_WILD_IN_DTYPE => -2147479455

    /**
     * @type {Integer (Int32)}
     */
    static E_NOSTEMMER => -2147479454

    /**
     * @type {Integer (Int32)}
     */
    static E_MISSINGPROP => -2147479424

    /**
     * @type {Integer (Int32)}
     */
    static E_PROPLISTNOTEMPTY => -2147479423

    /**
     * @type {Integer (Int32)}
     */
    static E_PROPLISTEMPTY => -2147479422

    /**
     * @type {Integer (Int32)}
     */
    static E_ALREADYINIT => -2147479421

    /**
     * @type {Integer (Int32)}
     */
    static E_NOTINIT => -2147479420

    /**
     * @type {Integer (Int32)}
     */
    static E_RESULTSETEMPTY => -2147479419

    /**
     * @type {Integer (Int32)}
     */
    static E_TOOMANYCOLUMNS => -2147479418

    /**
     * @type {Integer (Int32)}
     */
    static E_NOKEYPROP => -2147479417

    /**
     * @type {String}
     */
    static CLSID_IITResultSet => "{4662daa7-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_COLUMNS => 256

    /**
     * @type {String}
     */
    static CLSID_ITStdBreaker => "{4662daaf-d393-11d0-9a56-00c04fb68bf7}"

    /**
     * @type {String}
     */
    static CLSID_ITEngStemmer => "{8fa0d5a8-dedf-11d0-9a61-00c04fb68bf7}"

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTYPE_TOC => 0

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTYPE_INDEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTYPE_SEARCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTYPE_FAVORITES => 3

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTYPE_HISTORY => 4

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTYPE_AUTHOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTYPE_CUSTOM_FIRST => 11

    /**
     * @type {Integer (Int32)}
     */
    static IT_INCLUSIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IT_EXCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static IT_HIDDEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTAB_TOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTAB_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HHWIN_NAVTAB_BOTTOM => 2

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_CONTENTS => 0

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_INDEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_SEARCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_FAVORITES => 3

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_HISTORY => 4

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_AUTHOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_CUSTOM_FIRST => 11

    /**
     * @type {Integer (Int32)}
     */
    static HH_TAB_CUSTOM_LAST => 19

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_TAB_CONTENTS => 0

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_TAB_INDEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_TAB_SEARCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_TAB_HISTORY => 3

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_TAB_FAVORITES => 4

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_EXPAND => 5

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_CONTRACT => 6

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_BACK => 7

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_FORWARD => 8

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_STOP => 9

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_REFRESH => 10

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_HOME => 11

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_SYNC => 12

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_OPTIONS => 13

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_PRINT => 14

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_HIGHLIGHT => 15

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_CUSTOMIZE => 16

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_JUMP1 => 17

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_JUMP2 => 18

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_ZOOM => 19

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_TOC_NEXT => 20

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_TOC_PREV => 21

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_NOTES => 22

    /**
     * @type {Integer (Int32)}
     */
    static HHACT_LAST_ENUM => 23
;@endregion Constants

;@region Methods
    /**
     * Displays a help window. (ANSI)
     * @remarks
     * The  syntax applies to ANSI character sets.  When using a Unicode character set, the type of the <i>pszFile</i> parameter should be "LPCTSTR  ".
     * 
     * When using the HTML Help API, set the stack size of the hosting executable to at least 100k. If the defined stack size is too small, then the thread created to run HTML Help will also be created with this stack size, and failure could result. Optionally, you can remove /STACK from the link command line, and remove any STACK setting in the executable's DEF file (default stack size is 1MB in this case). You can also you can set the stack size using the /Fnumber compiler command (the compiler will pass this to the linker as /STACK).
     * @param {Pointer<Void>} hwndCaller Specifies the handle (<i>hwnd</i>) of the window calling <b>HtmlHelp</b>. The help window is owned by this window. 
     * 
     * 
     * 
     * When the help window is closed, <b>HtmlHelp</b> will return focus to the owner unless the owner is the desktop. If <i>hwndCaller</i> is the desktop, then the operating system determines where focus is returned.
     * 
     * In addition, if <b>HtmlHelp</b> sends any notification messages from the help window, they are sent to <i>hwndCaller</i> as long as you have enabled <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-notification-messages">notification message</a> tracking in the help window definition.
     * @param {Pointer<Byte>} pszFile Depending on the <i>uCommand</i> value, specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-html-help-urls">file path</a> to either a compiled help (.chm) file, or a topic file within a specified help file. 
     * 
     * 
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644703(v=vs.85)">window type</a> name can also be specified, preceded with a greater-than (&gt;) character.
     * 
     * If the specified command does not require a file, this value may be NULL.
     * @param {Integer} uCommand Specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-commands">command</a> to complete.
     * @param {Pointer} dwData Specifies any data that may be required, based on the value of the <i>uCommand</i> parameter.
     * @returns {Pointer<Void>} Depending on the specified <i>uCommand</i> and the result, <b>HtmlHelp</b> returns one or both of the following: 
     * 
     * <ul>
     * <li>The handle (hwnd) of the help window.</li>
     * <li>NULL. In some cases, NULL indicates failure; in other cases, NULL indicates that the help window has not yet been created. </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/nf-htmlhelp-htmlhelpa
     */
    static HtmlHelpA(hwndCaller, pszFile, uCommand, dwData) {
        pszFile := pszFile is String? StrPtr(pszFile) : pszFile

        result := DllCall("hhctrl.ocx\HtmlHelpA", "ptr", hwndCaller, "ptr", pszFile, "uint", uCommand, "ptr", dwData)
        return result
    }

    /**
     * Displays a help window. (Unicode)
     * @remarks
     * The  syntax applies to ANSI character sets.  When using a Unicode character set, the type of the <i>pszFile</i> parameter should be "LPCTSTR  ".
     * 
     * When using the HTML Help API, set the stack size of the hosting executable to at least 100k. If the defined stack size is too small, then the thread created to run HTML Help will also be created with this stack size, and failure could result. Optionally, you can remove /STACK from the link command line, and remove any STACK setting in the executable's DEF file (default stack size is 1MB in this case). You can also you can set the stack size using the /Fnumber compiler command (the compiler will pass this to the linker as /STACK).
     * @param {Pointer<Void>} hwndCaller Specifies the handle (<i>hwnd</i>) of the window calling <b>HtmlHelp</b>. The help window is owned by this window. 
     * 
     * 
     * 
     * When the help window is closed, <b>HtmlHelp</b> will return focus to the owner unless the owner is the desktop. If <i>hwndCaller</i> is the desktop, then the operating system determines where focus is returned.
     * 
     * In addition, if <b>HtmlHelp</b> sends any notification messages from the help window, they are sent to <i>hwndCaller</i> as long as you have enabled <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-notification-messages">notification message</a> tracking in the help window definition.
     * @param {Pointer<Char>} pszFile Depending on the <i>uCommand</i> value, specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-html-help-urls">file path</a> to either a compiled help (.chm) file, or a topic file within a specified help file. 
     * 
     * 
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644703(v=vs.85)">window type</a> name can also be specified, preceded with a greater-than (&gt;) character.
     * 
     * If the specified command does not require a file, this value may be NULL.
     * @param {Integer} uCommand Specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-commands">command</a> to complete.
     * @param {Pointer} dwData Specifies any data that may be required, based on the value of the <i>uCommand</i> parameter.
     * @returns {Pointer<Void>} Depending on the specified <i>uCommand</i> and the result, <b>HtmlHelp</b> returns one or both of the following: 
     * 
     * <ul>
     * <li>The handle (hwnd) of the help window.</li>
     * <li>NULL. In some cases, NULL indicates failure; in other cases, NULL indicates that the help window has not yet been created. </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/nf-htmlhelp-htmlhelpw
     */
    static HtmlHelpW(hwndCaller, pszFile, uCommand, dwData) {
        pszFile := pszFile is String? StrPtr(pszFile) : pszFile

        result := DllCall("hhctrl.ocx\HtmlHelpW", "ptr", hwndCaller, "ptr", pszFile, "uint", uCommand, "ptr", dwData)
        return result
    }

;@endregion Methods
}
