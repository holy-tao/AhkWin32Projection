#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HMETAFILE.ahk
#Include .\HBITMAP.ahk
#Include .\HBRUSH.ahk
#Include .\HDC.ahk
#Include .\HRGN.ahk
#Include .\HFONT.ahk
#Include .\HPALETTE.ahk
#Include .\HPEN.ahk
#Include .\HGDIOBJ.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\HENHMETAFILE.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\HMONITOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class Gdi {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static GDI_ERROR => -1

    /**
     * @type {Integer (Int32)}
     */
    static ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAXSTRETCHBLTMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POLYFILL_LAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LAYOUT_BTT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LAYOUT_VBH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ASPECT_FILTERING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETBKCOLOR => 513

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETBKMODE => 258

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETMAPMODE => 259

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETROP2 => 260

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETRELABS => 261

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETPOLYFILLMODE => 262

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETSTRETCHBLTMODE => 263

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETTEXTCHAREXTRA => 264

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETTEXTCOLOR => 521

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETTEXTJUSTIFICATION => 522

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETWINDOWORG => 523

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETWINDOWEXT => 524

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETVIEWPORTORG => 525

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETVIEWPORTEXT => 526

    /**
     * @type {Integer (UInt32)}
     */
    static META_OFFSETWINDOWORG => 527

    /**
     * @type {Integer (UInt32)}
     */
    static META_SCALEWINDOWEXT => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static META_OFFSETVIEWPORTORG => 529

    /**
     * @type {Integer (UInt32)}
     */
    static META_SCALEVIEWPORTEXT => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static META_LINETO => 531

    /**
     * @type {Integer (UInt32)}
     */
    static META_MOVETO => 532

    /**
     * @type {Integer (UInt32)}
     */
    static META_EXCLUDECLIPRECT => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static META_INTERSECTCLIPRECT => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static META_ARC => 2071

    /**
     * @type {Integer (UInt32)}
     */
    static META_ELLIPSE => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static META_FLOODFILL => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static META_PIE => 2074

    /**
     * @type {Integer (UInt32)}
     */
    static META_RECTANGLE => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static META_ROUNDRECT => 1564

    /**
     * @type {Integer (UInt32)}
     */
    static META_PATBLT => 1565

    /**
     * @type {Integer (UInt32)}
     */
    static META_SAVEDC => 30

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETPIXEL => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static META_OFFSETCLIPRGN => 544

    /**
     * @type {Integer (UInt32)}
     */
    static META_TEXTOUT => 1313

    /**
     * @type {Integer (UInt32)}
     */
    static META_BITBLT => 2338

    /**
     * @type {Integer (UInt32)}
     */
    static META_STRETCHBLT => 2851

    /**
     * @type {Integer (UInt32)}
     */
    static META_POLYGON => 804

    /**
     * @type {Integer (UInt32)}
     */
    static META_POLYLINE => 805

    /**
     * @type {Integer (UInt32)}
     */
    static META_ESCAPE => 1574

    /**
     * @type {Integer (UInt32)}
     */
    static META_RESTOREDC => 295

    /**
     * @type {Integer (UInt32)}
     */
    static META_FILLREGION => 552

    /**
     * @type {Integer (UInt32)}
     */
    static META_FRAMEREGION => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static META_INVERTREGION => 298

    /**
     * @type {Integer (UInt32)}
     */
    static META_PAINTREGION => 299

    /**
     * @type {Integer (UInt32)}
     */
    static META_SELECTCLIPREGION => 300

    /**
     * @type {Integer (UInt32)}
     */
    static META_SELECTOBJECT => 301

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETTEXTALIGN => 302

    /**
     * @type {Integer (UInt32)}
     */
    static META_CHORD => 2096

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETMAPPERFLAGS => 561

    /**
     * @type {Integer (UInt32)}
     */
    static META_EXTTEXTOUT => 2610

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETDIBTODEV => 3379

    /**
     * @type {Integer (UInt32)}
     */
    static META_SELECTPALETTE => 564

    /**
     * @type {Integer (UInt32)}
     */
    static META_REALIZEPALETTE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static META_ANIMATEPALETTE => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETPALENTRIES => 55

    /**
     * @type {Integer (UInt32)}
     */
    static META_POLYPOLYGON => 1336

    /**
     * @type {Integer (UInt32)}
     */
    static META_RESIZEPALETTE => 313

    /**
     * @type {Integer (UInt32)}
     */
    static META_DIBBITBLT => 2368

    /**
     * @type {Integer (UInt32)}
     */
    static META_DIBSTRETCHBLT => 2881

    /**
     * @type {Integer (UInt32)}
     */
    static META_DIBCREATEPATTERNBRUSH => 322

    /**
     * @type {Integer (UInt32)}
     */
    static META_STRETCHDIB => 3907

    /**
     * @type {Integer (UInt32)}
     */
    static META_EXTFLOODFILL => 1352

    /**
     * @type {Integer (UInt32)}
     */
    static META_SETLAYOUT => 329

    /**
     * @type {Integer (UInt32)}
     */
    static META_DELETEOBJECT => 496

    /**
     * @type {Integer (UInt32)}
     */
    static META_CREATEPALETTE => 247

    /**
     * @type {Integer (UInt32)}
     */
    static META_CREATEPATTERNBRUSH => 505

    /**
     * @type {Integer (UInt32)}
     */
    static META_CREATEPENINDIRECT => 762

    /**
     * @type {Integer (UInt32)}
     */
    static META_CREATEFONTINDIRECT => 763

    /**
     * @type {Integer (UInt32)}
     */
    static META_CREATEBRUSHINDIRECT => 764

    /**
     * @type {Integer (UInt32)}
     */
    static META_CREATEREGION => 1791

    /**
     * @type {Integer (UInt32)}
     */
    static NEWFRAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ABORTDOC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NEXTBAND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SETCOLORTABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GETCOLORTABLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FLUSHOUTPUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DRAFTMODE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static QUERYESCSUPPORT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SETABORTPROC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static STARTDOC => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ENDDOC => 11

    /**
     * @type {Integer (UInt32)}
     */
    static GETPHYSPAGESIZE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static GETPRINTINGOFFSET => 13

    /**
     * @type {Integer (UInt32)}
     */
    static GETSCALINGFACTOR => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MFCOMMENT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static GETPENWIDTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SETCOPYCOUNT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SELECTPAPERSOURCE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEDATA => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PASSTHROUGH => 19

    /**
     * @type {Integer (UInt32)}
     */
    static GETTECHNOLGY => 20

    /**
     * @type {Integer (UInt32)}
     */
    static GETTECHNOLOGY => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SETLINECAP => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SETLINEJOIN => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SETMITERLIMIT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static BANDINFO => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DRAWPATTERNRECT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static GETVECTORPENSIZE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static GETVECTORBRUSHSIZE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLEDUPLEX => 28

    /**
     * @type {Integer (UInt32)}
     */
    static GETSETPAPERBINS => 29

    /**
     * @type {Integer (UInt32)}
     */
    static GETSETPRINTORIENT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static ENUMPAPERBINS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SETDIBSCALING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EPSPRINTING => 33

    /**
     * @type {Integer (UInt32)}
     */
    static ENUMPAPERMETRICS => 34

    /**
     * @type {Integer (UInt32)}
     */
    static GETSETPAPERMETRICS => 35

    /**
     * @type {Integer (UInt32)}
     */
    static POSTSCRIPT_DATA => 37

    /**
     * @type {Integer (UInt32)}
     */
    static POSTSCRIPT_IGNORE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSETRAILS => 39

    /**
     * @type {Integer (UInt32)}
     */
    static GETDEVICEUNITS => 42

    /**
     * @type {Integer (UInt32)}
     */
    static GETEXTENDEDTEXTMETRICS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GETEXTENTTABLE => 257

    /**
     * @type {Integer (UInt32)}
     */
    static GETPAIRKERNTABLE => 258

    /**
     * @type {Integer (UInt32)}
     */
    static GETTRACKKERNTABLE => 259

    /**
     * @type {Integer (UInt32)}
     */
    static EXTTEXTOUT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GETFACENAME => 513

    /**
     * @type {Integer (UInt32)}
     */
    static DOWNLOADFACE => 514

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLERELATIVEWIDTHS => 768

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLEPAIRKERNING => 769

    /**
     * @type {Integer (UInt32)}
     */
    static SETKERNTRACK => 770

    /**
     * @type {Integer (UInt32)}
     */
    static SETALLJUSTVALUES => 771

    /**
     * @type {Integer (UInt32)}
     */
    static SETCHARSET => 772

    /**
     * @type {Integer (UInt32)}
     */
    static STRETCHBLT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static METAFILE_DRIVER => 2049

    /**
     * @type {Integer (UInt32)}
     */
    static GETSETSCREENPARAMS => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static QUERYDIBSUPPORT => 3073

    /**
     * @type {Integer (UInt32)}
     */
    static BEGIN_PATH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CLIP_TO_PATH => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static END_PATH => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_DEVICE_CAPS => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static RESTORE_CTM => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static SAVE_CTM => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static SET_ARC_DIRECTION => 4102

    /**
     * @type {Integer (UInt32)}
     */
    static SET_BACKGROUND_COLOR => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static SET_POLY_MODE => 4104

    /**
     * @type {Integer (UInt32)}
     */
    static SET_SCREEN_ANGLE => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static SET_SPREAD => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSFORM_CTM => 4107

    /**
     * @type {Integer (UInt32)}
     */
    static SET_CLIP_BOX => 4108

    /**
     * @type {Integer (UInt32)}
     */
    static SET_BOUNDS => 4109

    /**
     * @type {Integer (UInt32)}
     */
    static SET_MIRROR_MODE => 4110

    /**
     * @type {Integer (UInt32)}
     */
    static OPENCHANNEL => 4110

    /**
     * @type {Integer (UInt32)}
     */
    static DOWNLOADHEADER => 4111

    /**
     * @type {Integer (UInt32)}
     */
    static CLOSECHANNEL => 4112

    /**
     * @type {Integer (UInt32)}
     */
    static POSTSCRIPT_PASSTHROUGH => 4115

    /**
     * @type {Integer (UInt32)}
     */
    static ENCAPSULATED_POSTSCRIPT => 4116

    /**
     * @type {Integer (UInt32)}
     */
    static POSTSCRIPT_IDENTIFY => 4117

    /**
     * @type {Integer (UInt32)}
     */
    static POSTSCRIPT_INJECTION => 4118

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKJPEGFORMAT => 4119

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKPNGFORMAT => 4120

    /**
     * @type {Integer (UInt32)}
     */
    static GET_PS_FEATURESETTING => 4121

    /**
     * @type {Integer (UInt32)}
     */
    static GDIPLUS_TS_QUERYVER => 4122

    /**
     * @type {Integer (UInt32)}
     */
    static GDIPLUS_TS_RECORD => 4123

    /**
     * @type {Integer (UInt32)}
     */
    static MILCORE_TS_QUERYVER_RESULT_FALSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MILCORE_TS_QUERYVER_RESULT_TRUE => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static SPCLPASSTHROUGH2 => 4568

    /**
     * @type {Integer (UInt32)}
     */
    static PSIDENT_GDICENTRIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PSIDENT_PSCENTRIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSINJECT_DLFONT => 3722304989

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_NUP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_OUTPUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_PSLEVEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_CUSTPAPER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_MIRROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_NEGATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_PROTOCOL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_PRIVATE_BEGIN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FEATURESETTING_PRIVATE_END => 8191

    /**
     * @type {Integer (UInt32)}
     */
    static PSPROTOCOL_ASCII => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PSPROTOCOL_BCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSPROTOCOL_TBCP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSPROTOCOL_BINARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static QDI_SETDIBITS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QDI_GETDIBITS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QDI_DIBTOSCREEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QDI_STRETCHDIB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SP_NOTREPORTED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SP_ERROR => -1

    /**
     * @type {Integer (Int32)}
     */
    static SP_APPABORT => -2

    /**
     * @type {Integer (Int32)}
     */
    static SP_USERABORT => -3

    /**
     * @type {Integer (Int32)}
     */
    static SP_OUTOFDISK => -4

    /**
     * @type {Integer (Int32)}
     */
    static SP_OUTOFMEMORY => -5

    /**
     * @type {Integer (UInt32)}
     */
    static PR_JOBSTATUS => 0

    /**
     * @type {Integer (Int32)}
     */
    static LCS_GM_BUSINESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static LCS_GM_GRAPHICS => 2

    /**
     * @type {Integer (Int32)}
     */
    static LCS_GM_IMAGES => 4

    /**
     * @type {Integer (Int32)}
     */
    static LCS_GM_ABS_COLORIMETRIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_OUT_OF_GAMUT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CM_IN_GAMUT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTM_REGULAR => 64

    /**
     * @type {Integer (Int32)}
     */
    static NTM_BOLD => 32

    /**
     * @type {Integer (Int32)}
     */
    static NTM_ITALIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTM_NONNEGATIVE_AC => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NTM_PS_OPENTYPE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NTM_TT_OPENTYPE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NTM_MULTIPLEMASTER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static NTM_TYPE1 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static NTM_DSIG => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static LF_FACESIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LF_FULLFACESIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CLEARTYPE_NATURAL_QUALITY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MONO_FONT => 8

    /**
     * @type {Integer (Int32)}
     */
    static FS_LATIN1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static FS_LATIN2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static FS_CYRILLIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static FS_GREEK => 8

    /**
     * @type {Integer (Int32)}
     */
    static FS_TURKISH => 16

    /**
     * @type {Integer (Int32)}
     */
    static FS_HEBREW => 32

    /**
     * @type {Integer (Int32)}
     */
    static FS_ARABIC => 64

    /**
     * @type {Integer (Int32)}
     */
    static FS_BALTIC => 128

    /**
     * @type {Integer (Int32)}
     */
    static FS_VIETNAMESE => 256

    /**
     * @type {Integer (Int32)}
     */
    static FS_THAI => 65536

    /**
     * @type {Integer (Int32)}
     */
    static FS_JISJAPAN => 131072

    /**
     * @type {Integer (Int32)}
     */
    static FS_CHINESESIMP => 262144

    /**
     * @type {Integer (Int32)}
     */
    static FS_WANSUNG => 524288

    /**
     * @type {Integer (Int32)}
     */
    static FS_CHINESETRAD => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static FS_JOHAB => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static FS_SYMBOL => -2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PANOSE_COUNT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_FAMILYTYPE_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_SERIFSTYLE_INDEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_PROPORTION_INDEX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_STROKEVARIATION_INDEX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_ARMSTYLE_INDEX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_LETTERFORM_INDEX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_CULTURE_LATIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PAN_NO_FIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_VENDOR_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_CULTURE_LATIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RASTER_FONTTYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_FONTTYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUETYPE_FONTTYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PC_RESERVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PC_EXPLICIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PC_NOCOLLAPSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BKMODE_LAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GM_LAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PT_CLOSEFIGURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PT_LINETO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PT_BEZIERTO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PT_MOVETO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ABSOLUTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RELATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STOCK_LAST => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CLR_INVALID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static HS_API_MAX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DT_PLOTTER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DT_RASDISPLAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DT_RASPRINTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DT_RASCAMERA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DT_CHARSTREAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DT_METAFILE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DT_DISPFILE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CC_CIRCLES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CC_PIE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CC_CHORD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ELLIPSES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CC_WIDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CC_STYLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CC_WIDESTYLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CC_INTERIORS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ROUNDRECT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LC_POLYLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LC_MARKER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LC_POLYMARKER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LC_WIDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LC_STYLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LC_WIDESTYLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LC_INTERIORS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PC_POLYGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PC_RECTANGLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PC_WINDPOLYGON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PC_TRAPEZOID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PC_SCANLINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PC_WIDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PC_STYLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PC_WIDESTYLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PC_INTERIORS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PC_POLYPOLYGON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PC_PATHS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CP_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CP_RECTANGLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CP_REGION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_OP_CHARACTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TC_OP_STROKE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_CP_STROKE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TC_CR_90 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TC_CR_ANY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TC_SF_X_YINDEP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TC_SA_DOUBLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TC_SA_INTEGER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TC_SA_CONTIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TC_EA_DOUBLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TC_IA_ABLE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TC_UA_ABLE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TC_SO_ABLE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TC_RA_ABLE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TC_VA_ABLE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TC_RESERVED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TC_SCROLLBLT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RC_BITBLT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RC_BANDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RC_SCALING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RC_BITMAP64 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RC_GDI20_OUTPUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RC_GDI20_STATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RC_SAVEBITMAP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RC_DI_BITMAP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RC_PALETTE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RC_DIBTODEV => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RC_BIGFONT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RC_STRETCHBLT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static RC_FLOODFILL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RC_STRETCHDIB => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static RC_OP_DX_OUTPUT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static RC_DEVBITS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SB_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SB_CONST_ALPHA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SB_PIXEL_ALPHA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SB_PREMULT_ALPHA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SB_GRAD_RECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SB_GRAD_TRI => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVICE_ICM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_GAMMA_RAMP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CMYK_COLOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYSPAL_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static CBM_INIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CCHFORMNAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DMORIENT_PORTRAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMORIENT_LANDSCAPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LETTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LETTERSMALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_TABLOID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LEDGER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LEGAL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_STATEMENT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_EXECUTIVE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A4 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A4SMALL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A5 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B4 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B5 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_FOLIO => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_QUARTO => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_10X14 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_11X17 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_NOTE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_9 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_10 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_11 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_12 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_14 => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_CSHEET => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_DSHEET => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ESHEET => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_DL => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_C5 => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_C3 => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_C4 => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_C6 => 31

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_C65 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_B4 => 33

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_B5 => 34

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_B6 => 35

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_ITALY => 36

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_MONARCH => 37

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_PERSONAL => 38

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_FANFOLD_US => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_FANFOLD_STD_GERMAN => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_FANFOLD_LGL_GERMAN => 41

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ISO_B4 => 42

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JAPANESE_POSTCARD => 43

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_9X11 => 44

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_10X11 => 45

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_15X11 => 46

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_ENV_INVITE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_RESERVED_48 => 48

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_RESERVED_49 => 49

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LETTER_EXTRA => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LEGAL_EXTRA => 51

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_TABLOID_EXTRA => 52

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A4_EXTRA => 53

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LETTER_TRANSVERSE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A4_TRANSVERSE => 55

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LETTER_EXTRA_TRANSVERSE => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A_PLUS => 57

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B_PLUS => 58

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LETTER_PLUS => 59

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A4_PLUS => 60

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A5_TRANSVERSE => 61

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B5_TRANSVERSE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A3_EXTRA => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A5_EXTRA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B5_EXTRA => 65

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A2 => 66

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A3_TRANSVERSE => 67

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A3_EXTRA_TRANSVERSE => 68

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_DBL_JAPANESE_POSTCARD => 69

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A6 => 70

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_KAKU2 => 71

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_KAKU3 => 72

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_CHOU3 => 73

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_CHOU4 => 74

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LETTER_ROTATED => 75

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A3_ROTATED => 76

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A4_ROTATED => 77

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A5_ROTATED => 78

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B4_JIS_ROTATED => 79

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B5_JIS_ROTATED => 80

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JAPANESE_POSTCARD_ROTATED => 81

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED => 82

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_A6_ROTATED => 83

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_KAKU2_ROTATED => 84

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_KAKU3_ROTATED => 85

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_CHOU3_ROTATED => 86

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_CHOU4_ROTATED => 87

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B6_JIS => 88

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_B6_JIS_ROTATED => 89

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_12X11 => 90

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_YOU4 => 91

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_JENV_YOU4_ROTATED => 92

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_P16K => 93

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_P32K => 94

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_P32KBIG => 95

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_1 => 96

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_2 => 97

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_3 => 98

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_4 => 99

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_5 => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_6 => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_7 => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_8 => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_9 => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_10 => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_P16K_ROTATED => 106

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_P32K_ROTATED => 107

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_P32KBIG_ROTATED => 108

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_1_ROTATED => 109

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_2_ROTATED => 110

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_3_ROTATED => 111

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_4_ROTATED => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_5_ROTATED => 113

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_6_ROTATED => 114

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_7_ROTATED => 115

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_8_ROTATED => 116

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_9_ROTATED => 117

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_PENV_10_ROTATED => 118

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_LAST => 118

    /**
     * @type {Integer (UInt32)}
     */
    static DMPAPER_USER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_UPPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_ONLYONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_LOWER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_MIDDLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_MANUAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_ENVELOPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_ENVMANUAL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_AUTO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_TRACTOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_SMALLFMT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_LARGEFMT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_LARGECAPACITY => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_CASSETTE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_FORMSOURCE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_LAST => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DMBIN_USER => 256

    /**
     * @type {Integer (Int32)}
     */
    static DMRES_DRAFT => -1

    /**
     * @type {Integer (Int32)}
     */
    static DMRES_LOW => -2

    /**
     * @type {Integer (Int32)}
     */
    static DMRES_MEDIUM => -3

    /**
     * @type {Integer (Int32)}
     */
    static DMRES_HIGH => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DMDISPLAYFLAGS_TEXTMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMNUP_SYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMNUP_ONEUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMICMMETHOD_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMICMMETHOD_SYSTEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMICMMETHOD_DRIVER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMICMMETHOD_DEVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMICMMETHOD_USER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DMICM_SATURATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMICM_CONTRAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMICM_COLORIMETRIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMICM_ABS_COLORIMETRIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMICM_USER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DMMEDIA_STANDARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMMEDIA_TRANSPARENCY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMMEDIA_GLOSSY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMMEDIA_USER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_COARSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_FINE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_LINEART => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_ERRORDIFFUSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_RESERVED6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_RESERVED7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_RESERVED8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_RESERVED9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_GRAYSCALE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DMDITHER_USER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_MAXPATH => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_MODE_IDX_INVALID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_TARGET_MODE_IDX_INVALID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_DESKTOP_IMAGE_IDX_INVALID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_SOURCE_MODE_IDX_INVALID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_CLONE_GROUP_INVALID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_SOURCE_IN_USE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_TARGET_IN_USE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_TARGET_FORCIBLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_BOOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_PATH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_SYSTEM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_TARGET_IS_HMD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_PREFERRED_UNSCALED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_SUPPORT_VIRTUAL_MODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_BOOST_REFRESH_RATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYCONFIG_PATH_VALID_FLAGS => 29

    /**
     * @type {Integer (UInt32)}
     */
    static RDH_RECTANGLES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYSRGN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TT_POLYGON_TYPE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static TT_PRIM_LINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TT_PRIM_QSPLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TT_PRIM_CSPLINE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_DBCS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_ERROR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FLI_MASK => 4155

    /**
     * @type {Integer (Int32)}
     */
    static FLI_GLYPHS => 262144

    /**
     * @type {Integer (Int32)}
     */
    static GCP_JUSTIFYIN => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_LATIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_HEBREW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_ARABIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_NEUTRAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_LOCALNUMBER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_LATINNUMBER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_LATINNUMERICTERMINATOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_LATINNUMERICSEPARATOR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_NUMERICSEPARATOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_PREBOUNDLTR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_PREBOUNDRTL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_POSTBOUNDLTR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GCPCLASS_POSTBOUNDRTL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GCPGLYPH_LINKBEFORE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static GCPGLYPH_LINKAFTER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TT_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TT_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DC_BINADJUST => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DC_EMF_COMPLIANT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DC_DATATYPE_PRODUCED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DC_MANUFACTURER => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DC_MODEL => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTRATEUNIT_PPM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTRATEUNIT_CPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTRATEUNIT_LPM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTRATEUNIT_IPM => 4

    /**
     * @type {Integer (Int32)}
     */
    static DCTT_BITMAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCTT_DOWNLOAD => 2

    /**
     * @type {Integer (Int32)}
     */
    static DCTT_SUBDEV => 4

    /**
     * @type {Integer (Int32)}
     */
    static DCTT_DOWNLOAD_OUTLINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEUPNONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEUPCENTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEUPLEFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEUPRIGHT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEDOWNNONE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEDOWNCENTER => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEDOWNLEFT => 258

    /**
     * @type {Integer (UInt32)}
     */
    static DCBA_FACEDOWNRIGHT => 259

    /**
     * @type {Integer (UInt32)}
     */
    static GS_8BIT_INDICES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GGI_MARK_NONEXISTING_GLYPHS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MAX_NUMAXES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MAX_AXES_NAMELEN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GDIREGISTERDDRAWPACKETVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AC_SRC_OVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AC_SRC_ALPHA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_OP_FLAG => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CA_NEGATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CA_LOG_FILTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_DEVICE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_A => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_B => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_C => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_D50 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_D55 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_D65 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_D75 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_F2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_MAX_INDEX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_TUNGSTEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_DAYLIGHT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_FLUORESCENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ILLUMINANT_NTSC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI_APPBANDING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_ROPS_READ_DESTINATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FONTMAPPER_MAX => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ENHMETA_SIGNATURE => 1179469088

    /**
     * @type {Integer (UInt32)}
     */
    static ENHMETA_STOCK_OBJECT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SETICMPROFILE_EMBEDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATECOLORSPACE_EMBEDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COLORMATCHTOTARGET_EMBEDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GDICOMMENT_IDENTIFIER => 1128875079

    /**
     * @type {Integer (UInt32)}
     */
    static GDICOMMENT_WINDOWS_METAFILE => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static GDICOMMENT_BEGINGROUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GDICOMMENT_ENDGROUP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GDICOMMENT_MULTIFORMATS => 1073741828

    /**
     * @type {Integer (UInt32)}
     */
    static EPS_SIGNATURE => 1179865157

    /**
     * @type {Integer (UInt32)}
     */
    static GDICOMMENT_UNICODE_STRING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GDICOMMENT_UNICODE_END => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_FONT_LINES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_FONT_POLYGONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_DOUBLEBUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_STEREO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_SUPPORT_GDI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_SUPPORT_OPENGL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_SHARE_DEPTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_SHARE_STENCIL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_SHARE_ACCUM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_SWAP_EXCHANGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_SWAP_COPY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_TRANSPARENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_TYPE_RGBA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LPD_TYPE_COLORINDEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_MAIN_PLANE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY4 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY5 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY6 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY7 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY8 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY9 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY10 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY11 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY12 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY13 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY14 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_OVERLAY15 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY1 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY2 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY3 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY4 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY5 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY6 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY7 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY8 => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY9 => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY10 => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY11 => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY12 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY13 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY14 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAP_UNDERLAY15 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WGL_SWAPMULTIPLE_MAX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NEWTRANSPARENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static QUERYROPSUPPORT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SELECTDIB => 41

    /**
     * @type {Integer (UInt32)}
     */
    static SC_SCREENSAVE => 61760

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_SUBSET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_SUBSET1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_DELTA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_APPLE_PLATFORMID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_MS_PLATFORMID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_DONT_CARE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_LANG_KEEP_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_FLAGS_SUBSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_FLAGS_COMPRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_FLAGS_TTC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TTFCFP_FLAGS_GLYPHLIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TTFMFP_SUBSET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TTFMFP_SUBSET1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTFMFP_DELTA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_GENERIC => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_READOUTOFBOUNDS => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_WRITEOUTOFBOUNDS => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_READCONTROL => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_WRITECONTROL => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MEM => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_FORMAT => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_WOULD_GROW => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_VERSION => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_NO_GLYPHS => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_MERGE_FORMATS => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_MERGE_CHECKSUMS => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_MERGE_NUMGLYPHS => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_DELTA_FORMAT => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_NOT_TTC => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_TTC_INDEX => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_CMAP => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_GLYF => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_HEAD => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_HHEA => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_HMTX => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_LOCA => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_MAXP => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_NAME => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_POST => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_OS2 => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_VHEA => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_VMTX => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_HHEA_OR_VHEA => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_HMTX_OR_VMTX => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_MISSING_EBDT => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_CMAP => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_GLYF => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_HEAD => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_HHEA => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_HMTX => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_LOCA => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_MAXP => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_NAME => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_POST => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_OS2 => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_VHEA => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_VMTX => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_HHEA_OR_VHEA => 1072

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_HMTX_OR_VMTX => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_TTO => 1080

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_GSUB => 1081

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_GPOS => 1082

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_GDEF => 1083

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_JSTF => 1084

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_BASE => 1085

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_EBLC => 1086

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_LTSH => 1087

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_VDMX => 1088

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_INVALID_HDMX => 1089

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER0 => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER1 => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER2 => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER3 => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER4 => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER5 => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER6 => 1106

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER7 => 1107

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER8 => 1108

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER9 => 1109

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER10 => 1110

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER11 => 1111

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER12 => 1112

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER13 => 1113

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER14 => 1114

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER15 => 1115

    /**
     * @type {Integer (UInt32)}
     */
    static ERR_PARAMETER16 => 1116

    /**
     * @type {Integer (UInt32)}
     */
    static CHARSET_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHARSET_GLYPHIDX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_FAILIFVARIATIONSIMULATED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_WEBOBJECT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_XORENCRYPTDATA => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_VARIATIONSIMULATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_EUDCEMBEDDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_SUBSETCANCEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TTLOAD_PRIVATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTLOAD_EUDC_OVERWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TTLOAD_EUDC_SET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TTDELETE_DONTREMOVEFONT => 1

    /**
     * @type {Integer (Int32)}
     */
    static E_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static E_API_NOTIMPL => 1

    /**
     * @type {Integer (Int32)}
     */
    static E_CHARCODECOUNTINVALID => 2

    /**
     * @type {Integer (Int32)}
     */
    static E_CHARCODESETINVALID => 3

    /**
     * @type {Integer (Int32)}
     */
    static E_DEVICETRUETYPEFONT => 4

    /**
     * @type {Integer (Int32)}
     */
    static E_HDCINVALID => 6

    /**
     * @type {Integer (Int32)}
     */
    static E_NOFREEMEMORY => 7

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTREFERENCEINVALID => 8

    /**
     * @type {Integer (Int32)}
     */
    static E_NOTATRUETYPEFONT => 10

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORACCESSINGFONTDATA => 12

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORACCESSINGFACENAME => 13

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORUNICODECONVERSION => 17

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORCONVERTINGCHARS => 18

    /**
     * @type {Integer (Int32)}
     */
    static E_EXCEPTION => 19

    /**
     * @type {Integer (Int32)}
     */
    static E_RESERVEDPARAMNOTNULL => 20

    /**
     * @type {Integer (Int32)}
     */
    static E_CHARSETINVALID => 21

    /**
     * @type {Integer (Int32)}
     */
    static E_FILE_NOT_FOUND => 23

    /**
     * @type {Integer (Int32)}
     */
    static E_TTC_INDEX_OUT_OF_RANGE => 24

    /**
     * @type {Integer (Int32)}
     */
    static E_INPUTPARAMINVALID => 25

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORCOMPRESSINGFONTDATA => 256

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTDATAINVALID => 258

    /**
     * @type {Integer (Int32)}
     */
    static E_NAMECHANGEFAILED => 259

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTNOTEMBEDDABLE => 260

    /**
     * @type {Integer (Int32)}
     */
    static E_PRIVSINVALID => 261

    /**
     * @type {Integer (Int32)}
     */
    static E_SUBSETTINGFAILED => 262

    /**
     * @type {Integer (Int32)}
     */
    static E_READFROMSTREAMFAILED => 263

    /**
     * @type {Integer (Int32)}
     */
    static E_SAVETOSTREAMFAILED => 264

    /**
     * @type {Integer (Int32)}
     */
    static E_NOOS2 => 265

    /**
     * @type {Integer (Int32)}
     */
    static E_T2NOFREEMEMORY => 266

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORREADINGFONTDATA => 267

    /**
     * @type {Integer (Int32)}
     */
    static E_FLAGSINVALID => 268

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORCREATINGFONTFILE => 269

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTALREADYEXISTS => 270

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTNAMEALREADYEXISTS => 271

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTINSTALLFAILED => 272

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORDECOMPRESSINGFONTDATA => 273

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORACCESSINGEXCLUDELIST => 274

    /**
     * @type {Integer (Int32)}
     */
    static E_FACENAMEINVALID => 275

    /**
     * @type {Integer (Int32)}
     */
    static E_STREAMINVALID => 276

    /**
     * @type {Integer (Int32)}
     */
    static E_STATUSINVALID => 277

    /**
     * @type {Integer (Int32)}
     */
    static E_PRIVSTATUSINVALID => 278

    /**
     * @type {Integer (Int32)}
     */
    static E_PERMISSIONSINVALID => 279

    /**
     * @type {Integer (Int32)}
     */
    static E_PBENABLEDINVALID => 280

    /**
     * @type {Integer (Int32)}
     */
    static E_SUBSETTINGEXCEPTION => 281

    /**
     * @type {Integer (Int32)}
     */
    static E_SUBSTRING_TEST_FAIL => 282

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTVARIATIONSIMULATED => 283

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTFAMILYNAMENOTINFULL => 285

    /**
     * @type {Integer (Int32)}
     */
    static E_ADDFONTFAILED => 512

    /**
     * @type {Integer (Int32)}
     */
    static E_COULDNTCREATETEMPFILE => 513

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTFILECREATEFAILED => 515

    /**
     * @type {Integer (Int32)}
     */
    static E_WINDOWSAPI => 516

    /**
     * @type {Integer (Int32)}
     */
    static E_FONTFILENOTFOUND => 517

    /**
     * @type {Integer (Int32)}
     */
    static E_RESOURCEFILECREATEFAILED => 518

    /**
     * @type {Integer (Int32)}
     */
    static E_ERROREXPANDINGFONTDATA => 519

    /**
     * @type {Integer (Int32)}
     */
    static E_ERRORGETTINGDC => 520

    /**
     * @type {Integer (Int32)}
     */
    static E_EXCEPTIONINDECOMPRESSION => 521

    /**
     * @type {Integer (Int32)}
     */
    static E_EXCEPTIONINCOMPRESSION => 522
;@endregion Constants

;@region Methods
    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {HGDIOBJ} h A handle to the graphics object of interest. This can be a handle to one of the following: a logical bitmap, a brush, a font, a palette, a pen, or a device independent bitmap created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a> function.
     * @param {Integer} c The number of bytes of information to be written to the buffer.
     * @param {Pointer} pv A pointer to a buffer that receives the information about the specified graphics object.
     * 
     * The following table shows the type of information the buffer receives for each type of graphics object you can specify with <i>hgdiobj</i>.
     * 
     * <table>
     * <tr>
     * <th>Object type</th>
     * <th>Data written to buffer</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBITMAP"></a><a id="hbitmap"></a><dl>
     * <dt><b><b>HBITMAP</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBITMAP_returned_from_a_call_to_CreateDIBSection"></a><a id="hbitmap_returned_from_a_call_to_createdibsection"></a><a id="HBITMAP_RETURNED_FROM_A_CALL_TO_CREATEDIBSECTION"></a><dl>
     * <dt><b><b>HBITMAP</b> returned from a call to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a>, if <i>cbBuffer</i> is set to<c> sizeof (DIBSECTION)</code>, or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a>, if <i>cbBuffer</i> is set to <code>sizeof (BITMAP)</c>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HPALETTE"></a><a id="hpalette"></a><dl>
     * <dt><b><b>HPALETTE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>WORD</b> count of the number of entries in the logical palette
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HPEN_returned_from_a_call_to_ExtCreatePen"></a><a id="hpen_returned_from_a_call_to_extcreatepen"></a><a id="HPEN_RETURNED_FROM_A_CALL_TO_EXTCREATEPEN"></a><dl>
     * <dt><b><b>HPEN</b> returned from a call to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extcreatepen">ExtCreatePen</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-extlogpen">EXTLOGPEN</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HPEN"></a><a id="hpen"></a><dl>
     * <dt><b><b>HPEN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpen">LOGPEN</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBRUSH"></a><a id="hbrush"></a><dl>
     * <dt><b><b>HBRUSH</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HFONT"></a><a id="hfont"></a><dl>
     * <dt><b><b>HFONT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the <i>lpvObject</i> parameter is <b>NULL</b>, the function return value is the number of bytes required to store the information it writes to the buffer for the specified graphics object.
     * 
     * The address of <i>lpvObject</i> must be on a 4-byte boundary; otherwise, <b>GetObject</b> fails.
     * @returns {Integer} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobjecta
     */
    static GetObjectA(h, c, pv) {
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\GetObjectA", "ptr", h, "int", c, "ptr", pv, "int")
        return result
    }

    /**
     * The AddFontResource function adds the font resource from the specified file to the system font table. The font can subsequently be used for text output by any application.
     * @param {PSTR} param0 
     * @returns {Integer} If the function succeeds, the return value specifies the number of fonts added.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-addfontresourcea
     * @since windows5.0
     */
    static AddFontResourceA(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall("GDI32.dll\AddFontResourceA", "ptr", param0, "int")
        return result
    }

    /**
     * The AddFontResource function adds the font resource from the specified file to the system font table. The font can subsequently be used for text output by any application.
     * @param {PWSTR} param0 
     * @returns {Integer} If the function succeeds, the return value specifies the number of fonts added.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-addfontresourcew
     * @since windows5.0
     */
    static AddFontResourceW(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall("GDI32.dll\AddFontResourceW", "ptr", param0, "int")
        return result
    }

    /**
     * The AnimatePalette function replaces entries in the specified logical palette.
     * @param {HPALETTE} hPal A handle to the logical palette.
     * @param {Integer} iStartIndex The first logical palette entry to be replaced.
     * @param {Integer} cEntries The number of entries to be replaced.
     * @param {Pointer<PALETTEENTRY>} ppe A pointer to the first member in an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures used to replace the current entries.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-animatepalette
     * @since windows5.0
     */
    static AnimatePalette(hPal, iStartIndex, cEntries, ppe) {
        hPal := hPal is Win32Handle ? NumGet(hPal, "ptr") : hPal

        result := DllCall("GDI32.dll\AnimatePalette", "ptr", hPal, "uint", iStartIndex, "uint", cEntries, "ptr", ppe, "int")
        return result
    }

    /**
     * The Arc function draws an elliptical arc.
     * @param {HDC} hdc A handle to the device context where drawing takes place.
     * @param {Integer} x1 The x-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
     * @param {Integer} y1 The y-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
     * @param {Integer} x2 The x-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
     * @param {Integer} y2 The y-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
     * @param {Integer} x3 The x-coordinate, in logical units, of the ending point of the radial line defining the starting point of the arc.
     * @param {Integer} y3 The y-coordinate, in logical units, of the ending point of the radial line defining the starting point of the arc.
     * @param {Integer} x4 The x-coordinate, in logical units, of the ending point of the radial line defining the ending point of the arc.
     * @param {Integer} y4 The y-coordinate, in logical units, of the ending point of the radial line defining the ending point of the arc.
     * @returns {BOOL} If the arc is drawn, the return value is nonzero.
     * 
     * If the arc is not drawn, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-arc
     * @since windows5.0
     */
    static Arc(hdc, x1, y1, x2, y2, x3, y3, x4, y4) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Arc", "ptr", hdc, "int", x1, "int", y1, "int", x2, "int", y2, "int", x3, "int", y3, "int", x4, "int", y4, "int")
        return result
    }

    /**
     * The BitBlt function performs a bit-block transfer of the color data corresponding to a rectangle of pixels from the specified source device context into a destination device context.
     * @param {HDC} hdc A handle to the destination device context.
     * @param {Integer} x The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} y The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} cx The width, in logical units, of the source and destination rectangles.
     * @param {Integer} cy The height, in logical units, of the source and the destination rectangles.
     * @param {HDC} hdcSrc A handle to the source device context.
     * @param {Integer} x1 The x-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} y1 The y-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} rop A raster-operation code. These codes define how the color data for the source rectangle is to be combined with the color data for the destination rectangle to achieve the final color.
     * 
     * The following list shows some common raster operation codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BLACKNESS"></a><a id="blackness"></a><dl>
     * <dt><b>BLACKNESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Fills the destination rectangle using the color associated with index 0 in the physical palette. (This color is black for the default physical palette.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CAPTUREBLT"></a><a id="captureblt"></a><dl>
     * <dt><b>CAPTUREBLT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Includes any windows that are layered on top of your window in the resulting image. By default, the image only contains your window. Note that this generally cannot be used for printing device contexts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSTINVERT"></a><a id="dstinvert"></a><dl>
     * <dt><b>DSTINVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Inverts the destination rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MERGECOPY"></a><a id="mergecopy"></a><dl>
     * <dt><b>MERGECOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges the colors of the source rectangle with the brush currently selected in <i>hdcDest</i>, by using the Boolean AND operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MERGEPAINT"></a><a id="mergepaint"></a><dl>
     * <dt><b>MERGEPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges the colors of the inverted source rectangle with the colors of the destination rectangle by using the Boolean OR operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NOMIRRORBITMAP"></a><a id="nomirrorbitmap"></a><dl>
     * <dt><b>NOMIRRORBITMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents the bitmap from being mirrored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NOTSRCCOPY"></a><a id="notsrccopy"></a><dl>
     * <dt><b>NOTSRCCOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copies the inverted source rectangle to the destination.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NOTSRCERASE"></a><a id="notsrcerase"></a><dl>
     * <dt><b>NOTSRCERASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the colors of the source and destination rectangles by using the Boolean OR operator and then inverts the resultant color.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PATCOPY"></a><a id="patcopy"></a><dl>
     * <dt><b>PATCOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copies the brush currently selected in <i>hdcDest</i>, into the destination bitmap.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PATINVERT"></a><a id="patinvert"></a><dl>
     * <dt><b>PATINVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the colors of the brush currently selected in <i>hdcDest</i>, with the colors of the destination rectangle by using the Boolean XOR operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PATPAINT"></a><a id="patpaint"></a><dl>
     * <dt><b>PATPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the colors of the brush currently selected in <i>hdcDest</i>, with the colors of the inverted source rectangle by using the Boolean OR operator. The result of this operation is combined with the colors of the destination rectangle by using the Boolean OR operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCAND"></a><a id="srcand"></a><dl>
     * <dt><b>SRCAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the colors of the source and destination rectangles by using the Boolean AND operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCCOPY"></a><a id="srccopy"></a><dl>
     * <dt><b>SRCCOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copies the source rectangle directly to the destination rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCERASE"></a><a id="srcerase"></a><dl>
     * <dt><b>SRCERASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the inverted colors of the destination rectangle with the colors of the source rectangle by using the Boolean AND operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCINVERT"></a><a id="srcinvert"></a><dl>
     * <dt><b>SRCINVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the colors of the source and destination rectangles by using the Boolean XOR operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCPAINT"></a><a id="srcpaint"></a><dl>
     * <dt><b>SRCPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the colors of the source and destination rectangles by using the Boolean OR operator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WHITENESS"></a><a id="whiteness"></a><dl>
     * <dt><b>WHITENESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Fills the destination rectangle using the color associated with index 1 in the physical palette. (This color is white for the default physical palette.)
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-bitblt
     * @since windows5.0
     */
    static BitBlt(hdc, x, y, cx, cy, hdcSrc, x1, y1, rop) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc

        A_LastError := 0

        result := DllCall("GDI32.dll\BitBlt", "ptr", hdc, "int", x, "int", y, "int", cx, "int", cy, "ptr", hdcSrc, "int", x1, "int", y1, "uint", rop, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CancelDC function cancels any pending operation on the specified device context (DC).
     * @param {HDC} hdc A handle to the DC.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-canceldc
     * @since windows5.0
     */
    static CancelDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CancelDC", "ptr", hdc, "int")
        return result
    }

    /**
     * The Chord function draws a chord (a region bounded by the intersection of an ellipse and a line segment, called a secant). The chord is outlined by using the current pen and filled by using the current brush.
     * @param {HDC} hdc A handle to the device context in which the chord appears.
     * @param {Integer} x1 The x-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
     * @param {Integer} y1 The y-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
     * @param {Integer} x2 The x-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
     * @param {Integer} y2 The y-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
     * @param {Integer} x3 The x-coordinate, in logical coordinates, of the endpoint of the radial defining the beginning of the chord.
     * @param {Integer} y3 The y-coordinate, in logical coordinates, of the endpoint of the radial defining the beginning of the chord.
     * @param {Integer} x4 The x-coordinate, in logical coordinates, of the endpoint of the radial defining the end of the chord.
     * @param {Integer} y4 The y-coordinate, in logical coordinates, of the endpoint of the radial defining the end of the chord.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-chord
     * @since windows5.0
     */
    static Chord(hdc, x1, y1, x2, y2, x3, y3, x4, y4) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Chord", "ptr", hdc, "int", x1, "int", y1, "int", x2, "int", y2, "int", x3, "int", y3, "int", x4, "int", y4, "int")
        return result
    }

    /**
     * The CloseMetaFile function closes a metafile device context and returns a handle that identifies a Windows-format metafile.
     * @param {HDC} hdc Handle to a metafile device context used to create a Windows-format metafile.
     * @returns {HMETAFILE} If the function succeeds, the return value is a handle to a Windows-format metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-closemetafile
     * @since windows5.0
     */
    static CloseMetaFile(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CloseMetaFile", "ptr", hdc, "ptr")
        return HMETAFILE({Value: result}, True)
    }

    /**
     * The CombineRgn function combines two regions and stores the result in a third region. The two regions are combined according to the specified mode.
     * @param {HRGN} hrgnDst A handle to a new region with dimensions defined by combining two other regions. (This region must exist before <b>CombineRgn</b> is called.)
     * @param {HRGN} hrgnSrc1 A handle to the first of two regions to be combined.
     * @param {HRGN} hrgnSrc2 A handle to the second of two regions to be combined.
     * @param {Integer} iMode 
     * @returns {Integer} The return value specifies the type of the resulting region. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The region is more than a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No region is created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-combinergn
     * @since windows5.0
     */
    static CombineRgn(hrgnDst, hrgnSrc1, hrgnSrc2, iMode) {
        hrgnDst := hrgnDst is Win32Handle ? NumGet(hrgnDst, "ptr") : hrgnDst
        hrgnSrc1 := hrgnSrc1 is Win32Handle ? NumGet(hrgnSrc1, "ptr") : hrgnSrc1
        hrgnSrc2 := hrgnSrc2 is Win32Handle ? NumGet(hrgnSrc2, "ptr") : hrgnSrc2

        result := DllCall("GDI32.dll\CombineRgn", "ptr", hrgnDst, "ptr", hrgnSrc1, "ptr", hrgnSrc2, "int", iMode, "int")
        return result
    }

    /**
     * The CopyMetaFile function copies the content of a Windows-format metafile to the specified file.
     * @param {HMETAFILE} param0 
     * @param {PSTR} param1 
     * @returns {HMETAFILE} If the function succeeds, the return value is a handle to the copy of the Windows-format metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-copymetafilea
     * @since windows5.0
     */
    static CopyMetaFileA(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("GDI32.dll\CopyMetaFileA", "ptr", param0, "ptr", param1, "ptr")
        return HMETAFILE({Value: result}, True)
    }

    /**
     * The CopyMetaFile function copies the content of a Windows-format metafile to the specified file.
     * @param {HMETAFILE} param0 
     * @param {PWSTR} param1 
     * @returns {HMETAFILE} If the function succeeds, the return value is a handle to the copy of the Windows-format metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-copymetafilew
     * @since windows5.0
     */
    static CopyMetaFileW(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall("GDI32.dll\CopyMetaFileW", "ptr", param0, "ptr", param1, "ptr")
        return HMETAFILE({Value: result}, True)
    }

    /**
     * The CreateBitmap function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
     * @param {Integer} nWidth The bitmap width, in pixels.
     * @param {Integer} nHeight The bitmap height, in pixels.
     * @param {Integer} nPlanes The number of color planes used by the device.
     * @param {Integer} nBitCount The number of bits required to identify the color of a single pixel.
     * @param {Pointer<Void>} lpBits A pointer to an array of color data used to set the colors in a rectangle of pixels. Each scan line in the rectangle must be word aligned (scan lines that are not word aligned must be padded with zeros). If this parameter is <b>NULL</b>, the contents of the new bitmap is undefined.
     * @returns {HBITMAP} If the function succeeds, the return value is a handle to a bitmap.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * 
     * This function can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_BITMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calculated size of the bitmap is less than zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createbitmap
     * @since windows5.0
     */
    static CreateBitmap(nWidth, nHeight, nPlanes, nBitCount, lpBits) {
        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\CreateBitmap", "int", nWidth, "int", nHeight, "uint", nPlanes, "uint", nBitCount, lpBitsMarshal, lpBits, "ptr")
        return HBITMAP({Value: result}, True)
    }

    /**
     * The CreateBitmapIndirect function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
     * @param {Pointer<BITMAP>} pbm A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> structure that contains information about the bitmap. If an application sets the <b>bmWidth</b> or <b>bmHeight</b> members to zero, <b>CreateBitmapIndirect</b> returns the handle to a 1-by-1 pixel, monochrome bitmap.
     * @returns {HBITMAP} If the function succeeds, the return value is a handle to the bitmap.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * 
     * This function can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmap is too big for memory to be allocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createbitmapindirect
     * @since windows5.0
     */
    static CreateBitmapIndirect(pbm) {
        result := DllCall("GDI32.dll\CreateBitmapIndirect", "ptr", pbm, "ptr")
        return HBITMAP({Value: result}, True)
    }

    /**
     * The CreateBrushIndirect function creates a logical brush that has the specified style, color, and pattern.
     * @param {Pointer<LOGBRUSH>} plbrush A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a> structure that contains information about the brush.
     * @returns {HBRUSH} If the function succeeds, the return value identifies a logical brush.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createbrushindirect
     * @since windows5.0
     */
    static CreateBrushIndirect(plbrush) {
        result := DllCall("GDI32.dll\CreateBrushIndirect", "ptr", plbrush, "ptr")
        return HBRUSH({Value: result}, True)
    }

    /**
     * The CreateCompatibleBitmap function creates a bitmap compatible with the device that is associated with the specified device context.
     * @param {HDC} hdc A handle to a device context.
     * @param {Integer} cx The bitmap width, in pixels.
     * @param {Integer} cy The bitmap height, in pixels.
     * @returns {HBITMAP} If the function succeeds, the return value is a handle to the compatible bitmap (DDB).
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createcompatiblebitmap
     * @since windows5.0
     */
    static CreateCompatibleBitmap(hdc, cx, cy) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CreateCompatibleBitmap", "ptr", hdc, "int", cx, "int", cy, "ptr")
        return HBITMAP({Value: result}, True)
    }

    /**
     * The CreateDiscardableBitmap function creates a discardable bitmap that is compatible with the specified device.
     * @param {HDC} hdc A handle to a device context.
     * @param {Integer} cx The width, in pixels, of the bitmap.
     * @param {Integer} cy The height, in pixels, of the bitmap.
     * @returns {HBITMAP} If the function succeeds, the return value is a handle to the compatible bitmap (DDB).
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-creatediscardablebitmap
     * @since windows5.0
     */
    static CreateDiscardableBitmap(hdc, cx, cy) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CreateDiscardableBitmap", "ptr", hdc, "int", cx, "int", cy, "ptr")
        return HBITMAP({Value: result}, True)
    }

    /**
     * The CreateCompatibleDC function creates a memory device context (DC) compatible with the specified device.
     * @param {HDC} hdc A handle to an existing DC. If this handle is <b>NULL</b>, the function creates a memory DC compatible with the application's current screen.
     * @returns {HDC} If the function succeeds, the return value is the handle to a memory DC.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createcompatibledc
     * @since windows5.0
     */
    static CreateCompatibleDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CreateCompatibleDC", "ptr", hdc, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreateDC function creates a device context (DC) for a device using the specified name.
     * @param {PSTR} pwszDriver A pointer to a null-terminated character string that specifies either DISPLAY or the name of a specific display device. For printing, we recommend that you pass <b>NULL</b> to <i>lpszDriver</i> because GDI ignores <i>lpszDriver</i> for printer devices.
     * @param {PSTR} pwszDevice A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The <i>lpszDevice</i> parameter must be used.
     * 
     * To obtain valid names for displays, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>.
     * 
     * If <i>lpszDriver</i> is DISPLAY or the device name of a specific display device, then <i>lpszDevice</i> must be <b>NULL</b> or that same device name. If <i>lpszDevice</i> is <b>NULL</b>, then a DC is created for the primary display device.
     * 
     * If there are multiple monitors on the system, calling <c>CreateDC(TEXT("DISPLAY"),NULL,NULL,NULL)</c> will create a DC covering all the monitors.
     * @param {PSTR} pszPort This parameter is ignored and should be set to <b>NULL</b>. It is provided only for compatibility with 16-bit Windows.
     * @param {Pointer<DEVMODEA>} pdm A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure containing device-specific initialization data for the device driver. The <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> function retrieves this structure filled in for a specified device. The <i>pdm</i> parameter must be <b>NULL</b> if the device driver is to use the default initialization (if any) specified by the user.
     * 
     * If <i>lpszDriver</i> is DISPLAY, <i>pdm</i> must be <b>NULL</b>; GDI then uses the display device's current <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * @returns {HDC} If the function succeeds, the return value is the handle to a DC for the specified device.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createdca
     * @since windows5.0
     */
    static CreateDCA(pwszDriver, pwszDevice, pszPort, pdm) {
        pwszDriver := pwszDriver is String ? StrPtr(pwszDriver) : pwszDriver
        pwszDevice := pwszDevice is String ? StrPtr(pwszDevice) : pwszDevice
        pszPort := pszPort is String ? StrPtr(pszPort) : pszPort

        result := DllCall("GDI32.dll\CreateDCA", "ptr", pwszDriver, "ptr", pwszDevice, "ptr", pszPort, "ptr", pdm, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreateDC function creates a device context (DC) for a device using the specified name.
     * @param {PWSTR} pwszDriver A pointer to a null-terminated character string that specifies either DISPLAY or the name of a specific display device. For printing, we recommend that you pass <b>NULL</b> to <i>lpszDriver</i> because GDI ignores <i>lpszDriver</i> for printer devices.
     * @param {PWSTR} pwszDevice A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The <i>lpszDevice</i> parameter must be used.
     * 
     * To obtain valid names for displays, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>.
     * 
     * If <i>lpszDriver</i> is DISPLAY or the device name of a specific display device, then <i>lpszDevice</i> must be <b>NULL</b> or that same device name. If <i>lpszDevice</i> is <b>NULL</b>, then a DC is created for the primary display device.
     * 
     * If there are multiple monitors on the system, calling <c>CreateDC(TEXT("DISPLAY"),NULL,NULL,NULL)</c> will create a DC covering all the monitors.
     * @param {PWSTR} pszPort This parameter is ignored and should be set to <b>NULL</b>. It is provided only for compatibility with 16-bit Windows.
     * @param {Pointer<DEVMODEW>} pdm A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure containing device-specific initialization data for the device driver. The <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> function retrieves this structure filled in for a specified device. The <i>pdm</i> parameter must be <b>NULL</b> if the device driver is to use the default initialization (if any) specified by the user.
     * 
     * If <i>lpszDriver</i> is DISPLAY, <i>pdm</i> must be <b>NULL</b>; GDI then uses the display device's current <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * @returns {HDC} If the function succeeds, the return value is the handle to a DC for the specified device.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createdcw
     * @since windows5.0
     */
    static CreateDCW(pwszDriver, pwszDevice, pszPort, pdm) {
        pwszDriver := pwszDriver is String ? StrPtr(pwszDriver) : pwszDriver
        pwszDevice := pwszDevice is String ? StrPtr(pwszDevice) : pwszDevice
        pszPort := pszPort is String ? StrPtr(pszPort) : pszPort

        result := DllCall("GDI32.dll\CreateDCW", "ptr", pwszDriver, "ptr", pwszDevice, "ptr", pszPort, "ptr", pdm, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreateDIBitmap function creates a compatible bitmap (DDB) from a DIB and, optionally, sets the bitmap bits.
     * @param {HDC} hdc A handle to a device context.
     * @param {Pointer<BITMAPINFOHEADER>} pbmih A pointer to a bitmap information header structure, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapv5header">BITMAPV5HEADER</a>.
     * 
     * If <i>fdwInit</i> is CBM_INIT, the function uses the bitmap information header structure to obtain the desired width and height of the bitmap as well as other information. Note that a positive value for the height indicates a bottom-up DIB while a negative value for the height indicates a top-down DIB. Calling <b>CreateDIBitmap</b> with <i>fdwInit</i> as CBM_INIT is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createcompatiblebitmap">CreateCompatibleBitmap</a> function to create a DDB in the format of the device and then calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-setdibits">SetDIBits</a> function to translate the DIB bits to the DDB.
     * @param {Integer} flInit Specifies how the system initializes the bitmap bits. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBM_INIT"></a><a id="cbm_init"></a><dl>
     * <dt><b>CBM_INIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the system uses the data pointed to by the <i>lpbInit</i> and <i>lpbmi</i> parameters to initialize the bitmap bits.
     * 
     * If this flag is clear, the data pointed to by those parameters is not used.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>fdwInit</i> is zero, the system does not initialize the bitmap bits.
     * @param {Pointer<Void>} pjBits A pointer to an array of bytes containing the initial bitmap data. The format of the data depends on the <b>biBitCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure to which the <i>lpbmi</i> parameter points.
     * @param {Pointer<BITMAPINFO>} pbmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure that describes the dimensions and color format of the array pointed to by the <i>lpbInit</i> parameter.
     * @param {Integer} iUsage 
     * @returns {HBITMAP} If the function succeeds, the return value is a handle to the compatible bitmap.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createdibitmap
     * @since windows5.0
     */
    static CreateDIBitmap(hdc, pbmih, flInit, pjBits, pbmi, iUsage) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pjBitsMarshal := pjBits is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\CreateDIBitmap", "ptr", hdc, "ptr", pbmih, "uint", flInit, pjBitsMarshal, pjBits, "ptr", pbmi, "uint", iUsage, "ptr")
        return HBITMAP({Value: result}, True)
    }

    /**
     * The CreateDIBPatternBrush function creates a logical brush that has the pattern specified by the specified device-independent bitmap (DIB).
     * @param {HGLOBAL} h A handle to a global memory object containing a packed DIB, which consists of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure immediately followed by an array of bytes defining the pixels of the bitmap.
     * @param {Integer} iUsage 
     * @returns {HBRUSH} If the function succeeds, the return value identifies a logical brush.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createdibpatternbrush
     * @since windows5.0
     */
    static CreateDIBPatternBrush(h, iUsage) {
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\CreateDIBPatternBrush", "ptr", h, "uint", iUsage, "ptr")
        return HBRUSH({Value: result}, True)
    }

    /**
     * The CreateDIBPatternBrushPt function creates a logical brush that has the pattern specified by the device-independent bitmap (DIB).
     * @param {Pointer<Void>} lpPackedDIB A pointer to a packed DIB consisting of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure immediately followed by an array of bytes defining the pixels of the bitmap.
     * @param {Integer} iUsage 
     * @returns {HBRUSH} If the function succeeds, the return value identifies a logical brush.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createdibpatternbrushpt
     * @since windows5.0
     */
    static CreateDIBPatternBrushPt(lpPackedDIB, iUsage) {
        lpPackedDIBMarshal := lpPackedDIB is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\CreateDIBPatternBrushPt", lpPackedDIBMarshal, lpPackedDIB, "uint", iUsage, "ptr")
        return HBRUSH({Value: result}, True)
    }

    /**
     * The CreateEllipticRgn function creates an elliptical region.
     * @param {Integer} x1 Specifies the x-coordinate in logical units, of the upper-left corner of the bounding rectangle of the ellipse.
     * @param {Integer} y1 Specifies the y-coordinate in logical units, of the upper-left corner of the bounding rectangle of the ellipse.
     * @param {Integer} x2 Specifies the x-coordinate in logical units, of the lower-right corner of the bounding rectangle of the ellipse.
     * @param {Integer} y2 Specifies the y-coordinate in logical units, of the lower-right corner of the bounding rectangle of the ellipse.
     * @returns {HRGN} If the function succeeds, the return value is the handle to the region.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createellipticrgn
     * @since windows5.0
     */
    static CreateEllipticRgn(x1, y1, x2, y2) {
        result := DllCall("GDI32.dll\CreateEllipticRgn", "int", x1, "int", y1, "int", x2, "int", y2, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The CreateEllipticRgnIndirect function creates an elliptical region.
     * @param {Pointer<RECT>} lprect Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the coordinates of the upper-left and lower-right corners of the bounding rectangle of the ellipse in logical units.
     * @returns {HRGN} If the function succeeds, the return value is the handle to the region.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createellipticrgnindirect
     * @since windows5.0
     */
    static CreateEllipticRgnIndirect(lprect) {
        result := DllCall("GDI32.dll\CreateEllipticRgnIndirect", "ptr", lprect, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The CreateFontIndirect function creates a logical font that has the specified characteristics. The font can subsequently be selected as the current font for any device context.
     * @param {Pointer<LOGFONTA>} lplf A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that defines the characteristics of the logical font.
     * @returns {HFONT} If the function succeeds, the return value is a handle to a logical font.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createfontindirecta
     * @since windows5.0
     */
    static CreateFontIndirectA(lplf) {
        result := DllCall("GDI32.dll\CreateFontIndirectA", "ptr", lplf, "ptr")
        return HFONT({Value: result}, True)
    }

    /**
     * The CreateFontIndirect function creates a logical font that has the specified characteristics. The font can subsequently be selected as the current font for any device context.
     * @param {Pointer<LOGFONTW>} lplf A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that defines the characteristics of the logical font.
     * @returns {HFONT} If the function succeeds, the return value is a handle to a logical font.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createfontindirectw
     * @since windows5.0
     */
    static CreateFontIndirectW(lplf) {
        result := DllCall("GDI32.dll\CreateFontIndirectW", "ptr", lplf, "ptr")
        return HFONT({Value: result}, True)
    }

    /**
     * The CreateFont function creates a logical font with the specified characteristics. The logical font can subsequently be selected as the font for any device.
     * @param {Integer} cHeight The height, in logical units, of the font's character cell or character. The character height value (also known as the em height) is the character cell height value minus the internal-leading value. The font mapper interprets the value specified in <i>nHeight</i> in the following manner.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>&gt; 0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font mapper transforms this value into device units and matches it against the cell height of the available fonts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font mapper uses a default height value when it searches for a match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>&lt; 0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font mapper transforms this value into device units and matches its absolute value against the character height of the available fonts.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For all height comparisons, the font mapper looks for the largest font that does not exceed the requested size.
     * 
     * This mapping occurs when the font is used for the first time.
     * 
     * For the MM_TEXT mapping mode, you can use the following formula to specify a height for a font with a specified point size:
     * 
     * 
     * ```cpp
     * 
     * nHeight = -MulDiv(PointSize, GetDeviceCaps(hDC, LOGPIXELSY), 72);
     * 
     * ```
     * @param {Integer} cWidth The average width, in logical units, of characters in the requested font. If this value is zero, the font mapper chooses a closest match value. The closest match value is determined by comparing the absolute values of the difference between the current device's aspect ratio and the digitized aspect ratio of available fonts.
     * @param {Integer} cEscapement The angle, in tenths of degrees, between the escapement vector and the x-axis of the device. The escapement vector is parallel to the base line of a row of text.
     * 
     * When the graphics mode is set to GM_ADVANCED, you can specify the escapement angle of the string independently of the orientation angle of the string's characters.
     * 
     * When the graphics mode is set to GM_COMPATIBLE, <i>nEscapement</i> specifies both the escapement and orientation. You should set <i>nEscapement</i> and <i>nOrientation</i> to the same value.
     * @param {Integer} cOrientation The angle, in tenths of degrees, between each character's base line and the x-axis of the device.
     * @param {Integer} cWeight The weight of the font in the range 0 through 1000. For example, 400 is normal and 700 is bold. If this value is zero, a default weight is used.
     * 
     * The following values are defined for convenience.
     * 
     * <table>
     * <tr>
     * <th>Weight</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_DONTCARE"></a><a id="fw_dontcare"></a><dl>
     * <dt><b>FW_DONTCARE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_THIN"></a><a id="fw_thin"></a><dl>
     * <dt><b>FW_THIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 100
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_EXTRALIGHT"></a><a id="fw_extralight"></a><dl>
     * <dt><b>FW_EXTRALIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 200
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_ULTRALIGHT"></a><a id="fw_ultralight"></a><dl>
     * <dt><b>FW_ULTRALIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 200
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_LIGHT"></a><a id="fw_light"></a><dl>
     * <dt><b>FW_LIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 300
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_NORMAL"></a><a id="fw_normal"></a><dl>
     * <dt><b>FW_NORMAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 400
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_REGULAR"></a><a id="fw_regular"></a><dl>
     * <dt><b>FW_REGULAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 400
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_MEDIUM"></a><a id="fw_medium"></a><dl>
     * <dt><b>FW_MEDIUM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 500
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_SEMIBOLD"></a><a id="fw_semibold"></a><dl>
     * <dt><b>FW_SEMIBOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_DEMIBOLD"></a><a id="fw_demibold"></a><dl>
     * <dt><b>FW_DEMIBOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_BOLD"></a><a id="fw_bold"></a><dl>
     * <dt><b>FW_BOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 700
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_EXTRABOLD"></a><a id="fw_extrabold"></a><dl>
     * <dt><b>FW_EXTRABOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 800
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_ULTRABOLD"></a><a id="fw_ultrabold"></a><dl>
     * <dt><b>FW_ULTRABOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 800
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_HEAVY"></a><a id="fw_heavy"></a><dl>
     * <dt><b>FW_HEAVY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 900
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_BLACK"></a><a id="fw_black"></a><dl>
     * <dt><b>FW_BLACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 900
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} bItalic Specifies an italic font if set to <b>TRUE</b>.
     * @param {Integer} bUnderline Specifies an underlined font if set to <b>TRUE</b>.
     * @param {Integer} bStrikeOut A strikeout font if set to <b>TRUE</b>.
     * @param {Integer} iCharSet The character set. The following values are predefined:
     * 
     * <ul>
     * <li>ANSI_CHARSET</li>
     * <li>BALTIC_CHARSET</li>
     * <li>CHINESEBIG5_CHARSET</li>
     * <li>DEFAULT_CHARSET</li>
     * <li>EASTEUROPE_CHARSET</li>
     * <li>GB2312_CHARSET</li>
     * <li>GREEK_CHARSET</li>
     * <li>HANGUL_CHARSET</li>
     * <li>MAC_CHARSET</li>
     * <li>OEM_CHARSET</li>
     * <li>RUSSIAN_CHARSET</li>
     * <li>SHIFTJIS_CHARSET</li>
     * <li>SYMBOL_CHARSET</li>
     * <li>TURKISH_CHARSET</li>
     * <li>VIETNAMESE_CHARSET</li>
     * </ul>
     * Korean language edition of Windows:
     *             
     * 
     * <ul>
     * <li>JOHAB_CHARSET</li>
     * </ul>
     * Middle East language edition of Windows:
     *             
     * 
     * <ul>
     * <li>ARABIC_CHARSET</li>
     * <li>HEBREW_CHARSET</li>
     * </ul>
     * Thai language edition of Windows:
     *             
     * 
     * <ul>
     * <li>THAI_CHARSET</li>
     * </ul>
     * The OEM_CHARSET value specifies a character set that is operating-system dependent.
     * 
     * DEFAULT_CHARSET is set to a value based on the current system locale. For example, when the system locale is English (United States), it is set as ANSI_CHARSET.
     * 
     * Fonts with other character sets may exist in the operating system. If an application uses a font with an unknown character set, it should not attempt to translate or interpret strings that are rendered with that font.
     * 
     * To ensure consistent results when creating a font, do not specify OEM_CHARSET or DEFAULT_CHARSET. If you specify a typeface name in the <i>lpszFace</i> parameter, make sure that the <i>fdwCharSet</i> value matches the character set of the typeface specified in <i>lpszFace</i>.
     * @param {Integer} iOutPrecision 
     * @param {Integer} iClipPrecision 
     * @param {Integer} iQuality 
     * @param {Integer} iPitchAndFamily 
     * @param {PSTR} pszFaceName A pointer to a null-terminated string that specifies the typeface name of the font. The length of this string must not exceed 32 characters, including the terminating null character. The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesa">EnumFontFamilies</a> function can be used to enumerate the typeface names of all currently available fonts. For more information, see the Remarks.
     * 
     * If <i>lpszFace</i> is <b>NULL</b> or empty string, GDI uses the first font that matches the other specified attributes.
     * @returns {HFONT} If the function succeeds, the return value is a handle to a logical font.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createfonta
     * @since windows5.0
     */
    static CreateFontA(cHeight, cWidth, cEscapement, cOrientation, cWeight, bItalic, bUnderline, bStrikeOut, iCharSet, iOutPrecision, iClipPrecision, iQuality, iPitchAndFamily, pszFaceName) {
        pszFaceName := pszFaceName is String ? StrPtr(pszFaceName) : pszFaceName

        result := DllCall("GDI32.dll\CreateFontA", "int", cHeight, "int", cWidth, "int", cEscapement, "int", cOrientation, "int", cWeight, "uint", bItalic, "uint", bUnderline, "uint", bStrikeOut, "uint", iCharSet, "uint", iOutPrecision, "uint", iClipPrecision, "uint", iQuality, "uint", iPitchAndFamily, "ptr", pszFaceName, "ptr")
        return HFONT({Value: result}, True)
    }

    /**
     * The CreateFont function creates a logical font with the specified characteristics. The logical font can subsequently be selected as the font for any device.
     * @param {Integer} cHeight The height, in logical units, of the font's character cell or character. The character height value (also known as the em height) is the character cell height value minus the internal-leading value. The font mapper interprets the value specified in <i>nHeight</i> in the following manner.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>&gt; 0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font mapper transforms this value into device units and matches it against the cell height of the available fonts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font mapper uses a default height value when it searches for a match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>&lt; 0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font mapper transforms this value into device units and matches its absolute value against the character height of the available fonts.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For all height comparisons, the font mapper looks for the largest font that does not exceed the requested size.
     * 
     * This mapping occurs when the font is used for the first time.
     * 
     * For the MM_TEXT mapping mode, you can use the following formula to specify a height for a font with a specified point size:
     * 
     * 
     * ```cpp
     * 
     * nHeight = -MulDiv(PointSize, GetDeviceCaps(hDC, LOGPIXELSY), 72);
     * 
     * ```
     * @param {Integer} cWidth The average width, in logical units, of characters in the requested font. If this value is zero, the font mapper chooses a closest match value. The closest match value is determined by comparing the absolute values of the difference between the current device's aspect ratio and the digitized aspect ratio of available fonts.
     * @param {Integer} cEscapement The angle, in tenths of degrees, between the escapement vector and the x-axis of the device. The escapement vector is parallel to the base line of a row of text.
     * 
     * When the graphics mode is set to GM_ADVANCED, you can specify the escapement angle of the string independently of the orientation angle of the string's characters.
     * 
     * When the graphics mode is set to GM_COMPATIBLE, <i>nEscapement</i> specifies both the escapement and orientation. You should set <i>nEscapement</i> and <i>nOrientation</i> to the same value.
     * @param {Integer} cOrientation The angle, in tenths of degrees, between each character's base line and the x-axis of the device.
     * @param {Integer} cWeight The weight of the font in the range 0 through 1000. For example, 400 is normal and 700 is bold. If this value is zero, a default weight is used.
     * 
     * The following values are defined for convenience.
     * 
     * <table>
     * <tr>
     * <th>Weight</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_DONTCARE"></a><a id="fw_dontcare"></a><dl>
     * <dt><b>FW_DONTCARE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_THIN"></a><a id="fw_thin"></a><dl>
     * <dt><b>FW_THIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 100
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_EXTRALIGHT"></a><a id="fw_extralight"></a><dl>
     * <dt><b>FW_EXTRALIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 200
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_ULTRALIGHT"></a><a id="fw_ultralight"></a><dl>
     * <dt><b>FW_ULTRALIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 200
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_LIGHT"></a><a id="fw_light"></a><dl>
     * <dt><b>FW_LIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 300
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_NORMAL"></a><a id="fw_normal"></a><dl>
     * <dt><b>FW_NORMAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 400
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_REGULAR"></a><a id="fw_regular"></a><dl>
     * <dt><b>FW_REGULAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 400
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_MEDIUM"></a><a id="fw_medium"></a><dl>
     * <dt><b>FW_MEDIUM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 500
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_SEMIBOLD"></a><a id="fw_semibold"></a><dl>
     * <dt><b>FW_SEMIBOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_DEMIBOLD"></a><a id="fw_demibold"></a><dl>
     * <dt><b>FW_DEMIBOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_BOLD"></a><a id="fw_bold"></a><dl>
     * <dt><b>FW_BOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 700
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_EXTRABOLD"></a><a id="fw_extrabold"></a><dl>
     * <dt><b>FW_EXTRABOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 800
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_ULTRABOLD"></a><a id="fw_ultrabold"></a><dl>
     * <dt><b>FW_ULTRABOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 800
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_HEAVY"></a><a id="fw_heavy"></a><dl>
     * <dt><b>FW_HEAVY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 900
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FW_BLACK"></a><a id="fw_black"></a><dl>
     * <dt><b>FW_BLACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 900
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} bItalic Specifies an italic font if set to <b>TRUE</b>.
     * @param {Integer} bUnderline Specifies an underlined font if set to <b>TRUE</b>.
     * @param {Integer} bStrikeOut A strikeout font if set to <b>TRUE</b>.
     * @param {Integer} iCharSet The character set. The following values are predefined:
     * 
     * <ul>
     * <li>ANSI_CHARSET</li>
     * <li>BALTIC_CHARSET</li>
     * <li>CHINESEBIG5_CHARSET</li>
     * <li>DEFAULT_CHARSET</li>
     * <li>EASTEUROPE_CHARSET</li>
     * <li>GB2312_CHARSET</li>
     * <li>GREEK_CHARSET</li>
     * <li>HANGUL_CHARSET</li>
     * <li>MAC_CHARSET</li>
     * <li>OEM_CHARSET</li>
     * <li>RUSSIAN_CHARSET</li>
     * <li>SHIFTJIS_CHARSET</li>
     * <li>SYMBOL_CHARSET</li>
     * <li>TURKISH_CHARSET</li>
     * <li>VIETNAMESE_CHARSET</li>
     * </ul>
     * Korean language edition of Windows:
     *             
     * 
     * <ul>
     * <li>JOHAB_CHARSET</li>
     * </ul>
     * Middle East language edition of Windows:
     *             
     * 
     * <ul>
     * <li>ARABIC_CHARSET</li>
     * <li>HEBREW_CHARSET</li>
     * </ul>
     * Thai language edition of Windows:
     *             
     * 
     * <ul>
     * <li>THAI_CHARSET</li>
     * </ul>
     * The OEM_CHARSET value specifies a character set that is operating-system dependent.
     * 
     * DEFAULT_CHARSET is set to a value based on the current system locale. For example, when the system locale is English (United States), it is set as ANSI_CHARSET.
     * 
     * Fonts with other character sets may exist in the operating system. If an application uses a font with an unknown character set, it should not attempt to translate or interpret strings that are rendered with that font.
     * 
     * To ensure consistent results when creating a font, do not specify OEM_CHARSET or DEFAULT_CHARSET. If you specify a typeface name in the <i>lpszFace</i> parameter, make sure that the <i>fdwCharSet</i> value matches the character set of the typeface specified in <i>lpszFace</i>.
     * @param {Integer} iOutPrecision 
     * @param {Integer} iClipPrecision 
     * @param {Integer} iQuality 
     * @param {Integer} iPitchAndFamily 
     * @param {PWSTR} pszFaceName A pointer to a null-terminated string that specifies the typeface name of the font. The length of this string must not exceed 32 characters, including the terminating null character. The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesa">EnumFontFamilies</a> function can be used to enumerate the typeface names of all currently available fonts. For more information, see the Remarks.
     * 
     * If <i>lpszFace</i> is <b>NULL</b> or empty string, GDI uses the first font that matches the other specified attributes.
     * @returns {HFONT} If the function succeeds, the return value is a handle to a logical font.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createfontw
     * @since windows5.0
     */
    static CreateFontW(cHeight, cWidth, cEscapement, cOrientation, cWeight, bItalic, bUnderline, bStrikeOut, iCharSet, iOutPrecision, iClipPrecision, iQuality, iPitchAndFamily, pszFaceName) {
        pszFaceName := pszFaceName is String ? StrPtr(pszFaceName) : pszFaceName

        result := DllCall("GDI32.dll\CreateFontW", "int", cHeight, "int", cWidth, "int", cEscapement, "int", cOrientation, "int", cWeight, "uint", bItalic, "uint", bUnderline, "uint", bStrikeOut, "uint", iCharSet, "uint", iOutPrecision, "uint", iClipPrecision, "uint", iQuality, "uint", iPitchAndFamily, "ptr", pszFaceName, "ptr")
        return HFONT({Value: result}, True)
    }

    /**
     * The CreateHatchBrush function creates a logical brush that has the specified hatch pattern and color.
     * @param {Integer} iHatch 
     * @param {COLORREF} color The foreground color of the brush that is used for the hatches. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {HBRUSH} If the function succeeds, the return value identifies a logical brush.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createhatchbrush
     * @since windows5.0
     */
    static CreateHatchBrush(iHatch, color) {
        result := DllCall("GDI32.dll\CreateHatchBrush", "int", iHatch, "uint", color, "ptr")
        return HBRUSH({Value: result}, True)
    }

    /**
     * The CreateIC function creates an information context for the specified device.
     * @param {PSTR} pszDriver A pointer to a null-terminated character string that specifies the name of the device driver (for example, Epson).
     * @param {PSTR} pszDevice A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The <i>lpszDevice</i> parameter must be used.
     * @param {PSTR} pszPort This parameter is ignored and should be set to <b>NULL</b>. It is provided only for compatibility with 16-bit Windows.
     * @param {Pointer<DEVMODEA>} pdm A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure containing device-specific initialization data for the device driver. The <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> function retrieves this structure filled in for a specified device. The <i>lpdvmInit</i> parameter must be <b>NULL</b> if the device driver is to use the default initialization (if any) specified by the user.
     * @returns {HDC} If the function succeeds, the return value is the handle to an information context.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createica
     * @since windows5.0
     */
    static CreateICA(pszDriver, pszDevice, pszPort, pdm) {
        pszDriver := pszDriver is String ? StrPtr(pszDriver) : pszDriver
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice
        pszPort := pszPort is String ? StrPtr(pszPort) : pszPort

        result := DllCall("GDI32.dll\CreateICA", "ptr", pszDriver, "ptr", pszDevice, "ptr", pszPort, "ptr", pdm, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreateIC function creates an information context for the specified device.
     * @param {PWSTR} pszDriver A pointer to a null-terminated character string that specifies the name of the device driver (for example, Epson).
     * @param {PWSTR} pszDevice A pointer to a null-terminated character string that specifies the name of the specific output device being used, as shown by the Print Manager (for example, Epson FX-80). It is not the printer model name. The <i>lpszDevice</i> parameter must be used.
     * @param {PWSTR} pszPort This parameter is ignored and should be set to <b>NULL</b>. It is provided only for compatibility with 16-bit Windows.
     * @param {Pointer<DEVMODEW>} pdm A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure containing device-specific initialization data for the device driver. The <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> function retrieves this structure filled in for a specified device. The <i>lpdvmInit</i> parameter must be <b>NULL</b> if the device driver is to use the default initialization (if any) specified by the user.
     * @returns {HDC} If the function succeeds, the return value is the handle to an information context.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createicw
     * @since windows5.0
     */
    static CreateICW(pszDriver, pszDevice, pszPort, pdm) {
        pszDriver := pszDriver is String ? StrPtr(pszDriver) : pszDriver
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice
        pszPort := pszPort is String ? StrPtr(pszPort) : pszPort

        result := DllCall("GDI32.dll\CreateICW", "ptr", pszDriver, "ptr", pszDevice, "ptr", pszPort, "ptr", pdm, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreateMetaFile function creates a device context for a Windows-format metafile.
     * @param {PSTR} pszFile A pointer to the file name for the Windows-format metafile to be created. If this parameter is <b>NULL</b>, the Windows-format metafile is memory based and its contents are lost when it is deleted by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletemetafile">DeleteMetaFile</a> function.
     * @returns {HDC} If the function succeeds, the return value is a handle to the device context for the Windows-format metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createmetafilea
     * @since windows5.0
     */
    static CreateMetaFileA(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := DllCall("GDI32.dll\CreateMetaFileA", "ptr", pszFile, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreateMetaFile function creates a device context for a Windows-format metafile.
     * @param {PWSTR} pszFile A pointer to the file name for the Windows-format metafile to be created. If this parameter is <b>NULL</b>, the Windows-format metafile is memory based and its contents are lost when it is deleted by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletemetafile">DeleteMetaFile</a> function.
     * @returns {HDC} If the function succeeds, the return value is a handle to the device context for the Windows-format metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createmetafilew
     * @since windows5.0
     */
    static CreateMetaFileW(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := DllCall("GDI32.dll\CreateMetaFileW", "ptr", pszFile, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreatePalette function creates a logical palette.
     * @param {Pointer<LOGPALETTE>} plpal A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpalette">LOGPALETTE</a> structure that contains information about the colors in the logical palette.
     * @returns {HPALETTE} If the function succeeds, the return value is a handle to a logical palette.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpalette
     * @since windows5.0
     */
    static CreatePalette(plpal) {
        result := DllCall("GDI32.dll\CreatePalette", "ptr", plpal, "ptr")
        return HPALETTE({Value: result}, True)
    }

    /**
     * The CreatePen function creates a logical pen that has the specified style, width, and color. The pen can subsequently be selected into a device context and used to draw lines and curves.
     * @param {Integer} iStyle 
     * @param {Integer} cWidth The width of the pen, in logical units. If <i>nWidth</i> is zero, the pen is a single pixel wide, regardless of the current transformation.
     * 
     * <b>CreatePen</b> returns a pen with the specified width but with the PS_SOLID style if you specify a width greater than one for the following styles: PS_DASH, PS_DOT, PS_DASHDOT, PS_DASHDOTDOT.
     * @param {COLORREF} color A color reference for the pen color. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {HPEN} If the function succeeds, the return value is a handle that identifies a logical pen.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpen
     * @since windows5.0
     */
    static CreatePen(iStyle, cWidth, color) {
        result := DllCall("GDI32.dll\CreatePen", "int", iStyle, "int", cWidth, "uint", color, "ptr")
        return HPEN({Value: result}, True)
    }

    /**
     * The CreatePenIndirect function creates a logical cosmetic pen that has the style, width, and color specified in a structure.
     * @param {Pointer<LOGPEN>} plpen Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpen">LOGPEN</a> structure that specifies the pen's style, width, and color.
     * @returns {HPEN} If the function succeeds, the return value is a handle that identifies a logical cosmetic pen.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpenindirect
     * @since windows5.0
     */
    static CreatePenIndirect(plpen) {
        result := DllCall("GDI32.dll\CreatePenIndirect", "ptr", plpen, "ptr")
        return HPEN({Value: result}, True)
    }

    /**
     * The CreatePolyPolygonRgn function creates a region consisting of a series of polygons. The polygons can overlap.
     * @param {Pointer<POINT>} pptl A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that define the vertices of the polygons in logical units. The polygons are specified consecutively. Each polygon is presumed closed and each vertex is specified only once.
     * @param {Pointer<Integer>} pc A pointer to an array of integers, each of which specifies the number of points in one of the polygons in the array pointed to by <i>lppt</i>.
     * @param {Integer} cPoly The total number of integers in the array pointed to by <i>lpPolyCounts</i>.
     * @param {Integer} iMode 
     * @returns {HRGN} If the function succeeds, the return value is the handle to the region.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpolypolygonrgn
     * @since windows5.0
     */
    static CreatePolyPolygonRgn(pptl, pc, cPoly, iMode) {
        pcMarshal := pc is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\CreatePolyPolygonRgn", "ptr", pptl, pcMarshal, pc, "int", cPoly, "int", iMode, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The CreatePatternBrush function creates a logical brush with the specified bitmap pattern. The bitmap can be a DIB section bitmap, which is created by the CreateDIBSection function, or it can be a device-dependent bitmap.
     * @param {HBITMAP} hbm A handle to the bitmap to be used to create the logical brush.
     * @returns {HBRUSH} If the function succeeds, the return value identifies a logical brush.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpatternbrush
     * @since windows5.0
     */
    static CreatePatternBrush(hbm) {
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm

        result := DllCall("GDI32.dll\CreatePatternBrush", "ptr", hbm, "ptr")
        return HBRUSH({Value: result}, True)
    }

    /**
     * The CreateRectRgn function creates a rectangular region.
     * @param {Integer} x1 Specifies the x-coordinate of the upper-left corner of the region in logical units.
     * @param {Integer} y1 Specifies the y-coordinate of the upper-left corner of the region in logical units.
     * @param {Integer} x2 Specifies the x-coordinate of the lower-right corner of the region in logical units.
     * @param {Integer} y2 Specifies the y-coordinate of the lower-right corner of the region in logical units.
     * @returns {HRGN} If the function succeeds, the return value is the handle to the region.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createrectrgn
     * @since windows5.0
     */
    static CreateRectRgn(x1, y1, x2, y2) {
        result := DllCall("GDI32.dll\CreateRectRgn", "int", x1, "int", y1, "int", x2, "int", y2, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The CreateRectRgnIndirect function creates a rectangular region.
     * @param {Pointer<RECT>} lprect Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the coordinates of the upper-left and lower-right corners of the rectangle that defines the region in logical units.
     * @returns {HRGN} If the function succeeds, the return value is the handle to the region.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createrectrgnindirect
     * @since windows5.0
     */
    static CreateRectRgnIndirect(lprect) {
        result := DllCall("GDI32.dll\CreateRectRgnIndirect", "ptr", lprect, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The CreateRoundRectRgn function creates a rectangular region with rounded corners.
     * @param {Integer} x1 Specifies the x-coordinate of the upper-left corner of the region in device units.
     * @param {Integer} y1 Specifies the y-coordinate of the upper-left corner of the region in device units.
     * @param {Integer} x2 Specifies the x-coordinate of the lower-right corner of the region in device units.
     * @param {Integer} y2 Specifies the y-coordinate of the lower-right corner of the region in device units.
     * @param {Integer} w Specifies the width of the ellipse used to create the rounded corners in device units.
     * @param {Integer} h Specifies the height of the ellipse used to create the rounded corners in device units.
     * @returns {HRGN} If the function succeeds, the return value is the handle to the region.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createroundrectrgn
     * @since windows5.0
     */
    static CreateRoundRectRgn(x1, y1, x2, y2, w, h) {
        result := DllCall("GDI32.dll\CreateRoundRectRgn", "int", x1, "int", y1, "int", x2, "int", y2, "int", w, "int", h, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The CreateScalableFontResource function creates a font resource file for a scalable font.
     * @param {Integer} fdwHidden 
     * @param {PSTR} lpszFont A pointer to a null-terminated string specifying the name of the font resource file to create. If this parameter specifies an existing font resource file, the function fails.
     * @param {PSTR} lpszFile A pointer to a null-terminated string specifying the name of the scalable font file that this function uses to create the font resource file.
     * @param {PSTR} lpszPath A pointer to a null-terminated string specifying the path to the scalable font file.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * 
     * If <i>lpszFontRes</i> specifies an existing font file, <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_FILE_EXISTS
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createscalablefontresourcea
     * @since windows5.0
     */
    static CreateScalableFontResourceA(fdwHidden, lpszFont, lpszFile, lpszPath) {
        lpszFont := lpszFont is String ? StrPtr(lpszFont) : lpszFont
        lpszFile := lpszFile is String ? StrPtr(lpszFile) : lpszFile
        lpszPath := lpszPath is String ? StrPtr(lpszPath) : lpszPath

        A_LastError := 0

        result := DllCall("GDI32.dll\CreateScalableFontResourceA", "uint", fdwHidden, "ptr", lpszFont, "ptr", lpszFile, "ptr", lpszPath, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CreateScalableFontResource function creates a font resource file for a scalable font.
     * @param {Integer} fdwHidden 
     * @param {PWSTR} lpszFont A pointer to a null-terminated string specifying the name of the font resource file to create. If this parameter specifies an existing font resource file, the function fails.
     * @param {PWSTR} lpszFile A pointer to a null-terminated string specifying the name of the scalable font file that this function uses to create the font resource file.
     * @param {PWSTR} lpszPath A pointer to a null-terminated string specifying the path to the scalable font file.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * 
     * If <i>lpszFontRes</i> specifies an existing font file, <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_FILE_EXISTS
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createscalablefontresourcew
     * @since windows5.0
     */
    static CreateScalableFontResourceW(fdwHidden, lpszFont, lpszFile, lpszPath) {
        lpszFont := lpszFont is String ? StrPtr(lpszFont) : lpszFont
        lpszFile := lpszFile is String ? StrPtr(lpszFile) : lpszFile
        lpszPath := lpszPath is String ? StrPtr(lpszPath) : lpszPath

        A_LastError := 0

        result := DllCall("GDI32.dll\CreateScalableFontResourceW", "uint", fdwHidden, "ptr", lpszFont, "ptr", lpszFile, "ptr", lpszPath, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CreateSolidBrush function creates a logical brush that has the specified solid color.
     * @param {COLORREF} color The color of the brush. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {HBRUSH} If the function succeeds, the return value identifies a logical brush.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createsolidbrush
     * @since windows5.0
     */
    static CreateSolidBrush(color) {
        result := DllCall("GDI32.dll\CreateSolidBrush", "uint", color, "ptr")
        return HBRUSH({Value: result}, True)
    }

    /**
     * The DeleteDC function deletes the specified device context (DC).
     * @param {HDC} hdc A handle to the device context.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-deletedc
     * @since windows5.0
     */
    static DeleteDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\DeleteDC", "ptr", hdc, "int")
        return result
    }

    /**
     * The DeleteMetaFile function deletes a Windows-format metafile or Windows-format metafile handle.
     * @param {HMETAFILE} hmf A handle to a Windows-format metafile.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-deletemetafile
     * @since windows5.0
     */
    static DeleteMetaFile(hmf) {
        hmf := hmf is Win32Handle ? NumGet(hmf, "ptr") : hmf

        result := DllCall("GDI32.dll\DeleteMetaFile", "ptr", hmf, "int")
        return result
    }

    /**
     * The DeleteObject function deletes a logical pen, brush, font, bitmap, region, or palette, freeing all system resources associated with the object. After the object is deleted, the specified handle is no longer valid.
     * @param {HGDIOBJ} ho A handle to a logical pen, brush, font, bitmap, region, or palette.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the specified handle is not valid or is currently selected into a DC, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-deleteobject
     * @since windows5.0
     */
    static DeleteObject(ho) {
        ho := ho is Win32Handle ? NumGet(ho, "ptr") : ho

        result := DllCall("GDI32.dll\DeleteObject", "ptr", ho, "int")
        return result
    }

    /**
     * The DrawEscape function provides drawing capabilities of the specified video display that are not directly available through the graphics device interface (GDI).
     * @param {HDC} hdc A handle to the DC for the specified video display.
     * @param {Integer} iEscape The escape function to be performed.
     * @param {Integer} cjIn The number of bytes of data pointed to by the <i>lpszInData</i> parameter.
     * @param {Pointer} lpIn A pointer to the input structure required for the specified escape.
     * @returns {Integer} If the function is successful, the return value is greater than zero except for the QUERYESCSUPPORT draw escape, which checks for implementation only.
     * 
     * If the escape is not implemented, the return value is zero.
     * 
     * If an error occurred, the return value is less than zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-drawescape
     * @since windows5.0
     */
    static DrawEscape(hdc, iEscape, cjIn, lpIn) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\DrawEscape", "ptr", hdc, "int", iEscape, "int", cjIn, "ptr", lpIn, "int")
        return result
    }

    /**
     * The Ellipse function draws an ellipse. The center of the ellipse is the center of the specified bounding rectangle. The ellipse is outlined by using the current pen and is filled by using the current brush.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} left The x-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
     * @param {Integer} top The y-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
     * @param {Integer} right The x-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
     * @param {Integer} bottom The y-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-ellipse
     * @since windows6.1
     */
    static Ellipse(hdc, left, top, right, bottom) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Ellipse", "ptr", hdc, "int", left, "int", top, "int", right, "int", bottom, "int")
        return result
    }

    /**
     * The EnumFontFamiliesEx function enumerates all uniquely-named fonts in the system that match the font characteristics specified by the LOGFONT structure. EnumFontFamiliesEx enumerates fonts based on typeface name, character set, or both.
     * @param {HDC} hdc A handle to the device context from which to enumerate the fonts.
     * @param {Pointer<LOGFONTA>} lpLogfont A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the fonts to enumerate. The function examines the following members.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>lfCharSet</b></td>
     * <td>If set to DEFAULT_CHARSET, the function enumerates all uniquely-named fonts in all character sets. (If there are two fonts with the same name, only one is enumerated.) If set to a valid character set value, the function enumerates only fonts in the specified character set.</td>
     * </tr>
     * <tr>
     * <td><b>lfFaceName</b></td>
     * <td>If set to an empty string, the function enumerates one font in each available typeface name. If set to a valid typeface name, the function enumerates all fonts with the specified name.</td>
     * </tr>
     * <tr>
     * <td><b>lfPitchAndFamily</b></td>
     * <td>Must be set to zero for all language versions of the operating system.</td>
     * </tr>
     * </table>
     * @param {Pointer<FONTENUMPROCA>} lpProc A pointer to the application defined callback function. For more information, see the <a href="https://docs.microsoft.com/previous-versions/dd162618(v=vs.85)">EnumFontFamExProc</a> function.
     * @param {LPARAM} lParam An application defined value. The function passes this value to the callback function along with font information.
     * @param {Integer} dwFlags This parameter is not used and must be zero.
     * @returns {Integer} The return value is the last value returned by the callback function. This value depends on which font families are available for the specified device.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumfontfamiliesexa
     * @since windows5.0
     */
    static EnumFontFamiliesExA(hdc, lpLogfont, lpProc, lParam, dwFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EnumFontFamiliesExA", "ptr", hdc, "ptr", lpLogfont, "ptr", lpProc, "ptr", lParam, "uint", dwFlags, "int")
        return result
    }

    /**
     * The EnumFontFamiliesEx function enumerates all uniquely-named fonts in the system that match the font characteristics specified by the LOGFONT structure. EnumFontFamiliesEx enumerates fonts based on typeface name, character set, or both.
     * @param {HDC} hdc A handle to the device context from which to enumerate the fonts.
     * @param {Pointer<LOGFONTW>} lpLogfont A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the fonts to enumerate. The function examines the following members.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>lfCharSet</b></td>
     * <td>If set to DEFAULT_CHARSET, the function enumerates all uniquely-named fonts in all character sets. (If there are two fonts with the same name, only one is enumerated.) If set to a valid character set value, the function enumerates only fonts in the specified character set.</td>
     * </tr>
     * <tr>
     * <td><b>lfFaceName</b></td>
     * <td>If set to an empty string, the function enumerates one font in each available typeface name. If set to a valid typeface name, the function enumerates all fonts with the specified name.</td>
     * </tr>
     * <tr>
     * <td><b>lfPitchAndFamily</b></td>
     * <td>Must be set to zero for all language versions of the operating system.</td>
     * </tr>
     * </table>
     * @param {Pointer<FONTENUMPROCW>} lpProc A pointer to the application defined callback function. For more information, see the <a href="https://docs.microsoft.com/previous-versions/dd162618(v=vs.85)">EnumFontFamExProc</a> function.
     * @param {LPARAM} lParam An application defined value. The function passes this value to the callback function along with font information.
     * @param {Integer} dwFlags This parameter is not used and must be zero.
     * @returns {Integer} The return value is the last value returned by the callback function. This value depends on which font families are available for the specified device.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumfontfamiliesexw
     * @since windows5.0
     */
    static EnumFontFamiliesExW(hdc, lpLogfont, lpProc, lParam, dwFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EnumFontFamiliesExW", "ptr", hdc, "ptr", lpLogfont, "ptr", lpProc, "ptr", lParam, "uint", dwFlags, "int")
        return result
    }

    /**
     * The EnumFontFamilies function enumerates the fonts in a specified font family that are available on a specified device.
     * @param {HDC} hdc A handle to the device context from which to enumerate the fonts.
     * @param {PSTR} lpLogfont A pointer to a null-terminated string that specifies the family name of the desired fonts. If <i>lpszFamily</i> is <b>NULL</b>, <b>EnumFontFamilies</b> selects and enumerates one font of each available type family.
     * @param {Pointer<FONTENUMPROCA>} lpProc A pointer to the application defined callback function. For information, see <a href="https://docs.microsoft.com/previous-versions/dd162621(v=vs.85)">EnumFontFamProc</a>.
     * @param {LPARAM} lParam A pointer to application-supplied data. The data is passed to the callback function along with the font information.
     * @returns {Integer} The return value is the last value returned by the callback function. Its meaning is implementation specific.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumfontfamiliesa
     * @since windows5.0
     */
    static EnumFontFamiliesA(hdc, lpLogfont, lpProc, lParam) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpLogfont := lpLogfont is String ? StrPtr(lpLogfont) : lpLogfont

        result := DllCall("GDI32.dll\EnumFontFamiliesA", "ptr", hdc, "ptr", lpLogfont, "ptr", lpProc, "ptr", lParam, "int")
        return result
    }

    /**
     * The EnumFontFamilies function enumerates the fonts in a specified font family that are available on a specified device.
     * @param {HDC} hdc A handle to the device context from which to enumerate the fonts.
     * @param {PWSTR} lpLogfont A pointer to a null-terminated string that specifies the family name of the desired fonts. If <i>lpszFamily</i> is <b>NULL</b>, <b>EnumFontFamilies</b> selects and enumerates one font of each available type family.
     * @param {Pointer<FONTENUMPROCW>} lpProc A pointer to the application defined callback function. For information, see <a href="https://docs.microsoft.com/previous-versions/dd162621(v=vs.85)">EnumFontFamProc</a>.
     * @param {LPARAM} lParam A pointer to application-supplied data. The data is passed to the callback function along with the font information.
     * @returns {Integer} The return value is the last value returned by the callback function. Its meaning is implementation specific.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumfontfamiliesw
     * @since windows5.0
     */
    static EnumFontFamiliesW(hdc, lpLogfont, lpProc, lParam) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpLogfont := lpLogfont is String ? StrPtr(lpLogfont) : lpLogfont

        result := DllCall("GDI32.dll\EnumFontFamiliesW", "ptr", hdc, "ptr", lpLogfont, "ptr", lpProc, "ptr", lParam, "int")
        return result
    }

    /**
     * The EnumFonts function enumerates the fonts available on a specified device.
     * @param {HDC} hdc A handle to the device context from which to enumerate the fonts.
     * @param {PSTR} lpLogfont A pointer to a null-terminated string that specifies the typeface name of the desired fonts. If <i>lpFaceName</i> is <b>NULL</b>, <b>EnumFonts</b> randomly selects and enumerates one font of each available typeface.
     * @param {Pointer<FONTENUMPROCA>} lpProc A pointer to the application definedcallback function. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd162623(v=vs.85)">EnumFontsProc</a>.
     * @param {LPARAM} lParam A pointer to any application-defined data. The data is passed to the callback function along with the font information.
     * @returns {Integer} The return value is the last value returned by the callback function. Its meaning is defined by the application.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumfontsa
     * @since windows5.0
     */
    static EnumFontsA(hdc, lpLogfont, lpProc, lParam) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpLogfont := lpLogfont is String ? StrPtr(lpLogfont) : lpLogfont

        result := DllCall("GDI32.dll\EnumFontsA", "ptr", hdc, "ptr", lpLogfont, "ptr", lpProc, "ptr", lParam, "int")
        return result
    }

    /**
     * The EnumFonts function enumerates the fonts available on a specified device.
     * @param {HDC} hdc A handle to the device context from which to enumerate the fonts.
     * @param {PWSTR} lpLogfont A pointer to a null-terminated string that specifies the typeface name of the desired fonts. If <i>lpFaceName</i> is <b>NULL</b>, <b>EnumFonts</b> randomly selects and enumerates one font of each available typeface.
     * @param {Pointer<FONTENUMPROCW>} lpProc A pointer to the application definedcallback function. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd162623(v=vs.85)">EnumFontsProc</a>.
     * @param {LPARAM} lParam A pointer to any application-defined data. The data is passed to the callback function along with the font information.
     * @returns {Integer} The return value is the last value returned by the callback function. Its meaning is defined by the application.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumfontsw
     * @since windows5.0
     */
    static EnumFontsW(hdc, lpLogfont, lpProc, lParam) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpLogfont := lpLogfont is String ? StrPtr(lpLogfont) : lpLogfont

        result := DllCall("GDI32.dll\EnumFontsW", "ptr", hdc, "ptr", lpLogfont, "ptr", lpProc, "ptr", lParam, "int")
        return result
    }

    /**
     * The EnumObjects function enumerates the pens or brushes available for the specified device context (DC).
     * @param {HDC} hdc A handle to the DC.
     * @param {Integer} nType The object type. This parameter can be OBJ_BRUSH or OBJ_PEN.
     * @param {Pointer<GOBJENUMPROC>} lpFunc A pointer to the application-defined callback function. For more information about the callback function, see the <a href="https://docs.microsoft.com/previous-versions/dd162686(v=vs.85)">EnumObjectsProc</a> function.
     * @param {LPARAM} lParam A pointer to the application-defined data. The data is passed to the callback function along with the object information.
     * @returns {Integer} If the function succeeds, the return value is the last value returned by the callback function. Its meaning is user-defined.
     * 
     * If the objects cannot be enumerated (for example, there are too many objects), the function returns zero without calling the callback function.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumobjects
     * @since windows5.0
     */
    static EnumObjects(hdc, nType, lpFunc, lParam) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EnumObjects", "ptr", hdc, "int", nType, "ptr", lpFunc, "ptr", lParam, "int")
        return result
    }

    /**
     * The EqualRgn function checks the two specified regions to determine whether they are identical. The function considers two regions identical if they are equal in size and shape.
     * @param {HRGN} hrgn1 Handle to a region.
     * @param {HRGN} hrgn2 Handle to a region.
     * @returns {BOOL} If the two regions are equal, the return value is nonzero.
     * 
     * If the two regions are not equal, the return value is zero. A return value of ERROR means at least one of the region handles is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-equalrgn
     * @since windows5.0
     */
    static EqualRgn(hrgn1, hrgn2) {
        hrgn1 := hrgn1 is Win32Handle ? NumGet(hrgn1, "ptr") : hrgn1
        hrgn2 := hrgn2 is Win32Handle ? NumGet(hrgn2, "ptr") : hrgn2

        result := DllCall("GDI32.dll\EqualRgn", "ptr", hrgn1, "ptr", hrgn2, "int")
        return result
    }

    /**
     * The ExcludeClipRect function creates a new clipping region that consists of the existing clipping region minus the specified rectangle.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} left The x-coordinate, in logical units, of the upper-left corner of the rectangle.
     * @param {Integer} top The y-coordinate, in logical units, of the upper-left corner of the rectangle.
     * @param {Integer} right The x-coordinate, in logical units, of the lower-right corner of the rectangle.
     * @param {Integer} bottom The y-coordinate, in logical units, of the lower-right corner of the rectangle.
     * @returns {Integer} The return value specifies the new clipping region's complexity; it can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No region was created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-excludecliprect
     * @since windows5.0
     */
    static ExcludeClipRect(hdc, left, top, right, bottom) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ExcludeClipRect", "ptr", hdc, "int", left, "int", top, "int", right, "int", bottom, "int")
        return result
    }

    /**
     * The ExtCreateRegion function creates a region from the specified region and transformation data.
     * @param {Pointer<XFORM>} lpx A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure that defines the transformation to be performed on the region. If this pointer is <b>NULL</b>, the identity transformation is used.
     * @param {Integer} nCount The number of bytes pointed to by <i>lpRgnData</i>.
     * @param {Pointer} lpData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure that contains the region data in logical units.
     * @returns {HRGN} If the function succeeds, the return value is the value of the region.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-extcreateregion
     * @since windows5.0
     */
    static ExtCreateRegion(lpx, nCount, lpData) {
        result := DllCall("GDI32.dll\ExtCreateRegion", "ptr", lpx, "uint", nCount, "ptr", lpData, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The ExtFloodFill function fills an area of the display surface with the current brush.
     * @param {HDC} hdc A handle to a device context.
     * @param {Integer} x The x-coordinate, in logical units, of the point where filling is to start.
     * @param {Integer} y The y-coordinate, in logical units, of the point where filling is to start.
     * @param {COLORREF} color The color of the boundary or of the area to be filled. The interpretation of <i>color</i> depends on the value of the <i>fuFillType</i> parameter. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @param {Integer} type 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-extfloodfill
     * @since windows5.0
     */
    static ExtFloodFill(hdc, x, y, color, type) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ExtFloodFill", "ptr", hdc, "int", x, "int", y, "uint", color, "uint", type, "int")
        return result
    }

    /**
     * The FillRgn function fills a region by using the specified brush.
     * @param {HDC} hdc Handle to the device context.
     * @param {HRGN} hrgn Handle to the region to be filled. The region's coordinates are presumed to be in logical units.
     * @param {HBRUSH} hbr Handle to the brush to be used to fill the region.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-fillrgn
     * @since windows5.0
     */
    static FillRgn(hdc, hrgn, hbr) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn
        hbr := hbr is Win32Handle ? NumGet(hbr, "ptr") : hbr

        result := DllCall("GDI32.dll\FillRgn", "ptr", hdc, "ptr", hrgn, "ptr", hbr, "int")
        return result
    }

    /**
     * The FloodFill function fills an area of the display surface with the current brush. The area is assumed to be bounded as specified by the color parameter.
     * @param {HDC} hdc A handle to a device context.
     * @param {Integer} x The x-coordinate, in logical units, of the point where filling is to start.
     * @param {Integer} y The y-coordinate, in logical units, of the point where filling is to start.
     * @param {COLORREF} color The color of the boundary or the area to be filled. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-floodfill
     * @since windows5.0
     */
    static FloodFill(hdc, x, y, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\FloodFill", "ptr", hdc, "int", x, "int", y, "uint", color, "int")
        return result
    }

    /**
     * The FrameRgn function draws a border around the specified region by using the specified brush.
     * @param {HDC} hdc Handle to the device context.
     * @param {HRGN} hrgn Handle to the region to be enclosed in a border. The region's coordinates are presumed to be in logical units.
     * @param {HBRUSH} hbr Handle to the brush to be used to draw the border.
     * @param {Integer} w Specifies the width, in logical units, of vertical brush strokes.
     * @param {Integer} h Specifies the height, in logical units, of horizontal brush strokes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-framergn
     * @since windows5.0
     */
    static FrameRgn(hdc, hrgn, hbr, w, h) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn
        hbr := hbr is Win32Handle ? NumGet(hbr, "ptr") : hbr

        result := DllCall("GDI32.dll\FrameRgn", "ptr", hdc, "ptr", hrgn, "ptr", hbr, "int", w, "int", h, "int")
        return result
    }

    /**
     * The GetROP2 function retrieves the foreground mix mode of the specified device context. The mix mode specifies how the pen or interior color and the color already on the screen are combined to yield a new color.
     * @param {HDC} hdc Handle to the device context.
     * @returns {Integer} If the function succeeds, the return value specifies the foreground mix mode.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getrop2
     * @since windows5.0
     */
    static GetROP2(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetROP2", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetAspectRatioFilterEx function retrieves the setting for the current aspect-ratio filter.
     * @param {HDC} hdc Handle to a device context.
     * @param {Pointer<SIZE>} lpsize Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the current aspect-ratio filter.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getaspectratiofilterex
     * @since windows5.0
     */
    static GetAspectRatioFilterEx(hdc, lpsize) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetAspectRatioFilterEx", "ptr", hdc, "ptr", lpsize, "int")
        return result
    }

    /**
     * The GetBkColor function returns the current background color for the specified device context.
     * @param {HDC} hdc Handle to the device context whose background color is to be returned.
     * @returns {COLORREF} If the function succeeds, the return value is a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value for the current background color.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getbkcolor
     * @since windows5.0
     */
    static GetBkColor(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetBkColor", "ptr", hdc, "uint")
        return result
    }

    /**
     * The GetDCBrushColor function retrieves the current brush color for the specified device context (DC).
     * @param {HDC} hdc A handle to the DC whose brush color is to be returned.
     * @returns {COLORREF} If the function succeeds, the return value is the <a href="/windows/desktop/gdi/colorref">COLORREF</a> value for the current DC brush color.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdcbrushcolor
     * @since windows5.0
     */
    static GetDCBrushColor(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetDCBrushColor", "ptr", hdc, "uint")
        return result
    }

    /**
     * The GetDCPenColor function retrieves the current pen color for the specified device context (DC).
     * @param {HDC} hdc A handle to the DC whose brush color is to be returned.
     * @returns {COLORREF} If the function succeeds, the return value is a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value for the current DC pen color.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdcpencolor
     * @since windows5.0
     */
    static GetDCPenColor(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetDCPenColor", "ptr", hdc, "uint")
        return result
    }

    /**
     * The GetBkMode function returns the current background mix mode for a specified device context. The background mix mode of a device context affects text, hatched brushes, and pen styles that are not solid lines.
     * @param {HDC} hdc Handle to the device context whose background mode is to be returned.
     * @returns {Integer} If the function succeeds, the return value specifies the current background mix mode, either OPAQUE or TRANSPARENT.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getbkmode
     * @since windows5.0
     */
    static GetBkMode(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetBkMode", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetBitmapBits function copies the bitmap bits of a specified device-dependent bitmap into a buffer.
     * @param {HBITMAP} hbit A handle to the device-dependent bitmap.
     * @param {Integer} cb The number of bytes to copy from the bitmap into the buffer.
     * @param {Pointer} lpvBits A pointer to a buffer to receive the bitmap bits. The bits are stored as an array of byte values.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes copied to the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getbitmapbits
     * @since windows5.0
     */
    static GetBitmapBits(hbit, cb, lpvBits) {
        hbit := hbit is Win32Handle ? NumGet(hbit, "ptr") : hbit

        result := DllCall("GDI32.dll\GetBitmapBits", "ptr", hbit, "int", cb, "ptr", lpvBits, "int")
        return result
    }

    /**
     * The GetBitmapDimensionEx function retrieves the dimensions of a compatible bitmap. The retrieved dimensions must have been set by the SetBitmapDimensionEx function.
     * @param {HBITMAP} hbit A handle to a compatible bitmap (DDB).
     * @param {Pointer<SIZE>} lpsize A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure to receive the bitmap dimensions. For more information, see Remarks.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getbitmapdimensionex
     * @since windows5.0
     */
    static GetBitmapDimensionEx(hbit, lpsize) {
        hbit := hbit is Win32Handle ? NumGet(hbit, "ptr") : hbit

        result := DllCall("GDI32.dll\GetBitmapDimensionEx", "ptr", hbit, "ptr", lpsize, "int")
        return result
    }

    /**
     * The GetBoundsRect function obtains the current accumulated bounding rectangle for a specified device context.
     * @param {HDC} hdc A handle to the device context whose bounding rectangle the function will return.
     * @param {Pointer<RECT>} lprect A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that will receive the current bounding rectangle. The application's rectangle is returned in logical coordinates, and the bounding rectangle is returned in screen coordinates.
     * @param {Integer} flags Specifies how the <b>GetBoundsRect</b> function will behave. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DCB_RESET"></a><a id="dcb_reset"></a><dl>
     * <dt><b>DCB_RESET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Clears the bounding rectangle after returning it. If this flag is not set, the bounding rectangle will not be cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The return value specifies the state of the accumulated bounding rectangle; it can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>An error occurred. The specified device context handle is invalid.</td>
     * </tr>
     * <tr>
     * <td>DCB_DISABLE</td>
     * <td>Boundary accumulation is off.</td>
     * </tr>
     * <tr>
     * <td>DCB_ENABLE</td>
     * <td>Boundary accumulation is on.</td>
     * </tr>
     * <tr>
     * <td>DCB_RESET</td>
     * <td>The bounding rectangle is empty.</td>
     * </tr>
     * <tr>
     * <td>DCB_SET</td>
     * <td>The bounding rectangle is not empty.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getboundsrect
     * @since windows5.0
     */
    static GetBoundsRect(hdc, lprect, flags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetBoundsRect", "ptr", hdc, "ptr", lprect, "uint", flags, "uint")
        return result
    }

    /**
     * The GetBrushOrgEx function retrieves the current brush origin for the specified device context. This function replaces the GetBrushOrg function.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the brush origin, in device coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getbrushorgex
     * @since windows5.0
     */
    static GetBrushOrgEx(hdc, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetBrushOrgEx", "ptr", hdc, "ptr", lppt, "int")
        return result
    }

    /**
     * The GetCharWidth function retrieves the widths, in logical coordinates, of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iFirst The first character in the group of consecutive characters.
     * @param {Integer} iLast The last character in the group of consecutive characters, which must not precede the specified first character.
     * @param {Pointer<Integer>} lpBuffer A pointer to a buffer that receives the character widths, in logical coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharwidtha
     * @since windows5.0
     */
    static GetCharWidthA(hdc, iFirst, iLast, lpBuffer) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBufferMarshal := lpBuffer is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetCharWidthA", "ptr", hdc, "uint", iFirst, "uint", iLast, lpBufferMarshal, lpBuffer, "int")
        return result
    }

    /**
     * The GetCharWidth function retrieves the widths, in logical coordinates, of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iFirst The first character in the group of consecutive characters.
     * @param {Integer} iLast The last character in the group of consecutive characters, which must not precede the specified first character.
     * @param {Pointer<Integer>} lpBuffer A pointer to a buffer that receives the character widths, in logical coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharwidthw
     * @since windows5.0
     */
    static GetCharWidthW(hdc, iFirst, iLast, lpBuffer) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBufferMarshal := lpBuffer is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetCharWidthW", "ptr", hdc, "uint", iFirst, "uint", iLast, lpBufferMarshal, lpBuffer, "int")
        return result
    }

    /**
     * The GetCharWidth32 function retrieves the widths, in logical coordinates, of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iFirst The first character in the group of consecutive characters.
     * @param {Integer} iLast The last character in the group of consecutive characters, which must not precede the specified first character.
     * @param {Pointer<Integer>} lpBuffer A pointer to a buffer that receives the character widths, in logical coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharwidth32a
     * @since windows5.0
     */
    static GetCharWidth32A(hdc, iFirst, iLast, lpBuffer) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBufferMarshal := lpBuffer is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetCharWidth32A", "ptr", hdc, "uint", iFirst, "uint", iLast, lpBufferMarshal, lpBuffer, "int")
        return result
    }

    /**
     * The GetCharWidth32 function retrieves the widths, in logical coordinates, of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iFirst The first character in the group of consecutive characters.
     * @param {Integer} iLast The last character in the group of consecutive characters, which must not precede the specified first character.
     * @param {Pointer<Integer>} lpBuffer A pointer to a buffer that receives the character widths, in logical coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharwidth32w
     * @since windows5.0
     */
    static GetCharWidth32W(hdc, iFirst, iLast, lpBuffer) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBufferMarshal := lpBuffer is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetCharWidth32W", "ptr", hdc, "uint", iFirst, "uint", iLast, lpBufferMarshal, lpBuffer, "int")
        return result
    }

    /**
     * The GetCharWidthFloat function retrieves the fractional widths of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iFirst The code point of the first character in the group of consecutive characters.
     * @param {Integer} iLast The code point of the last character in the group of consecutive characters.
     * @param {Pointer<Float>} lpBuffer A pointer to a buffer that receives the character widths, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharwidthfloata
     * @since windows5.0
     */
    static GetCharWidthFloatA(hdc, iFirst, iLast, lpBuffer) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBufferMarshal := lpBuffer is VarRef ? "float*" : "ptr"

        result := DllCall("GDI32.dll\GetCharWidthFloatA", "ptr", hdc, "uint", iFirst, "uint", iLast, lpBufferMarshal, lpBuffer, "int")
        return result
    }

    /**
     * The GetCharWidthFloat function retrieves the fractional widths of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iFirst The code point of the first character in the group of consecutive characters.
     * @param {Integer} iLast The code point of the last character in the group of consecutive characters.
     * @param {Pointer<Float>} lpBuffer A pointer to a buffer that receives the character widths, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharwidthfloatw
     * @since windows5.0
     */
    static GetCharWidthFloatW(hdc, iFirst, iLast, lpBuffer) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBufferMarshal := lpBuffer is VarRef ? "float*" : "ptr"

        result := DllCall("GDI32.dll\GetCharWidthFloatW", "ptr", hdc, "uint", iFirst, "uint", iLast, lpBufferMarshal, lpBuffer, "int")
        return result
    }

    /**
     * The GetCharABCWidths function retrieves the widths, in logical units, of consecutive characters in a specified range from the current TrueType font. This function succeeds only with TrueType fonts.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} wFirst The first character in the group of consecutive characters from the current font.
     * @param {Integer} wLast The last character in the group of consecutive characters from the current font.
     * @param {Pointer<ABC>} lpABC A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-abc">ABC</a> structures that receives the character widths, in logical units. This array must contain at least as many <b>ABC</b> structures as there are characters in the range specified by the <i>uFirstChar</i> and <i>uLastChar</i> parameters.
     * @returns {BOOL} If the function succeeds, the return value is nonzero
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharabcwidthsa
     * @since windows5.0
     */
    static GetCharABCWidthsA(hdc, wFirst, wLast, lpABC) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetCharABCWidthsA", "ptr", hdc, "uint", wFirst, "uint", wLast, "ptr", lpABC, "int")
        return result
    }

    /**
     * The GetCharABCWidths function retrieves the widths, in logical units, of consecutive characters in a specified range from the current TrueType font. This function succeeds only with TrueType fonts.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} wFirst The first character in the group of consecutive characters from the current font.
     * @param {Integer} wLast The last character in the group of consecutive characters from the current font.
     * @param {Pointer<ABC>} lpABC A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-abc">ABC</a> structures that receives the character widths, in logical units. This array must contain at least as many <b>ABC</b> structures as there are characters in the range specified by the <i>uFirstChar</i> and <i>uLastChar</i> parameters.
     * @returns {BOOL} If the function succeeds, the return value is nonzero
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharabcwidthsw
     * @since windows5.0
     */
    static GetCharABCWidthsW(hdc, wFirst, wLast, lpABC) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetCharABCWidthsW", "ptr", hdc, "uint", wFirst, "uint", wLast, "ptr", lpABC, "int")
        return result
    }

    /**
     * The GetCharABCWidthsFloat function retrieves the widths, in logical units, of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc Handle to the device context.
     * @param {Integer} iFirst Specifies the code point of the first character in the group of consecutive characters where the ABC widths are seeked.
     * @param {Integer} iLast Specifies the code point of the last character in the group of consecutive characters where the ABC widths are seeked. This range is inclusive. An error is returned if the specified last character precedes the specified first character.
     * @param {Pointer<ABCFLOAT>} lpABC Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-abcfloat">ABCFLOAT</a> structures that receives the character widths, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharabcwidthsfloata
     * @since windows5.0
     */
    static GetCharABCWidthsFloatA(hdc, iFirst, iLast, lpABC) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetCharABCWidthsFloatA", "ptr", hdc, "uint", iFirst, "uint", iLast, "ptr", lpABC, "int")
        return result
    }

    /**
     * The GetCharABCWidthsFloat function retrieves the widths, in logical units, of consecutive characters in a specified range from the current font.
     * @param {HDC} hdc Handle to the device context.
     * @param {Integer} iFirst Specifies the code point of the first character in the group of consecutive characters where the ABC widths are seeked.
     * @param {Integer} iLast Specifies the code point of the last character in the group of consecutive characters where the ABC widths are seeked. This range is inclusive. An error is returned if the specified last character precedes the specified first character.
     * @param {Pointer<ABCFLOAT>} lpABC Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-abcfloat">ABCFLOAT</a> structures that receives the character widths, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharabcwidthsfloatw
     * @since windows5.0
     */
    static GetCharABCWidthsFloatW(hdc, iFirst, iLast, lpABC) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetCharABCWidthsFloatW", "ptr", hdc, "uint", iFirst, "uint", iLast, "ptr", lpABC, "int")
        return result
    }

    /**
     * The GetClipBox function retrieves the dimensions of the tightest bounding rectangle that can be drawn around the current visible area on the device.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<RECT>} lprect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that is to receive the rectangle dimensions, in logical units.
     * @returns {Integer} If the function succeeds, the return value specifies the clipping box's complexity and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>GetClipBox</b> returns logical coordinates based on the given device context.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getclipbox
     * @since windows5.0
     */
    static GetClipBox(hdc, lprect) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetClipBox", "ptr", hdc, "ptr", lprect, "int")
        return result
    }

    /**
     * The GetClipRgn function retrieves a handle identifying the current application-defined clipping region for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {HRGN} hrgn A handle to an existing region before the function is called. After the function returns, this parameter is a handle to a copy of the current clipping region.
     * @returns {Integer} If the function succeeds and there is no clipping region for the given device context, the return value is zero. If the function succeeds and there is a clipping region for the given device context, the return value is 1. If an error occurs, the return value is -1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcliprgn
     * @since windows5.0
     */
    static GetClipRgn(hdc, hrgn) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\GetClipRgn", "ptr", hdc, "ptr", hrgn, "int")
        return result
    }

    /**
     * The GetMetaRgn function retrieves the current metaregion for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {HRGN} hrgn A handle to an existing region before the function is called. After the function returns, this parameter is a handle to a copy of the current metaregion.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getmetargn
     * @since windows5.0
     */
    static GetMetaRgn(hdc, hrgn) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\GetMetaRgn", "ptr", hdc, "ptr", hrgn, "int")
        return result
    }

    /**
     * The GetCurrentObject function retrieves a handle to an object of the specified type that has been selected into the specified device context (DC).
     * @param {HDC} hdc A handle to the DC.
     * @param {Integer} type 
     * @returns {HGDIOBJ} If the function succeeds, the return value is a handle to the specified object.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcurrentobject
     * @since windows5.0
     */
    static GetCurrentObject(hdc, type) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetCurrentObject", "ptr", hdc, "uint", type, "ptr")
        return HGDIOBJ({Value: result}, True)
    }

    /**
     * The GetCurrentPositionEx function retrieves the current position in logical coordinates.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the logical coordinates of the current position.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcurrentpositionex
     * @since windows5.0
     */
    static GetCurrentPositionEx(hdc, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetCurrentPositionEx", "ptr", hdc, "ptr", lppt, "int")
        return result
    }

    /**
     * The GetDeviceCaps function retrieves device-specific information for the specified device.
     * @param {HDC} hdc A handle to the DC.
     * @param {Integer} index 
     * @returns {Integer} The return value specifies the value of the desired item.
     * 
     * When <i>nIndex</i> is BITSPIXEL and the device has 15bpp or 16bpp, the return value is 16.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdevicecaps
     * @since windows5.0
     */
    static GetDeviceCaps(hdc, index) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetDeviceCaps", "ptr", hdc, "int", index, "int")
        return result
    }

    /**
     * The GetDIBits function retrieves the bits of the specified compatible bitmap and copies them into a buffer as a DIB using the specified format.
     * @param {HDC} hdc A handle to the device context.
     * @param {HBITMAP} hbm A handle to the bitmap. This must be a compatible bitmap (DDB).
     * @param {Integer} start The first scan line to retrieve.
     * @param {Integer} cLines The number of scan lines to retrieve.
     * @param {Pointer<Void>} lpvBits A pointer to a buffer to receive the bitmap data. If this parameter is <b>NULL</b>, the function passes the dimensions and format of the bitmap to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure pointed to by the <i>lpbi</i> parameter.
     * @param {Pointer<BITMAPINFO>} lpbmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure that specifies the desired format for the DIB data.
     * @param {Integer} usage 
     * @returns {Integer} If the <i>lpvBits</i> parameter is non-<b>NULL</b> and the function succeeds, the return value is the number of scan lines copied from the bitmap.
     * 
     * If the <i>lpvBits</i> parameter is <b>NULL</b> and <b>GetDIBits</b> successfully fills the <a href="/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * 
     * This function can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdibits
     * @since windows5.0
     */
    static GetDIBits(hdc, hbm, start, cLines, lpvBits, lpbmi, usage) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm

        lpvBitsMarshal := lpvBits is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\GetDIBits", "ptr", hdc, "ptr", hbm, "uint", start, "uint", cLines, lpvBitsMarshal, lpvBits, "ptr", lpbmi, "uint", usage, "int")
        return result
    }

    /**
     * The GetFontData function retrieves font metric data for a TrueType font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} dwTable The name of a font metric table from which the font data is to be retrieved. This parameter can identify one of the metric tables documented in the TrueType Font Files specification published by Microsoft Corporation. If this parameter is zero, the information is retrieved starting at the beginning of the file for TrueType font files or from the beginning of the data for the currently selected font for TrueType Collection files. To retrieve the data from the beginning of the file for TrueType Collection files specify 'ttcf' (0x66637474).
     * @param {Integer} dwOffset The offset from the beginning of the font metric table to the location where the function should begin retrieving information. If this parameter is zero, the information is retrieved starting at the beginning of the table specified by the <i>dwTable</i> parameter. If this value is greater than or equal to the size of the table, an error occurs.
     * @param {Pointer} pvBuffer A pointer to a buffer that receives the font information. If this parameter is <b>NULL</b>, the function returns the size of the buffer required for the font data.
     * @param {Integer} cjBuffer The length, in bytes, of the information to be retrieved. If this parameter is zero, <b>GetFontData</b> returns the size of the data specified in the <i>dwTable</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes returned.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getfontdata
     * @since windows5.0
     */
    static GetFontData(hdc, dwTable, dwOffset, pvBuffer, cjBuffer) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetFontData", "ptr", hdc, "uint", dwTable, "uint", dwOffset, "ptr", pvBuffer, "uint", cjBuffer, "uint")
        return result
    }

    /**
     * The GetGlyphOutline function retrieves the outline or bitmap for a character in the TrueType font that is selected into the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} uChar The character for which data is to be returned.
     * @param {Integer} fuFormat 
     * @param {Pointer<GLYPHMETRICS>} lpgm A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-glyphmetrics">GLYPHMETRICS</a> structure describing the placement of the glyph in the character cell.
     * @param {Integer} cjBuffer The size, in bytes, of the buffer (*<i>lpvBuffer</i>) where the function is to copy information about the outline character. If this value is zero, the function returns the required size of the buffer.
     * @param {Pointer} pvBuffer A pointer to the buffer that receives information about the outline character. If this value is <b>NULL</b>, the function returns the required size of the buffer.
     * @param {Pointer<MAT2>} lpmat2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-mat2">MAT2</a> structure specifying a transformation matrix for the character.
     * @returns {Integer} If GGO_BITMAP, GGO_GRAY2_BITMAP, GGO_GRAY4_BITMAP, GGO_GRAY8_BITMAP, or GGO_NATIVE is specified and the function succeeds, the return value is greater than zero; otherwise, the return value is GDI_ERROR. If one of these flags is specified and the buffer size or address is zero, the return value specifies the required buffer size, in bytes.
     * 
     * If GGO_METRICS is specified and the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getglyphoutlinea
     * @since windows5.0
     */
    static GetGlyphOutlineA(hdc, uChar, fuFormat, lpgm, cjBuffer, pvBuffer, lpmat2) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetGlyphOutlineA", "ptr", hdc, "uint", uChar, "uint", fuFormat, "ptr", lpgm, "uint", cjBuffer, "ptr", pvBuffer, "ptr", lpmat2, "uint")
        return result
    }

    /**
     * The GetGlyphOutline function retrieves the outline or bitmap for a character in the TrueType font that is selected into the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} uChar The character for which data is to be returned.
     * @param {Integer} fuFormat 
     * @param {Pointer<GLYPHMETRICS>} lpgm A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-glyphmetrics">GLYPHMETRICS</a> structure describing the placement of the glyph in the character cell.
     * @param {Integer} cjBuffer The size, in bytes, of the buffer (*<i>lpvBuffer</i>) where the function is to copy information about the outline character. If this value is zero, the function returns the required size of the buffer.
     * @param {Pointer} pvBuffer A pointer to the buffer that receives information about the outline character. If this value is <b>NULL</b>, the function returns the required size of the buffer.
     * @param {Pointer<MAT2>} lpmat2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-mat2">MAT2</a> structure specifying a transformation matrix for the character.
     * @returns {Integer} If GGO_BITMAP, GGO_GRAY2_BITMAP, GGO_GRAY4_BITMAP, GGO_GRAY8_BITMAP, or GGO_NATIVE is specified and the function succeeds, the return value is greater than zero; otherwise, the return value is GDI_ERROR. If one of these flags is specified and the buffer size or address is zero, the return value specifies the required buffer size, in bytes.
     * 
     * If GGO_METRICS is specified and the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getglyphoutlinew
     * @since windows5.0
     */
    static GetGlyphOutlineW(hdc, uChar, fuFormat, lpgm, cjBuffer, pvBuffer, lpmat2) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetGlyphOutlineW", "ptr", hdc, "uint", uChar, "uint", fuFormat, "ptr", lpgm, "uint", cjBuffer, "ptr", pvBuffer, "ptr", lpmat2, "uint")
        return result
    }

    /**
     * The GetGraphicsMode function retrieves the current graphics mode for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @returns {Integer} If the function succeeds, the return value is the current graphics mode. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>GM_COMPATIBLE</td>
     * <td>The current graphics mode is the compatible graphics mode, a mode that is compatible with 16-bit Windows. In this graphics mode, an application cannot set or modify the world transformation for the specified device context. The compatible graphics mode is the default graphics mode.</td>
     * </tr>
     * <tr>
     * <td>GM_ADVANCED</td>
     * <td>The current graphics mode is the advanced graphics mode, a mode that allows world transformations. In this graphics mode, an application can set or modify the world transformation for the specified device context.</td>
     * </tr>
     * </table>
     *  
     * 
     * Otherwise, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getgraphicsmode
     * @since windows5.0
     */
    static GetGraphicsMode(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetGraphicsMode", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetMapMode function retrieves the current mapping mode.
     * @param {HDC} hdc A handle to the device context.
     * @returns {Integer} If the function succeeds, the return value specifies the mapping mode.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getmapmode
     * @since windows5.0
     */
    static GetMapMode(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetMapMode", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetMetaFileBitsEx function retrieves the contents of a Windows-format metafile and copies them into the specified buffer.
     * @param {HMETAFILE} hMF A handle to a Windows-format metafile.
     * @param {Integer} cbBuffer The size, in bytes, of the buffer to receive the data.
     * @param {Pointer} lpData A pointer to a buffer that receives the metafile data. The buffer must be sufficiently large to contain the data. If <i>lpvData</i> is <b>NULL</b>, the function returns the number of bytes required to hold the data.
     * @returns {Integer} If the function succeeds and the buffer pointer is <b>NULL</b>, the return value is the number of bytes required for the buffer; if the function succeeds and the buffer pointer is a valid pointer, the return value is the number of bytes copied.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getmetafilebitsex
     * @since windows5.0
     */
    static GetMetaFileBitsEx(hMF, cbBuffer, lpData) {
        hMF := hMF is Win32Handle ? NumGet(hMF, "ptr") : hMF

        result := DllCall("GDI32.dll\GetMetaFileBitsEx", "ptr", hMF, "uint", cbBuffer, "ptr", lpData, "uint")
        return result
    }

    /**
     * The GetMetaFile function creates a handle that identifies the metafile stored in the specified file.
     * @param {PSTR} lpName A pointer to a null-terminated string that specifies the name of a metafile.
     * @returns {HMETAFILE} If the function succeeds, the return value is a handle to the metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getmetafilea
     */
    static GetMetaFileA(lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("GDI32.dll\GetMetaFileA", "ptr", lpName, "ptr")
        return HMETAFILE({Value: result}, True)
    }

    /**
     * The GetMetaFile function creates a handle that identifies the metafile stored in the specified file.
     * @param {PWSTR} lpName A pointer to a null-terminated string that specifies the name of a metafile.
     * @returns {HMETAFILE} If the function succeeds, the return value is a handle to the metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getmetafilew
     */
    static GetMetaFileW(lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("GDI32.dll\GetMetaFileW", "ptr", lpName, "ptr")
        return HMETAFILE({Value: result}, True)
    }

    /**
     * The GetNearestColor function retrieves a color value identifying a color from the system palette that will be displayed when the specified color value is used.
     * @param {HDC} hdc A handle to the device context.
     * @param {COLORREF} color A color value that identifies a requested color. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {COLORREF} If the function succeeds, the return value identifies a color from the system palette that corresponds to the given color value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getnearestcolor
     * @since windows5.0
     */
    static GetNearestColor(hdc, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetNearestColor", "ptr", hdc, "uint", color, "uint")
        return result
    }

    /**
     * The GetNearestPaletteIndex function retrieves the index for the entry in the specified logical palette most closely matching a specified color value.
     * @param {HPALETTE} h A handle to a logical palette.
     * @param {COLORREF} color A color to be matched. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {Integer} If the function succeeds, the return value is the index of an entry in a logical palette.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getnearestpaletteindex
     * @since windows5.0
     */
    static GetNearestPaletteIndex(h, color) {
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\GetNearestPaletteIndex", "ptr", h, "uint", color, "uint")
        return result
    }

    /**
     * The GetObjectType retrieves the type of the specified object.
     * @param {HGDIOBJ} h A handle to the graphics object.
     * @returns {Integer} If the function succeeds, the return value identifies the object. This value can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>OBJ_BITMAP</td>
     * <td>Bitmap</td>
     * </tr>
     * <tr>
     * <td>OBJ_BRUSH</td>
     * <td>Brush</td>
     * </tr>
     * <tr>
     * <td>OBJ_COLORSPACE</td>
     * <td>Color space</td>
     * </tr>
     * <tr>
     * <td>OBJ_DC</td>
     * <td>Device context</td>
     * </tr>
     * <tr>
     * <td>OBJ_ENHMETADC</td>
     * <td>Enhanced metafile DC</td>
     * </tr>
     * <tr>
     * <td>OBJ_ENHMETAFILE</td>
     * <td>Enhanced metafile</td>
     * </tr>
     * <tr>
     * <td>OBJ_EXTPEN</td>
     * <td>Extended pen</td>
     * </tr>
     * <tr>
     * <td>OBJ_FONT</td>
     * <td>Font</td>
     * </tr>
     * <tr>
     * <td>OBJ_MEMDC</td>
     * <td>Memory DC</td>
     * </tr>
     * <tr>
     * <td>OBJ_METAFILE</td>
     * <td>Metafile</td>
     * </tr>
     * <tr>
     * <td>OBJ_METADC</td>
     * <td>Metafile DC</td>
     * </tr>
     * <tr>
     * <td>OBJ_PAL</td>
     * <td>Palette</td>
     * </tr>
     * <tr>
     * <td>OBJ_PEN</td>
     * <td>Pen</td>
     * </tr>
     * <tr>
     * <td>OBJ_REGION</td>
     * <td>Region</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobjecttype
     * @since windows5.0
     */
    static GetObjectType(h) {
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\GetObjectType", "ptr", h, "uint")
        return result
    }

    /**
     * The GetOutlineTextMetrics function retrieves text metrics for TrueType fonts.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} cjCopy The size, in bytes, of the array that receives the text metrics.
     * @param {Pointer} potm A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-outlinetextmetrica">OUTLINETEXTMETRIC</a> structure. If this parameter is <b>NULL</b>, the function returns the size of the buffer required for the retrieved metric data.
     * @returns {Integer} If the function succeeds, the return value is nonzero or the size of the required buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getoutlinetextmetricsa
     * @since windows5.0
     */
    static GetOutlineTextMetricsA(hdc, cjCopy, potm) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetOutlineTextMetricsA", "ptr", hdc, "uint", cjCopy, "ptr", potm, "uint")
        return result
    }

    /**
     * The GetOutlineTextMetrics function retrieves text metrics for TrueType fonts.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} cjCopy The size, in bytes, of the array that receives the text metrics.
     * @param {Pointer} potm A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-outlinetextmetrica">OUTLINETEXTMETRIC</a> structure. If this parameter is <b>NULL</b>, the function returns the size of the buffer required for the retrieved metric data.
     * @returns {Integer} If the function succeeds, the return value is nonzero or the size of the required buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getoutlinetextmetricsw
     * @since windows5.0
     */
    static GetOutlineTextMetricsW(hdc, cjCopy, potm) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetOutlineTextMetricsW", "ptr", hdc, "uint", cjCopy, "ptr", potm, "uint")
        return result
    }

    /**
     * The GetPaletteEntries function retrieves a specified range of palette entries from the given logical palette.
     * @param {HPALETTE} hpal A handle to the logical palette.
     * @param {Integer} iStart The first entry in the logical palette to be retrieved.
     * @param {Integer} cEntries The number of entries in the logical palette to be retrieved.
     * @param {Pointer<PALETTEENTRY>} pPalEntries A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures to receive the palette entries. The array must contain at least as many structures as specified by the <i>nEntries</i> parameter.
     * @returns {Integer} If the function succeeds and the handle to the logical palette is a valid pointer (not <b>NULL</b>), the return value is the number of entries retrieved from the logical palette. If the function succeeds and handle to the logical palette is <b>NULL</b>, the return value is the number of entries in the given palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpaletteentries
     * @since windows5.0
     */
    static GetPaletteEntries(hpal, iStart, cEntries, pPalEntries) {
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal

        result := DllCall("GDI32.dll\GetPaletteEntries", "ptr", hpal, "uint", iStart, "uint", cEntries, "ptr", pPalEntries, "uint")
        return result
    }

    /**
     * The GetPixel function retrieves the red, green, blue (RGB) color value of the pixel at the specified coordinates.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical units, of the pixel to be examined.
     * @param {Integer} y The y-coordinate, in logical units, of the pixel to be examined.
     * @returns {COLORREF} The return value is the <a href="/windows/desktop/gdi/colorref">COLORREF</a> value that specifies the RGB of the pixel. If the pixel is outside of the current clipping region, the return value is CLR_INVALID (0xFFFFFFFF defined in Wingdi.h).
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixel
     * @since windows5.0
     */
    static GetPixel(hdc, x, y) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetPixel", "ptr", hdc, "int", x, "int", y, "uint")
        return result
    }

    /**
     * The GetPolyFillMode function retrieves the current polygon fill mode.
     * @param {HDC} hdc Handle to the device context.
     * @returns {Integer} If the function succeeds, the return value specifies the polygon fill mode, which can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>ALTERNATE</td>
     * <td>Selects alternate mode (fills area between odd-numbered and even-numbered polygon sides on each scan line).</td>
     * </tr>
     * <tr>
     * <td>WINDING</td>
     * <td>Selects winding mode (fills any region with a nonzero winding value).</td>
     * </tr>
     * </table>
     *  
     * 
     * If an error occurs, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpolyfillmode
     * @since windows5.0
     */
    static GetPolyFillMode(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetPolyFillMode", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetRasterizerCaps function returns flags indicating whether TrueType fonts are installed in the system.
     * @param {Pointer} lpraststat A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rasterizer_status">RASTERIZER_STATUS</a> structure that receives information about the rasterizer.
     * @param {Integer} cjBytes The number of bytes to be copied into the structure pointed to by the <i>lprs</i> parameter.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getrasterizercaps
     * @since windows5.0
     */
    static GetRasterizerCaps(lpraststat, cjBytes) {
        result := DllCall("GDI32.dll\GetRasterizerCaps", "ptr", lpraststat, "uint", cjBytes, "int")
        return result
    }

    /**
     * The GetRandomRgn function copies the system clipping region of a specified device context to a specific region.
     * @param {HDC} hdc A handle to the device context.
     * @param {HRGN} hrgn A handle to a region. Before the function is called, this identifies an existing region. After the function returns, this identifies a copy of the current system region. The old region identified by <i>hrgn</i> is overwritten.
     * @param {Integer} i This parameter must be SYSRGN.
     * @returns {Integer} If the function succeeds, the return value is 1. If the function fails, the return value is -1. If the region to be retrieved is <b>NULL</b>, the return value is 0. If the function fails or the region to be retrieved is <b>NULL</b>, <i>hrgn</i> is not initialized.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getrandomrgn
     * @since windows5.0
     */
    static GetRandomRgn(hdc, hrgn, i) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\GetRandomRgn", "ptr", hdc, "ptr", hrgn, "int", i, "int")
        return result
    }

    /**
     * The GetRegionData function fills the specified buffer with data describing a region. This data includes the dimensions of the rectangles that make up the region.
     * @param {HRGN} hrgn A handle to the region.
     * @param {Integer} nCount The size, in bytes, of the <i>lpRgnData</i> buffer.
     * @param {Pointer} lpRgnData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure that receives the information. The dimensions of the region are in logical units. If this parameter is <b>NULL</b>, the return value contains the number of bytes needed for the region data.
     * @returns {Integer} If the function succeeds and <i>dwCount</i> specifies an adequate number of bytes, the return value is always <i>dwCount</i>. If <i>dwCount</i> is too small or the function fails, the return value is 0. If <i>lpRgnData</i> is <b>NULL</b>, the return value is the required number of bytes.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getregiondata
     * @since windows5.0
     */
    static GetRegionData(hrgn, nCount, lpRgnData) {
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\GetRegionData", "ptr", hrgn, "uint", nCount, "ptr", lpRgnData, "uint")
        return result
    }

    /**
     * The GetRgnBox function retrieves the bounding rectangle of the specified region.
     * @param {HRGN} hrgn A handle to the region.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the bounding rectangle in logical units.
     * @returns {Integer} The return value specifies the region's complexity. It can be one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>NULLREGION</td>
     * <td>Region is empty.</td>
     * </tr>
     * <tr>
     * <td>SIMPLEREGION</td>
     * <td>Region is a single rectangle.</td>
     * </tr>
     * <tr>
     * <td>COMPLEXREGION</td>
     * <td>Region is more than a single rectangle.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the <i>hrgn</i> parameter does not identify a valid region, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getrgnbox
     * @since windows5.0
     */
    static GetRgnBox(hrgn, lprc) {
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\GetRgnBox", "ptr", hrgn, "ptr", lprc, "int")
        return result
    }

    /**
     * The GetStockObject function retrieves a handle to one of the stock pens, brushes, fonts, or palettes.
     * @param {Integer} i 
     * @returns {HGDIOBJ} If the function succeeds, the return value is a handle to the requested logical object.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getstockobject
     * @since windows5.0
     */
    static GetStockObject(i) {
        result := DllCall("GDI32.dll\GetStockObject", "int", i, "ptr")
        return HGDIOBJ({Value: result}, True)
    }

    /**
     * The GetStretchBltMode function retrieves the current stretching mode. The stretching mode defines how color data is added to or removed from bitmaps that are stretched or compressed when the StretchBlt function is called.
     * @param {HDC} hdc A handle to the device context.
     * @returns {Integer} If the function succeeds, the return value is the current stretching mode. This can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>BLACKONWHITE</td>
     * <td>Performs a Boolean AND operation using the color values for the eliminated and existing pixels. If the bitmap is a monochrome bitmap, this mode preserves black pixels at the expense of white pixels.</td>
     * </tr>
     * <tr>
     * <td>COLORONCOLOR</td>
     * <td>Deletes the pixels. This mode deletes all eliminated lines of pixels without trying to preserve their information.</td>
     * </tr>
     * <tr>
     * <td>HALFTONE</td>
     * <td>Maps pixels from the source rectangle into blocks of pixels in the destination rectangle. The average color over the destination block of pixels approximates the color of the source pixels.</td>
     * </tr>
     * <tr>
     * <td>STRETCH_ANDSCANS</td>
     * <td>Same as BLACKONWHITE.</td>
     * </tr>
     * <tr>
     * <td>STRETCH_DELETESCANS</td>
     * <td>Same as COLORONCOLOR.</td>
     * </tr>
     * <tr>
     * <td>STRETCH_HALFTONE</td>
     * <td>Same as HALFTONE.</td>
     * </tr>
     * <tr>
     * <td>STRETCH_ORSCANS</td>
     * <td>Same as WHITEONBLACK.</td>
     * </tr>
     * <tr>
     * <td>WHITEONBLACK</td>
     * <td>Performs a Boolean OR operation using the color values for the eliminated and existing pixels. If the bitmap is a monochrome bitmap, this mode preserves white pixels at the expense of black pixels.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getstretchbltmode
     * @since windows5.0
     */
    static GetStretchBltMode(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetStretchBltMode", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetSystemPaletteEntries function retrieves a range of palette entries from the system palette that is associated with the specified device context (DC).
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iStart The first entry to be retrieved from the system palette.
     * @param {Integer} cEntries The number of entries to be retrieved from the system palette.
     * @param {Pointer<PALETTEENTRY>} pPalEntries A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures to receive the palette entries. The array must contain at least as many structures as specified by the <i>cEntries</i> parameter. If this parameter is <b>NULL</b>, the function returns the total number of entries in the palette.
     * @returns {Integer} If the function succeeds, the return value is the number of entries retrieved from the palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getsystempaletteentries
     * @since windows5.0
     */
    static GetSystemPaletteEntries(hdc, iStart, cEntries, pPalEntries) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetSystemPaletteEntries", "ptr", hdc, "uint", iStart, "uint", cEntries, "ptr", pPalEntries, "uint")
        return result
    }

    /**
     * The GetSystemPaletteUse function retrieves the current state of the system (physical) palette for the specified device context (DC).
     * @param {HDC} hdc A handle to the device context.
     * @returns {Integer} If the function succeeds, the return value is the current state of the system palette. This parameter can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>SYSPAL_NOSTATIC</td>
     * <td>The system palette contains no static colors except black and white.</td>
     * </tr>
     * <tr>
     * <td>SYSPAL_STATIC</td>
     * <td>The system palette contains static colors that will not change when an application realizes its logical palette.</td>
     * </tr>
     * <tr>
     * <td>SYSPAL_ERROR</td>
     * <td>The given device context is invalid or does not support a color palette.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getsystempaletteuse
     * @since windows5.0
     */
    static GetSystemPaletteUse(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetSystemPaletteUse", "ptr", hdc, "uint")
        return result
    }

    /**
     * The GetTextCharacterExtra function retrieves the current intercharacter spacing for the specified device context.
     * @param {HDC} hdc Handle to the device context.
     * @returns {Integer} If the function succeeds, the return value is the current intercharacter spacing, in logical coordinates.
     * 
     * If the function fails, the return value is 0x8000000.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextcharacterextra
     * @since windows5.0
     */
    static GetTextCharacterExtra(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetTextCharacterExtra", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetTextAlign function retrieves the text-alignment setting for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @returns {Integer} If the function succeeds, the return value is the status of the text-alignment flags. For more information about the return value, see the Remarks section. The return value is a combination of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TA_BASELINE</td>
     * <td>The reference point is on the base line of the text.</td>
     * </tr>
     * <tr>
     * <td>TA_BOTTOM</td>
     * <td>The reference point is on the bottom edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_TOP</td>
     * <td>The reference point is on the top edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_CENTER</td>
     * <td>The reference point is aligned horizontally with the center of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_LEFT</td>
     * <td>The reference point is on the left edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_RIGHT</td>
     * <td>The reference point is on the right edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_RTLREADING</td>
     * <td><b>Middle East language edition of Windows:</b> The text is laid out in right to left reading order, as opposed to the default left to right order. This only applies when the font selected into the device context is either Hebrew or Arabic.</td>
     * </tr>
     * <tr>
     * <td>TA_NOUPDATECP</td>
     * <td>The current position is not updated after each text output call.</td>
     * </tr>
     * <tr>
     * <td>TA_UPDATECP</td>
     * <td>The current position is updated after each text output call.</td>
     * </tr>
     * </table>
     *  
     * 
     * When the current font has a vertical default base line (as with Kanji), the following values are used instead of TA_BASELINE and TA_CENTER.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>VTA_BASELINE</td>
     * <td>The reference point is on the base line of the text.</td>
     * </tr>
     * <tr>
     * <td>VTA_CENTER</td>
     * <td>The reference point is aligned vertically with the center of the bounding rectangle.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextalign
     * @since windows5.0
     */
    static GetTextAlign(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetTextAlign", "ptr", hdc, "uint")
        return result
    }

    /**
     * The GetTextColor function retrieves the current text color for the specified device context.
     * @param {HDC} hdc Handle to the device context.
     * @returns {COLORREF} If the function succeeds, the return value is the current text color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextcolor
     * @since windows5.0
     */
    static GetTextColor(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetTextColor", "ptr", hdc, "uint")
        return result
    }

    /**
     * The GetTextExtentPoint function computes the width and height of the specified string of text.
     * @param {HDC} hdc A handle to the device context.
     * @param {PSTR} lpString A pointer to the string that specifies the text. The string does not need to be zero-terminated, since <i>cbString</i> specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Pointer<SIZE>} lpsz A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the string, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentpointa
     * @since windows5.0
     */
    static GetTextExtentPointA(hdc, lpString, c, lpsz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\GetTextExtentPointA", "ptr", hdc, "ptr", lpString, "int", c, "ptr", lpsz, "int")
        return result
    }

    /**
     * The GetTextExtentPoint function computes the width and height of the specified string of text.
     * @param {HDC} hdc A handle to the device context.
     * @param {PWSTR} lpString A pointer to the string that specifies the text. The string does not need to be zero-terminated, since <i>cbString</i> specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Pointer<SIZE>} lpsz A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the string, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentpointw
     * @since windows5.0
     */
    static GetTextExtentPointW(hdc, lpString, c, lpsz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\GetTextExtentPointW", "ptr", hdc, "ptr", lpString, "int", c, "ptr", lpsz, "int")
        return result
    }

    /**
     * The GetTextExtentPoint32 function computes the width and height of the specified string of text.
     * @param {HDC} hdc A handle to the device context.
     * @param {PSTR} lpString A pointer to a buffer that specifies the text string. The string does not need to be null-terminated, because the <i>c</i> parameter specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Pointer<SIZE>} psizl A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the string, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentpoint32a
     * @since windows5.0
     */
    static GetTextExtentPoint32A(hdc, lpString, c, psizl) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\GetTextExtentPoint32A", "ptr", hdc, "ptr", lpString, "int", c, "ptr", psizl, "int")
        return result
    }

    /**
     * The GetTextExtentPoint32 function computes the width and height of the specified string of text.
     * @param {HDC} hdc A handle to the device context.
     * @param {PWSTR} lpString A pointer to a buffer that specifies the text string. The string does not need to be null-terminated, because the <i>c</i> parameter specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Pointer<SIZE>} psizl A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the string, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentpoint32w
     * @since windows5.0
     */
    static GetTextExtentPoint32W(hdc, lpString, c, psizl) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\GetTextExtentPoint32W", "ptr", hdc, "ptr", lpString, "int", c, "ptr", psizl, "int")
        return result
    }

    /**
     * The GetTextExtentExPoint function retrieves the number of characters in a specified string that will fit within a specified space and fills an array with the text extent for each of those characters.
     * @param {HDC} hdc A handle to the device context.
     * @param {PSTR} lpszString A pointer to the null-terminated string for which extents are to be retrieved.
     * @param {Integer} cchString The number of characters in the string pointed to by the <i>lpszStr</i> parameter. For an ANSI call it specifies the string length in bytes and for a Unicode it specifies the string length in WORDs. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
     * @param {Integer} nMaxExtent The maximum allowable width, in logical units, of the formatted string.
     * @param {Pointer<Integer>} lpnFit A pointer to an integer that receives a count of the maximum number of characters that will fit in the space specified by the <i>nMaxExtent</i> parameter. When the <i>lpnFit</i> parameter is <b>NULL</b>, the <i>nMaxExtent</i> parameter is ignored.
     * @param {Pointer<Integer>} lpnDx A pointer to an array of integers that receives partial string extents. Each element in the array gives the distance, in logical units, between the beginning of the string and one of the characters that fits in the space specified by the <i>nMaxExtent</i> parameter. This array must have at least as many elements as characters specified by the <i>cchString</i> parameter because the entire array is used internally. The function fills the array with valid extents for as many characters as are specified by the <i>lpnFit</i> parameter. Any values in the rest of the array should be ignored. If <i>alpDx</i> is <b>NULL</b>, the function does not compute partial string widths.
     * 
     * For complex scripts, where a sequence of characters may be represented by any number of glyphs, the values in the <i>alpDx</i> array up to the number specified by the <i>lpnFit</i> parameter match one-to-one with code points. Again, you should ignore the rest of the values in the <i>alpDx</i> array.
     * @param {Pointer<SIZE>} lpSize A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the string, in logical units. This parameter cannot be <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentexpointa
     * @since windows5.0
     */
    static GetTextExtentExPointA(hdc, lpszString, cchString, nMaxExtent, lpnFit, lpnDx, lpSize) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

        lpnFitMarshal := lpnFit is VarRef ? "int*" : "ptr"
        lpnDxMarshal := lpnDx is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetTextExtentExPointA", "ptr", hdc, "ptr", lpszString, "int", cchString, "int", nMaxExtent, lpnFitMarshal, lpnFit, lpnDxMarshal, lpnDx, "ptr", lpSize, "int")
        return result
    }

    /**
     * The GetTextExtentExPoint function retrieves the number of characters in a specified string that will fit within a specified space and fills an array with the text extent for each of those characters.
     * @param {HDC} hdc A handle to the device context.
     * @param {PWSTR} lpszString A pointer to the null-terminated string for which extents are to be retrieved.
     * @param {Integer} cchString The number of characters in the string pointed to by the <i>lpszStr</i> parameter. For an ANSI call it specifies the string length in bytes and for a Unicode it specifies the string length in WORDs. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
     * @param {Integer} nMaxExtent The maximum allowable width, in logical units, of the formatted string.
     * @param {Pointer<Integer>} lpnFit A pointer to an integer that receives a count of the maximum number of characters that will fit in the space specified by the <i>nMaxExtent</i> parameter. When the <i>lpnFit</i> parameter is <b>NULL</b>, the <i>nMaxExtent</i> parameter is ignored.
     * @param {Pointer<Integer>} lpnDx A pointer to an array of integers that receives partial string extents. Each element in the array gives the distance, in logical units, between the beginning of the string and one of the characters that fits in the space specified by the <i>nMaxExtent</i> parameter. This array must have at least as many elements as characters specified by the <i>cchString</i> parameter because the entire array is used internally. The function fills the array with valid extents for as many characters as are specified by the <i>lpnFit</i> parameter. Any values in the rest of the array should be ignored. If <i>alpDx</i> is <b>NULL</b>, the function does not compute partial string widths.
     * 
     * For complex scripts, where a sequence of characters may be represented by any number of glyphs, the values in the <i>alpDx</i> array up to the number specified by the <i>lpnFit</i> parameter match one-to-one with code points. Again, you should ignore the rest of the values in the <i>alpDx</i> array.
     * @param {Pointer<SIZE>} lpSize A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the string, in logical units. This parameter cannot be <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentexpointw
     * @since windows5.0
     */
    static GetTextExtentExPointW(hdc, lpszString, cchString, nMaxExtent, lpnFit, lpnDx, lpSize) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

        lpnFitMarshal := lpnFit is VarRef ? "int*" : "ptr"
        lpnDxMarshal := lpnDx is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetTextExtentExPointW", "ptr", hdc, "ptr", lpszString, "int", cchString, "int", nMaxExtent, lpnFitMarshal, lpnFit, lpnDxMarshal, lpnDx, "ptr", lpSize, "int")
        return result
    }

    /**
     * The GetFontLanguageInfo function returns information about the currently selected font for the specified display context. Applications typically use this information and the GetCharacterPlacement function to prepare a character string for display.
     * @param {HDC} hdc Handle to a display device context.
     * @returns {Integer} The return value identifies characteristics of the currently selected font. The function returns 0 if the font is "normalized" and can be treated as a simple Latin font; it returns GCP_ERROR if an error occurs. Otherwise, the function returns a combination of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>GCP_DBCS</td>
     * <td>The character set is DBCS.</td>
     * </tr>
     * <tr>
     * <td>GCP_DIACRITIC</td>
     * <td>The font/language contains diacritic glyphs.</td>
     * </tr>
     * <tr>
     * <td>FLI_GLYPHS</td>
     * <td>The font contains extra glyphs not normally accessible using the code page. Use <a href="/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> to access the glyphs. This value is for information only and is not intended to be passed to <b>GetCharacterPlacement</b>.</td>
     * </tr>
     * <tr>
     * <td>GCP_GLYPHSHAPE</td>
     * <td>The font/language contains multiple glyphs per code point or per code point combination (supports shaping and/or ligation), and the font contains advanced glyph tables to provide extra glyphs for the extra shapes. If this value is specified, the <b>lpGlyphs</b> array must be used with the <a href="/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> function and the ETO_GLYPHINDEX value must be passed to the <a href="/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> function when the string is drawn.</td>
     * </tr>
     * <tr>
     * <td>GCP_KASHIDA</td>
     * <td>The font/ language permits Kashidas.</td>
     * </tr>
     * <tr>
     * <td>GCP_LIGATE</td>
     * <td>The font/language contains ligation glyphs which can be substituted for specific character combinations.</td>
     * </tr>
     * <tr>
     * <td>GCP_USEKERNING</td>
     * <td>The font contains a kerning table which can be used to provide better spacing between the characters and glyphs.</td>
     * </tr>
     * <tr>
     * <td>GCP_REORDER</td>
     * <td>The language requires reordering for displayfor example, Hebrew or Arabic.</td>
     * </tr>
     * </table>
     *  
     * 
     * The return value, when masked with FLI_MASK, can be passed directly to the <a href="/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getfontlanguageinfo
     * @since windows5.0
     */
    static GetFontLanguageInfo(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetFontLanguageInfo", "ptr", hdc, "uint")
        return result
    }

    /**
     * The GetCharacterPlacement function retrieves information about a character string, such as character widths, caret positioning, ordering within the string, and glyph rendering.
     * @param {HDC} hdc A handle to the device context.
     * @param {PSTR} lpString A pointer to the character string to process. The string does not need to be zero-terminated, since <i>nCount</i> specifies the length of the string.
     * @param {Integer} nCount The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Integer} nMexExtent The maximum extent (in logical units) to which the string is processed. Characters that, if processed, would exceed this extent are ignored. Computations for any required ordering or glyph arrays apply only to the included characters. This parameter is used only if the GCP_MAXEXTENT value is specified in the <i>dwFlags</i> parameter. As the function processes the input string, each character and its extent is added to the output, extent, and other arrays only if the total extent has not yet exceeded the maximum. Once the limit is reached, processing will stop.
     * @param {Pointer<GCP_RESULTSA>} lpResults A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gcp_resultsa">GCP_RESULTS</a> structure that receives the results of the function.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, the return value is the  width and height of the string in logical units. The width is the low-order word and the height is the high-order word.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharacterplacementa
     * @since windows5.0
     */
    static GetCharacterPlacementA(hdc, lpString, nCount, nMexExtent, lpResults, dwFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\GetCharacterPlacementA", "ptr", hdc, "ptr", lpString, "int", nCount, "int", nMexExtent, "ptr", lpResults, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The GetCharacterPlacement function retrieves information about a character string, such as character widths, caret positioning, ordering within the string, and glyph rendering.
     * @param {HDC} hdc A handle to the device context.
     * @param {PWSTR} lpString A pointer to the character string to process. The string does not need to be zero-terminated, since <i>nCount</i> specifies the length of the string.
     * @param {Integer} nCount The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Integer} nMexExtent The maximum extent (in logical units) to which the string is processed. Characters that, if processed, would exceed this extent are ignored. Computations for any required ordering or glyph arrays apply only to the included characters. This parameter is used only if the GCP_MAXEXTENT value is specified in the <i>dwFlags</i> parameter. As the function processes the input string, each character and its extent is added to the output, extent, and other arrays only if the total extent has not yet exceeded the maximum. Once the limit is reached, processing will stop.
     * @param {Pointer<GCP_RESULTSW>} lpResults A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gcp_resultsa">GCP_RESULTS</a> structure that receives the results of the function.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, the return value is the  width and height of the string in logical units. The width is the low-order word and the height is the high-order word.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharacterplacementw
     * @since windows5.0
     */
    static GetCharacterPlacementW(hdc, lpString, nCount, nMexExtent, lpResults, dwFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\GetCharacterPlacementW", "ptr", hdc, "ptr", lpString, "int", nCount, "int", nMexExtent, "ptr", lpResults, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The GetFontUnicodeRanges function returns information about which Unicode characters are supported by a font. The information is returned as a GLYPHSET structure.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<GLYPHSET>} lpgs A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-glyphset">GLYPHSET</a> structure that receives the glyph set information. If this parameter is <b>NULL</b>, the function returns the size of the <b>GLYPHSET</b> structure required to store the information.
     * @returns {Integer} If the function succeeds, it returns number of bytes written to the GLYPHSET structure or, if the <i>lpgs</i> parameter is <b>NULL</b>, it returns the size of the GLYPHSET structure required to store the information.
     * 
     * If the function fails, it returns zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getfontunicoderanges
     * @since windows5.0
     */
    static GetFontUnicodeRanges(hdc, lpgs) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetFontUnicodeRanges", "ptr", hdc, "ptr", lpgs, "uint")
        return result
    }

    /**
     * The GetGlyphIndices function translates a string into an array of glyph indices. The function can be used to determine whether a glyph exists in a font.
     * @param {HDC} hdc A handle to the device context.
     * @param {PSTR} lpstr A pointer to the string to be converted.
     * @param {Integer} c The length of both the <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpstr</i> and the size (in WORDs) of the buffer pointed to by <i>pgi</i>.
     * @param {Pointer<Integer>} pgi This buffer must be of dimension c. On successful return, contains an array of glyph indices corresponding to the characters in the string.
     * @param {Integer} fl Specifies how glyphs should be handled if they are not supported. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GGI_MARK_NONEXISTING_GLYPHS"></a><a id="ggi_mark_nonexisting_glyphs"></a><dl>
     * <dt><b>GGI_MARK_NONEXISTING_GLYPHS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Marks unsupported glyphs with the hexadecimal value 0xffff.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns the number of bytes (for the ANSI function) or WORDs (for the Unicode function) converted.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getglyphindicesa
     * @since windows5.0
     */
    static GetGlyphIndicesA(hdc, lpstr, c, pgi, fl) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        pgiMarshal := pgi is VarRef ? "ushort*" : "ptr"

        result := DllCall("GDI32.dll\GetGlyphIndicesA", "ptr", hdc, "ptr", lpstr, "int", c, pgiMarshal, pgi, "uint", fl, "uint")
        return result
    }

    /**
     * The GetGlyphIndices function translates a string into an array of glyph indices. The function can be used to determine whether a glyph exists in a font.
     * @param {HDC} hdc A handle to the device context.
     * @param {PWSTR} lpstr A pointer to the string to be converted.
     * @param {Integer} c The length of both the <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpstr</i> and the size (in WORDs) of the buffer pointed to by <i>pgi</i>.
     * @param {Pointer<Integer>} pgi This buffer must be of dimension c. On successful return, contains an array of glyph indices corresponding to the characters in the string.
     * @param {Integer} fl Specifies how glyphs should be handled if they are not supported. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GGI_MARK_NONEXISTING_GLYPHS"></a><a id="ggi_mark_nonexisting_glyphs"></a><dl>
     * <dt><b>GGI_MARK_NONEXISTING_GLYPHS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Marks unsupported glyphs with the hexadecimal value 0xffff.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns the number of bytes (for the ANSI function) or WORDs (for the Unicode function) converted.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getglyphindicesw
     * @since windows5.0
     */
    static GetGlyphIndicesW(hdc, lpstr, c, pgi, fl) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        pgiMarshal := pgi is VarRef ? "ushort*" : "ptr"

        result := DllCall("GDI32.dll\GetGlyphIndicesW", "ptr", hdc, "ptr", lpstr, "int", c, pgiMarshal, pgi, "uint", fl, "uint")
        return result
    }

    /**
     * The GetTextExtentPointI function computes the width and height of the specified array of glyph indices.
     * @param {HDC} hdc Handle to the device context.
     * @param {Pointer<Integer>} pgiIn Pointer to array of glyph indices.
     * @param {Integer} cgi Specifies the number of glyph indices.
     * @param {Pointer<SIZE>} psize Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the string, in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentpointi
     * @since windows5.0
     */
    static GetTextExtentPointI(hdc, pgiIn, cgi, psize) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pgiInMarshal := pgiIn is VarRef ? "ushort*" : "ptr"

        result := DllCall("GDI32.dll\GetTextExtentPointI", "ptr", hdc, pgiInMarshal, pgiIn, "int", cgi, "ptr", psize, "int")
        return result
    }

    /**
     * The GetTextExtentExPointI function retrieves the number of characters in a specified string that will fit within a specified space and fills an array with the text extent for each of those characters.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<Integer>} lpwszString A pointer to an array of glyph indices for which extents are to be retrieved.
     * @param {Integer} cwchString The number of glyphs in the array pointed to by the <i>pgiIn</i> parameter.
     * @param {Integer} nMaxExtent The maximum allowable width, in logical units, of the formatted string.
     * @param {Pointer<Integer>} lpnFit A pointer to an integer that receives a count of the maximum number of characters that will fit in the space specified by the <i>nMaxExtent</i> parameter. When the <i>lpnFit</i> parameter is <b>NULL</b>, the <i>nMaxExtent</i> parameter is ignored.
     * @param {Pointer<Integer>} lpnDx A pointer to an array of integers that receives partial glyph extents. Each element in the array gives the distance, in logical units, between the beginning of the glyph indices array and one of the glyphs that fits in the space specified by the <i>nMaxExtent</i> parameter. Although this array should have at least as many elements as glyph indices specified by the <i>cgi</i> parameter, the function fills the array with extents only for as many glyph indices as are specified by the <i>lpnFit</i> parameter. If <i>lpnFit</i> is <b>NULL</b>, the function does not compute partial string widths.
     * @param {Pointer<SIZE>} lpSize A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the dimensions of the glyph indices array, in logical units. This value cannot be <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextextentexpointi
     * @since windows5.0
     */
    static GetTextExtentExPointI(hdc, lpwszString, cwchString, nMaxExtent, lpnFit, lpnDx, lpSize) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpwszStringMarshal := lpwszString is VarRef ? "ushort*" : "ptr"
        lpnFitMarshal := lpnFit is VarRef ? "int*" : "ptr"
        lpnDxMarshal := lpnDx is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetTextExtentExPointI", "ptr", hdc, lpwszStringMarshal, lpwszString, "int", cwchString, "int", nMaxExtent, lpnFitMarshal, lpnFit, lpnDxMarshal, lpnDx, "ptr", lpSize, "int")
        return result
    }

    /**
     * The GetCharWidthI function retrieves the widths, in logical coordinates, of consecutive glyph indices in a specified range from the current font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} giFirst The first glyph index in the group of consecutive glyph indices.
     * @param {Integer} cgi The number of glyph indices.
     * @param {Pointer<Integer>} pgi A pointer to an array of glyph indices. If this parameter is not <b>NULL</b>, it is used instead of the <i>giFirst</i> parameter.
     * @param {Pointer<Integer>} piWidths A pointer to a buffer that receives the widths, in logical coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharwidthi
     * @since windows5.0
     */
    static GetCharWidthI(hdc, giFirst, cgi, pgi, piWidths) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pgiMarshal := pgi is VarRef ? "ushort*" : "ptr"
        piWidthsMarshal := piWidths is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\GetCharWidthI", "ptr", hdc, "uint", giFirst, "uint", cgi, pgiMarshal, pgi, piWidthsMarshal, piWidths, "int")
        return result
    }

    /**
     * The GetCharABCWidthsI function retrieves the widths, in logical units, of consecutive glyph indices in a specified range from the current TrueType font. This function succeeds only with TrueType fonts.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} giFirst The first glyph index in the group of consecutive glyph indices from the current font. This parameter is only used if the <i>pgi</i> parameter is <b>NULL</b>.
     * @param {Integer} cgi The number of glyph indices.
     * @param {Pointer<Integer>} pgi A pointer to an array that contains glyph indices. If this parameter is <b>NULL</b>, the <i>giFirst</i> parameter is used instead. The <i>cgi</i> parameter specifies the number of glyph indices in this array.
     * @param {Pointer<ABC>} pabc A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-abc">ABC</a> structures that receives the character widths, in logical units. This array must contain at least as many <b>ABC</b> structures as there are glyph indices specified by the <i>cgi</i> parameter.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcharabcwidthsi
     * @since windows5.0
     */
    static GetCharABCWidthsI(hdc, giFirst, cgi, pgi, pabc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pgiMarshal := pgi is VarRef ? "ushort*" : "ptr"

        result := DllCall("GDI32.dll\GetCharABCWidthsI", "ptr", hdc, "uint", giFirst, "uint", cgi, pgiMarshal, pgi, "ptr", pabc, "int")
        return result
    }

    /**
     * The AddFontResourceEx function adds the font resource from the specified file to the system. Fonts added with the AddFontResourceEx function can be marked as private and not enumerable.
     * @param {PSTR} name A pointer to a null-terminated character string that contains a valid font file name. This parameter can specify any of the following files.
     * 
     * <table>
     * <tr>
     * <th>File Extension</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".fon"></a><a id=".FON"></a><dl>
     * <dt><b>.fon</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".fnt"></a><a id=".FNT"></a><dl>
     * <dt><b>.fnt</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raw bitmap font file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".ttf"></a><a id=".TTF"></a><dl>
     * <dt><b>.ttf</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raw TrueType file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".ttc"></a><a id=".TTC"></a><dl>
     * <dt><b>.ttc</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * East Asian Windows: TrueType font collection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".fot"></a><a id=".FOT"></a><dl>
     * <dt><b>.fot</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TrueType resource file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".otf"></a><a id=".OTF"></a><dl>
     * <dt><b>.otf</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PostScript OpenType font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".mmm"></a><a id=".MMM"></a><dl>
     * <dt><b>.mmm</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * multiple master Type1 font resource file. It must be used with .pfm and .pfb files.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".pfb"></a><a id=".PFB"></a><dl>
     * <dt><b>.pfb</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type 1 font bits file. It is used with a .pfm file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".pfm"></a><a id=".PFM"></a><dl>
     * <dt><b>.pfm</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type 1 font metrics file. It is used with a .pfb file.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * To add a font whose information comes from several resource files, point <i>lpszFileName</i> to a string with the file names separated by a | --for example, abcxxxxx.pfm | abcxxxxx.pfb.
     * @param {Integer} fl 
     * @returns {Integer} If the function succeeds, the return value specifies the number of fonts added.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-addfontresourceexa
     * @since windows5.0
     */
    static AddFontResourceExA(name, fl) {
        static res := 0 ;Reserved parameters must always be NULL

        name := name is String ? StrPtr(name) : name

        result := DllCall("GDI32.dll\AddFontResourceExA", "ptr", name, "uint", fl, "ptr", res, "int")
        return result
    }

    /**
     * The AddFontResourceEx function adds the font resource from the specified file to the system. Fonts added with the AddFontResourceEx function can be marked as private and not enumerable.
     * @param {PWSTR} name A pointer to a null-terminated character string that contains a valid font file name. This parameter can specify any of the following files.
     * 
     * <table>
     * <tr>
     * <th>File Extension</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".fon"></a><a id=".FON"></a><dl>
     * <dt><b>.fon</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".fnt"></a><a id=".FNT"></a><dl>
     * <dt><b>.fnt</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raw bitmap font file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".ttf"></a><a id=".TTF"></a><dl>
     * <dt><b>.ttf</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raw TrueType file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".ttc"></a><a id=".TTC"></a><dl>
     * <dt><b>.ttc</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * East Asian Windows: TrueType font collection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".fot"></a><a id=".FOT"></a><dl>
     * <dt><b>.fot</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TrueType resource file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".otf"></a><a id=".OTF"></a><dl>
     * <dt><b>.otf</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PostScript OpenType font.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".mmm"></a><a id=".MMM"></a><dl>
     * <dt><b>.mmm</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * multiple master Type1 font resource file. It must be used with .pfm and .pfb files.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".pfb"></a><a id=".PFB"></a><dl>
     * <dt><b>.pfb</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type 1 font bits file. It is used with a .pfm file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=".pfm"></a><a id=".PFM"></a><dl>
     * <dt><b>.pfm</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type 1 font metrics file. It is used with a .pfb file.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * To add a font whose information comes from several resource files, point <i>lpszFileName</i> to a string with the file names separated by a | --for example, abcxxxxx.pfm | abcxxxxx.pfb.
     * @param {Integer} fl 
     * @returns {Integer} If the function succeeds, the return value specifies the number of fonts added.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-addfontresourceexw
     * @since windows5.0
     */
    static AddFontResourceExW(name, fl) {
        static res := 0 ;Reserved parameters must always be NULL

        name := name is String ? StrPtr(name) : name

        result := DllCall("GDI32.dll\AddFontResourceExW", "ptr", name, "uint", fl, "ptr", res, "int")
        return result
    }

    /**
     * The RemoveFontResourceEx function removes the fonts in the specified file from the system font table.
     * @param {PSTR} name A pointer to a null-terminated string that names a font resource file.
     * @param {Integer} fl The characteristics of the font to be removed from the system. In order for the font to be removed, the flags used must be the same as when the font was added with the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-addfontresourceexa">AddFontResourceEx</a> function. See the <b>AddFontResourceEx</b> function for more information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-removefontresourceexa
     * @since windows5.0
     */
    static RemoveFontResourceExA(name, fl) {
        static pdv := 0 ;Reserved parameters must always be NULL

        name := name is String ? StrPtr(name) : name

        result := DllCall("GDI32.dll\RemoveFontResourceExA", "ptr", name, "uint", fl, "ptr", pdv, "int")
        return result
    }

    /**
     * The RemoveFontResourceEx function removes the fonts in the specified file from the system font table.
     * @param {PWSTR} name A pointer to a null-terminated string that names a font resource file.
     * @param {Integer} fl The characteristics of the font to be removed from the system. In order for the font to be removed, the flags used must be the same as when the font was added with the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-addfontresourceexa">AddFontResourceEx</a> function. See the <b>AddFontResourceEx</b> function for more information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-removefontresourceexw
     * @since windows5.0
     */
    static RemoveFontResourceExW(name, fl) {
        static pdv := 0 ;Reserved parameters must always be NULL

        name := name is String ? StrPtr(name) : name

        result := DllCall("GDI32.dll\RemoveFontResourceExW", "ptr", name, "uint", fl, "ptr", pdv, "int")
        return result
    }

    /**
     * The AddFontMemResourceEx function adds the font resource from a memory image to the system.
     * @param {Pointer} pFileView A pointer to a font resource.
     * @param {Integer} cjSize The number of bytes in the font resource that is pointed to by <i>pbFont</i>.
     * @param {Pointer<Integer>} pNumFonts A pointer to a variable that specifies the number of fonts installed.
     * @returns {HANDLE} If the function succeeds, the return value specifies the handle to the font added. This handle uniquely identifies the fonts that were installed on the system. If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-addfontmemresourceex
     * @since windows5.0
     */
    static AddFontMemResourceEx(pFileView, cjSize, pNumFonts) {
        static pvResrved := 0 ;Reserved parameters must always be NULL

        pNumFontsMarshal := pNumFonts is VarRef ? "uint*" : "ptr"

        result := DllCall("GDI32.dll\AddFontMemResourceEx", "ptr", pFileView, "uint", cjSize, "ptr", pvResrved, pNumFontsMarshal, pNumFonts, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * The RemoveFontMemResourceEx function removes the fonts added from a memory image file.
     * @param {HANDLE} h A handle to the font-resource. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-addfontmemresourceex">AddFontMemResourceEx</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-removefontmemresourceex
     * @since windows5.0
     */
    static RemoveFontMemResourceEx(h) {
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\RemoveFontMemResourceEx", "ptr", h, "int")
        return result
    }

    /**
     * The CreateFontIndirectEx function specifies a logical font that has the characteristics in the specified structure. The font can subsequently be selected as the current font for any device context.
     * @param {Pointer<ENUMLOGFONTEXDVA>} param0 
     * @returns {HFONT} If the function succeeds, the return value is the handle to the new <a href="/windows/desktop/api/wingdi/ns-wingdi-enumlogfontexdva">ENUMLOGFONTEXDV</a> structure.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createfontindirectexa
     * @since windows5.0
     */
    static CreateFontIndirectExA(param0) {
        result := DllCall("GDI32.dll\CreateFontIndirectExA", "ptr", param0, "ptr")
        return HFONT({Value: result}, True)
    }

    /**
     * The CreateFontIndirectEx function specifies a logical font that has the characteristics in the specified structure. The font can subsequently be selected as the current font for any device context.
     * @param {Pointer<ENUMLOGFONTEXDVW>} param0 
     * @returns {HFONT} If the function succeeds, the return value is the handle to the new <a href="/windows/desktop/api/wingdi/ns-wingdi-enumlogfontexdva">ENUMLOGFONTEXDV</a> structure.
     * 
     * If the function fails, the return value is zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createfontindirectexw
     * @since windows5.0
     */
    static CreateFontIndirectExW(param0) {
        result := DllCall("GDI32.dll\CreateFontIndirectExW", "ptr", param0, "ptr")
        return HFONT({Value: result}, True)
    }

    /**
     * The GetViewportExtEx function retrieves the x-extent and y-extent of the current viewport for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<SIZE>} lpsize A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the x- and y-extents, in device units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getviewportextex
     * @since windows5.0
     */
    static GetViewportExtEx(hdc, lpsize) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetViewportExtEx", "ptr", hdc, "ptr", lpsize, "int")
        return result
    }

    /**
     * The GetViewportOrgEx function retrieves the x-coordinates and y-coordinates of the viewport origin for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} lppoint A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the coordinates of the origin, in device units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getviewportorgex
     * @since windows5.0
     */
    static GetViewportOrgEx(hdc, lppoint) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetViewportOrgEx", "ptr", hdc, "ptr", lppoint, "int")
        return result
    }

    /**
     * This function retrieves the x-extent and y-extent of the window for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<SIZE>} lpsize A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the x- and y-extents in page-space units, that is, logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getwindowextex
     * @since windows5.0
     */
    static GetWindowExtEx(hdc, lpsize) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetWindowExtEx", "ptr", hdc, "ptr", lpsize, "int")
        return result
    }

    /**
     * The GetWindowOrgEx function retrieves the x-coordinates and y-coordinates of the window origin for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} lppoint A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the coordinates, in logical units, of the window origin.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getwindoworgex
     * @since windows5.0
     */
    static GetWindowOrgEx(hdc, lppoint) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetWindowOrgEx", "ptr", hdc, "ptr", lppoint, "int")
        return result
    }

    /**
     * The IntersectClipRect function creates a new clipping region from the intersection of the current clipping region and the specified rectangle.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} left The x-coordinate, in logical units, of the upper-left corner of the rectangle.
     * @param {Integer} top The y-coordinate, in logical units, of the upper-left corner of the rectangle.
     * @param {Integer} right The x-coordinate, in logical units, of the lower-right corner of the rectangle.
     * @param {Integer} bottom The y-coordinate, in logical units, of the lower-right corner of the rectangle.
     * @returns {Integer} The return value specifies the new clipping region's type and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred. (The current clipping region is unaffected.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-intersectcliprect
     * @since windows5.0
     */
    static IntersectClipRect(hdc, left, top, right, bottom) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\IntersectClipRect", "ptr", hdc, "int", left, "int", top, "int", right, "int", bottom, "int")
        return result
    }

    /**
     * The InvertRgn function inverts the colors in the specified region.
     * @param {HDC} hdc Handle to the device context.
     * @param {HRGN} hrgn Handle to the region for which colors are inverted. The region's coordinates are presumed to be logical coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-invertrgn
     * @since windows5.0
     */
    static InvertRgn(hdc, hrgn) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\InvertRgn", "ptr", hdc, "ptr", hrgn, "int")
        return result
    }

    /**
     * The LineDDA function determines which pixels should be highlighted for a line defined by the specified starting and ending points.
     * @param {Integer} xStart Specifies the x-coordinate, in logical units, of the line's starting point.
     * @param {Integer} yStart Specifies the y-coordinate, in logical units, of the line's starting point.
     * @param {Integer} xEnd Specifies the x-coordinate, in logical units, of the line's ending point.
     * @param {Integer} yEnd Specifies the y-coordinate, in logical units, of the line's ending point.
     * @param {Pointer<LINEDDAPROC>} lpProc Pointer to an application-defined callback function. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nc-wingdi-lineddaproc">LineDDAProc</a> callback function.
     * @param {LPARAM} data Pointer to the application-defined data.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-linedda
     * @since windows5.0
     */
    static LineDDA(xStart, yStart, xEnd, yEnd, lpProc, data) {
        result := DllCall("GDI32.dll\LineDDA", "int", xStart, "int", yStart, "int", xEnd, "int", yEnd, "ptr", lpProc, "ptr", data, "int")
        return result
    }

    /**
     * The LineTo function draws a line from the current position up to, but not including, the specified point.
     * @param {HDC} hdc Handle to a device context.
     * @param {Integer} x Specifies the x-coordinate, in logical units, of the line's ending point.
     * @param {Integer} y Specifies the y-coordinate, in logical units, of the line's ending point.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-lineto
     * @since windows5.0
     */
    static LineTo(hdc, x, y) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\LineTo", "ptr", hdc, "int", x, "int", y, "int")
        return result
    }

    /**
     * The MaskBlt function combines the color data for the source and destination bitmaps using the specified mask and raster operation.
     * @param {HDC} hdcDest A handle to the destination device context.
     * @param {Integer} xDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} width The width, in logical units, of the destination rectangle and source bitmap.
     * @param {Integer} height The height, in logical units, of the destination rectangle and source bitmap.
     * @param {HDC} hdcSrc A handle to the device context from which the bitmap is to be copied. It must be zero if the <i>dwRop</i> parameter specifies a raster operation that does not include a source.
     * @param {Integer} xSrc The x-coordinate, in logical units, of the upper-left corner of the source bitmap.
     * @param {Integer} ySrc The y-coordinate, in logical units, of the upper-left corner of the source bitmap.
     * @param {HBITMAP} hbmMask A handle to the monochrome mask bitmap combined with the color bitmap in the source device context.
     * @param {Integer} xMask The horizontal pixel offset for the mask bitmap specified by the <i>hbmMask</i> parameter.
     * @param {Integer} yMask The vertical pixel offset for the mask bitmap specified by the <i>hbmMask</i> parameter.
     * @param {Integer} rop The foreground and background ternary raster operation codes (ROPs) that the function uses to control the combination of source and destination data. The background raster operation code is stored in the high-order byte of the high-order word of this value; the foreground raster operation code is stored in the low-order byte of the high-order word of this value; the low-order word of this value is ignored, and should be zero. The macro <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-makerop4">MAKEROP4</a> creates such combinations of foreground and background raster operation codes.
     * 
     * For a discussion of foreground and background in the context of this function, see the following Remarks section.
     * 
     * For a list of common raster operation codes (ROPs), see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-bitblt">BitBlt</a> function. Note that the CAPTUREBLT ROP generally cannot be used for printing device contexts.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-maskblt
     * @since windows5.0
     */
    static MaskBlt(hdcDest, xDest, yDest, width, height, hdcSrc, xSrc, ySrc, hbmMask, xMask, yMask, rop) {
        hdcDest := hdcDest is Win32Handle ? NumGet(hdcDest, "ptr") : hdcDest
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := DllCall("GDI32.dll\MaskBlt", "ptr", hdcDest, "int", xDest, "int", yDest, "int", width, "int", height, "ptr", hdcSrc, "int", xSrc, "int", ySrc, "ptr", hbmMask, "int", xMask, "int", yMask, "uint", rop, "int")
        return result
    }

    /**
     * The PlgBlt function performs a bit-block transfer of the bits of color data from the specified rectangle in the source device context to the specified parallelogram in the destination device context.
     * @param {HDC} hdcDest A handle to the destination device context.
     * @param {Pointer<POINT>} lpPoint A pointer to an array of three points in logical space that identify three corners of the destination parallelogram. The upper-left corner of the source rectangle is mapped to the first point in this array, the upper-right corner to the second point in this array, and the lower-left corner to the third point. The lower-right corner of the source rectangle is mapped to the implicit fourth point in the parallelogram.
     * @param {HDC} hdcSrc A handle to the source device context.
     * @param {Integer} xSrc The x-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} ySrc The y-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} width The width, in logical units, of the source rectangle.
     * @param {Integer} height The height, in logical units, of the source rectangle.
     * @param {HBITMAP} hbmMask A handle to an optional monochrome bitmap that is used to mask the colors of the source rectangle.
     * @param {Integer} xMask The x-coordinate, in logical units, of the upper-left corner of the monochrome bitmap.
     * @param {Integer} yMask The y-coordinate, in logical units, of the upper-left corner of the monochrome bitmap.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-plgblt
     * @since windows5.0
     */
    static PlgBlt(hdcDest, lpPoint, hdcSrc, xSrc, ySrc, width, height, hbmMask, xMask, yMask) {
        hdcDest := hdcDest is Win32Handle ? NumGet(hdcDest, "ptr") : hdcDest
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := DllCall("GDI32.dll\PlgBlt", "ptr", hdcDest, "ptr", lpPoint, "ptr", hdcSrc, "int", xSrc, "int", ySrc, "int", width, "int", height, "ptr", hbmMask, "int", xMask, "int", yMask, "int")
        return result
    }

    /**
     * The OffsetClipRgn function moves the clipping region of a device context by the specified offsets.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The number of logical units to move left or right.
     * @param {Integer} y The number of logical units to move up or down.
     * @returns {Integer} The return value specifies the new region's complexity and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred. (The current clipping region is unaffected.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-offsetcliprgn
     * @since windows5.0
     */
    static OffsetClipRgn(hdc, x, y) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\OffsetClipRgn", "ptr", hdc, "int", x, "int", y, "int")
        return result
    }

    /**
     * The OffsetRgn function moves a region by the specified offsets.
     * @param {HRGN} hrgn Handle to the region to be moved.
     * @param {Integer} x Specifies the number of logical units to move left or right.
     * @param {Integer} y Specifies the number of logical units to move up or down.
     * @returns {Integer} The return value specifies the new region's complexity. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>NULLREGION</td>
     * <td>Region is empty.</td>
     * </tr>
     * <tr>
     * <td>SIMPLEREGION</td>
     * <td>Region is a single rectangle.</td>
     * </tr>
     * <tr>
     * <td>COMPLEXREGION</td>
     * <td>Region is more than one rectangle.</td>
     * </tr>
     * <tr>
     * <td>ERROR</td>
     * <td>An error occurred; region is unaffected.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-offsetrgn
     * @since windows5.0
     */
    static OffsetRgn(hrgn, x, y) {
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\OffsetRgn", "ptr", hrgn, "int", x, "int", y, "int")
        return result
    }

    /**
     * The PatBlt function paints the specified rectangle using the brush that is currently selected into the specified device context. The brush color and the surface color or colors are combined by using the specified raster operation.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical units, of the upper-left corner of the rectangle to be filled.
     * @param {Integer} y The y-coordinate, in logical units, of the upper-left corner of the rectangle to be filled.
     * @param {Integer} w The width, in logical units, of the rectangle.
     * @param {Integer} h The height, in logical units, of the rectangle.
     * @param {Integer} rop 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-patblt
     * @since windows5.0
     */
    static PatBlt(hdc, x, y, w, h, rop) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PatBlt", "ptr", hdc, "int", x, "int", y, "int", w, "int", h, "uint", rop, "int")
        return result
    }

    /**
     * The Pie function draws a pie-shaped wedge bounded by the intersection of an ellipse and two radials. The pie is outlined by using the current pen and filled by using the current brush.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} left The x-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
     * @param {Integer} top The y-coordinate, in logical coordinates, of the upper-left corner of the bounding rectangle.
     * @param {Integer} right The x-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
     * @param {Integer} bottom The y-coordinate, in logical coordinates, of the lower-right corner of the bounding rectangle.
     * @param {Integer} xr1 The x-coordinate, in logical coordinates, of the endpoint of the first radial.
     * @param {Integer} yr1 The y-coordinate, in logical coordinates, of the endpoint of the first radial.
     * @param {Integer} xr2 The x-coordinate, in logical coordinates, of the endpoint of the second radial.
     * @param {Integer} yr2 The y-coordinate, in logical coordinates, of the endpoint of the second radial.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-pie
     * @since windows5.0
     */
    static Pie(hdc, left, top, right, bottom, xr1, yr1, xr2, yr2) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Pie", "ptr", hdc, "int", left, "int", top, "int", right, "int", bottom, "int", xr1, "int", yr1, "int", xr2, "int", yr2, "int")
        return result
    }

    /**
     * The PlayMetaFile function displays the picture stored in the given Windows-format metafile on the specified device.
     * @param {HDC} hdc Handle to a device context.
     * @param {HMETAFILE} hmf Handle to a Windows-format metafile.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-playmetafile
     * @since windows5.0
     */
    static PlayMetaFile(hdc, hmf) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hmf := hmf is Win32Handle ? NumGet(hmf, "ptr") : hmf

        result := DllCall("GDI32.dll\PlayMetaFile", "ptr", hdc, "ptr", hmf, "int")
        return result
    }

    /**
     * The PaintRgn function paints the specified region by using the brush currently selected into the device context.
     * @param {HDC} hdc Handle to the device context.
     * @param {HRGN} hrgn Handle to the region to be filled. The region's coordinates are presumed to be logical coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-paintrgn
     * @since windows5.0
     */
    static PaintRgn(hdc, hrgn) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\PaintRgn", "ptr", hdc, "ptr", hrgn, "int")
        return result
    }

    /**
     * The PolyPolygon function draws a series of closed polygons. Each polygon is outlined by using the current pen and filled by using the current brush and polygon fill mode. The polygons drawn by this function can overlap.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that define the vertices of the polygons, in logical coordinates. The polygons are specified consecutively. Each polygon is closed automatically by drawing a line from the last vertex to the first. Each vertex should be specified once.
     * @param {Pointer<Integer>} asz A pointer to an array of integers, each of which specifies the number of points in the corresponding polygon. Each integer must be greater than or equal to 2.
     * @param {Integer} csz The total number of polygons.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polypolygon
     * @since windows5.0
     */
    static PolyPolygon(hdc, apt, asz, csz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        aszMarshal := asz is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\PolyPolygon", "ptr", hdc, "ptr", apt, aszMarshal, asz, "int", csz, "int")
        return result
    }

    /**
     * The PtInRegion function determines whether the specified point is inside the specified region.
     * @param {HRGN} hrgn Handle to the region to be examined.
     * @param {Integer} x Specifies the x-coordinate of the point in logical units.
     * @param {Integer} y Specifies the y-coordinate of the point in logical units.
     * @returns {BOOL} If the specified point is in the region, the return value is nonzero.
     * 
     * If the specified point is not in the region, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-ptinregion
     * @since windows5.0
     */
    static PtInRegion(hrgn, x, y) {
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\PtInRegion", "ptr", hrgn, "int", x, "int", y, "int")
        return result
    }

    /**
     * The PtVisible function determines whether the specified point is within the clipping region of a device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical units, of the point.
     * @param {Integer} y The y-coordinate, in logical units, of the point.
     * @returns {BOOL} If the specified point is within the clipping region of the device context, the return value is <b>TRUE</b>(1).
     * 
     * If the specified point is not within the clipping region of the device context, the return value is <b>FALSE</b>(0).
     * 
     * If the <b>HDC</b> is not valid, the return value is (BOOL)-1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-ptvisible
     * @since windows5.0
     */
    static PtVisible(hdc, x, y) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PtVisible", "ptr", hdc, "int", x, "int", y, "int")
        return result
    }

    /**
     * The RectInRegion function determines whether any part of the specified rectangle is within the boundaries of a region.
     * @param {HRGN} hrgn Handle to the region.
     * @param {Pointer<RECT>} lprect Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the rectangle in logical units. The lower and right edges of the rectangle are not included.
     * @returns {BOOL} If any part of the specified rectangle lies within the boundaries of the region, the return value is nonzero.
     * 
     * If no part of the specified rectangle lies within the boundaries of the region, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-rectinregion
     * @since windows5.0
     */
    static RectInRegion(hrgn, lprect) {
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\RectInRegion", "ptr", hrgn, "ptr", lprect, "int")
        return result
    }

    /**
     * The RectVisible function determines whether any part of the specified rectangle lies within the clipping region of a device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<RECT>} lprect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the specified rectangle.
     * @returns {BOOL} If the current transform does not have a rotation and the rectangle lies within the clipping region, the return value is <b>TRUE</b> (1).
     * 
     * If the current transform does not have a rotation and the rectangle does not lie within the clipping region, the return value is <b>FALSE</b> (0).
     * 
     * If the current transform has a rotation and the rectangle lies within the clipping region, the return value is 2.
     * 
     * If the current transform has a rotation and the rectangle does not lie within the clipping region, the return value is 1.
     * 
     * All other return values are considered error codes. If the any parameter is not valid, the return value is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-rectvisible
     * @since windows5.0
     */
    static RectVisible(hdc, lprect) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\RectVisible", "ptr", hdc, "ptr", lprect, "int")
        return result
    }

    /**
     * The Rectangle function draws a rectangle. The rectangle is outlined by using the current pen and filled by using the current brush.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} left The x-coordinate, in logical coordinates, of the upper-left corner of the rectangle.
     * @param {Integer} top The y-coordinate, in logical coordinates, of the upper-left corner of the rectangle.
     * @param {Integer} right The x-coordinate, in logical coordinates, of the lower-right corner of the rectangle.
     * @param {Integer} bottom The y-coordinate, in logical coordinates, of the lower-right corner of the rectangle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-rectangle
     * @since windows5.0
     */
    static Rectangle(hdc, left, top, right, bottom) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Rectangle", "ptr", hdc, "int", left, "int", top, "int", right, "int", bottom, "int")
        return result
    }

    /**
     * The RestoreDC function restores a device context (DC) to the specified state. The DC is restored by popping state information off a stack created by earlier calls to the SaveDC function.
     * @param {HDC} hdc A handle to the DC.
     * @param {Integer} nSavedDC The saved state to be restored. If this parameter is positive, <i>nSavedDC</i> represents a specific instance of the state to be restored. If this parameter is negative, <i>nSavedDC</i> represents an instance relative to the current state. For example, -1 restores the most recently saved state.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-restoredc
     * @since windows5.0
     */
    static RestoreDC(hdc, nSavedDC) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\RestoreDC", "ptr", hdc, "int", nSavedDC, "int")
        return result
    }

    /**
     * The ResetDC function updates the specified printer or plotter device context (DC) using the specified information.
     * @param {HDC} hdc A handle to the DC to update.
     * @param {Pointer<DEVMODEA>} lpdm A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure containing information about the new DC.
     * @returns {HDC} If the function succeeds, the return value is a handle to the original DC.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-resetdca
     * @since windows5.0
     */
    static ResetDCA(hdc, lpdm) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ResetDCA", "ptr", hdc, "ptr", lpdm, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The ResetDC function updates the specified printer or plotter device context (DC) using the specified information.
     * @param {HDC} hdc A handle to the DC to update.
     * @param {Pointer<DEVMODEW>} lpdm A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure containing information about the new DC.
     * @returns {HDC} If the function succeeds, the return value is a handle to the original DC.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-resetdcw
     * @since windows5.0
     */
    static ResetDCW(hdc, lpdm) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ResetDCW", "ptr", hdc, "ptr", lpdm, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The RealizePalette function maps palette entries from the current logical palette to the system palette.
     * @param {HDC} hdc A handle to the device context into which a logical palette has been selected.
     * @returns {Integer} If the function succeeds, the return value is the number of entries in the logical palette mapped to the system palette.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-realizepalette
     * @since windows5.0
     */
    static RealizePalette(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\RealizePalette", "ptr", hdc, "uint")
        return result
    }

    /**
     * The RemoveFontResource function removes the fonts in the specified file from the system font table.
     * @param {PSTR} lpFileName A pointer to a null-terminated string that names a font resource file.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-removefontresourcea
     * @since windows5.0
     */
    static RemoveFontResourceA(lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("GDI32.dll\RemoveFontResourceA", "ptr", lpFileName, "int")
        return result
    }

    /**
     * The RemoveFontResource function removes the fonts in the specified file from the system font table.
     * @param {PWSTR} lpFileName A pointer to a null-terminated string that names a font resource file.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-removefontresourcew
     * @since windows5.0
     */
    static RemoveFontResourceW(lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("GDI32.dll\RemoveFontResourceW", "ptr", lpFileName, "int")
        return result
    }

    /**
     * The RoundRect function draws a rectangle with rounded corners. The rectangle is outlined by using the current pen and filled by using the current brush.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} left The x-coordinate, in logical coordinates, of the upper-left corner of the rectangle.
     * @param {Integer} top The y-coordinate, in logical coordinates, of the upper-left corner of the rectangle.
     * @param {Integer} right The x-coordinate, in logical coordinates, of the lower-right corner of the rectangle.
     * @param {Integer} bottom The y-coordinate, in logical coordinates, of the lower-right corner of the rectangle.
     * @param {Integer} width The width, in logical coordinates, of the ellipse used to draw the rounded corners.
     * @param {Integer} height The height, in logical coordinates, of the ellipse used to draw the rounded corners.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-roundrect
     * @since windows5.0
     */
    static RoundRect(hdc, left, top, right, bottom, width, height) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\RoundRect", "ptr", hdc, "int", left, "int", top, "int", right, "int", bottom, "int", width, "int", height, "int")
        return result
    }

    /**
     * The ResizePalette function increases or decreases the size of a logical palette based on the specified value.
     * @param {HPALETTE} hpal A handle to the palette to be changed.
     * @param {Integer} n The number of entries in the palette after it has been resized.
     * 
     * The number of entries is limited to 1024.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-resizepalette
     * @since windows5.0
     */
    static ResizePalette(hpal, n) {
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal

        result := DllCall("GDI32.dll\ResizePalette", "ptr", hpal, "uint", n, "int")
        return result
    }

    /**
     * The SaveDC function saves the current state of the specified device context (DC) by copying data describing selected objects and graphic modes (such as the bitmap, brush, palette, font, pen, region, drawing mode, and mapping mode) to a context stack.
     * @param {HDC} hdc A handle to the DC whose state is to be saved.
     * @returns {Integer} If the function succeeds, the return value identifies the saved state.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-savedc
     * @since windows5.0
     */
    static SaveDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SaveDC", "ptr", hdc, "int")
        return result
    }

    /**
     * The SelectClipRgn function selects a region as the current clipping region for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {HRGN} hrgn A handle to the region to be selected.
     * @returns {Integer} The return value specifies the region's complexity and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred. (The previous clipping region is unaffected.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-selectcliprgn
     * @since windows5.0
     */
    static SelectClipRgn(hdc, hrgn) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\SelectClipRgn", "ptr", hdc, "ptr", hrgn, "int")
        return result
    }

    /**
     * The ExtSelectClipRgn function combines the specified region with the current clipping region using the specified mode.
     * @param {HDC} hdc A handle to the device context.
     * @param {HRGN} hrgn A handle to the region to be selected. This handle must not be <b>NULL</b> unless the RGN_COPY mode is specified.
     * @param {Integer} mode 
     * @returns {Integer} The return value specifies the new clipping region's complexity; it can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-extselectcliprgn
     * @since windows5.0
     */
    static ExtSelectClipRgn(hdc, hrgn, mode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\ExtSelectClipRgn", "ptr", hdc, "ptr", hrgn, "int", mode, "int")
        return result
    }

    /**
     * The SetMetaRgn function intersects the current clipping region for the specified device context with the current metaregion and saves the combined region as the new metaregion for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @returns {Integer} The return value specifies the new clipping region's complexity and can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred. (The previous clipping region is unaffected.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setmetargn
     * @since windows5.0
     */
    static SetMetaRgn(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetMetaRgn", "ptr", hdc, "int")
        return result
    }

    /**
     * The SelectObject function selects an object into the specified device context (DC). The new object replaces the previous object of the same type.
     * @param {HDC} hdc A handle to the DC.
     * @param {HGDIOBJ} h A handle to the object to be selected. The specified object must have been created by using one of the following functions.
     * 
     * <table>
     * <tr>
     * <th>Object</th>
     * <th>Functions</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Bitmap"></a><a id="bitmap"></a><a id="BITMAP"></a><dl>
     * <dt><b>Bitmap</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createbitmap">CreateBitmap</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createbitmapindirect">CreateBitmapIndirect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createcompatiblebitmap">CreateCompatibleBitmap</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibitmap">CreateDIBitmap</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a>
     * 
     * 
     * Bitmaps can only be selected into memory DC's. A single bitmap cannot be selected into more than one DC at the same time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Brush"></a><a id="brush"></a><a id="BRUSH"></a><dl>
     * <dt><b>Brush</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createbrushindirect">CreateBrushIndirect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibpatternbrush">CreateDIBPatternBrush</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibpatternbrushpt">CreateDIBPatternBrushPt</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createhatchbrush">CreateHatchBrush</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createpatternbrush">CreatePatternBrush</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createsolidbrush">CreateSolidBrush</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Font"></a><a id="font"></a><a id="FONT"></a><dl>
     * <dt><b>Font</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createfonta">CreateFont</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createfontindirecta">CreateFontIndirect</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Pen"></a><a id="pen"></a><a id="PEN"></a><dl>
     * <dt><b>Pen</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createpen">CreatePen</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createpenindirect">CreatePenIndirect</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Region"></a><a id="region"></a><a id="REGION"></a><dl>
     * <dt><b>Region</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-combinergn">CombineRgn</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createellipticrgn">CreateEllipticRgn</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createellipticrgnindirect">CreateEllipticRgnIndirect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createpolygonrgn">CreatePolygonRgn</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createrectrgn">CreateRectRgn</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createrectrgnindirect">CreateRectRgnIndirect</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HGDIOBJ} If the selected object is not a region and the function succeeds, the return value is a handle to the object being replaced. If the selected object is a region and the function succeeds, the return value is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>SIMPLEREGION</td>
     * <td>Region consists of a single rectangle.</td>
     * </tr>
     * <tr>
     * <td>COMPLEXREGION</td>
     * <td>Region consists of more than one rectangle.</td>
     * </tr>
     * <tr>
     * <td>NULLREGION</td>
     * <td>Region is empty.</td>
     * </tr>
     * </table>
     *  
     * 
     * If an error occurs and the selected object is not a region, the return value is <b>NULL</b>. Otherwise, it is HGDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-selectobject
     * @since windows5.0
     */
    static SelectObject(hdc, h) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\SelectObject", "ptr", hdc, "ptr", h, "ptr")
        return HGDIOBJ({Value: result}, True)
    }

    /**
     * The SelectPalette function selects the specified logical palette into a device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {HPALETTE} hPal A handle to the logical palette to be selected.
     * @param {BOOL} bForceBkgd Specifies whether the logical palette is forced to be a background palette. If this value is <b>TRUE</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-realizepalette">RealizePalette</a> function causes the logical palette to be mapped to the colors already in the physical palette in the best possible way. This is always done, even if the window for which the palette is realized belongs to a thread without active focus.
     * 
     * If this value is <b>FALSE</b>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-realizepalette">RealizePalette</a> causes the logical palette to be copied into the device palette when the application is in the foreground. (If the <i>hdc</i> parameter is a memory device context, this parameter is ignored.)
     * @returns {HPALETTE} If the function succeeds, the return value is a handle to the device context's previous logical palette.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-selectpalette
     * @since windows5.0
     */
    static SelectPalette(hdc, hPal, bForceBkgd) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hPal := hPal is Win32Handle ? NumGet(hPal, "ptr") : hPal

        result := DllCall("GDI32.dll\SelectPalette", "ptr", hdc, "ptr", hPal, "int", bForceBkgd, "ptr")
        return HPALETTE({Value: result}, True)
    }

    /**
     * The SetBkColor function sets the current background color to the specified color value, or to the nearest physical color if the device cannot represent the specified color value.
     * @param {HDC} hdc A handle to the device context.
     * @param {COLORREF} color The new background color. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {COLORREF} If the function succeeds, the return value specifies the previous background color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setbkcolor
     * @since windows5.0
     */
    static SetBkColor(hdc, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetBkColor", "ptr", hdc, "uint", color, "uint")
        return result
    }

    /**
     * SetDCBrushColor function sets the current device context (DC) brush color to the specified color value. If the device cannot represent the specified color value, the color is set to the nearest physical color.
     * @param {HDC} hdc A handle to the DC.
     * @param {COLORREF} color The new brush color.
     * @returns {COLORREF} If the function succeeds, the return value specifies the previous DC brush color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setdcbrushcolor
     * @since windows5.0
     */
    static SetDCBrushColor(hdc, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetDCBrushColor", "ptr", hdc, "uint", color, "uint")
        return result
    }

    /**
     * SetDCPenColor function sets the current device context (DC) pen color to the specified color value. If the device cannot represent the specified color value, the color is set to the nearest physical color.
     * @param {HDC} hdc A handle to the DC.
     * @param {COLORREF} color The new pen color.
     * @returns {COLORREF} If the function succeeds, the return value specifies the previous DC pen color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value. If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setdcpencolor
     * @since windows5.0
     */
    static SetDCPenColor(hdc, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetDCPenColor", "ptr", hdc, "uint", color, "uint")
        return result
    }

    /**
     * The SetBkMode function sets the background mix mode of the specified device context. The background mix mode is used with text, hatched brushes, and pen styles that are not solid lines.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} mode 
     * @returns {Integer} If the function succeeds, the return value specifies the previous background mode.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setbkmode
     * @since windows5.0
     */
    static SetBkMode(hdc, mode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetBkMode", "ptr", hdc, "int", mode, "int")
        return result
    }

    /**
     * The SetBitmapBits function sets the bits of color data for a bitmap to the specified values.
     * @param {HBITMAP} hbm A handle to the bitmap to be set. This must be a compatible bitmap (DDB).
     * @param {Integer} cb The number of bytes pointed to by the <i>lpBits</i> parameter.
     * @param {Pointer} pvBits A pointer to an array of bytes that contain color data for the specified bitmap.
     * @returns {Integer} If the function succeeds, the return value is the number of bytes used in setting the bitmap bits.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setbitmapbits
     * @since windows5.0
     */
    static SetBitmapBits(hbm, cb, pvBits) {
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm

        result := DllCall("GDI32.dll\SetBitmapBits", "ptr", hbm, "uint", cb, "ptr", pvBits, "int")
        return result
    }

    /**
     * The SetBoundsRect function controls the accumulation of bounding rectangle information for the specified device context.
     * @param {HDC} hdc A handle to the device context for which to accumulate bounding rectangles.
     * @param {Pointer<RECT>} lprect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure used to set the bounding rectangle. Rectangle dimensions are in logical coordinates. This parameter can be <b>NULL</b>.
     * @param {Integer} flags 
     * @returns {Integer} If the function succeeds, the return value specifies the previous state of the bounding rectangle. This state can be a combination of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DCB_DISABLE</td>
     * <td>Boundary accumulation is off.</td>
     * </tr>
     * <tr>
     * <td>DCB_ENABLE</td>
     * <td>Boundary accumulation is on. DCB_ENABLE and DCB_DISABLE are mutually exclusive.</td>
     * </tr>
     * <tr>
     * <td>DCB_RESET</td>
     * <td>Bounding rectangle is empty.</td>
     * </tr>
     * <tr>
     * <td>DCB_SET</td>
     * <td>Bounding rectangle is not empty. DCB_SET and DCB_RESET are mutually exclusive.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setboundsrect
     * @since windows5.0
     */
    static SetBoundsRect(hdc, lprect, flags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetBoundsRect", "ptr", hdc, "ptr", lprect, "uint", flags, "uint")
        return result
    }

    /**
     * The SetDIBits function sets the pixels in a compatible bitmap (DDB) using the color data found in the specified DIB.
     * @param {HDC} hdc A handle to a device context.
     * @param {HBITMAP} hbm A handle to the compatible bitmap (DDB) that is to be altered using the color data from the specified DIB.
     * @param {Integer} start The starting scan line for the device-independent color data in the array pointed to by the <i>lpvBits</i> parameter.
     * @param {Integer} cLines The number of scan lines found in the array containing device-independent color data.
     * @param {Pointer<Void>} lpBits A pointer to the DIB color data, stored as an array of bytes. The format of the bitmap values depends on the <b>biBitCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure pointed to by the <i>lpbmi</i> parameter.
     * @param {Pointer<BITMAPINFO>} lpbmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure that contains information about the DIB.
     * @param {Integer} ColorUse 
     * @returns {Integer} If the function succeeds, the return value is the number of scan lines copied.
     * 
     * If the function fails, the return value is zero.
     * 
     * This can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setdibits
     * @since windows5.0
     */
    static SetDIBits(hdc, hbm, start, cLines, lpBits, lpbmi, ColorUse) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm

        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\SetDIBits", "ptr", hdc, "ptr", hbm, "uint", start, "uint", cLines, lpBitsMarshal, lpBits, "ptr", lpbmi, "uint", ColorUse, "int")
        return result
    }

    /**
     * The SetDIBitsToDevice function sets the pixels in the specified rectangle on the device that is associated with the destination device context using color data from a DIB, JPEG, or PNG image.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} xDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} w The width, in logical units, of the image.
     * @param {Integer} h The height, in logical units, of the image.
     * @param {Integer} xSrc The x-coordinate, in logical units, of the lower-left corner of the image.
     * @param {Integer} ySrc The y-coordinate, in logical units, of the lower-left corner of the image.
     * @param {Integer} StartScan The starting scan line in the image.
     * @param {Integer} cLines The number of DIB scan lines contained in the array pointed to by the <i>lpvBits</i> parameter.
     * @param {Pointer<Void>} lpvBits A pointer to the color data stored as an array of bytes. For more information, see the following Remarks section.
     * @param {Pointer<BITMAPINFO>} lpbmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure that contains information about the DIB.
     * @param {Integer} ColorUse Indicates whether the <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure contains explicit red, green, blue (RGB) values or indexes into a palette. For more information, see the following Remarks section.
     * @returns {Integer} If the function succeeds, the return value is the number of scan lines set.
     * 
     * If zero scan lines are set (such as when <i>dwHeight</i> is 0) or the function fails, the function returns zero.
     * 
     * If the driver cannot support the JPEG or PNG file image passed to <b>SetDIBitsToDevice</b>, the function will fail and return GDI_ERROR. If failure does occur, the application must fall back on its own JPEG or PNG support to decompress the image into a bitmap, and then pass the bitmap to <b>SetDIBitsToDevice</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setdibitstodevice
     * @since windows5.0
     */
    static SetDIBitsToDevice(hdc, xDest, yDest, w, h, xSrc, ySrc, StartScan, cLines, lpvBits, lpbmi, ColorUse) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpvBitsMarshal := lpvBits is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\SetDIBitsToDevice", "ptr", hdc, "int", xDest, "int", yDest, "uint", w, "uint", h, "int", xSrc, "int", ySrc, "uint", StartScan, "uint", cLines, lpvBitsMarshal, lpvBits, "ptr", lpbmi, "uint", ColorUse, "int")
        return result
    }

    /**
     * The SetMapperFlags function alters the algorithm the font mapper uses when it maps logical fonts to physical fonts.
     * @param {HDC} hdc A handle to the device context that contains the font-mapper flag.
     * @param {Integer} flags Specifies whether the font mapper should attempt to match a font's aspect ratio to the current device's aspect ratio. If bit zero is set, the mapper selects only matching fonts.
     * @returns {Integer} If the function succeeds, the return value is the previous value of the font-mapper flag.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setmapperflags
     * @since windows5.0
     */
    static SetMapperFlags(hdc, flags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetMapperFlags", "ptr", hdc, "uint", flags, "uint")
        return result
    }

    /**
     * The SetGraphicsMode function sets the graphics mode for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iMode 
     * @returns {Integer} If the function succeeds, the return value is the old graphics mode.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setgraphicsmode
     * @since windows5.0
     */
    static SetGraphicsMode(hdc, iMode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetGraphicsMode", "ptr", hdc, "int", iMode, "int")
        return result
    }

    /**
     * The SetMapMode function sets the mapping mode of the specified device context. The mapping mode defines the unit of measure used to transform page-space units into device-space units, and also defines the orientation of the device's x and y axes.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iMode 
     * @returns {Integer} If the function succeeds, the return value identifies the previous mapping mode.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setmapmode
     * @since windows5.0
     */
    static SetMapMode(hdc, iMode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetMapMode", "ptr", hdc, "int", iMode, "int")
        return result
    }

    /**
     * The SetLayout function changes the layout of a device context (DC).
     * @param {HDC} hdc A handle to the DC.
     * @param {Integer} l 
     * @returns {Integer} If the function succeeds, it returns the previous layout of the DC.
     * 
     * If the function fails, it returns GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setlayout
     * @since windows5.0
     */
    static SetLayout(hdc, l) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetLayout", "ptr", hdc, "uint", l, "uint")
        return result
    }

    /**
     * The GetLayout function returns the layout of a device context (DC).
     * @param {HDC} hdc A handle to the device context.
     * @returns {Integer} If the function succeeds, it returns the layout flags for the current device context.
     * 
     * If the function fails, it returns GDI_ERROR. For extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getlayout
     * @since windows5.0
     */
    static GetLayout(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        A_LastError := 0

        result := DllCall("GDI32.dll\GetLayout", "ptr", hdc, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SetMetaFileBitsEx function creates a memory-based Windows-format metafile from the supplied data.
     * @param {Integer} cbBuffer Specifies the size, in bytes, of the Windows-format metafile.
     * @param {Pointer} lpData Pointer to a buffer that contains the Windows-format metafile. (It is assumed that the data was obtained by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getmetafilebitsex">GetMetaFileBitsEx</a> function.)
     * @returns {HMETAFILE} If the function succeeds, the return value is a handle to a memory-based Windows-format metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setmetafilebitsex
     * @since windows5.0
     */
    static SetMetaFileBitsEx(cbBuffer, lpData) {
        result := DllCall("GDI32.dll\SetMetaFileBitsEx", "uint", cbBuffer, "ptr", lpData, "ptr")
        return HMETAFILE({Value: result}, True)
    }

    /**
     * The SetPaletteEntries function sets RGB (red, green, blue) color values and flags in a range of entries in a logical palette.
     * @param {HPALETTE} hpal A handle to the logical palette.
     * @param {Integer} iStart The first logical-palette entry to be set.
     * @param {Integer} cEntries The number of logical-palette entries to be set.
     * @param {Pointer<PALETTEENTRY>} pPalEntries A pointer to the first member of an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures containing the RGB values and flags.
     * @returns {Integer} If the function succeeds, the return value is the number of entries that were set in the logical palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpaletteentries
     * @since windows5.0
     */
    static SetPaletteEntries(hpal, iStart, cEntries, pPalEntries) {
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal

        result := DllCall("GDI32.dll\SetPaletteEntries", "ptr", hpal, "uint", iStart, "uint", cEntries, "ptr", pPalEntries, "uint")
        return result
    }

    /**
     * The SetPixel function sets the pixel at the specified coordinates to the specified color.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical units, of the point to be set.
     * @param {Integer} y The y-coordinate, in logical units, of the point to be set.
     * @param {COLORREF} color The color to be used to paint the point. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {COLORREF} If the function succeeds, the return value is the RGB value that the function sets the pixel to. This value may differ from the color specified by <i>crColor</i>; that occurs when an exact match for the specified color cannot be found.
     * 
     * If the function fails, the return value is -1.
     * 
     * This can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpixel
     * @since windows5.0
     */
    static SetPixel(hdc, x, y, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetPixel", "ptr", hdc, "int", x, "int", y, "uint", color, "uint")
        return result
    }

    /**
     * The SetPixelV function sets the pixel at the specified coordinates to the closest approximation of the specified color. The point must be in the clipping region and the visible part of the device surface.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical units, of the point to be set.
     * @param {Integer} y The y-coordinate, in logical units, of the point to be set.
     * @param {COLORREF} color The color to be used to paint the point. To create a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> color value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpixelv
     * @since windows5.0
     */
    static SetPixelV(hdc, x, y, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetPixelV", "ptr", hdc, "int", x, "int", y, "uint", color, "int")
        return result
    }

    /**
     * The SetPolyFillMode function sets the polygon fill mode for functions that fill polygons.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} mode 
     * @returns {Integer} The return value specifies the previous filling mode. If an error occurs, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpolyfillmode
     * @since windows5.0
     */
    static SetPolyFillMode(hdc, mode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetPolyFillMode", "ptr", hdc, "int", mode, "int")
        return result
    }

    /**
     * The StretchBlt function copies a bitmap from a source rectangle into a destination rectangle, stretching or compressing the bitmap to fit the dimensions of the destination rectangle, if necessary.
     * @param {HDC} hdcDest A handle to the destination device context.
     * @param {Integer} xDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} wDest The width, in logical units, of the destination rectangle.
     * @param {Integer} hDest The height, in logical units, of the destination rectangle.
     * @param {HDC} hdcSrc A handle to the source device context.
     * @param {Integer} xSrc The x-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} ySrc The y-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} wSrc The width, in logical units, of the source rectangle.
     * @param {Integer} hSrc The height, in logical units, of the source rectangle.
     * @param {Integer} rop The raster operation to be performed. Raster operation codes define how the system combines colors in output operations that involve a brush, a source bitmap, and a destination bitmap.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-bitblt">BitBlt</a> for a list of common raster operation codes (ROPs). Note that the CAPTUREBLT ROP generally cannot be used for printing device contexts.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-stretchblt
     * @since windows5.0
     */
    static StretchBlt(hdcDest, xDest, yDest, wDest, hDest, hdcSrc, xSrc, ySrc, wSrc, hSrc, rop) {
        hdcDest := hdcDest is Win32Handle ? NumGet(hdcDest, "ptr") : hdcDest
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc

        result := DllCall("GDI32.dll\StretchBlt", "ptr", hdcDest, "int", xDest, "int", yDest, "int", wDest, "int", hDest, "ptr", hdcSrc, "int", xSrc, "int", ySrc, "int", wSrc, "int", hSrc, "uint", rop, "int")
        return result
    }

    /**
     * The SetRectRgn function converts a region into a rectangular region with the specified coordinates.
     * @param {HRGN} hrgn Handle to the region.
     * @param {Integer} left Specifies the x-coordinate of the upper-left corner of the rectangular region in logical units.
     * @param {Integer} top Specifies the y-coordinate of the upper-left corner of the rectangular region in logical units.
     * @param {Integer} right Specifies the x-coordinate of the lower-right corner of the rectangular region in logical units.
     * @param {Integer} bottom Specifies the y-coordinate of the lower-right corner of the rectangular region in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setrectrgn
     * @since windows5.0
     */
    static SetRectRgn(hrgn, left, top, right, bottom) {
        hrgn := hrgn is Win32Handle ? NumGet(hrgn, "ptr") : hrgn

        result := DllCall("GDI32.dll\SetRectRgn", "ptr", hrgn, "int", left, "int", top, "int", right, "int", bottom, "int")
        return result
    }

    /**
     * The StretchDIBits function copies the color data for a rectangle of pixels in a DIB, JPEG, or PNG image to the specified destination rectangle.
     * @param {HDC} hdc A handle to the destination device context.
     * @param {Integer} xDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} DestWidth The width, in logical units, of the destination rectangle.
     * @param {Integer} DestHeight The height, in logical units, of the destination rectangle.
     * @param {Integer} xSrc The x-coordinate, in pixels, of the source rectangle in the image.
     * @param {Integer} ySrc The y-coordinate, in pixels, of the source rectangle in the image.
     * @param {Integer} SrcWidth The width, in pixels, of the source rectangle in the image.
     * @param {Integer} SrcHeight The height, in pixels, of the source rectangle in the image.
     * @param {Pointer<Void>} lpBits A pointer to the image bits, which are stored as an array of bytes. For more information, see the Remarks section.
     * @param {Pointer<BITMAPINFO>} lpbmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure that contains information about the DIB.
     * @param {Integer} iUsage 
     * @param {Integer} rop A raster-operation code that specifies how the source pixels, the destination device context's current brush, and the destination pixels are to be combined to form the new image. For a list of some common raster operation codes, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-bitblt">BitBlt</a>.
     * @returns {Integer} If the function succeeds, the return value is the number of scan lines copied. Note that this value can be negative for mirrored content.
     * 
     * If the function fails, or no scan lines are copied, the return value is 0.
     * 
     * If the driver cannot support the JPEG or PNG file image passed to <b>StretchDIBits</b>, the function will fail and return GDI_ERROR. If failure does occur, the application must fall back on its own JPEG or PNG support to decompress the image into a bitmap, and then pass the bitmap to <b>StretchDIBits</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-stretchdibits
     * @since windows5.0
     */
    static StretchDIBits(hdc, xDest, yDest, DestWidth, DestHeight, xSrc, ySrc, SrcWidth, SrcHeight, lpBits, lpbmi, iUsage, rop) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\StretchDIBits", "ptr", hdc, "int", xDest, "int", yDest, "int", DestWidth, "int", DestHeight, "int", xSrc, "int", ySrc, "int", SrcWidth, "int", SrcHeight, lpBitsMarshal, lpBits, "ptr", lpbmi, "uint", iUsage, "uint", rop, "int")
        return result
    }

    /**
     * The SetROP2 function sets the current foreground mix mode.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} rop2 
     * @returns {Integer} If the function succeeds, the return value specifies the previous mix mode.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setrop2
     * @since windows5.0
     */
    static SetROP2(hdc, rop2) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetROP2", "ptr", hdc, "int", rop2, "int")
        return result
    }

    /**
     * The SetStretchBltMode function sets the bitmap stretching mode in the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} mode 
     * @returns {Integer} If the function succeeds, the return value is the previous stretching mode.
     * 
     * If the function fails, the return value is zero.
     * 
     * This function can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setstretchbltmode
     * @since windows5.0
     */
    static SetStretchBltMode(hdc, mode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetStretchBltMode", "ptr", hdc, "int", mode, "int")
        return result
    }

    /**
     * The SetSystemPaletteUse function allows an application to specify whether the system palette contains 2 or 20 static colors.
     * @param {HDC} hdc A handle to the device context. This device context must refer to a device that supports color palettes.
     * @param {Integer} use 
     * @returns {Integer} If the function succeeds, the return value is the previous system palette. It can be either SYSPAL_NOSTATIC, SYSPAL_NOSTATIC256, or SYSPAL_STATIC.
     * 
     * If the function fails, the return value is SYSPAL_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setsystempaletteuse
     * @since windows5.0
     */
    static SetSystemPaletteUse(hdc, use) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetSystemPaletteUse", "ptr", hdc, "uint", use, "uint")
        return result
    }

    /**
     * The SetTextCharacterExtra function sets the intercharacter spacing. Intercharacter spacing is added to each character, including break characters, when the system writes a line of text.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} extra The amount of extra space, in logical units, to be added to each character. If the current mapping mode is not MM_TEXT, the <i>nCharExtra</i> parameter is transformed and rounded to the nearest pixel.
     * @returns {Integer} If the function succeeds, the return value is the previous intercharacter spacing.
     * 
     * If the function fails, the return value is 0x80000000.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-settextcharacterextra
     * @since windows5.0
     */
    static SetTextCharacterExtra(hdc, extra) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetTextCharacterExtra", "ptr", hdc, "int", extra, "int")
        return result
    }

    /**
     * The SetTextColor function sets the text color for the specified device context to the specified color.
     * @param {HDC} hdc A handle to the device context.
     * @param {COLORREF} color The color of the text.
     * @returns {COLORREF} If the function succeeds, the return value is a color reference for the previous text color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-settextcolor
     * @since windows5.0
     */
    static SetTextColor(hdc, color) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetTextColor", "ptr", hdc, "uint", color, "uint")
        return result
    }

    /**
     * The SetTextAlign function sets the text-alignment flags for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} align The text alignment by using a mask of the values in the following list. Only one flag can be chosen from those that affect horizontal and vertical alignment. In addition, only one of the two flags that alter the current position can be chosen.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_BASELINE"></a><a id="ta_baseline"></a><dl>
     * <dt><b>TA_BASELINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be on the base line of the text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_BOTTOM"></a><a id="ta_bottom"></a><dl>
     * <dt><b>TA_BOTTOM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be on the bottom edge of the bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_TOP"></a><a id="ta_top"></a><dl>
     * <dt><b>TA_TOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be on the top edge of the bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_CENTER"></a><a id="ta_center"></a><dl>
     * <dt><b>TA_CENTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be aligned horizontally with the center of the bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_LEFT"></a><a id="ta_left"></a><dl>
     * <dt><b>TA_LEFT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be on the left edge of the bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_RIGHT"></a><a id="ta_right"></a><dl>
     * <dt><b>TA_RIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be on the right edge of the bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_NOUPDATECP"></a><a id="ta_noupdatecp"></a><dl>
     * <dt><b>TA_NOUPDATECP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position is not updated after each text output call. The reference point is passed to the text output function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_RTLREADING"></a><a id="ta_rtlreading"></a><dl>
     * <dt><b>TA_RTLREADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Middle East language edition of Windows:</b> The text is laid out in right to left reading order, as opposed to the default left to right order. This applies only when the font selected into the device context is either Hebrew or Arabic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TA_UPDATECP"></a><a id="ta_updatecp"></a><dl>
     * <dt><b>TA_UPDATECP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position is updated after each text output call. The current position is used as the reference point.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When the current font has a vertical default base line, as with Kanji, the following values must be used instead of TA_BASELINE and TA_CENTER.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VTA_BASELINE"></a><a id="vta_baseline"></a><dl>
     * <dt><b>VTA_BASELINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be on the base line of the text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VTA_CENTER"></a><a id="vta_center"></a><dl>
     * <dt><b>VTA_CENTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference point will be aligned vertically with the center of the bounding rectangle.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The default values are TA_LEFT, TA_TOP, and TA_NOUPDATECP.
     * @returns {Integer} If the function succeeds, the return value is the previous text-alignment setting.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-settextalign
     * @since windows5.0
     */
    static SetTextAlign(hdc, align) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetTextAlign", "ptr", hdc, "uint", align, "uint")
        return result
    }

    /**
     * The SetTextJustification function specifies the amount of space the system should add to the break characters in a string of text. The space is added when an application calls the TextOut or ExtTextOut functions.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} extra The total extra space, in logical units, to be added to the line of text. If the current mapping mode is not MM_TEXT, the value identified by the <i>nBreakExtra</i> parameter is transformed and rounded to the nearest pixel.
     * @param {Integer} count The number of break characters in the line.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-settextjustification
     * @since windows5.0
     */
    static SetTextJustification(hdc, extra, count) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetTextJustification", "ptr", hdc, "int", extra, "int", count, "int")
        return result
    }

    /**
     * The UpdateColors function updates the client area of the specified device context by remapping the current colors in the client area to the currently realized logical palette.
     * @param {HDC} hdc A handle to the device context.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-updatecolors
     * @since windows5.0
     */
    static UpdateColors(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\UpdateColors", "ptr", hdc, "int")
        return result
    }

    /**
     * The AlphaBlend function displays bitmaps that have transparent or semitransparent pixels.
     * @param {HDC} hdcDest A handle to the destination device context.
     * @param {Integer} xoriginDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yoriginDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} wDest The width, in logical units, of the destination rectangle.
     * @param {Integer} hDest The height, in logical units, of the destination rectangle.
     * @param {HDC} hdcSrc A handle to the source device context.
     * @param {Integer} xoriginSrc The x-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} yoriginSrc The y-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} wSrc The width, in logical units, of the source rectangle.
     * @param {Integer} hSrc The height, in logical units, of the source rectangle.
     * @param {BLENDFUNCTION} ftn The alpha-blending function for source and destination bitmaps, a global alpha value to be applied to the entire source bitmap, and format information for the source bitmap. The source and destination blend functions are currently limited to AC_SRC_OVER. See the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-blendfunction">BLENDFUNCTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emralphablend">EMRALPHABLEND</a> structures.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-alphablend
     * @since windows5.0
     */
    static AlphaBlend(hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, ftn) {
        hdcDest := hdcDest is Win32Handle ? NumGet(hdcDest, "ptr") : hdcDest
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc

        result := DllCall("MSIMG32.dll\AlphaBlend", "ptr", hdcDest, "int", xoriginDest, "int", yoriginDest, "int", wDest, "int", hDest, "ptr", hdcSrc, "int", xoriginSrc, "int", yoriginSrc, "int", wSrc, "int", hSrc, "ptr", ftn, "int")
        return result
    }

    /**
     * The TransparentBlt function performs a bit-block transfer of the color data corresponding to a rectangle of pixels from the specified source device context into a destination device context.
     * @param {HDC} hdcDest A handle to the destination device context.
     * @param {Integer} xoriginDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yoriginDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} wDest The width, in logical units, of the destination rectangle.
     * @param {Integer} hDest The height, in logical units, of the destination rectangle.
     * @param {HDC} hdcSrc A handle to the source device context.
     * @param {Integer} xoriginSrc The x-coordinate, in logical units, of the source rectangle.
     * @param {Integer} yoriginSrc The y-coordinate, in logical units, of the source rectangle.
     * @param {Integer} wSrc The width, in logical units, of the source rectangle.
     * @param {Integer} hSrc The height, in logical units, of the source rectangle.
     * @param {Integer} crTransparent The RGB color in the source bitmap to treat as transparent.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-transparentblt
     * @since windows5.0
     */
    static TransparentBlt(hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, crTransparent) {
        hdcDest := hdcDest is Win32Handle ? NumGet(hdcDest, "ptr") : hdcDest
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc

        result := DllCall("MSIMG32.dll\TransparentBlt", "ptr", hdcDest, "int", xoriginDest, "int", yoriginDest, "int", wDest, "int", hDest, "ptr", hdcSrc, "int", xoriginSrc, "int", yoriginSrc, "int", wSrc, "int", hSrc, "uint", crTransparent, "int")
        return result
    }

    /**
     * The GradientFill function fills rectangle and triangle structures.
     * @param {HDC} hdc A handle to the destination device context.
     * @param {Pointer<TRIVERTEX>} pVertex A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a> structures that each define a vertex.
     * @param {Integer} nVertex The number of vertices in <i>pVertex</i>.
     * @param {Pointer<Void>} pMesh An array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_triangle">GRADIENT_TRIANGLE</a> structures in triangle mode, or an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_rect">GRADIENT_RECT</a> structures in rectangle mode.
     * @param {Integer} nMesh The number of elements (triangles or rectangles) in <i>pMesh</i>.
     * @param {Integer} ulMode 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gradientfill
     * @since windows5.0
     */
    static GradientFill(hdc, pVertex, nVertex, pMesh, nMesh, ulMode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pMeshMarshal := pMesh is VarRef ? "ptr" : "ptr"

        result := DllCall("MSIMG32.dll\GradientFill", "ptr", hdc, "ptr", pVertex, "uint", nVertex, pMeshMarshal, pMesh, "uint", nMesh, "uint", ulMode, "int")
        return result
    }

    /**
     * The GdiAlphaBlend function displays bitmaps that have transparent or semitransparent pixels.
     * @param {HDC} hdcDest A handle to the destination device context.
     * @param {Integer} xoriginDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yoriginDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} wDest The width, in logical units, of the destination rectangle.
     * @param {Integer} hDest The height, in logical units, of the destination rectangle.
     * @param {HDC} hdcSrc A handle to the source device context.
     * @param {Integer} xoriginSrc The x-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} yoriginSrc The y-coordinate, in logical units, of the upper-left corner of the source rectangle.
     * @param {Integer} wSrc The width, in logical units, of the source rectangle.
     * @param {Integer} hSrc The height, in logical units, of the source rectangle.
     * @param {BLENDFUNCTION} ftn The alpha-blending function for source and destination bitmaps, a global alpha value to be applied to the entire source bitmap, and format information for the source bitmap. The source and destination blend functions are currently limited to AC_SRC_OVER. See the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-blendfunction">BLENDFUNCTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emralphablend">EMRALPHABLEND</a> structures.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * 
     * This function can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gdialphablend
     * @since windows5.0
     */
    static GdiAlphaBlend(hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, ftn) {
        hdcDest := hdcDest is Win32Handle ? NumGet(hdcDest, "ptr") : hdcDest
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc

        result := DllCall("GDI32.dll\GdiAlphaBlend", "ptr", hdcDest, "int", xoriginDest, "int", yoriginDest, "int", wDest, "int", hDest, "ptr", hdcSrc, "int", xoriginSrc, "int", yoriginSrc, "int", wSrc, "int", hSrc, "ptr", ftn, "int")
        return result
    }

    /**
     * The GdiTransparentBlt function performs a bit-block transfer of the color data corresponding to a rectangle of pixels from the specified source device context into a destination device context.
     * @param {HDC} hdcDest A handle to the destination device context.
     * @param {Integer} xoriginDest The x-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} yoriginDest The y-coordinate, in logical units, of the upper-left corner of the destination rectangle.
     * @param {Integer} wDest The width, in logical units, of the destination rectangle.
     * @param {Integer} hDest The height, in logical units, of the destination rectangle.
     * @param {HDC} hdcSrc A handle to the source device context.
     * @param {Integer} xoriginSrc The x-coordinate, in logical units, of the source rectangle.
     * @param {Integer} yoriginSrc The y-coordinate, in logical units, of the source rectangle.
     * @param {Integer} wSrc The width, in logical units, of the source rectangle.
     * @param {Integer} hSrc The height, in logical units, of the source rectangle.
     * @param {Integer} crTransparent The RGB color in the source bitmap to treat as transparent.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gditransparentblt
     * @since windows5.0
     */
    static GdiTransparentBlt(hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, crTransparent) {
        hdcDest := hdcDest is Win32Handle ? NumGet(hdcDest, "ptr") : hdcDest
        hdcSrc := hdcSrc is Win32Handle ? NumGet(hdcSrc, "ptr") : hdcSrc

        result := DllCall("GDI32.dll\GdiTransparentBlt", "ptr", hdcDest, "int", xoriginDest, "int", yoriginDest, "int", wDest, "int", hDest, "ptr", hdcSrc, "int", xoriginSrc, "int", yoriginSrc, "int", wSrc, "int", hSrc, "uint", crTransparent, "int")
        return result
    }

    /**
     * The GdiGradientFill function fills rectangle and triangle structures.
     * @param {HDC} hdc A handle to the destination device context.
     * @param {Pointer<TRIVERTEX>} pVertex A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a> structures that each define a triangle vertex.
     * @param {Integer} nVertex The number of vertices in <i>pVertex</i>.
     * @param {Pointer<Void>} pMesh An array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_triangle">GRADIENT_TRIANGLE</a> structures in triangle mode, or an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_rect">GRADIENT_RECT</a> structures in rectangle mode.
     * @param {Integer} nCount The number of elements (triangles or rectangles) in <i>pMesh</i>.
     * @param {Integer} ulMode 
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gdigradientfill
     * @since windows5.0
     */
    static GdiGradientFill(hdc, pVertex, nVertex, pMesh, nCount, ulMode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pMeshMarshal := pMesh is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\GdiGradientFill", "ptr", hdc, "ptr", pVertex, "uint", nVertex, pMeshMarshal, pMesh, "uint", nCount, "uint", ulMode, "int")
        return result
    }

    /**
     * The PlayMetaFileRecord function plays a Windows-format metafile record by executing the graphics device interface (GDI) function contained within that record.
     * @param {HDC} hdc A handle to a device context.
     * @param {Pointer<HANDLETABLE>} lpHandleTable A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-handletable">HANDLETABLE</a> structure representing the table of handles to GDI objects used when playing the metafile.
     * @param {Pointer<METARECORD>} lpMR A pointer to the Windows-format metafile record.
     * @param {Integer} noObjs The number of handles in the handle table.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-playmetafilerecord
     * @since windows5.0
     */
    static PlayMetaFileRecord(hdc, lpHandleTable, lpMR, noObjs) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PlayMetaFileRecord", "ptr", hdc, "ptr", lpHandleTable, "ptr", lpMR, "uint", noObjs, "int")
        return result
    }

    /**
     * The EnumMetaFile function enumerates the records within a Windows-format metafile by retrieving each record and passing it to the specified callback function.
     * @param {HDC} hdc Handle to a device context. This handle is passed to the callback function.
     * @param {HMETAFILE} hmf Handle to a Windows-format metafile.
     * @param {Pointer<MFENUMPROC>} proc Pointer to an application-supplied callback function. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd162630(v=vs.85)">EnumMetaFileProc</a>.
     * @param {LPARAM} param3 
     * @returns {BOOL} If the callback function successfully enumerates all the records in the Windows-format metafile, the return value is nonzero.
     * 
     * If the callback function does not successfully enumerate all the records in the Windows-format metafile, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enummetafile
     * @since windows5.0
     */
    static EnumMetaFile(hdc, hmf, proc, param3) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hmf := hmf is Win32Handle ? NumGet(hmf, "ptr") : hmf

        result := DllCall("GDI32.dll\EnumMetaFile", "ptr", hdc, "ptr", hmf, "ptr", proc, "ptr", param3, "int")
        return result
    }

    /**
     * The CloseEnhMetaFile function closes an enhanced-metafile device context and returns a handle that identifies an enhanced-format metafile.
     * @param {HDC} hdc Handle to an enhanced-metafile device context.
     * @returns {HENHMETAFILE} If the function succeeds, the return value is a handle to an enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-closeenhmetafile
     * @since windows5.0
     */
    static CloseEnhMetaFile(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CloseEnhMetaFile", "ptr", hdc, "ptr")
        return HENHMETAFILE({Value: result}, True)
    }

    /**
     * The CopyEnhMetaFile function copies the contents of an enhanced-format metafile to a specified file.
     * @param {HENHMETAFILE} hEnh A handle to the enhanced metafile to be copied.
     * @param {PSTR} lpFileName A pointer to the name of the destination file. If this parameter is <b>NULL</b>, the source metafile is copied to memory.
     * @returns {HENHMETAFILE} If the function succeeds, the return value is a handle to the copy of the enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-copyenhmetafilea
     * @since windows5.0
     */
    static CopyEnhMetaFileA(hEnh, lpFileName) {
        hEnh := hEnh is Win32Handle ? NumGet(hEnh, "ptr") : hEnh
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("GDI32.dll\CopyEnhMetaFileA", "ptr", hEnh, "ptr", lpFileName, "ptr")
        return HENHMETAFILE({Value: result}, True)
    }

    /**
     * The CopyEnhMetaFile function copies the contents of an enhanced-format metafile to a specified file.
     * @param {HENHMETAFILE} hEnh A handle to the enhanced metafile to be copied.
     * @param {PWSTR} lpFileName A pointer to the name of the destination file. If this parameter is <b>NULL</b>, the source metafile is copied to memory.
     * @returns {HENHMETAFILE} If the function succeeds, the return value is a handle to the copy of the enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-copyenhmetafilew
     * @since windows5.0
     */
    static CopyEnhMetaFileW(hEnh, lpFileName) {
        hEnh := hEnh is Win32Handle ? NumGet(hEnh, "ptr") : hEnh
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("GDI32.dll\CopyEnhMetaFileW", "ptr", hEnh, "ptr", lpFileName, "ptr")
        return HENHMETAFILE({Value: result}, True)
    }

    /**
     * The CreateEnhMetaFile function creates a device context for an enhanced-format metafile. This device context can be used to store a device-independent picture.
     * @param {HDC} hdc A handle to a reference device for the enhanced metafile. This parameter can be <b>NULL</b>; for more information, see Remarks.
     * @param {PSTR} lpFilename A pointer to the file name for the enhanced metafile to be created. If this parameter is <b>NULL</b>, the enhanced metafile is memory based and its contents are lost when it is deleted by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteenhmetafile">DeleteEnhMetaFile</a> function.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the dimensions (in .01-millimeter units) of the picture to be stored in the enhanced metafile.
     * @param {PSTR} lpDesc A pointer to a string that specifies the name of the application that created the picture, as well as the picture's title. This parameter can be <b>NULL</b>; for more information, see Remarks.
     * @returns {HDC} If the function succeeds, the return value is a handle to the device context for the enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createenhmetafilea
     * @since windows5.0
     */
    static CreateEnhMetaFileA(hdc, lpFilename, lprc, lpDesc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename
        lpDesc := lpDesc is String ? StrPtr(lpDesc) : lpDesc

        result := DllCall("GDI32.dll\CreateEnhMetaFileA", "ptr", hdc, "ptr", lpFilename, "ptr", lprc, "ptr", lpDesc, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The CreateEnhMetaFile function creates a device context for an enhanced-format metafile. This device context can be used to store a device-independent picture.
     * @param {HDC} hdc A handle to a reference device for the enhanced metafile. This parameter can be <b>NULL</b>; for more information, see Remarks.
     * @param {PWSTR} lpFilename A pointer to the file name for the enhanced metafile to be created. If this parameter is <b>NULL</b>, the enhanced metafile is memory based and its contents are lost when it is deleted by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteenhmetafile">DeleteEnhMetaFile</a> function.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the dimensions (in .01-millimeter units) of the picture to be stored in the enhanced metafile.
     * @param {PWSTR} lpDesc A pointer to a string that specifies the name of the application that created the picture, as well as the picture's title. This parameter can be <b>NULL</b>; for more information, see Remarks.
     * @returns {HDC} If the function succeeds, the return value is a handle to the device context for the enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createenhmetafilew
     * @since windows5.0
     */
    static CreateEnhMetaFileW(hdc, lpFilename, lprc, lpDesc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename
        lpDesc := lpDesc is String ? StrPtr(lpDesc) : lpDesc

        result := DllCall("GDI32.dll\CreateEnhMetaFileW", "ptr", hdc, "ptr", lpFilename, "ptr", lprc, "ptr", lpDesc, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The DeleteEnhMetaFile function deletes an enhanced-format metafile or an enhanced-format metafile handle.
     * @param {HENHMETAFILE} hmf A handle to an enhanced metafile.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-deleteenhmetafile
     * @since windows5.0
     */
    static DeleteEnhMetaFile(hmf) {
        hmf := hmf is Win32Handle ? NumGet(hmf, "ptr") : hmf

        result := DllCall("GDI32.dll\DeleteEnhMetaFile", "ptr", hmf, "int")
        return result
    }

    /**
     * The EnumEnhMetaFile function enumerates the records within an enhanced-format metafile by retrieving each record and passing it to the specified callback function.
     * @param {HDC} hdc A handle to a device context. This handle is passed to the callback function.
     * @param {HENHMETAFILE} hmf A handle to an enhanced metafile.
     * @param {Pointer<ENHMFENUMPROC>} proc A pointer to the application-supplied callback function. For more information, see the <a href="https://docs.microsoft.com/previous-versions/dd162606(v=vs.85)">EnhMetaFileProc</a> function.
     * @param {Pointer<Void>} param3 
     * @param {Pointer<RECT>} lpRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the coordinates, in logical units, of the picture's upper-left and lower-right corners.
     * @returns {BOOL} If the callback function successfully enumerates all the records in the enhanced metafile, the return value is nonzero.
     * 
     * If the callback function does not successfully enumerate all the records in the enhanced metafile, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumenhmetafile
     * @since windows5.0
     */
    static EnumEnhMetaFile(hdc, hmf, proc, param3, lpRect) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hmf := hmf is Win32Handle ? NumGet(hmf, "ptr") : hmf

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\EnumEnhMetaFile", "ptr", hdc, "ptr", hmf, "ptr", proc, param3Marshal, param3, "ptr", lpRect, "int")
        return result
    }

    /**
     * The GetEnhMetaFile function creates a handle that identifies the enhanced-format metafile stored in the specified file.
     * @param {PSTR} lpName A pointer to a null-terminated string that specifies the name of an enhanced metafile.
     * @returns {HENHMETAFILE} If the function succeeds, the return value is a handle to the enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafilea
     * @since windows5.0
     */
    static GetEnhMetaFileA(lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("GDI32.dll\GetEnhMetaFileA", "ptr", lpName, "ptr")
        return HENHMETAFILE({Value: result}, True)
    }

    /**
     * The GetEnhMetaFile function creates a handle that identifies the enhanced-format metafile stored in the specified file.
     * @param {PWSTR} lpName A pointer to a null-terminated string that specifies the name of an enhanced metafile.
     * @returns {HENHMETAFILE} If the function succeeds, the return value is a handle to the enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafilew
     * @since windows5.0
     */
    static GetEnhMetaFileW(lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("GDI32.dll\GetEnhMetaFileW", "ptr", lpName, "ptr")
        return HENHMETAFILE({Value: result}, True)
    }

    /**
     * The GetEnhMetaFileBits function retrieves the contents of the specified enhanced-format metafile and copies them into a buffer.
     * @param {HENHMETAFILE} hEMF A handle to the enhanced metafile.
     * @param {Integer} nSize The size, in bytes, of the buffer to receive the data.
     * @param {Pointer} lpData A pointer to a buffer that receives the metafile data. The buffer must be sufficiently large to contain the data. If <i>lpbBuffer</i> is <b>NULL</b>, the function returns the size necessary to hold the data.
     * @returns {Integer} If the function succeeds and the buffer pointer is <b>NULL</b>, the return value is the size of the enhanced metafile, in bytes.
     * 
     * If the function succeeds and the buffer pointer is a valid pointer, the return value is the number of bytes copied to the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafilebits
     * @since windows5.0
     */
    static GetEnhMetaFileBits(hEMF, nSize, lpData) {
        hEMF := hEMF is Win32Handle ? NumGet(hEMF, "ptr") : hEMF

        result := DllCall("GDI32.dll\GetEnhMetaFileBits", "ptr", hEMF, "uint", nSize, "ptr", lpData, "uint")
        return result
    }

    /**
     * The GetEnhMetaFileDescription function retrieves an optional text description from an enhanced-format metafile and copies the string to the specified buffer.
     * @param {HENHMETAFILE} hemf A handle to the enhanced metafile.
     * @param {Integer} cchBuffer The size, in characters, of the buffer to receive the data. Only this many characters will be copied.
     * @param {PSTR} lpDescription A pointer to a buffer that receives the optional text description.
     * @returns {Integer} If the optional text description exists and the buffer pointer is <b>NULL</b>, the return value is the length of the text string, in characters.
     * 
     * If the optional text description exists and the buffer pointer is a valid pointer, the return value is the number of characters copied into the buffer.
     * 
     * If the optional text description does not exist, the return value is zero.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafiledescriptiona
     * @since windows5.0
     */
    static GetEnhMetaFileDescriptionA(hemf, cchBuffer, lpDescription) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf
        lpDescription := lpDescription is String ? StrPtr(lpDescription) : lpDescription

        result := DllCall("GDI32.dll\GetEnhMetaFileDescriptionA", "ptr", hemf, "uint", cchBuffer, "ptr", lpDescription, "uint")
        return result
    }

    /**
     * The GetEnhMetaFileDescription function retrieves an optional text description from an enhanced-format metafile and copies the string to the specified buffer.
     * @param {HENHMETAFILE} hemf A handle to the enhanced metafile.
     * @param {Integer} cchBuffer The size, in characters, of the buffer to receive the data. Only this many characters will be copied.
     * @param {PWSTR} lpDescription A pointer to a buffer that receives the optional text description.
     * @returns {Integer} If the optional text description exists and the buffer pointer is <b>NULL</b>, the return value is the length of the text string, in characters.
     * 
     * If the optional text description exists and the buffer pointer is a valid pointer, the return value is the number of characters copied into the buffer.
     * 
     * If the optional text description does not exist, the return value is zero.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafiledescriptionw
     * @since windows5.0
     */
    static GetEnhMetaFileDescriptionW(hemf, cchBuffer, lpDescription) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf
        lpDescription := lpDescription is String ? StrPtr(lpDescription) : lpDescription

        result := DllCall("GDI32.dll\GetEnhMetaFileDescriptionW", "ptr", hemf, "uint", cchBuffer, "ptr", lpDescription, "uint")
        return result
    }

    /**
     * The GetEnhMetaFileHeader function retrieves the record containing the header for the specified enhanced-format metafile.
     * @param {HENHMETAFILE} hemf A handle to the enhanced metafile for which the header is to be retrieved.
     * @param {Integer} nSize The size, in bytes, of the buffer to receive the data. Only this many bytes will be copied.
     * @param {Pointer} lpEnhMetaHeader A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-enhmetaheader">ENHMETAHEADER</a> structure that receives the header record. If this parameter is <b>NULL</b>, the function returns the size of the header record.
     * @returns {Integer} If the function succeeds and the structure pointer is <b>NULL</b>, the return value is the size of the record that contains the header; if the structure pointer is a valid pointer, the return value is the number of bytes copied. Otherwise, it is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafileheader
     * @since windows5.0
     */
    static GetEnhMetaFileHeader(hemf, nSize, lpEnhMetaHeader) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf

        result := DllCall("GDI32.dll\GetEnhMetaFileHeader", "ptr", hemf, "uint", nSize, "ptr", lpEnhMetaHeader, "uint")
        return result
    }

    /**
     * The GetEnhMetaFilePaletteEntries function retrieves optional palette entries from the specified enhanced metafile.
     * @param {HENHMETAFILE} hemf A handle to the enhanced metafile.
     * @param {Integer} nNumEntries The number of entries to be retrieved from the optional palette.
     * @param {Pointer<PALETTEENTRY>} lpPaletteEntries A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures that receives the palette colors. The array must contain at least as many structures as there are entries specified by the <i>cEntries</i> parameter.
     * @returns {Integer} If the array pointer is <b>NULL</b> and the enhanced metafile contains an optional palette, the return value is the number of entries in the enhanced metafile's palette; if the array pointer is a valid pointer and the enhanced metafile contains an optional palette, the return value is the number of entries copied; if the metafile does not contain an optional palette, the return value is zero. Otherwise, the return value is GDI_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getenhmetafilepaletteentries
     * @since windows5.0
     */
    static GetEnhMetaFilePaletteEntries(hemf, nNumEntries, lpPaletteEntries) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf

        result := DllCall("GDI32.dll\GetEnhMetaFilePaletteEntries", "ptr", hemf, "uint", nNumEntries, "ptr", lpPaletteEntries, "uint")
        return result
    }

    /**
     * The GetWinMetaFileBits function converts the enhanced-format records from a metafile into Windows-format records and stores the converted records in the specified buffer.
     * @param {HENHMETAFILE} hemf A handle to the enhanced metafile.
     * @param {Integer} cbData16 The size, in bytes, of the buffer into which the converted records are to be copied.
     * @param {Pointer} pData16 A pointer to the buffer that receives the converted records. If <i>lpbBuffer</i> is <b>NULL</b>, <b>GetWinMetaFileBits</b> returns the number of bytes required to store the converted metafile records.
     * @param {Integer} iMapMode The mapping mode to use in the converted metafile.
     * @param {HDC} hdcRef A handle to the reference device context.
     * @returns {Integer} If the function succeeds and the buffer pointer is <b>NULL</b>, the return value is the number of bytes required to store the converted records; if the function succeeds and the buffer pointer is a valid pointer, the return value is the size of the metafile data in bytes.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getwinmetafilebits
     * @since windows5.0
     */
    static GetWinMetaFileBits(hemf, cbData16, pData16, iMapMode, hdcRef) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf
        hdcRef := hdcRef is Win32Handle ? NumGet(hdcRef, "ptr") : hdcRef

        result := DllCall("GDI32.dll\GetWinMetaFileBits", "ptr", hemf, "uint", cbData16, "ptr", pData16, "int", iMapMode, "ptr", hdcRef, "uint")
        return result
    }

    /**
     * The PlayEnhMetaFile function displays the picture stored in the specified enhanced-format metafile.
     * @param {HDC} hdc A handle to the device context for the output device on which the picture will appear.
     * @param {HENHMETAFILE} hmf A handle to the enhanced metafile.
     * @param {Pointer<RECT>} lprect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the coordinates of the bounding rectangle used to display the picture. The coordinates are specified in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-playenhmetafile
     * @since windows5.0
     */
    static PlayEnhMetaFile(hdc, hmf, lprect) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hmf := hmf is Win32Handle ? NumGet(hmf, "ptr") : hmf

        result := DllCall("GDI32.dll\PlayEnhMetaFile", "ptr", hdc, "ptr", hmf, "ptr", lprect, "int")
        return result
    }

    /**
     * The PlayEnhMetaFileRecord function plays an enhanced-metafile record by executing the graphics device interface (GDI) functions identified by the record.
     * @param {HDC} hdc A handle to the device context passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumenhmetafile">EnumEnhMetaFile</a> function.
     * @param {Pointer<HANDLETABLE>} pht A pointer to a table of handles to GDI objects used when playing the metafile. The first entry in this table contains the enhanced-metafile handle.
     * @param {Pointer<ENHMETARECORD>} pmr A pointer to the enhanced-metafile record to be played.
     * @param {Integer} cht The number of handles in the handle table.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-playenhmetafilerecord
     * @since windows5.0
     */
    static PlayEnhMetaFileRecord(hdc, pht, pmr, cht) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PlayEnhMetaFileRecord", "ptr", hdc, "ptr", pht, "ptr", pmr, "uint", cht, "int")
        return result
    }

    /**
     * The SetEnhMetaFileBits function creates a memory-based enhanced-format metafile from the specified data.
     * @param {Integer} nSize Specifies the size, in bytes, of the data provided.
     * @param {Pointer} pb Pointer to a buffer that contains enhanced-metafile data. (It is assumed that the data in the buffer was obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getenhmetafilebits">GetEnhMetaFileBits</a> function.)
     * @returns {HENHMETAFILE} If the function succeeds, the return value is a handle to a memory-based enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setenhmetafilebits
     * @since windows5.0
     */
    static SetEnhMetaFileBits(nSize, pb) {
        result := DllCall("GDI32.dll\SetEnhMetaFileBits", "uint", nSize, "ptr", pb, "ptr")
        return HENHMETAFILE({Value: result}, True)
    }

    /**
     * The GdiComment function copies a comment from a buffer into a specified enhanced-format metafile.
     * @param {HDC} hdc A handle to an enhanced-metafile device context.
     * @param {Integer} nSize The length of the comment buffer, in bytes.
     * @param {Pointer} lpData A pointer to the buffer that contains the comment.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gdicomment
     * @since windows5.0
     */
    static GdiComment(hdc, nSize, lpData) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GdiComment", "ptr", hdc, "uint", nSize, "ptr", lpData, "int")
        return result
    }

    /**
     * The GetTextMetrics function fills the specified buffer with the metrics for the currently selected font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<TEXTMETRICA>} lptm A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRIC</a> structure that receives the text metrics.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextmetricsa
     * @since windows5.0
     */
    static GetTextMetricsA(hdc, lptm) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetTextMetricsA", "ptr", hdc, "ptr", lptm, "int")
        return result
    }

    /**
     * The GetTextMetrics function fills the specified buffer with the metrics for the currently selected font.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<TEXTMETRICW>} lptm A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRIC</a> structure that receives the text metrics.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextmetricsw
     * @since windows5.0
     */
    static GetTextMetricsW(hdc, lptm) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetTextMetricsW", "ptr", hdc, "ptr", lptm, "int")
        return result
    }

    /**
     * The AngleArc function draws a line segment and an arc.
     * @param {HDC} hdc Handle to a device context.
     * @param {Integer} x Specifies the x-coordinate, in logical units, of the center of the circle.
     * @param {Integer} y Specifies the y-coordinate, in logical units, of the center of the circle.
     * @param {Integer} r Specifies the radius, in logical units, of the circle. This value must be positive.
     * @param {Float} StartAngle Specifies the start angle, in degrees, relative to the x-axis.
     * @param {Float} SweepAngle Specifies the sweep angle, in degrees, relative to the starting angle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-anglearc
     * @since windows5.0
     */
    static AngleArc(hdc, x, y, r, StartAngle, SweepAngle) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\AngleArc", "ptr", hdc, "int", x, "int", y, "uint", r, "float", StartAngle, "float", SweepAngle, "int")
        return result
    }

    /**
     * The PolyPolyline function draws multiple series of connected line segments.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that contains the vertices of the polylines, in logical units. The polylines are specified consecutively.
     * @param {Pointer<Integer>} asz A pointer to an array of variables specifying the number of points in the <i>lppt</i> array for the corresponding polyline. Each entry must be greater than or equal to two.
     * @param {Integer} csz The total number of entries in the <i>lpdwPolyPoints</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polypolyline
     * @since windows5.0
     */
    static PolyPolyline(hdc, apt, asz, csz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        aszMarshal := asz is VarRef ? "uint*" : "ptr"

        result := DllCall("GDI32.dll\PolyPolyline", "ptr", hdc, "ptr", apt, aszMarshal, asz, "uint", csz, "int")
        return result
    }

    /**
     * The GetWorldTransform function retrieves the current world-space to page-space transformation.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<XFORM>} lpxf A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure that receives the current world-space to page-space transformation.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getworldtransform
     * @since windows5.0
     */
    static GetWorldTransform(hdc, lpxf) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetWorldTransform", "ptr", hdc, "ptr", lpxf, "int")
        return result
    }

    /**
     * The SetWorldTransform function sets a two-dimensional linear transformation between world space and page space for the specified device context. This transformation can be used to scale, rotate, shear, or translate graphics output.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<XFORM>} lpxf A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure that contains the transformation data.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setworldtransform
     * @since windows5.0
     */
    static SetWorldTransform(hdc, lpxf) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetWorldTransform", "ptr", hdc, "ptr", lpxf, "int")
        return result
    }

    /**
     * The ModifyWorldTransform function changes the world transformation for a device context using the specified mode.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<XFORM>} lpxf A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure used to modify the world transformation for the given device context.
     * @param {Integer} mode 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-modifyworldtransform
     * @since windows5.0
     */
    static ModifyWorldTransform(hdc, lpxf, mode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ModifyWorldTransform", "ptr", hdc, "ptr", lpxf, "uint", mode, "int")
        return result
    }

    /**
     * The CombineTransform function concatenates two world-space to page-space transformations.
     * @param {Pointer<XFORM>} lpxfOut A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure that receives the combined transformation.
     * @param {Pointer<XFORM>} lpxf1 A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure that specifies the first transformation.
     * @param {Pointer<XFORM>} lpxf2 A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-xform">XFORM</a> structure that specifies the second transformation.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-combinetransform
     * @since windows5.0
     */
    static CombineTransform(lpxfOut, lpxf1, lpxf2) {
        result := DllCall("GDI32.dll\CombineTransform", "ptr", lpxfOut, "ptr", lpxf1, "ptr", lpxf2, "int")
        return result
    }

    /**
     * The CreateDIBSection function creates a DIB that applications can write to directly.
     * @param {HDC} hdc A handle to a device context. If the value of <i>iUsage</i> is DIB_PAL_COLORS, the function uses this device context's logical palette to initialize the DIB colors.
     * @param {Pointer<BITMAPINFO>} pbmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure that specifies various attributes of the DIB, including the bitmap dimensions and colors.
     * @param {Integer} usage The type of data contained in the <b>bmiColors</b> array member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure pointed to by <i>pbmi</i> (either logical palette indexes or literal RGB values). The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DIB_PAL_COLORS"></a><a id="dib_pal_colors"></a><dl>
     * <dt><b>DIB_PAL_COLORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>bmiColors</b> member is an array of 16-bit indexes into the logical palette of the device context specified by <i>hdc</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DIB_RGB_COLORS"></a><a id="dib_rgb_colors"></a><dl>
     * <dt><b>DIB_RGB_COLORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure contains an array of literal RGB values.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Void>>} ppvBits A pointer to a variable that receives a pointer to the location of the DIB bit values.
     * @param {HANDLE} hSection A handle to a file-mapping object that the function will use to create the DIB. This parameter can be <b>NULL</b>.
     * 
     * If <i>hSection</i> is not <b>NULL</b>, it must be a handle to a file-mapping object created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function with the PAGE_READWRITE or PAGE_WRITECOPY flag. Read-only DIB sections are not supported. Handles created by other means will cause <b>CreateDIBSection</b> to fail.
     * 
     * If <i>hSection</i> is not <b>NULL</b>, the <b>CreateDIBSection</b> function locates the bitmap bit values at offset <i>dwOffset</i> in the file-mapping object referred to by <i>hSection</i>. An application can later retrieve the <i>hSection</i> handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getobject">GetObject</a> function with the <b>HBITMAP</b> returned by <b>CreateDIBSection</b>.
     * 
     * If <i>hSection</i> is <b>NULL</b>, the system allocates memory for the DIB. In this case, the <b>CreateDIBSection</b> function ignores the <i>dwOffset</i> parameter. An application cannot later obtain a handle to this memory. The <b>dshSection</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a> structure filled in by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getobject">GetObject</a> function will be <b>NULL</b>.
     * @param {Integer} offset The offset from the beginning of the file-mapping object referenced by <i>hSection</i> where storage for the bitmap bit values is to begin. This value is ignored if <i>hSection</i> is <b>NULL</b>. The bitmap bit values are aligned on doubleword boundaries, so <i>dwOffset</i> must be a multiple of the size of a <b>DWORD</b>.
     * @returns {HBITMAP} If the function succeeds, the return value is a handle to the newly created DIB, and *<i>ppvBits</i> points to the bitmap bit values.
     * 
     * If the function fails, the return value is <b>NULL</b>, and *<i>ppvBits</i> is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can return the following value:
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createdibsection
     * @since windows5.0
     */
    static CreateDIBSection(hdc, pbmi, usage, ppvBits, hSection, offset) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hSection := hSection is Win32Handle ? NumGet(hSection, "ptr") : hSection

        ppvBitsMarshal := ppvBits is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("GDI32.dll\CreateDIBSection", "ptr", hdc, "ptr", pbmi, "uint", usage, ppvBitsMarshal, ppvBits, "ptr", hSection, "uint", offset, "ptr")
        if(A_LastError)
            throw OSError()

        return HBITMAP({Value: result}, True)
    }

    /**
     * The GetDIBColorTable function retrieves RGB (red, green, blue) color values from a range of entries in the color table of the DIB section bitmap that is currently selected into a specified device context.
     * @param {HDC} hdc A handle to a device context. A DIB section bitmap must be selected into this device context.
     * @param {Integer} iStart A zero-based color table index that specifies the first color table entry to retrieve.
     * @param {Integer} cEntries The number of color table entries to retrieve.
     * @param {Pointer<RGBQUAD>} prgbq A pointer to a buffer that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgbquad">RGBQUAD</a> data structures containing color information from the DIB color table. The buffer must be large enough to contain as many <b>RGBQUAD</b> data structures as the value of <i>cEntries</i>.
     * @returns {Integer} If the function succeeds, the return value is the number of color table entries that the function retrieves.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdibcolortable
     * @since windows5.0
     */
    static GetDIBColorTable(hdc, iStart, cEntries, prgbq) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetDIBColorTable", "ptr", hdc, "uint", iStart, "uint", cEntries, "ptr", prgbq, "uint")
        return result
    }

    /**
     * The SetDIBColorTable function sets RGB (red, green, blue) color values in a range of entries in the color table of the DIB that is currently selected into a specified device context.
     * @param {HDC} hdc A device context. A DIB must be selected into this device context.
     * @param {Integer} iStart A zero-based color table index that specifies the first color table entry to set.
     * @param {Integer} cEntries The number of color table entries to set.
     * @param {Pointer<RGBQUAD>} prgbq A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgbquad">RGBQUAD</a> structures containing new color information for the DIB's color table.
     * @returns {Integer} If the function succeeds, the return value is the number of color table entries that the function sets.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setdibcolortable
     * @since windows5.0
     */
    static SetDIBColorTable(hdc, iStart, cEntries, prgbq) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetDIBColorTable", "ptr", hdc, "uint", iStart, "uint", cEntries, "ptr", prgbq, "uint")
        return result
    }

    /**
     * The SetColorAdjustment function sets the color adjustment values for a device context (DC) using the specified values.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<COLORADJUSTMENT>} lpca A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-coloradjustment">COLORADJUSTMENT</a> structure containing the color adjustment values.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setcoloradjustment
     * @since windows5.0
     */
    static SetColorAdjustment(hdc, lpca) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetColorAdjustment", "ptr", hdc, "ptr", lpca, "int")
        return result
    }

    /**
     * The GetColorAdjustment function retrieves the color adjustment values for the specified device context (DC).
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<COLORADJUSTMENT>} lpca A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-coloradjustment">COLORADJUSTMENT</a> structure that receives the color adjustment values.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcoloradjustment
     * @since windows5.0
     */
    static GetColorAdjustment(hdc, lpca) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetColorAdjustment", "ptr", hdc, "ptr", lpca, "int")
        return result
    }

    /**
     * The CreateHalftonePalette function creates a halftone palette for the specified device context (DC).
     * @param {HDC} hdc A handle to the device context.
     * @returns {HPALETTE} If the function succeeds, the return value is a handle to a logical halftone palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createhalftonepalette
     * @since windows5.0
     */
    static CreateHalftonePalette(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CreateHalftonePalette", "ptr", hdc, "ptr")
        return HPALETTE({Value: result}, True)
    }

    /**
     * The AbortPath function closes and discards any paths in the specified device context.
     * @param {HDC} hdc Handle to the device context from which a path will be discarded.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-abortpath
     * @since windows5.0
     */
    static AbortPath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\AbortPath", "ptr", hdc, "int")
        return result
    }

    /**
     * The ArcTo function draws an elliptical arc.
     * @param {HDC} hdc A handle to the device context where drawing takes place.
     * @param {Integer} left The x-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
     * @param {Integer} top The y-coordinate, in logical units, of the upper-left corner of the bounding rectangle.
     * @param {Integer} right The x-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
     * @param {Integer} bottom The y-coordinate, in logical units, of the lower-right corner of the bounding rectangle.
     * @param {Integer} xr1 The x-coordinate, in logical units, of the endpoint of the radial defining the starting point of the arc.
     * @param {Integer} yr1 The y-coordinate, in logical units, of the endpoint of the radial defining the starting point of the arc.
     * @param {Integer} xr2 The x-coordinate, in logical units, of the endpoint of the radial defining the ending point of the arc.
     * @param {Integer} yr2 The y-coordinate, in logical units, of the endpoint of the radial defining the ending point of the arc.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-arcto
     * @since windows5.0
     */
    static ArcTo(hdc, left, top, right, bottom, xr1, yr1, xr2, yr2) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ArcTo", "ptr", hdc, "int", left, "int", top, "int", right, "int", bottom, "int", xr1, "int", yr1, "int", xr2, "int", yr2, "int")
        return result
    }

    /**
     * The BeginPath function opens a path bracket in the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-beginpath
     * @since windows5.0
     */
    static BeginPath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\BeginPath", "ptr", hdc, "int")
        return result
    }

    /**
     * The CloseFigure function closes an open figure in a path.
     * @param {HDC} hdc Handle to the device context in which the figure will be closed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-closefigure
     * @since windows5.0
     */
    static CloseFigure(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CloseFigure", "ptr", hdc, "int")
        return result
    }

    /**
     * The EndPath function closes a path bracket and selects the path defined by the bracket into the specified device context.
     * @param {HDC} hdc A handle to the device context into which the new path is selected.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-endpath
     * @since windows5.0
     */
    static EndPath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EndPath", "ptr", hdc, "int")
        return result
    }

    /**
     * The FillPath function closes any open figures in the current path and fills the path's interior by using the current brush and polygon-filling mode.
     * @param {HDC} hdc A handle to a device context that contains a valid path.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-fillpath
     * @since windows5.0
     */
    static FillPath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\FillPath", "ptr", hdc, "int")
        return result
    }

    /**
     * The FlattenPath function transforms any curves in the path that is selected into the current device context (DC), turning each curve into a sequence of lines.
     * @param {HDC} hdc A handle to a DC that contains a valid path.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-flattenpath
     * @since windows5.0
     */
    static FlattenPath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\FlattenPath", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {HDC} hdc A handle to a device context that contains a closed path.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that receives the line endpoints and curve control points, in logical coordinates.
     * @param {Pointer<Integer>} aj 
     * @param {Integer} cpt The total number of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that can be stored in the array pointed to by <i>lpPoints</i>. This value must be the same as the number of bytes that can be placed in the array pointed to by <i>lpTypes</i>.
     * @returns {Integer} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     * @since windows5.0
     */
    static GetPath(hdc, apt, aj, cpt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        ajMarshal := aj is VarRef ? "char*" : "ptr"

        result := DllCall("GDI32.dll\GetPath", "ptr", hdc, "ptr", apt, ajMarshal, aj, "int", cpt, "int")
        return result
    }

    /**
     * The PathToRegion function creates a region from the path that is selected into the specified device context. The resulting region uses device coordinates.
     * @param {HDC} hdc Handle to a device context that contains a closed path.
     * @returns {HRGN} If the function succeeds, the return value identifies a valid region.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-pathtoregion
     * @since windows5.0
     */
    static PathToRegion(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PathToRegion", "ptr", hdc, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The PolyDraw function draws a set of line segments and B�zier curves.
     * @param {HDC} hdc A handle to a device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that contains the endpoints for each line segment and the endpoints and control points for each Bézier curve, in logical units.
     * @param {Pointer<Integer>} aj 
     * @param {Integer} cpt The total number of points in the <i>lppt</i> array, the same as the number of bytes in the <i>lpbTypes</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polydraw
     * @since windows5.0
     */
    static PolyDraw(hdc, apt, aj, cpt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        ajMarshal := aj is VarRef ? "char*" : "ptr"

        result := DllCall("GDI32.dll\PolyDraw", "ptr", hdc, "ptr", apt, ajMarshal, aj, "int", cpt, "int")
        return result
    }

    /**
     * The SelectClipPath function selects the current path as a clipping region for a device context, combining the new region with any existing clipping region using the specified mode.
     * @param {HDC} hdc A handle to the device context of the path.
     * @param {Integer} mode 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-selectclippath
     * @since windows5.0
     */
    static SelectClipPath(hdc, mode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SelectClipPath", "ptr", hdc, "int", mode, "int")
        return result
    }

    /**
     * The SetArcDirection sets the drawing direction to be used for arc and rectangle functions.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} dir 
     * @returns {Integer} If the function succeeds, the return value specifies the old arc direction.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setarcdirection
     * @since windows5.0
     */
    static SetArcDirection(hdc, dir) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetArcDirection", "ptr", hdc, "int", dir, "int")
        return result
    }

    /**
     * The SetMiterLimit function sets the limit for the length of miter joins for the specified device context.
     * @param {HDC} hdc Handle to the device context.
     * @param {Float} limit Specifies the new miter limit for the device context.
     * @param {Pointer<Float>} old Pointer to a floating-point value that receives the previous miter limit. If this parameter is <b>NULL</b>, the previous miter limit is not returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setmiterlimit
     * @since windows5.0
     */
    static SetMiterLimit(hdc, limit, old) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        oldMarshal := old is VarRef ? "float*" : "ptr"

        result := DllCall("GDI32.dll\SetMiterLimit", "ptr", hdc, "float", limit, oldMarshal, old, "int")
        return result
    }

    /**
     * The StrokeAndFillPath function closes any open figures in a path, strokes the outline of the path by using the current pen, and fills its interior by using the current brush.
     * @param {HDC} hdc A handle to the device context.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-strokeandfillpath
     * @since windows5.0
     */
    static StrokeAndFillPath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StrokeAndFillPath", "ptr", hdc, "int")
        return result
    }

    /**
     * The StrokePath function renders the specified path by using the current pen.
     * @param {HDC} hdc Handle to a device context that contains the completed path.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-strokepath
     * @since windows5.0
     */
    static StrokePath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StrokePath", "ptr", hdc, "int")
        return result
    }

    /**
     * The WidenPath function redefines the current path as the area that would be painted if the path were stroked using the pen currently selected into the given device context.
     * @param {HDC} hdc A handle to a device context that contains a closed path.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-widenpath
     * @since windows5.0
     */
    static WidenPath(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\WidenPath", "ptr", hdc, "int")
        return result
    }

    /**
     * The ExtCreatePen function creates a logical cosmetic or geometric pen that has the specified style, width, and brush attributes.
     * @param {Integer} iPenStyle A combination of type, style, end cap, and join attributes. The values from each category are combined by using the bitwise OR operator ( | ).
     * @param {Integer} cWidth The width of the pen. If the <i>dwPenStyle</i> parameter is PS_GEOMETRIC, the width is given in logical units. If <i>dwPenStyle</i> is PS_COSMETIC, the width must be set to 1.
     * @param {Pointer<LOGBRUSH>} plbrush A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a> structure. If <i>dwPenStyle</i> is PS_COSMETIC, the <b>lbColor</b> member specifies the color of the pen and the <b>lpStyle</b> member must be set to BS_SOLID. If <i>dwPenStyle</i> is PS_GEOMETRIC, all members must be used to specify the brush attributes of the pen.
     * @param {Integer} cStyle The length, in <b>DWORD</b> units, of the <i>lpStyle</i> array. This value must be zero if <i>dwPenStyle</i> is not PS_USERSTYLE.
     * 
     * The style count is limited to 16.
     * @param {Pointer<Integer>} pstyle A pointer to an array. The first value specifies the length of the first dash in a user-defined style, the second value specifies the length of the first space, and so on. This pointer must be <b>NULL</b> if <i>dwPenStyle</i> is not PS_USERSTYLE.
     * 
     * If the <i>lpStyle</i> array is exceeded during line drawing, the pointer is reset to the beginning of the array. When this happens and <i>dwStyleCount</i> is an even number, the pattern of dashes and spaces repeats. However, if <i>dwStyleCount</i> is odd, the pattern reverses when the pointer is reset -- the first element of <i>lpStyle</i> now refers to spaces, the second refers to dashes, and so forth.
     * @returns {HPEN} If the function succeeds, the return value is a handle that identifies a logical pen.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-extcreatepen
     * @since windows5.0
     */
    static ExtCreatePen(iPenStyle, cWidth, plbrush, cStyle, pstyle) {
        pstyleMarshal := pstyle is VarRef ? "uint*" : "ptr"

        result := DllCall("GDI32.dll\ExtCreatePen", "uint", iPenStyle, "uint", cWidth, "ptr", plbrush, "uint", cStyle, pstyleMarshal, pstyle, "ptr")
        return HPEN({Value: result}, True)
    }

    /**
     * The GetMiterLimit function retrieves the miter limit for the specified device context.
     * @param {HDC} hdc Handle to the device context.
     * @param {Pointer<Float>} plimit Pointer to a floating-point value that receives the current miter limit.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getmiterlimit
     * @since windows5.0
     */
    static GetMiterLimit(hdc, plimit) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        plimitMarshal := plimit is VarRef ? "float*" : "ptr"

        result := DllCall("GDI32.dll\GetMiterLimit", "ptr", hdc, plimitMarshal, plimit, "int")
        return result
    }

    /**
     * The GetArcDirection function retrieves the current arc direction for the specified device context. Arc and rectangle functions use the arc direction.
     * @param {HDC} hdc Handle to the device context.
     * @returns {Integer} The return value specifies the current arc direction; it can be any one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>AD_COUNTERCLOCKWISE</td>
     * <td>Arcs and rectangles are drawn counterclockwise.</td>
     * </tr>
     * <tr>
     * <td>AD_CLOCKWISE</td>
     * <td>Arcs and rectangles are drawn clockwise.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getarcdirection
     * @since windows5.0
     */
    static GetArcDirection(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetArcDirection", "ptr", hdc, "int")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {HGDIOBJ} h A handle to the graphics object of interest. This can be a handle to one of the following: a logical bitmap, a brush, a font, a palette, a pen, or a device independent bitmap created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a> function.
     * @param {Integer} c The number of bytes of information to be written to the buffer.
     * @param {Pointer} pv A pointer to a buffer that receives the information about the specified graphics object.
     * 
     * The following table shows the type of information the buffer receives for each type of graphics object you can specify with <i>hgdiobj</i>.
     * 
     * <table>
     * <tr>
     * <th>Object type</th>
     * <th>Data written to buffer</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBITMAP"></a><a id="hbitmap"></a><dl>
     * <dt><b><b>HBITMAP</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBITMAP_returned_from_a_call_to_CreateDIBSection"></a><a id="hbitmap_returned_from_a_call_to_createdibsection"></a><a id="HBITMAP_RETURNED_FROM_A_CALL_TO_CREATEDIBSECTION"></a><dl>
     * <dt><b><b>HBITMAP</b> returned from a call to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a>, if <i>cbBuffer</i> is set to<c> sizeof (DIBSECTION)</code>, or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a>, if <i>cbBuffer</i> is set to <code>sizeof (BITMAP)</c>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HPALETTE"></a><a id="hpalette"></a><dl>
     * <dt><b><b>HPALETTE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>WORD</b> count of the number of entries in the logical palette
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HPEN_returned_from_a_call_to_ExtCreatePen"></a><a id="hpen_returned_from_a_call_to_extcreatepen"></a><a id="HPEN_RETURNED_FROM_A_CALL_TO_EXTCREATEPEN"></a><dl>
     * <dt><b><b>HPEN</b> returned from a call to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extcreatepen">ExtCreatePen</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-extlogpen">EXTLOGPEN</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HPEN"></a><a id="hpen"></a><dl>
     * <dt><b><b>HPEN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpen">LOGPEN</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBRUSH"></a><a id="hbrush"></a><dl>
     * <dt><b><b>HBRUSH</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HFONT"></a><a id="hfont"></a><dl>
     * <dt><b><b>HFONT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the <i>lpvObject</i> parameter is <b>NULL</b>, the function return value is the number of bytes required to store the information it writes to the buffer for the specified graphics object.
     * 
     * The address of <i>lpvObject</i> must be on a 4-byte boundary; otherwise, <b>GetObject</b> fails.
     * @returns {Integer} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobjectw
     * @since windows5.0
     */
    static GetObjectW(h, c, pv) {
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\GetObjectW", "ptr", h, "int", c, "ptr", pv, "int")
        return result
    }

    /**
     * The MoveToEx function updates the current position to the specified point and optionally returns the previous position.
     * @param {HDC} hdc Handle to a device context.
     * @param {Integer} x Specifies the x-coordinate, in logical units, of the new position, in logical units.
     * @param {Integer} y Specifies the y-coordinate, in logical units, of the new position, in logical units.
     * @param {Pointer<POINT>} lppt Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the previous current position. If this parameter is a <b>NULL</b> pointer, the previous position is not returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-movetoex
     * @since windows5.0
     */
    static MoveToEx(hdc, x, y, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\MoveToEx", "ptr", hdc, "int", x, "int", y, "ptr", lppt, "int")
        return result
    }

    /**
     * The TextOut function writes a character string at the specified location, using the currently selected font, background color, and text color.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical coordinates, of the reference point that the system uses to align the string.
     * @param {Integer} y The y-coordinate, in logical coordinates, of the reference point that the system uses to align the string.
     * @param {PSTR} lpString A pointer to the string to be drawn. The string does not need to be zero-terminated, because <i>cchString</i> specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>, in characters.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-textouta
     * @since windows5.0
     */
    static TextOutA(hdc, x, y, lpString, c) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\TextOutA", "ptr", hdc, "int", x, "int", y, "ptr", lpString, "int", c, "int")
        return result
    }

    /**
     * The TextOut function writes a character string at the specified location, using the currently selected font, background color, and text color.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical coordinates, of the reference point that the system uses to align the string.
     * @param {Integer} y The y-coordinate, in logical coordinates, of the reference point that the system uses to align the string.
     * @param {PWSTR} lpString A pointer to the string to be drawn. The string does not need to be zero-terminated, because <i>cchString</i> specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>, in characters.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-textoutw
     * @since windows5.0
     */
    static TextOutW(hdc, x, y, lpString, c) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        result := DllCall("GDI32.dll\TextOutW", "ptr", hdc, "int", x, "int", y, "ptr", lpString, "int", c, "int")
        return result
    }

    /**
     * The ExtTextOut function draws text using the currently selected font, background color, and text color. You can optionally provide dimensions to be used for clipping, opaquing, or both.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical coordinates, of the reference point used to position the string.
     * @param {Integer} y The y-coordinate, in logical coordinates, of the reference point used to position the string.
     * @param {Integer} options 
     * @param {Pointer<RECT>} lprect A pointer to an optional <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the dimensions, in logical coordinates, of a rectangle that is used for clipping, opaquing, or both.
     * @param {PSTR} lpString A pointer to a string that specifies the text to be drawn. The string does not need to be zero-terminated, since <i>cbCount</i> specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * 
     * This value may not exceed 8192.
     * @param {Pointer<Integer>} lpDx A pointer to an optional array of values that indicate the distance between origins of adjacent character cells. For example, lpDx[<i>i</i>] logical units separate the origins of character cell <i>i</i> and character cell <i>i</i> + 1.
     * @returns {BOOL} If the string is drawn, the return value is nonzero. However, if the ANSI version of <b>ExtTextOut</b> is called with ETO_GLYPH_INDEX, the function returns <b>TRUE</b> even though the function does nothing.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-exttextouta
     * @since windows5.0
     */
    static ExtTextOutA(hdc, x, y, options, lprect, lpString, c, lpDx) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        lpDxMarshal := lpDx is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\ExtTextOutA", "ptr", hdc, "int", x, "int", y, "uint", options, "ptr", lprect, "ptr", lpString, "uint", c, lpDxMarshal, lpDx, "int")
        return result
    }

    /**
     * The ExtTextOut function draws text using the currently selected font, background color, and text color. You can optionally provide dimensions to be used for clipping, opaquing, or both.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical coordinates, of the reference point used to position the string.
     * @param {Integer} y The y-coordinate, in logical coordinates, of the reference point used to position the string.
     * @param {Integer} options 
     * @param {Pointer<RECT>} lprect A pointer to an optional <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the dimensions, in logical coordinates, of a rectangle that is used for clipping, opaquing, or both.
     * @param {PWSTR} lpString A pointer to a string that specifies the text to be drawn. The string does not need to be zero-terminated, since <i>cbCount</i> specifies the length of the string.
     * @param {Integer} c The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * 
     * This value may not exceed 8192.
     * @param {Pointer<Integer>} lpDx A pointer to an optional array of values that indicate the distance between origins of adjacent character cells. For example, lpDx[<i>i</i>] logical units separate the origins of character cell <i>i</i> and character cell <i>i</i> + 1.
     * @returns {BOOL} If the string is drawn, the return value is nonzero. However, if the ANSI version of <b>ExtTextOut</b> is called with ETO_GLYPH_INDEX, the function returns <b>TRUE</b> even though the function does nothing.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-exttextoutw
     * @since windows5.0
     */
    static ExtTextOutW(hdc, x, y, options, lprect, lpString, c, lpDx) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        lpDxMarshal := lpDx is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\ExtTextOutW", "ptr", hdc, "int", x, "int", y, "uint", options, "ptr", lprect, "ptr", lpString, "uint", c, lpDxMarshal, lpDx, "int")
        return result
    }

    /**
     * The PolyTextOut function draws several strings using the font and text colors currently selected in the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POLYTEXTA>} ppt A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-polytexta">POLYTEXT</a> structures describing the strings to be drawn. The array contains one structure for each string to be drawn.
     * @param {Integer} nstrings The number of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-polytexta">POLYTEXT</a> structures in the <i>pptxt</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polytextouta
     * @since windows5.0
     */
    static PolyTextOutA(hdc, ppt, nstrings) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PolyTextOutA", "ptr", hdc, "ptr", ppt, "int", nstrings, "int")
        return result
    }

    /**
     * The PolyTextOut function draws several strings using the font and text colors currently selected in the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POLYTEXTW>} ppt A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-polytexta">POLYTEXT</a> structures describing the strings to be drawn. The array contains one structure for each string to be drawn.
     * @param {Integer} nstrings The number of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-polytexta">POLYTEXT</a> structures in the <i>pptxt</i> array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polytextoutw
     * @since windows5.0
     */
    static PolyTextOutW(hdc, ppt, nstrings) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PolyTextOutW", "ptr", hdc, "ptr", ppt, "int", nstrings, "int")
        return result
    }

    /**
     * The CreatePolygonRgn function creates a polygonal region.
     * @param {Pointer<POINT>} pptl A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that define the vertices of the polygon in logical units. The polygon is presumed closed. Each vertex can be specified only once.
     * @param {Integer} cPoint The number of points in the array.
     * @param {Integer} iMode 
     * @returns {HRGN} If the function succeeds, the return value is the handle to the region.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpolygonrgn
     * @since windows5.0
     */
    static CreatePolygonRgn(pptl, cPoint, iMode) {
        result := DllCall("GDI32.dll\CreatePolygonRgn", "ptr", pptl, "int", cPoint, "int", iMode, "ptr")
        return HRGN({Value: result}, True)
    }

    /**
     * The DPtoLP function converts device coordinates into logical coordinates. The conversion depends on the mapping mode of the device context, the settings of the origins and extents for the window and viewport, and the world transformation.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} lppt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures. The x- and y-coordinates contained in each <b>POINT</b> structure will be transformed.
     * @param {Integer} c The number of points in the array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-dptolp
     * @since windows5.0
     */
    static DPtoLP(hdc, lppt, c) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\DPtoLP", "ptr", hdc, "ptr", lppt, "int", c, "int")
        return result
    }

    /**
     * The LPtoDP function converts logical coordinates into device coordinates. The conversion depends on the mapping mode of the device context, the settings of the origins and extents for the window and viewport, and the world transformation.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} lppt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures. The x-coordinates and y-coordinates contained in each of the <b>POINT</b> structures will be transformed.
     * @param {Integer} c The number of points in the array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-lptodp
     * @since windows5.0
     */
    static LPtoDP(hdc, lppt, c) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\LPtoDP", "ptr", hdc, "ptr", lppt, "int", c, "int")
        return result
    }

    /**
     * The Polygon function draws a polygon consisting of two or more vertices connected by straight lines. The polygon is outlined by using the current pen and filled by using the current brush and polygon fill mode.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that specify the vertices of the polygon, in logical coordinates.
     * @param {Integer} cpt The number of vertices in the array. This value must be greater than or equal to 2.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polygon
     * @since windows5.0
     */
    static Polygon(hdc, apt, cpt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Polygon", "ptr", hdc, "ptr", apt, "int", cpt, "int")
        return result
    }

    /**
     * The Polyline function draws a series of line segments by connecting the points in the specified array.
     * @param {HDC} hdc A handle to a device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures, in logical units.
     * @param {Integer} cpt The number of points in the array. This number must be greater than or equal to two.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polyline
     * @since windows5.0
     */
    static Polyline(hdc, apt, cpt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Polyline", "ptr", hdc, "ptr", apt, "int", cpt, "int")
        return result
    }

    /**
     * The PolyBezier function draws one or more B�zier curves.
     * @param {HDC} hdc A handle to a device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that contain the endpoints and control points of the curve(s), in logical units.
     * @param {Integer} cpt The number of points in the <i>lppt</i> array. This value must be one more than three times the number of curves to be drawn, because each Bézier curve requires two control points and an endpoint, and the initial curve requires an additional starting point.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polybezier
     * @since windows5.0
     */
    static PolyBezier(hdc, apt, cpt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PolyBezier", "ptr", hdc, "ptr", apt, "uint", cpt, "int")
        return result
    }

    /**
     * The PolyBezierTo function draws one or more B�zier curves.
     * @param {HDC} hdc A handle to a device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that contains the endpoints and control points, in logical units.
     * @param {Integer} cpt The number of points in the <i>lppt</i> array. This value must be three times the number of curves to be drawn because each Bézier curve requires two control points and an ending point.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polybezierto
     * @since windows5.0
     */
    static PolyBezierTo(hdc, apt, cpt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PolyBezierTo", "ptr", hdc, "ptr", apt, "uint", cpt, "int")
        return result
    }

    /**
     * The PolylineTo function draws one or more straight lines.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<POINT>} apt A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that contains the vertices of the line, in logical units.
     * @param {Integer} cpt The number of points in the array.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-polylineto
     * @since windows5.0
     */
    static PolylineTo(hdc, apt, cpt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\PolylineTo", "ptr", hdc, "ptr", apt, "uint", cpt, "int")
        return result
    }

    /**
     * Sets the horizontal and vertical extents of the viewport for a device context by using the specified values.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The horizontal extent, in device units, of the viewport.
     * @param {Integer} y The vertical extent, in device units, of the viewport.
     * @param {Pointer<SIZE>} lpsz A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the previous viewport extents, in device units. If <i>lpSize</i> is <b>NULL</b>, this parameter is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setviewportextex
     * @since windows5.0
     */
    static SetViewportExtEx(hdc, x, y, lpsz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetViewportExtEx", "ptr", hdc, "int", x, "int", y, "ptr", lpsz, "int")
        return result
    }

    /**
     * The SetViewportOrgEx function specifies which device point maps to the window origin (0,0).
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in device units, of the new viewport origin.
     * @param {Integer} y The y-coordinate, in device units, of the new viewport origin.
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the previous viewport origin, in device coordinates. If <i>lpPoint</i> is <b>NULL</b>, this parameter is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setviewportorgex
     * @since windows5.0
     */
    static SetViewportOrgEx(hdc, x, y, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetViewportOrgEx", "ptr", hdc, "int", x, "int", y, "ptr", lppt, "int")
        return result
    }

    /**
     * The SetWindowExtEx function sets the horizontal and vertical extents of the window for a device context by using the specified values.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The window's horizontal extent in logical units.
     * @param {Integer} y The window's vertical extent in logical units.
     * @param {Pointer<SIZE>} lpsz A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the previous window extents, in logical units. If <i>lpSize</i> is <b>NULL</b>, this parameter is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setwindowextex
     * @since windows5.0
     */
    static SetWindowExtEx(hdc, x, y, lpsz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetWindowExtEx", "ptr", hdc, "int", x, "int", y, "ptr", lpsz, "int")
        return result
    }

    /**
     * The SetWindowOrgEx function specifies which window point maps to the viewport origin (0,0).
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in logical units, of the new window origin.
     * @param {Integer} y The y-coordinate, in logical units, of the new window origin.
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the previous origin of the window, in logical units. If <i>lpPoint</i> is <b>NULL</b>, this parameter is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setwindoworgex
     * @since windows5.0
     */
    static SetWindowOrgEx(hdc, x, y, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetWindowOrgEx", "ptr", hdc, "int", x, "int", y, "ptr", lppt, "int")
        return result
    }

    /**
     * The OffsetViewportOrgEx function modifies the viewport origin for a device context using the specified horizontal and vertical offsets.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The horizontal offset, in device units.
     * @param {Integer} y The vertical offset, in device units.
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure. The previous viewport origin, in device units, is placed in this structure. If <i>lpPoint</i> is <b>NULL</b>, the previous viewport origin is not returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-offsetviewportorgex
     * @since windows5.0
     */
    static OffsetViewportOrgEx(hdc, x, y, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\OffsetViewportOrgEx", "ptr", hdc, "int", x, "int", y, "ptr", lppt, "int")
        return result
    }

    /**
     * The OffsetWindowOrgEx function modifies the window origin for a device context using the specified horizontal and vertical offsets.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The horizontal offset, in logical units.
     * @param {Integer} y The vertical offset, in logical units.
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure. The logical coordinates of the previous window origin are placed in this structure. If <i>lpPoint</i> is <b>NULL</b>, the previous origin is not returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-offsetwindoworgex
     * @since windows5.0
     */
    static OffsetWindowOrgEx(hdc, x, y, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\OffsetWindowOrgEx", "ptr", hdc, "int", x, "int", y, "ptr", lppt, "int")
        return result
    }

    /**
     * The ScaleViewportExtEx function modifies the viewport for a device context using the ratios formed by the specified multiplicands and divisors.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} xn The amount by which to multiply the current horizontal extent.
     * @param {Integer} dx The amount by which to divide the current horizontal extent.
     * @param {Integer} yn The amount by which to multiply the current vertical extent.
     * @param {Integer} yd The amount by which to divide the current vertical extent.
     * @param {Pointer<SIZE>} lpsz A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the previous viewport extents, in device units. If <i>lpSize</i> is <b>NULL</b>, this parameter is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-scaleviewportextex
     * @since windows5.0
     */
    static ScaleViewportExtEx(hdc, xn, dx, yn, yd, lpsz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ScaleViewportExtEx", "ptr", hdc, "int", xn, "int", dx, "int", yn, "int", yd, "ptr", lpsz, "int")
        return result
    }

    /**
     * The ScaleWindowExtEx function modifies the window for a device context using the ratios formed by the specified multiplicands and divisors.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} xn The amount by which to multiply the current horizontal extent.
     * @param {Integer} xd The amount by which to divide the current horizontal extent.
     * @param {Integer} yn The amount by which to multiply the current vertical extent.
     * @param {Integer} yd The amount by which to divide the current vertical extent.
     * @param {Pointer<SIZE>} lpsz A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that receives the previous window extents, in logical units. If <i>lpSize</i> is <b>NULL</b>, this parameter is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-scalewindowextex
     * @since windows5.0
     */
    static ScaleWindowExtEx(hdc, xn, xd, yn, yd, lpsz) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ScaleWindowExtEx", "ptr", hdc, "int", xn, "int", xd, "int", yn, "int", yd, "ptr", lpsz, "int")
        return result
    }

    /**
     * The SetBitmapDimensionEx function assigns preferred dimensions to a bitmap. These dimensions can be used by applications; however, they are not used by the system.
     * @param {HBITMAP} hbm A handle to the bitmap. The bitmap cannot be a DIB-section bitmap.
     * @param {Integer} w The width, in 0.1-millimeter units, of the bitmap.
     * @param {Integer} h The height, in 0.1-millimeter units, of the bitmap.
     * @param {Pointer<SIZE>} lpsz A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure to receive the previous dimensions of the bitmap. This pointer can be <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setbitmapdimensionex
     * @since windows5.0
     */
    static SetBitmapDimensionEx(hbm, w, h, lpsz) {
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm

        result := DllCall("GDI32.dll\SetBitmapDimensionEx", "ptr", hbm, "int", w, "int", h, "ptr", lpsz, "int")
        return result
    }

    /**
     * The SetBrushOrgEx function sets the brush origin that GDI assigns to the next brush an application selects into the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate, in device units, of the new brush origin. If this value is greater than the brush width, its value is reduced using the modulus operator (<i>nXOrg</i> <b>mod</b> brush width).
     * @param {Integer} y The y-coordinate, in device units, of the new brush origin. If this value is greater than the brush height, its value is reduced using the modulus operator (<i>nYOrg</i> <b>mod</b> brush height).
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the previous brush origin.
     * 
     * This parameter can be <b>NULL</b> if the previous brush origin is not required.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setbrushorgex
     * @since windows5.0
     */
    static SetBrushOrgEx(hdc, x, y, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetBrushOrgEx", "ptr", hdc, "int", x, "int", y, "ptr", lppt, "int")
        return result
    }

    /**
     * The GetTextFace function retrieves the typeface name of the font that is selected into the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} c The length of the buffer pointed to by <i>lpFaceName</i>. For the ANSI function it is a BYTE count and for the Unicode function it is a WORD count. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
     * @param {PSTR} lpName A pointer to the buffer that receives the typeface name. If this parameter is <b>NULL</b>, the function returns the number of characters in the name, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is the number of characters copied to the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextfacea
     * @since windows5.0
     */
    static GetTextFaceA(hdc, c, lpName) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("GDI32.dll\GetTextFaceA", "ptr", hdc, "int", c, "ptr", lpName, "int")
        return result
    }

    /**
     * The GetTextFace function retrieves the typeface name of the font that is selected into the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} c The length of the buffer pointed to by <i>lpFaceName</i>. For the ANSI function it is a BYTE count and for the Unicode function it is a WORD count. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
     * @param {PWSTR} lpName A pointer to the buffer that receives the typeface name. If this parameter is <b>NULL</b>, the function returns the number of characters in the name, including the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is the number of characters copied to the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gettextfacew
     * @since windows5.0
     */
    static GetTextFaceW(hdc, c, lpName) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("GDI32.dll\GetTextFaceW", "ptr", hdc, "int", c, "ptr", lpName, "int")
        return result
    }

    /**
     * The GetKerningPairs function retrieves the character-kerning pairs for the currently selected font for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} nPairs The number of pairs in the <i>lpkrnpair</i> array. If the font has more than <i>nNumPairs</i> kerning pairs, the function returns an error.
     * @param {Pointer<KERNINGPAIR>} lpKernPair A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-kerningpair">KERNINGPAIR</a> structures that receives the kerning pairs. The array must contain at least as many structures as specified by the <i>nNumPairs</i> parameter. If this parameter is <b>NULL</b>, the function returns the total number of kerning pairs for the font.
     * @returns {Integer} If the function succeeds, the return value is the number of kerning pairs returned.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getkerningpairsa
     * @since windows5.0
     */
    static GetKerningPairsA(hdc, nPairs, lpKernPair) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetKerningPairsA", "ptr", hdc, "uint", nPairs, "ptr", lpKernPair, "uint")
        return result
    }

    /**
     * The GetKerningPairs function retrieves the character-kerning pairs for the currently selected font for the specified device context.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} nPairs The number of pairs in the <i>lpkrnpair</i> array. If the font has more than <i>nNumPairs</i> kerning pairs, the function returns an error.
     * @param {Pointer<KERNINGPAIR>} lpKernPair A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-kerningpair">KERNINGPAIR</a> structures that receives the kerning pairs. The array must contain at least as many structures as specified by the <i>nNumPairs</i> parameter. If this parameter is <b>NULL</b>, the function returns the total number of kerning pairs for the font.
     * @returns {Integer} If the function succeeds, the return value is the number of kerning pairs returned.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getkerningpairsw
     * @since windows5.0
     */
    static GetKerningPairsW(hdc, nPairs, lpKernPair) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetKerningPairsW", "ptr", hdc, "uint", nPairs, "ptr", lpKernPair, "uint")
        return result
    }

    /**
     * The GetDCOrgEx function retrieves the final translation origin for a specified device context (DC).
     * @param {HDC} hdc A handle to the DC whose final translation origin is to be retrieved.
     * @param {Pointer<POINT>} lppt A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the final translation origin, in device coordinates.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdcorgex
     * @since windows5.0
     */
    static GetDCOrgEx(hdc, lppt) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetDCOrgEx", "ptr", hdc, "ptr", lppt, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<POINT>} ptl 
     * @returns {BOOL} 
     */
    static FixBrushOrgEx(hdc, x, y, ptl) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\FixBrushOrgEx", "ptr", hdc, "int", x, "int", y, "ptr", ptl, "int")
        return result
    }

    /**
     * The UnrealizeObject function resets the origin of a brush or resets a logical palette.
     * @param {HGDIOBJ} h A handle to the logical palette to be reset.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-unrealizeobject
     * @since windows5.0
     */
    static UnrealizeObject(h) {
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("GDI32.dll\UnrealizeObject", "ptr", h, "int")
        return result
    }

    /**
     * The GdiFlush function flushes the calling thread's current batch.
     * @returns {BOOL} If all functions in the current batch succeed, the return value is nonzero.
     * 
     * If not all functions in the current batch succeed, the return value is zero, indicating that at least one function returned an error.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gdiflush
     * @since windows5.0
     */
    static GdiFlush() {
        result := DllCall("GDI32.dll\GdiFlush", "int")
        return result
    }

    /**
     * The GdiSetBatchLimit function sets the maximum number of function calls that can be accumulated in the calling thread's current batch. The system flushes the current batch whenever this limit is exceeded.
     * @param {Integer} dw Specifies the batch limit to be set. A value of 0 sets the default limit. A value of 1 disables batching.
     * @returns {Integer} If the function succeeds, the return value is the previous batch limit.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gdisetbatchlimit
     * @since windows5.0
     */
    static GdiSetBatchLimit(dw) {
        result := DllCall("GDI32.dll\GdiSetBatchLimit", "uint", dw, "uint")
        return result
    }

    /**
     * The GdiGetBatchLimit function returns the maximum number of function calls that can be accumulated in the calling thread's current batch. The system flushes the current batch whenever this limit is exceeded.
     * @returns {Integer} If the function succeeds, the return value is the batch limit.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-gdigetbatchlimit
     * @since windows5.0
     */
    static GdiGetBatchLimit() {
        result := DllCall("GDI32.dll\GdiGetBatchLimit", "uint")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<WGLSWAP>} param1 
     * @returns {Integer} 
     */
    static wglSwapMultipleBuffers(param0, param1) {
        result := DllCall("OPENGL32.dll\wglSwapMultipleBuffers", "uint", param0, "ptr", param1, "uint")
        return result
    }

    /**
     * The CreateFontPackage function creates a subset version of a specified TrueType font, typically in order to pass it to a printer.
     * @param {Pointer<Integer>} puchSrcBuffer Points to a buffer containing source TTF or TTC data, describing the font that is to be subsetted.
     * @param {Integer} ulSrcBufferSize Specifies size of *<i>puchSrcBuffer</i>, in bytes.
     * @param {Pointer<Pointer<Integer>>} ppuchFontPackageBuffer Points to a variable of type unsigned char*. The <b>CreateFontPackage</b> function will allocate a buffer **<i>puchFontPackageBuffer</i>, using <i>lpfnAllocate</i> and <i>lpfnReAllocate</i>. On successful return, the buffer will contain the subset font or font package. The application is responsible for eventually freeing the buffer.
     * @param {Pointer<Integer>} pulFontPackageBufferSize Points to an unsigned long, which on successful return will specify the allocated size of buffer **<i>puchFontPackageBuffer</i>.
     * @param {Pointer<Integer>} pulBytesWritten Points to an unsigned long, which on successful return will specify the number of bytes actually used in buffer **<i>puchFontPackageBuffer</i>.
     * @param {Integer} usFlag Specifies whether this font should be subsetted, compressed, or both; whether it is a TTF or TTC; and whether*pusSubsetKeepListrepresents character codes or glyph indices. Any combination of the following flags may be specified:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFCFP_FLAGS_SUBSET"></a><a id="ttfcfp_flags_subset"></a><dl>
     * <dt><b>TTFCFP_FLAGS_SUBSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, requests subsetting.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFCFP_FLAGS_COMPRESS"></a><a id="ttfcfp_flags_compress"></a><dl>
     * <dt><b>TTFCFP_FLAGS_COMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, requests compression. The currently shipping version of this function does not do compression. This flag allows for future implementation of this capability, but is currently ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFCFP_FLAGS_TTC"></a><a id="ttfcfp_flags_ttc"></a><dl>
     * <dt><b>TTFCFP_FLAGS_TTC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, specifies that the font in <i>puchSrcBuffer</i> is a TTC; otherwise, it must be a TTF.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFCFP_FLAGS_GLYPHLIST"></a><a id="ttfcfp_flags_glyphlist"></a><dl>
     * <dt><b>TTFCFP_FLAGS_GLYPHLIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, specifies that*pusSubsetKeepListis a list of glyph indices; otherwise, it must be a list of character codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} usTTCIndex The zero based TTC Index; only used if TTFCFP_FLAGS_TTC is set in <i>usFlags</i>.
     * @param {Integer} usSubsetFormat The format of the file to create. Select one of these values; they cannot be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFCFP_SUBSET"></a><a id="ttfcfp_subset"></a><dl>
     * <dt><b>TTFCFP_SUBSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a standalone Subset font that cannot be merged with later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFCFP_SUBSET1"></a><a id="ttfcfp_subset1"></a><dl>
     * <dt><b>TTFCFP_SUBSET1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a Subset font package that can be merged with later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFCFP_DELTA"></a><a id="ttfcfp_delta"></a><dl>
     * <dt><b>TTFCFP_DELTA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a Delta font package that can merge with a previous subset font.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} usSubsetLanguage The language in the Name table to retain. If Set to 0, all languages will be retained. Used only for initial subsetting: that is, used only if <i>usSubsetFormat</i> is either TTFCFP_SUBSET or TTFCFP_SUBSET1, and the TTFCFP_FLAGS_SUBSET flag is set in <i>usFlags</i>.
     * @param {Integer} usSubsetPlatform In conjunction with <i>usSubsetEncoding</i>, specifies which CMAP to use. Used only if *<i>pusSubsetKeepList</i> is a list of characters: that is, used only if TTFCFP_FLAGS_GLYPHLIST is not set in <i>usFlags</i>. In that case, by this CMAP subtable is applied to <i>pusSubsetKeepList</i> to create a list of glyphs to retain in the output font or font package.
     * @param {Integer} usSubsetEncoding In conjunction with <i>usSubsetPlatform</i>, specifies which CMAP to use. Used only if *<i>pusSubsetKeepList</i> is a list of characters: that is, used only if TTFCFP_FLAGS_GLYPHLIST is not set in <i>usFlags</i>.
     * @param {Pointer<Integer>} pusSubsetKeepList Points to an array of integers which comprise a list of character codes or glyph indices that should be retained in the output font or font package. If this list contains character codes (that is, if if TTFCFP_FLAGS_GLYPHLIST is not set in <i>usFlags</i>), this list may be either Unicode or some other type of encoding, depending on the Platform-Encoding CMAP specified by <i>usSubsetPlatform</i> and <i>usSubsetEncoding</i>.
     * @param {Integer} usSubsetListCount The number of elements in the list *<i>pusSubsetKeepList</i>.
     * @param {Pointer<CFP_ALLOCPROC>} lpfnAllocate The callback function to allocate initial memory for <i>puchFontPackageBuffer</i> and for temporary buffers.
     * @param {Pointer<CFP_REALLOCPROC>} lpfnReAllocate The callback function to reallocate memory for <i>puchFontPackageBuffer</i> and for temporary buffers.
     * @param {Pointer<CFP_FREEPROC>} lpfnFree The callback function to free up memory allocated by <i>lpfnAllocate</i> and <i>lpfnReAllocate</i>.
     * @param {Pointer<Void>} lpvReserved Must be set to <b>NULL</b>.
     * @returns {Integer} If the function is successful, returns zero.
     * 
     * Otherwise, returns a nonzero value. See <a href="/windows/desktop/gdi/font-package-function-error-messages">Font-Package Function Error Messages</a> for possible error returns.
     * @see https://docs.microsoft.com/windows/win32/api//fontsub/nf-fontsub-createfontpackage
     * @since windows5.1.2600
     */
    static CreateFontPackage(puchSrcBuffer, ulSrcBufferSize, ppuchFontPackageBuffer, pulFontPackageBufferSize, pulBytesWritten, usFlag, usTTCIndex, usSubsetFormat, usSubsetLanguage, usSubsetPlatform, usSubsetEncoding, pusSubsetKeepList, usSubsetListCount, lpfnAllocate, lpfnReAllocate, lpfnFree, lpvReserved) {
        puchSrcBufferMarshal := puchSrcBuffer is VarRef ? "char*" : "ptr"
        ppuchFontPackageBufferMarshal := ppuchFontPackageBuffer is VarRef ? "ptr*" : "ptr"
        pulFontPackageBufferSizeMarshal := pulFontPackageBufferSize is VarRef ? "uint*" : "ptr"
        pulBytesWrittenMarshal := pulBytesWritten is VarRef ? "uint*" : "ptr"
        pusSubsetKeepListMarshal := pusSubsetKeepList is VarRef ? "ushort*" : "ptr"
        lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("FONTSUB.dll\CreateFontPackage", puchSrcBufferMarshal, puchSrcBuffer, "uint", ulSrcBufferSize, ppuchFontPackageBufferMarshal, ppuchFontPackageBuffer, pulFontPackageBufferSizeMarshal, pulFontPackageBufferSize, pulBytesWrittenMarshal, pulBytesWritten, "ushort", usFlag, "ushort", usTTCIndex, "ushort", usSubsetFormat, "ushort", usSubsetLanguage, "short", usSubsetPlatform, "short", usSubsetEncoding, pusSubsetKeepListMarshal, pusSubsetKeepList, "ushort", usSubsetListCount, "ptr", lpfnAllocate, "ptr", lpfnReAllocate, "ptr", lpfnFree, lpvReservedMarshal, lpvReserved, "CDecl uint")
        return result
    }

    /**
     * The MergeFontPackage function manipulates fonts created by CreateFontPackage.
     * @param {Pointer<Integer>} puchMergeFontBuffer A pointer to a buffer containing a font to merge with. This is used only when <i>usMode</i> is TTFMFP_DELTA.
     * @param {Integer} ulMergeFontBufferSize Specifies size of *<i>puchMergeFontBuffer</i>, in bytes.
     * @param {Pointer<Integer>} puchFontPackageBuffer A pointer to a to buffer containing a font package.
     * @param {Integer} ulFontPackageBufferSize Specifies size of *<i>puchMergeFontBuffer</i>, in bytes.
     * @param {Pointer<Pointer<Integer>>} ppuchDestBuffer A pointer to a variable of type unsigned char*. The <b>MergeFontPackage</b> function will allocate a buffer **<i>ppuchDestBuffer</i>, using <i>lpfnAllocate</i> and <i>lpfnReAllocate</i>. On successful return, that buffer will contain the resulting merged or expanded font. The application is responsible for eventually freeing that buffer.
     * @param {Pointer<Integer>} pulDestBufferSize Points to an unsigned long, which on successful return will specify the allocated size of buffer **<i>ppuchDestBuffer</i>.
     * @param {Pointer<Integer>} pulBytesWritten Points to an unsigned long, which on successful return will specify the number of bytes actually used in buffer **<i>ppuchDestBuffer</i>.
     * @param {Integer} usMode Specifies what kind of process to perform. Select one of these values; they cannot be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFMFP_SUBSET"></a><a id="ttfmfp_subset"></a><dl>
     * <dt><b>TTFMFP_SUBSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copies a simple working font; see remarks below.
     * 
     * <i>puchMergeFontBuffer</i> will be ignored; <i>puchFontPackageBuffer</i> should contain a working font created by <a href="https://docs.microsoft.com/windows/desktop/api/fontsub/nf-fontsub-createfontpackage">CreateFontPackage</a> with <i>usSubsetFormat</i> set to TTFCFP_SUBSET; this working font will simply be copied to <i>ppuchDestBuffer</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFMFP_SUBSET1"></a><a id="ttfmfp_subset1"></a><dl>
     * <dt><b>TTFMFP_SUBSET1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turns a font package into a mergeable working font; see remarks below.
     * 
     * <i>puchMergeFontBuffer</i> will be ignored; <i>puchFontPackageBuffer</i> should contain a mergeable working font created by <a href="https://docs.microsoft.com/windows/desktop/api/fontsub/nf-fontsub-createfontpackage">CreateFontPackage</a> with <i>usSubsetFormat</i> set to TTFCFP_SUBSET1. The result in **<i>ppuchDestBuffer</i> will be a working font that may be merged with later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTFMFP_DELTA"></a><a id="ttfmfp_delta"></a><dl>
     * <dt><b>TTFMFP_DELTA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges a Delta font package into a mergeable working font; see remarks below.
     * 
     * *<i>puchFontPackageBuffer</i> should contain a font package created by <a href="https://docs.microsoft.com/windows/desktop/api/fontsub/nf-fontsub-createfontpackage">CreateFontPackage</a> with <i>usSubsetFormat</i> set to TTFCFP_DELTA and <i>puchMergeFontBuffer</i> should contain a font package created by a prior call to <b>MergeFontPackage</b> with <i>usMode</i> set to TTFMFP_SUBSET1 or TTFMFP_DELTA. The resulting merged font in **<i>ppuchDestBuffer</i> will be a working font that may be merged with later.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<CFP_ALLOCPROC>} lpfnAllocate The callback function to allocate initial memory for <i>ppuchDestBuffer</i> and for temporary buffers.
     * @param {Pointer<CFP_REALLOCPROC>} lpfnReAllocate The callback function to reallocate memory for <i>ppuchDestBuffer</i> and for temporary buffers.
     * @param {Pointer<CFP_FREEPROC>} lpfnFree The callback function to free up memory allocated by <i>lpfnAllocate</i> and <i>lpfnReAllocate</i>.
     * @param {Pointer<Void>} lpvReserved Must be set to <b>NULL</b>.
     * @returns {Integer} If the function is successful, returns zero.
     * 
     * Otherwise, returns a nonzero value. See <a href="/windows/desktop/gdi/font-package-function-error-messages">Font-Package Function Error Messages</a> for possible error returns.
     * @see https://docs.microsoft.com/windows/win32/api//fontsub/nf-fontsub-mergefontpackage
     * @since windows5.1.2600
     */
    static MergeFontPackage(puchMergeFontBuffer, ulMergeFontBufferSize, puchFontPackageBuffer, ulFontPackageBufferSize, ppuchDestBuffer, pulDestBufferSize, pulBytesWritten, usMode, lpfnAllocate, lpfnReAllocate, lpfnFree, lpvReserved) {
        puchMergeFontBufferMarshal := puchMergeFontBuffer is VarRef ? "char*" : "ptr"
        puchFontPackageBufferMarshal := puchFontPackageBuffer is VarRef ? "char*" : "ptr"
        ppuchDestBufferMarshal := ppuchDestBuffer is VarRef ? "ptr*" : "ptr"
        pulDestBufferSizeMarshal := pulDestBufferSize is VarRef ? "uint*" : "ptr"
        pulBytesWrittenMarshal := pulBytesWritten is VarRef ? "uint*" : "ptr"
        lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("FONTSUB.dll\MergeFontPackage", puchMergeFontBufferMarshal, puchMergeFontBuffer, "uint", ulMergeFontBufferSize, puchFontPackageBufferMarshal, puchFontPackageBuffer, "uint", ulFontPackageBufferSize, ppuchDestBufferMarshal, ppuchDestBuffer, pulDestBufferSizeMarshal, pulDestBufferSize, pulBytesWrittenMarshal, pulBytesWritten, "ushort", usMode, "ptr", lpfnAllocate, "ptr", lpfnReAllocate, "ptr", lpfnFree, lpvReservedMarshal, lpvReserved, "CDecl uint")
        return result
    }

    /**
     * Creates a font structure containing the subsetted wide-character (16-bit) font. The current font of the device context (hDC) provides the font information.
     * @param {HDC} hDC Device context handle.
     * @param {Integer} ulFlags 
     * @param {Integer} ulCharSet 
     * @param {Pointer<Integer>} pulPrivStatus 
     * @param {Pointer<Integer>} pulStatus Pointer to a bitfield containing status information about the embedding request. This field is filled upon completion of this function. No bits are currently defined for this parameter.
     * @param {Pointer<WRITEEMBEDPROC>} lpfnWriteToStream Pointer to the client-defined callback function, which writes the font structure to the document stream. See <a href="https://docs.microsoft.com/previous-versions/dd145225(v=vs.85)">WRITEEMBEDPROC</a>.
     * @param {Pointer<Void>} lpvWriteStream A token to represent the output stream.
     * @param {Pointer<Integer>} pusCharCodeSet Pointer to the buffer containing the optional Unicode character codes for subsetting. This field is only used for subsetting a font and is ignored if the <i>ulFlags</i> field does not specify TTEMBED_SUBSET.
     * @param {Integer} usCharCodeCount The number of characters in the list of characters indicated by <i>pusCharCodeSet</i>. This field is only used for subsetting a font and is ignored if the <i>ulFlags</i> field does not specify TTEMBED_SUBSET.
     * @param {Integer} usLanguage Specifies which language in the name table to keep when subsetting. Set to 0 to keep all languages. This field is only used for subsetting a font and is ignored if the <i>ulFlags</i> field does not specify TTEMBED_SUBSET.
     * @param {Pointer<TTEMBEDINFO>} pTTEmbedInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttembedinfo">TTEMBEDINFO</a> structure containing the URLs from which the embedded font object may be legitimately referenced. If <i>pTTEmbedInfo</i> is <b>NULL</b>, no URLs will be added to the embedded font object and no URL checking will occur when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/nf-t2embapi-ttloadembeddedfont">TTLoadEmbeddedFont</a>.
     * @returns {Integer} If the embedding is successful, returns E_NONE.
     * 
     * The font structure is incorporated into the document stream by the client. <i>pulPrivStatus</i> is set, indicating the embedding privileges of the font; and <i>pulStatus</i> is set to provide results of the embedding operation.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttembedfont
     * @since windows5.0
     */
    static TTEmbedFont(hDC, ulFlags, ulCharSet, pulPrivStatus, pulStatus, lpfnWriteToStream, lpvWriteStream, pusCharCodeSet, usCharCodeCount, usLanguage, pTTEmbedInfo) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        pulPrivStatusMarshal := pulPrivStatus is VarRef ? "uint*" : "ptr"
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"
        lpvWriteStreamMarshal := lpvWriteStream is VarRef ? "ptr" : "ptr"
        pusCharCodeSetMarshal := pusCharCodeSet is VarRef ? "ushort*" : "ptr"

        result := DllCall("t2embed.dll\TTEmbedFont", "ptr", hDC, "uint", ulFlags, "uint", ulCharSet, pulPrivStatusMarshal, pulPrivStatus, pulStatusMarshal, pulStatus, "ptr", lpfnWriteToStream, lpvWriteStreamMarshal, lpvWriteStream, pusCharCodeSetMarshal, pusCharCodeSet, "ushort", usCharCodeCount, "ushort", usLanguage, "ptr", pTTEmbedInfo, "int")
        return result
    }

    /**
     * Creates a font structure containing the subsetted wide-character (16-bit) font. An external file provides the font information.
     * @param {HDC} hDC Device context handle.
     * @param {PSTR} szFontFileName The font file name and path to embed. This is an ANSI string.
     * @param {Integer} usTTCIndex Zero-based index into the font file (TTC) identifying the physical font to embed. If the file contains a single font (such as a TTF or OTF outline file), this parameter should be set to 0.
     * @param {Integer} ulFlags 
     * @param {Integer} ulCharSet 
     * @param {Pointer<Integer>} pulPrivStatus 
     * @param {Pointer<Integer>} pulStatus Pointer to a bitfield containing status information about the embedding request. This field is filled upon completion of this function. No bits are currently defined for this parameter.
     * @param {Pointer<WRITEEMBEDPROC>} lpfnWriteToStream Pointer to the client-defined callback function that writes the font structure to the document stream.  See <a href="https://docs.microsoft.com/previous-versions/dd145225(v=vs.85)">WRITEEMBEDPROC</a>.
     * @param {Pointer<Void>} lpvWriteStream A token to represent the output stream.
     * @param {Pointer<Integer>} pusCharCodeSet Pointer to the buffer containing the optional Unicode character codes for subsetting. This field is only used for subsetting a font and is ignored if theulFlagsfield does not specify TTEMBED_SUBSET.
     * @param {Integer} usCharCodeCount The number of characters in the list of characters indicated by <i>pusCharCodeSet</i>. This field is only used for subsetting a font and is ignored if the <i>ulFlags</i> field does not specify TTEMBED_SUBSET.
     * @param {Integer} usLanguage Specifies which language in the name table to keep when subsetting. Set to 0 to keep all languages. This field is only used for subsetting a font and is ignored if the <i>ulFlags</i> field does not specify TTEMBED_SUBSET.
     * @param {Pointer<TTEMBEDINFO>} pTTEmbedInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttembedinfo">TTEMBEDINFO</a> structure containing the URLs from which the embedded font object may be legitimately referenced. If <i>pTTEmbedInfo</i> is <b>NULL</b>, no URLs will be added to the embedded font object and no URL checking will occur when the client calls the <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/nf-t2embapi-ttloadembeddedfont">TTLoadEmbeddedFont</a> function.
     * @returns {Integer} If the embedding is successful, returns E_NONE.
     * 
     * The font structure is incorporated into the document stream by the client. <i>pulPrivStatus</i> is set, indicating the embedding privileges of the font; and <i>pulStatus</i> is set to provide results of the embedding operation.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttembedfontfromfilea
     * @since windows5.0
     */
    static TTEmbedFontFromFileA(hDC, szFontFileName, usTTCIndex, ulFlags, ulCharSet, pulPrivStatus, pulStatus, lpfnWriteToStream, lpvWriteStream, pusCharCodeSet, usCharCodeCount, usLanguage, pTTEmbedInfo) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        szFontFileName := szFontFileName is String ? StrPtr(szFontFileName) : szFontFileName

        pulPrivStatusMarshal := pulPrivStatus is VarRef ? "uint*" : "ptr"
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"
        lpvWriteStreamMarshal := lpvWriteStream is VarRef ? "ptr" : "ptr"
        pusCharCodeSetMarshal := pusCharCodeSet is VarRef ? "ushort*" : "ptr"

        result := DllCall("t2embed.dll\TTEmbedFontFromFileA", "ptr", hDC, "ptr", szFontFileName, "ushort", usTTCIndex, "uint", ulFlags, "uint", ulCharSet, pulPrivStatusMarshal, pulPrivStatus, pulStatusMarshal, pulStatus, "ptr", lpfnWriteToStream, lpvWriteStreamMarshal, lpvWriteStream, pusCharCodeSetMarshal, pusCharCodeSet, "ushort", usCharCodeCount, "ushort", usLanguage, "ptr", pTTEmbedInfo, "int")
        return result
    }

    /**
     * Reads an embedded font from the document stream and installs it. Also allows a client to further restrict embedding privileges of the font.
     * @param {Pointer<HANDLE>} phFontReference A pointer to a handle that identifies the installed embedded font. This handle references an internal structure, not an Hfont.
     * @param {Integer} ulFlags A flag specifying loading and installation options. Currently, this flag can be set to zero or the following value:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTLOAD_PRIVATE"></a><a id="ttload_private"></a><dl>
     * <dt><b>TTLOAD_PRIVATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Load the font so that it is not enumerated to the user. If the font is not installable, it will remain private.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pulPrivStatus 
     * @param {Integer} ulPrivs 
     * @param {Pointer<Integer>} pulStatus 
     * @param {Pointer<READEMBEDPROC>} lpfnReadFromStream A pointer to the client-defined callback function that reads the font structure from the document stream.
     * @param {Pointer<Void>} lpvReadStream A pointer to the stream (font structure).
     * @param {PWSTR} szWinFamilyName A pointer to the new 16-bit-character Unicode Microsoft Windows family name of the font. Set to <b>NULL</b> to use existing name. When changing the name of a font upon loading, you must supply both this parameter and the <i>szMacFamilyName</i> parameter.
     * @param {PSTR} szMacFamilyName A pointer to the new 8-bit-character Macintosh family name of the font. Set to <b>NULL</b> to use existing name. When changing the name of a font upon loading, you must supply both this parameter and the <i>szWinFamilyName</i> parameter.
     * @param {Pointer<TTLOADINFO>} pTTLoadInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttloadinfo">TTLOADINFO</a> structure containing the URL from which the embedded font object has been obtained. If this value does not match one of those contained in the <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttembedinfo">TTEMBEDINFO</a> structure, the font will not load successfully.
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * If font loading is successful, a font indicated by <i>phFontReference</i> is created from the font structure with the names referenced in <i>szWinFamilyName</i> and <i>szMacFamilyName</i>. <i>pulPrivStatus</i> is set indicating the embedding privileges of the font; and <i>pulStatus</i> may be set indicating status information about the font loading operation.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttloadembeddedfont
     * @since windows5.0
     */
    static TTLoadEmbeddedFont(phFontReference, ulFlags, pulPrivStatus, ulPrivs, pulStatus, lpfnReadFromStream, lpvReadStream, szWinFamilyName, szMacFamilyName, pTTLoadInfo) {
        szWinFamilyName := szWinFamilyName is String ? StrPtr(szWinFamilyName) : szWinFamilyName
        szMacFamilyName := szMacFamilyName is String ? StrPtr(szMacFamilyName) : szMacFamilyName

        pulPrivStatusMarshal := pulPrivStatus is VarRef ? "uint*" : "ptr"
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"
        lpvReadStreamMarshal := lpvReadStream is VarRef ? "ptr" : "ptr"

        result := DllCall("t2embed.dll\TTLoadEmbeddedFont", "ptr", phFontReference, "uint", ulFlags, pulPrivStatusMarshal, pulPrivStatus, "uint", ulPrivs, pulStatusMarshal, pulStatus, "ptr", lpfnReadFromStream, lpvReadStreamMarshal, lpvReadStream, "ptr", szWinFamilyName, "ptr", szMacFamilyName, "ptr", pTTLoadInfo, "int")
        return result
    }

    /**
     * Retrieves information about an embedded font, such as embedding permissions. TTGetEmbeddedFontInfo performs the same task as TTLoadEmbeddedFont but does not allocate internal data structures for the embedded font.
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} pulPrivStatus On completion, indicates embedding privileges of the font. A list of possible values follows:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EMBED_PREVIEWPRINT"></a><a id="embed_previewprint"></a><dl>
     * <dt><b>EMBED_PREVIEWPRINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Preview and Print Embedding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EMBED_EDITABLE"></a><a id="embed_editable"></a><dl>
     * <dt><b>EMBED_EDITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Editable Embedding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EMBED_INSTALLABLE"></a><a id="embed_installable"></a><dl>
     * <dt><b>EMBED_INSTALLABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Installable Embedding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EMBED_NOEMBEDDING"></a><a id="embed_noembedding"></a><dl>
     * <dt><b>EMBED_NOEMBEDDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Restricted License Embedding.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulPrivs Flag indicating a further restriction of embedding privileges, imposed by the client. See <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/nf-t2embapi-ttloadembeddedfont">TTLoadEmbeddedFont</a> for additional information.
     * @param {Pointer<Integer>} pulStatus Pointer to a bitfield containing status information, and is filled upon completion of this function. The status can be zero or the following value:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTLOAD_FONT_SUBSETTED"></a><a id="ttload_font_subsetted"></a><dl>
     * <dt><b>TTLOAD_FONT_SUBSETTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font loaded is a subset of the original font.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<READEMBEDPROC>} lpfnReadFromStream [callback] Pointer to the client-defined callback function that reads the font structure from the document stream.
     * @param {Pointer<Void>} lpvReadStream Currently undefined. Reserved for a pointer to the stream (font structure).
     * @param {Pointer<TTLOADINFO>} pTTLoadInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttloadinfo">TTLOADINFO</a> structure containing the URL from which the embedded font object has been obtained.
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * The location referenced by *<i>pulPrivStatus</i> identifies embedding privileges of the font. The location referenced by *<i>pulStatus</i> identifies whether a subset of the font is embedded.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttgetembeddedfontinfo
     * @since windows5.0
     */
    static TTGetEmbeddedFontInfo(ulFlags, pulPrivStatus, ulPrivs, pulStatus, lpfnReadFromStream, lpvReadStream, pTTLoadInfo) {
        pulPrivStatusMarshal := pulPrivStatus is VarRef ? "uint*" : "ptr"
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"
        lpvReadStreamMarshal := lpvReadStream is VarRef ? "ptr" : "ptr"

        result := DllCall("t2embed.dll\TTGetEmbeddedFontInfo", "uint", ulFlags, pulPrivStatusMarshal, pulPrivStatus, "uint", ulPrivs, pulStatusMarshal, pulStatus, "ptr", lpfnReadFromStream, lpvReadStreamMarshal, lpvReadStream, "ptr", pTTLoadInfo, "int")
        return result
    }

    /**
     * Releases memory used by an embedded font, hFontReference.
     * @param {HANDLE} hFontReference Handle identifying font, as provided in the <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/nf-t2embapi-ttloadembeddedfont">TTLoadEmbeddedFont</a> function.
     * @param {Integer} ulFlags Flag specifying font deletion options. Currently, this flag can be set to zero or the following value:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTDELETE_DONTREMOVEFONT"></a><a id="ttdelete_dontremovefont"></a><dl>
     * <dt><b>TTDELETE_DONTREMOVEFONT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not remove the installed font from the system, but release the memory previously occupied by the embedded font structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pulStatus Currently undefined.
     * @returns {Integer} If successful, <b>TTDeleteEmbeddedFont</b> returns a value of E_NONE.
     * 
     * The memory occupied by the embedded font structure is cleared. By default, the font indicated by <i>hFontReference</i> is also permanently removed (uninstalled and deleted) from the system.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttdeleteembeddedfont
     * @since windows5.0
     */
    static TTDeleteEmbeddedFont(hFontReference, ulFlags, pulStatus) {
        hFontReference := hFontReference is Win32Handle ? NumGet(hFontReference, "ptr") : hFontReference

        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"

        result := DllCall("t2embed.dll\TTDeleteEmbeddedFont", "ptr", hFontReference, "uint", ulFlags, pulStatusMarshal, pulStatus, "int")
        return result
    }

    /**
     * Obtains the embedding privileges of a font.
     * @param {HDC} hDC Device context handle.
     * @param {Pointer<Integer>} pulEmbedType 
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * This function reads the embedding privileges stored in the font and transfers the privileges to <i>pulPrivStatus</i>.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttgetembeddingtype
     * @since windows5.0
     */
    static TTGetEmbeddingType(hDC, pulEmbedType) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        pulEmbedTypeMarshal := pulEmbedType is VarRef ? "uint*" : "ptr"

        result := DllCall("t2embed.dll\TTGetEmbeddingType", "ptr", hDC, pulEmbedTypeMarshal, pulEmbedType, "int")
        return result
    }

    /**
     * Converts an array of 8-bit character code values to 16-bit Unicode values.
     * @param {HDC} hDC A device context handle.
     * @param {Pointer<Integer>} pucCharCodes A pointer to an array of 8-bit character codes to convert to 16-bit Unicode values. Must be set to a non-null value.
     * @param {Integer} ulCharCodeSize The size of an 8-bit character code array.
     * @param {Pointer<Integer>} pusShortCodes A pointer to an array that will be filled by this function with the Unicode equivalents of the 8-bit values in the <i>pucCharCodesarray</i>. This parameter must be set to a non-null value.
     * @param {Integer} ulShortCodeSize The size, in wide characters, of the character code array.
     * @param {Integer} ulFlags This parameter is currently unused.
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * Array *<i>pusShortCodes</i> is filled with 16-bit Unicode values that correspond to the 8-bit character codes in *<i>pusCharCodes</i>.<i>ulShortCodeSize</i> contains the size, in wide characters, of *<i>pusShortCodes</i>.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttchartounicode
     * @since windows5.0
     */
    static TTCharToUnicode(hDC, pucCharCodes, ulCharCodeSize, pusShortCodes, ulShortCodeSize, ulFlags) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        pucCharCodesMarshal := pucCharCodes is VarRef ? "char*" : "ptr"
        pusShortCodesMarshal := pusShortCodes is VarRef ? "ushort*" : "ptr"

        result := DllCall("t2embed.dll\TTCharToUnicode", "ptr", hDC, pucCharCodesMarshal, pucCharCodes, "uint", ulCharCodeSize, pusShortCodesMarshal, pusShortCodes, "uint", ulShortCodeSize, "uint", ulFlags, "int")
        return result
    }

    /**
     * Validates part or all glyph data of a wide-character (16-bit) font, in the size range specified.
     * @param {HDC} hDC Device context handle.
     * @param {Pointer<TTVALIDATIONTESTSPARAMS>} pTestParam Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttvalidationtestsparams">TTVALIDATIONTESTPARAMS</a> structure specifying the parameters to test.
     * @returns {Integer} If successful and the glyph data is valid, returns E_NONE.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttrunvalidationtests
     * @since windows5.0
     */
    static TTRunValidationTests(hDC, pTestParam) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := DllCall("t2embed.dll\TTRunValidationTests", "ptr", hDC, "ptr", pTestParam, "int")
        return result
    }

    /**
     * Determines whether the typeface exclusion list contains a specified font.
     * @param {HDC} hDC Device context handle.
     * @param {Pointer<BOOL>} pbEnabled Pointer to a boolean, set upon completion of the function. A nonzero value indicates the font is not in the typeface exclusion list and, therefore, can be embedded without conflict.
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * The parameter <i>pbEnabled</i> is filled with a boolean that indicates whether embedding is currently enabled within a device context.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttisembeddingenabled
     * @since windows5.0
     */
    static TTIsEmbeddingEnabled(hDC, pbEnabled) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := DllCall("t2embed.dll\TTIsEmbeddingEnabled", "ptr", hDC, "ptr", pbEnabled, "int")
        return result
    }

    /**
     * Determines whether embedding is enabled for a specified font.
     * @param {PSTR} lpszFacename Pointer to the facename of the font, such as Arial Bold.
     * @param {Pointer<BOOL>} pbEnabled Pointer to a boolean, set upon completion of the function. A nonzero value indicates the font is not in the typeface exclusion list, and, therefore, can be embedded without conflict.
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * <i>pbEnabled</i> is filled with a boolean that indicates whether embedding is currently enabled within a device context for the specified font.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttisembeddingenabledforfacename
     * @since windows5.0
     */
    static TTIsEmbeddingEnabledForFacename(lpszFacename, pbEnabled) {
        lpszFacename := lpszFacename is String ? StrPtr(lpszFacename) : lpszFacename

        result := DllCall("t2embed.dll\TTIsEmbeddingEnabledForFacename", "ptr", lpszFacename, "ptr", pbEnabled, "int")
        return result
    }

    /**
     * Adds or removes facenames from the typeface exclusion list.
     * @param {PSTR} lpszFacename Pointer to the facename of the font to be added or removed from the typeface exclusion list.
     * @param {BOOL} bEnable Boolean controlling operation on typeface exclusion list. If nonzero, then the facename will be removed from the list; if zero, the facename will be added to the list.
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * The facename indicated by <i>lpszFacename</i> will be added or removed from the typeface exclusion list.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttenableembeddingforfacename
     * @since windows5.0
     */
    static TTEnableEmbeddingForFacename(lpszFacename, bEnable) {
        lpszFacename := lpszFacename is String ? StrPtr(lpszFacename) : lpszFacename

        result := DllCall("t2embed.dll\TTEnableEmbeddingForFacename", "ptr", lpszFacename, "int", bEnable, "int")
        return result
    }

    /**
     * Creates a font structure containing the subsetted UCS-4 character (32-bit) font. The current font of the device context (hDC) provides the font information.
     * @param {HDC} hDC Device context handle.
     * @param {Integer} ulFlags 
     * @param {Integer} ulCharSet 
     * @param {Pointer<Integer>} pulPrivStatus 
     * @param {Pointer<Integer>} pulStatus Pointer to a bitfield containing status information about the embedding request. This field is filled upon completion of this function. No bits are currently defined for this parameter.
     * @param {Pointer<WRITEEMBEDPROC>} lpfnWriteToStream Pointer to the client-defined callback function which writes the font structure to the document stream. See <a href="https://docs.microsoft.com/previous-versions/dd145225(v=vs.85)">WRITEEMBEDPROC</a>.
     * @param {Pointer<Void>} lpvWriteStream A token to represent the output stream.
     * @param {Pointer<Integer>} pulCharCodeSet Pointer to the buffer containing the optional UCS-4 character codes for subsetting. This field is only used for subsetting a font and is ignored if the <i>ulFlags</i> field does not specify TTEMBED_SUBSET.
     * @param {Integer} usCharCodeCount The number of characters in the list of characters indicated by <i>pulCharCodeSet</i>. This field is only used for subsetting a font and is ignored if the ulFlags field does not specify TTEMBED_SUBSET.
     * @param {Integer} usLanguage Specifies which language in the name table to keep when subsetting. Set to 0 to keep all languages. This field is only used for subsetting a font and is ignored if the <i>ulFlags</i> field does not specify TTEMBED_SUBSET.
     * @param {Pointer<TTEMBEDINFO>} pTTEmbedInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttembedinfo">TTEMBEDINFO</a> structure containing the URLs from which the embedded font object may be legitimately referenced. If <i>pTTEmbedInfo</i> is <b>NULL</b>, no URLs will be added to the embedded font object and no URL checking will occur when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/nf-t2embapi-ttloadembeddedfont">TTLoadEmbeddedFont</a>.
     * @returns {Integer} If the embedding is successful, returns E_NONE.
     * 
     * The font structure is incorporated into the document stream by the client.
     * 
     * <i>pulPrivStatus</i> is set, indicating the embedding privileges of the font; and <i>pulStatus</i> is set to provide results of the embedding operation.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttembedfontex
     * @since windows5.0
     */
    static TTEmbedFontEx(hDC, ulFlags, ulCharSet, pulPrivStatus, pulStatus, lpfnWriteToStream, lpvWriteStream, pulCharCodeSet, usCharCodeCount, usLanguage, pTTEmbedInfo) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        pulPrivStatusMarshal := pulPrivStatus is VarRef ? "uint*" : "ptr"
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"
        lpvWriteStreamMarshal := lpvWriteStream is VarRef ? "ptr" : "ptr"
        pulCharCodeSetMarshal := pulCharCodeSet is VarRef ? "uint*" : "ptr"

        result := DllCall("t2embed.dll\TTEmbedFontEx", "ptr", hDC, "uint", ulFlags, "uint", ulCharSet, pulPrivStatusMarshal, pulPrivStatus, pulStatusMarshal, pulStatus, "ptr", lpfnWriteToStream, lpvWriteStreamMarshal, lpvWriteStream, pulCharCodeSetMarshal, pulCharCodeSet, "ushort", usCharCodeCount, "ushort", usLanguage, "ptr", pTTEmbedInfo, "int")
        return result
    }

    /**
     * Validates part or all glyph data of a UCS-4 character (32-bit) font, in the size range specified.
     * @param {HDC} hDC Device context handle.
     * @param {Pointer<TTVALIDATIONTESTSPARAMSEX>} pTestParam Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/t2embapi/ns-t2embapi-ttvalidationtestsparamsex">TTVALIDATIONTESTPARAMSEX</a> structure specifying the parameters to test.
     * @returns {Integer} If successful and the glyph data is valid, returns E_NONE.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttrunvalidationtestsex
     * @since windows5.0
     */
    static TTRunValidationTestsEx(hDC, pTestParam) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := DllCall("t2embed.dll\TTRunValidationTestsEx", "ptr", hDC, "ptr", pTestParam, "int")
        return result
    }

    /**
     * Obtains the family name for the font loaded through TTLoadEmbeddedFont.
     * @param {Pointer<HANDLE>} phFontReference Handle that identifies the embedded font that has been installed. The handle references an internal structure, not an Hfont.
     * @param {PWSTR} wzWinFamilyName Buffer to hold the new 16-bit-character Microsoft Windows family name.
     * @param {Integer} cchMaxWinName Length of the string allocated for the Windows name (<i>szWinFamilyName</i>). Must be at least LF_FACESIZE long.
     * @param {PSTR} szMacFamilyName Buffer to hold the new 8-bit-character MacIntosh family name.
     * @param {Integer} cchMaxMacName Length of the string allocated for the Macintosh name (<i>szMacFamilyName</i>). Must be at least LF_FACESIZE long.
     * @returns {Integer} If successful, returns E_NONE.
     * 
     * The font family name is a string in <i>szWinFamilyName</i> or <i>szMacFamilyName</i>.
     * 
     * Otherwise, returns an error code described in <a href="/windows/desktop/gdi/font-embedding-function-error-messages">Embedding-Function Error Messages</a>.
     * @see https://docs.microsoft.com/windows/win32/api//t2embapi/nf-t2embapi-ttgetnewfontname
     * @since windows5.0
     */
    static TTGetNewFontName(phFontReference, wzWinFamilyName, cchMaxWinName, szMacFamilyName, cchMaxMacName) {
        wzWinFamilyName := wzWinFamilyName is String ? StrPtr(wzWinFamilyName) : wzWinFamilyName
        szMacFamilyName := szMacFamilyName is String ? StrPtr(szMacFamilyName) : szMacFamilyName

        result := DllCall("t2embed.dll\TTGetNewFontName", "ptr", phFontReference, "ptr", wzWinFamilyName, "int", cchMaxWinName, "ptr", szMacFamilyName, "int", cchMaxMacName, "int")
        return result
    }

    /**
     * The DrawEdge function draws one or more edges of rectangle.
     * @param {HDC} hdc A handle to the device context.
     * @param {Pointer<RECT>} qrc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the rectangle.
     * @param {Integer} edge The type of inner and outer edges to draw. This parameter must be a combination of one inner-border flag and one outer-border flag. The inner-border flags are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDR_RAISEDINNER"></a><a id="bdr_raisedinner"></a><dl>
     * <dt><b>BDR_RAISEDINNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raised inner edge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDR_SUNKENINNER"></a><a id="bdr_sunkeninner"></a><dl>
     * <dt><b>BDR_SUNKENINNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunken inner edge.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The outer-border flags are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDR_RAISEDOUTER"></a><a id="bdr_raisedouter"></a><dl>
     * <dt><b>BDR_RAISEDOUTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raised outer edge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDR_SUNKENOUTER"></a><a id="bdr_sunkenouter"></a><dl>
     * <dt><b>BDR_SUNKENOUTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunken outer edge.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Alternatively, the <i>edge</i> parameter can specify one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDGE_BUMP"></a><a id="edge_bump"></a><dl>
     * <dt><b>EDGE_BUMP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combination of BDR_RAISEDOUTER and BDR_SUNKENINNER.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDGE_ETCHED"></a><a id="edge_etched"></a><dl>
     * <dt><b>EDGE_ETCHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combination of BDR_SUNKENOUTER and BDR_RAISEDINNER.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDGE_RAISED"></a><a id="edge_raised"></a><dl>
     * <dt><b>EDGE_RAISED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combination of BDR_RAISEDOUTER and BDR_RAISEDINNER.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDGE_SUNKEN"></a><a id="edge_sunken"></a><dl>
     * <dt><b>EDGE_SUNKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combination of BDR_SUNKENOUTER and BDR_SUNKENINNER.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} grfFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawedge
     * @since windows5.0
     */
    static DrawEdge(hdc, qrc, edge, grfFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("USER32.dll\DrawEdge", "ptr", hdc, "ptr", qrc, "uint", edge, "uint", grfFlags, "int")
        return result
    }

    /**
     * The DrawFrameControl function draws a frame control of the specified type and style.
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} lprc 
     * @param {Integer} uType 
     * @param {Integer} uState 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawframecontrol
     * @since windows5.0
     */
    static DrawFrameControl(hdc, lprc, uType, uState) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("USER32.dll\DrawFrameControl", "ptr", hdc, "ptr", lprc, "uint", uType, "uint", uState, "int")
        return result
    }

    /**
     * The DrawCaption function draws a window caption.
     * @param {HWND} hwnd A handle to a window that supplies text and an icon for the window caption.
     * @param {HDC} hdc A handle to a device context. The function draws the window caption into this device context.
     * @param {Pointer<RECT>} lprect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the bounding rectangle for the window caption in logical coordinates.
     * @param {Integer} flags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawcaption
     * @since windows5.0
     */
    static DrawCaption(hwnd, hdc, lprect, flags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("USER32.dll\DrawCaption", "ptr", hwnd, "ptr", hdc, "ptr", lprect, "uint", flags, "int")
        return result
    }

    /**
     * Animates the caption of a window to indicate the opening of an icon or the minimizing or maximizing of a window.
     * @param {HWND} hwnd A handle to the window whose caption should be animated on the screen. The animation will be clipped to the parent of this window.
     * @param {Integer} idAni The type of animation. This must be IDANI_CAPTION. With the IDANI_CAPTION animation type, the window caption will animate from the position specified by lprcFrom to the position specified by lprcTo. The effect is similar to minimizing or maximizing a window.
     * @param {Pointer<RECT>} lprcFrom A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure specifying the location and size of the icon or minimized window. Coordinates are relative to the clipping window <i>hwnd</i>.
     * @param {Pointer<RECT>} lprcTo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure specifying the location and size of the restored window. Coordinates are relative to the clipping window <i>hwnd</i>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawanimatedrects
     * @since windows5.0
     */
    static DrawAnimatedRects(hwnd, idAni, lprcFrom, lprcTo) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("USER32.dll\DrawAnimatedRects", "ptr", hwnd, "int", idAni, "ptr", lprcFrom, "ptr", lprcTo, "int")
        return result
    }

    /**
     * The DrawText function draws formatted text in the specified rectangle. It formats the text according to the specified method (expanding tabs, justifying characters, breaking lines, and so forth).
     * @param {HDC} hdc A handle to the device context.
     * @param {PSTR} lpchText A pointer to the string that specifies the text to be drawn. If the <i>nCount</i> parameter is -1, the string must be null-terminated.
     * 
     * If <i>uFormat</i> includes DT_MODIFYSTRING, the function could add up to four additional characters to this string. The buffer containing the string should be large enough to accommodate these extra characters.
     * @param {Integer} cchText The length, in characters, of the string. If <i>nCount</i> is -1, then the <i>lpchText</i> parameter is assumed to be a pointer to a null-terminated string and <b>DrawText</b> computes the character count automatically.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle (in logical coordinates) in which the text is to be formatted.
     * @param {Integer} format 
     * @returns {Integer} If the function succeeds, the return value is the height of the text in logical units. If DT_VCENTER or DT_BOTTOM is specified, the return value is the offset from <code>lpRect-&gt;top</code> to the bottom of the drawn text
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawtexta
     * @since windows5.0
     */
    static DrawTextA(hdc, lpchText, cchText, lprc, format) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpchText := lpchText is String ? StrPtr(lpchText) : lpchText

        result := DllCall("USER32.dll\DrawTextA", "ptr", hdc, "ptr", lpchText, "int", cchText, "ptr", lprc, "uint", format, "int")
        return result
    }

    /**
     * The DrawText function draws formatted text in the specified rectangle. It formats the text according to the specified method (expanding tabs, justifying characters, breaking lines, and so forth).
     * @param {HDC} hdc A handle to the device context.
     * @param {PWSTR} lpchText A pointer to the string that specifies the text to be drawn. If the <i>nCount</i> parameter is -1, the string must be null-terminated.
     * 
     * If <i>uFormat</i> includes DT_MODIFYSTRING, the function could add up to four additional characters to this string. The buffer containing the string should be large enough to accommodate these extra characters.
     * @param {Integer} cchText The length, in characters, of the string. If <i>nCount</i> is -1, then the <i>lpchText</i> parameter is assumed to be a pointer to a null-terminated string and <b>DrawText</b> computes the character count automatically.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle (in logical coordinates) in which the text is to be formatted.
     * @param {Integer} format 
     * @returns {Integer} If the function succeeds, the return value is the height of the text in logical units. If DT_VCENTER or DT_BOTTOM is specified, the return value is the offset from <code>lpRect-&gt;top</code> to the bottom of the drawn text
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawtextw
     * @since windows5.0
     */
    static DrawTextW(hdc, lpchText, cchText, lprc, format) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpchText := lpchText is String ? StrPtr(lpchText) : lpchText

        result := DllCall("USER32.dll\DrawTextW", "ptr", hdc, "ptr", lpchText, "int", cchText, "ptr", lprc, "uint", format, "int")
        return result
    }

    /**
     * The DrawTextEx function draws formatted text in the specified rectangle.
     * @param {HDC} hdc A handle to the device context in which to draw.
     * @param {PSTR} lpchText A pointer to the string that contains the text to draw. If the <i>cchText</i> parameter is -1, the string must be null-terminated.
     * 
     * If <i>dwDTFormat</i> includes DT_MODIFYSTRING, the function could add up to four additional characters to this string. The buffer containing the string should be large enough to accommodate these extra characters.
     * @param {Integer} cchText The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpchText</i>. If <i>cchText</i> is -1, then the <i>lpchText</i> parameter is assumed to be a pointer to a null-terminated string and <b>DrawTextEx</b> computes the character count automatically.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle, in logical coordinates, in which the text is to be formatted.
     * @param {Integer} format 
     * @param {Pointer<DRAWTEXTPARAMS>} lpdtp A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-drawtextparams">DRAWTEXTPARAMS</a> structure that specifies additional formatting options. This parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is the text height in logical units. If DT_VCENTER or DT_BOTTOM is specified, the return value is the offset from <code>lprc-&gt;top</code> to the bottom of the drawn text
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawtextexa
     * @since windows5.0
     */
    static DrawTextExA(hdc, lpchText, cchText, lprc, format, lpdtp) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpchText := lpchText is String ? StrPtr(lpchText) : lpchText

        result := DllCall("USER32.dll\DrawTextExA", "ptr", hdc, "ptr", lpchText, "int", cchText, "ptr", lprc, "uint", format, "ptr", lpdtp, "int")
        return result
    }

    /**
     * The DrawTextEx function draws formatted text in the specified rectangle.
     * @param {HDC} hdc A handle to the device context in which to draw.
     * @param {PWSTR} lpchText A pointer to the string that contains the text to draw. If the <i>cchText</i> parameter is -1, the string must be null-terminated.
     * 
     * If <i>dwDTFormat</i> includes DT_MODIFYSTRING, the function could add up to four additional characters to this string. The buffer containing the string should be large enough to accommodate these extra characters.
     * @param {Integer} cchText The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpchText</i>. If <i>cchText</i> is -1, then the <i>lpchText</i> parameter is assumed to be a pointer to a null-terminated string and <b>DrawTextEx</b> computes the character count automatically.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle, in logical coordinates, in which the text is to be formatted.
     * @param {Integer} format 
     * @param {Pointer<DRAWTEXTPARAMS>} lpdtp A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-drawtextparams">DRAWTEXTPARAMS</a> structure that specifies additional formatting options. This parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is the text height in logical units. If DT_VCENTER or DT_BOTTOM is specified, the return value is the offset from <code>lprc-&gt;top</code> to the bottom of the drawn text
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawtextexw
     * @since windows5.0
     */
    static DrawTextExW(hdc, lpchText, cchText, lprc, format, lpdtp) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpchText := lpchText is String ? StrPtr(lpchText) : lpchText

        result := DllCall("USER32.dll\DrawTextExW", "ptr", hdc, "ptr", lpchText, "int", cchText, "ptr", lprc, "uint", format, "ptr", lpdtp, "int")
        return result
    }

    /**
     * The GrayString function draws gray text at the specified location.
     * @param {HDC} hDC A handle to the device context.
     * @param {HBRUSH} hBrush A handle to the brush to be used for graying. If this parameter is <b>NULL</b>, the text is grayed with the same brush that was used to draw window text.
     * @param {Pointer<GRAYSTRINGPROC>} lpOutputFunc A pointer to the application-defined function that will draw the string, or, if <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> is to be used to draw the string, it is a <b>NULL</b> pointer. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-graystringproc">OutputProc</a> callback function.
     * @param {LPARAM} lpData A pointer to data to be passed to the output function. If the <i>lpOutputFunc</i> parameter is <b>NULL</b>, <i>lpData</i> must be a pointer to the string to be output.
     * @param {Integer} nCount The number of characters to be output. If the <i>nCount</i> parameter is zero, <b>GrayString</b> calculates the length of the string (assuming <i>lpData</i> is a pointer to the string). If <i>nCount</i> is 1 and the function pointed to by <i>lpOutputFunc</i> returns <b>FALSE</b>, the image is shown but not grayed.
     * @param {Integer} X The device x-coordinate of the starting position of the rectangle that encloses the string.
     * @param {Integer} Y The device y-coordinate of the starting position of the rectangle that encloses the string.
     * @param {Integer} nWidth The width, in device units, of the rectangle that encloses the string. If this parameter is zero, <b>GrayString</b> calculates the width of the area, assuming <i>lpData</i> is a pointer to the string.
     * @param {Integer} nHeight The height, in device units, of the rectangle that encloses the string. If this parameter is zero, <b>GrayString</b> calculates the height of the area, assuming <i>lpData</i> is a pointer to the string.
     * @returns {BOOL} If the string is drawn, the return value is nonzero.
     * 
     * If either the <a href="/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> function or the application-defined output function returned zero, or there was insufficient memory to create a memory bitmap for graying, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-graystringa
     * @since windows5.0
     */
    static GrayStringA(hDC, hBrush, lpOutputFunc, lpData, nCount, X, Y, nWidth, nHeight) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hBrush := hBrush is Win32Handle ? NumGet(hBrush, "ptr") : hBrush

        result := DllCall("USER32.dll\GrayStringA", "ptr", hDC, "ptr", hBrush, "ptr", lpOutputFunc, "ptr", lpData, "int", nCount, "int", X, "int", Y, "int", nWidth, "int", nHeight, "int")
        return result
    }

    /**
     * The GrayString function draws gray text at the specified location.
     * @param {HDC} hDC A handle to the device context.
     * @param {HBRUSH} hBrush A handle to the brush to be used for graying. If this parameter is <b>NULL</b>, the text is grayed with the same brush that was used to draw window text.
     * @param {Pointer<GRAYSTRINGPROC>} lpOutputFunc A pointer to the application-defined function that will draw the string, or, if <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> is to be used to draw the string, it is a <b>NULL</b> pointer. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-graystringproc">OutputProc</a> callback function.
     * @param {LPARAM} lpData A pointer to data to be passed to the output function. If the <i>lpOutputFunc</i> parameter is <b>NULL</b>, <i>lpData</i> must be a pointer to the string to be output.
     * @param {Integer} nCount The number of characters to be output. If the <i>nCount</i> parameter is zero, <b>GrayString</b> calculates the length of the string (assuming <i>lpData</i> is a pointer to the string). If <i>nCount</i> is 1 and the function pointed to by <i>lpOutputFunc</i> returns <b>FALSE</b>, the image is shown but not grayed.
     * @param {Integer} X The device x-coordinate of the starting position of the rectangle that encloses the string.
     * @param {Integer} Y The device y-coordinate of the starting position of the rectangle that encloses the string.
     * @param {Integer} nWidth The width, in device units, of the rectangle that encloses the string. If this parameter is zero, <b>GrayString</b> calculates the width of the area, assuming <i>lpData</i> is a pointer to the string.
     * @param {Integer} nHeight The height, in device units, of the rectangle that encloses the string. If this parameter is zero, <b>GrayString</b> calculates the height of the area, assuming <i>lpData</i> is a pointer to the string.
     * @returns {BOOL} If the string is drawn, the return value is nonzero.
     * 
     * If either the <a href="/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> function or the application-defined output function returned zero, or there was insufficient memory to create a memory bitmap for graying, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-graystringw
     * @since windows5.0
     */
    static GrayStringW(hDC, hBrush, lpOutputFunc, lpData, nCount, X, Y, nWidth, nHeight) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hBrush := hBrush is Win32Handle ? NumGet(hBrush, "ptr") : hBrush

        result := DllCall("USER32.dll\GrayStringW", "ptr", hDC, "ptr", hBrush, "ptr", lpOutputFunc, "ptr", lpData, "int", nCount, "int", X, "int", Y, "int", nWidth, "int", nHeight, "int")
        return result
    }

    /**
     * The DrawState function displays an image and applies a visual effect to indicate a state, such as a disabled or default state.
     * @param {HDC} hdc A handle to the device context to draw in.
     * @param {HBRUSH} hbrFore A handle to the brush used to draw the image, if the state specified by the <i>fuFlags</i> parameter is DSS_MONO. This parameter is ignored for other states.
     * @param {Pointer<DRAWSTATEPROC>} qfnCallBack A pointer to an application-defined callback function used to render the image. This parameter is required if the image type in <i>fuFlags</i> is DST_COMPLEX. It is optional and can be <b>NULL</b> if the image type is DST_TEXT. For all other image types, this parameter is ignored. For more information about the callback function, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-drawstateproc">DrawStateProc</a> function.
     * @param {LPARAM} lData Information about the image. The meaning of this parameter depends on the image type.
     * @param {WPARAM} wData Information about the image. The meaning of this parameter depends on the image type. It is, however, zero extended for use with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-drawstateproc">DrawStateProc</a> function.
     * @param {Integer} x The horizontal location, in device units, at which to draw the image.
     * @param {Integer} y The vertical location, in device units, at which to draw the image.
     * @param {Integer} cx The width of the image, in device units. This parameter is required if the image type is DST_COMPLEX. Otherwise, it can be zero to calculate the width of the image.
     * @param {Integer} cy The height of the image, in device units. This parameter is required if the image type is DST_COMPLEX. Otherwise, it can be zero to calculate the height of the image.
     * @param {Integer} uFlags The image type and state. This parameter can be one of the following type values.
     * 
     * <table>
     * <tr>
     * <th>Value (type)</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_BITMAP"></a><a id="dst_bitmap"></a><dl>
     * <dt><b>DST_BITMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is a bitmap. The <i>lData</i> parameter is the bitmap handle. Note that the bitmap cannot already be selected into an existing device context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_COMPLEX"></a><a id="dst_complex"></a><dl>
     * <dt><b>DST_COMPLEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is application defined. To render the image, <b>DrawState</b> calls the callback function specified by the <i>lpOutputFunc</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_ICON"></a><a id="dst_icon"></a><dl>
     * <dt><b>DST_ICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is an icon. The <i>lData</i> parameter is the icon handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_PREFIXTEXT"></a><a id="dst_prefixtext"></a><dl>
     * <dt><b>DST_PREFIXTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is text that may contain an accelerator mnemonic. <b>DrawState</b> interprets the ampersand (&amp;) prefix character as a directive to underscore the character that follows. The <i>lData</i> parameter is a pointer to the string, and the <i>wData</i> parameter specifies the length. If <i>wData</i> is zero, the string must be null-terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_TEXT"></a><a id="dst_text"></a><dl>
     * <dt><b>DST_TEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is text. The <i>lData</i> parameter is a pointer to the string, and the <i>wData</i> parameter specifies the length. If <i>wData</i> is zero, the string must be null-terminated.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can also be one of the following state values.
     * 
     * <table>
     * <tr>
     * <th>Value (state)</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_DISABLED"></a><a id="dss_disabled"></a><dl>
     * <dt><b>DSS_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Embosses the image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_HIDEPREFIX"></a><a id="dss_hideprefix"></a><dl>
     * <dt><b>DSS_HIDEPREFIX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignores the ampersand (&amp;) prefix character in the text, thus the letter that follows will not be underlined. This must be used with DST_PREFIXTEXT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_MONO"></a><a id="dss_mono"></a><dl>
     * <dt><b>DSS_MONO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws the image using the brush specified by the <i>hbr</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_NORMAL"></a><a id="dss_normal"></a><dl>
     * <dt><b>DSS_NORMAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws the image without any modification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_PREFIXONLY"></a><a id="dss_prefixonly"></a><dl>
     * <dt><b>DSS_PREFIXONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws only the underline at the position of the letter after the ampersand (&amp;) prefix character. No text in the string is drawn. This must be used with DST_PREFIXTEXT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_RIGHT"></a><a id="dss_right"></a><dl>
     * <dt><b>DSS_RIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Aligns the text to the right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_UNION"></a><a id="dss_union"></a><dl>
     * <dt><b>DSS_UNION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dithers the image.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For all states except DSS_NORMAL, the image is converted to monochrome before the visual effect is applied.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawstatea
     * @since windows5.0
     */
    static DrawStateA(hdc, hbrFore, qfnCallBack, lData, wData, x, y, cx, cy, uFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hbrFore := hbrFore is Win32Handle ? NumGet(hbrFore, "ptr") : hbrFore

        result := DllCall("USER32.dll\DrawStateA", "ptr", hdc, "ptr", hbrFore, "ptr", qfnCallBack, "ptr", lData, "ptr", wData, "int", x, "int", y, "int", cx, "int", cy, "uint", uFlags, "int")
        return result
    }

    /**
     * The DrawState function displays an image and applies a visual effect to indicate a state, such as a disabled or default state.
     * @param {HDC} hdc A handle to the device context to draw in.
     * @param {HBRUSH} hbrFore A handle to the brush used to draw the image, if the state specified by the <i>fuFlags</i> parameter is DSS_MONO. This parameter is ignored for other states.
     * @param {Pointer<DRAWSTATEPROC>} qfnCallBack A pointer to an application-defined callback function used to render the image. This parameter is required if the image type in <i>fuFlags</i> is DST_COMPLEX. It is optional and can be <b>NULL</b> if the image type is DST_TEXT. For all other image types, this parameter is ignored. For more information about the callback function, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-drawstateproc">DrawStateProc</a> function.
     * @param {LPARAM} lData Information about the image. The meaning of this parameter depends on the image type.
     * @param {WPARAM} wData Information about the image. The meaning of this parameter depends on the image type. It is, however, zero extended for use with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-drawstateproc">DrawStateProc</a> function.
     * @param {Integer} x The horizontal location, in device units, at which to draw the image.
     * @param {Integer} y The vertical location, in device units, at which to draw the image.
     * @param {Integer} cx The width of the image, in device units. This parameter is required if the image type is DST_COMPLEX. Otherwise, it can be zero to calculate the width of the image.
     * @param {Integer} cy The height of the image, in device units. This parameter is required if the image type is DST_COMPLEX. Otherwise, it can be zero to calculate the height of the image.
     * @param {Integer} uFlags The image type and state. This parameter can be one of the following type values.
     * 
     * <table>
     * <tr>
     * <th>Value (type)</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_BITMAP"></a><a id="dst_bitmap"></a><dl>
     * <dt><b>DST_BITMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is a bitmap. The <i>lData</i> parameter is the bitmap handle. Note that the bitmap cannot already be selected into an existing device context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_COMPLEX"></a><a id="dst_complex"></a><dl>
     * <dt><b>DST_COMPLEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is application defined. To render the image, <b>DrawState</b> calls the callback function specified by the <i>lpOutputFunc</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_ICON"></a><a id="dst_icon"></a><dl>
     * <dt><b>DST_ICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is an icon. The <i>lData</i> parameter is the icon handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_PREFIXTEXT"></a><a id="dst_prefixtext"></a><dl>
     * <dt><b>DST_PREFIXTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is text that may contain an accelerator mnemonic. <b>DrawState</b> interprets the ampersand (&amp;) prefix character as a directive to underscore the character that follows. The <i>lData</i> parameter is a pointer to the string, and the <i>wData</i> parameter specifies the length. If <i>wData</i> is zero, the string must be null-terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DST_TEXT"></a><a id="dst_text"></a><dl>
     * <dt><b>DST_TEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is text. The <i>lData</i> parameter is a pointer to the string, and the <i>wData</i> parameter specifies the length. If <i>wData</i> is zero, the string must be null-terminated.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can also be one of the following state values.
     * 
     * <table>
     * <tr>
     * <th>Value (state)</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_DISABLED"></a><a id="dss_disabled"></a><dl>
     * <dt><b>DSS_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Embosses the image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_HIDEPREFIX"></a><a id="dss_hideprefix"></a><dl>
     * <dt><b>DSS_HIDEPREFIX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignores the ampersand (&amp;) prefix character in the text, thus the letter that follows will not be underlined. This must be used with DST_PREFIXTEXT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_MONO"></a><a id="dss_mono"></a><dl>
     * <dt><b>DSS_MONO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws the image using the brush specified by the <i>hbr</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_NORMAL"></a><a id="dss_normal"></a><dl>
     * <dt><b>DSS_NORMAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws the image without any modification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_PREFIXONLY"></a><a id="dss_prefixonly"></a><dl>
     * <dt><b>DSS_PREFIXONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws only the underline at the position of the letter after the ampersand (&amp;) prefix character. No text in the string is drawn. This must be used with DST_PREFIXTEXT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_RIGHT"></a><a id="dss_right"></a><dl>
     * <dt><b>DSS_RIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Aligns the text to the right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSS_UNION"></a><a id="dss_union"></a><dl>
     * <dt><b>DSS_UNION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dithers the image.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For all states except DSS_NORMAL, the image is converted to monochrome before the visual effect is applied.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawstatew
     * @since windows5.0
     */
    static DrawStateW(hdc, hbrFore, qfnCallBack, lData, wData, x, y, cx, cy, uFlags) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hbrFore := hbrFore is Win32Handle ? NumGet(hbrFore, "ptr") : hbrFore

        result := DllCall("USER32.dll\DrawStateW", "ptr", hdc, "ptr", hbrFore, "ptr", qfnCallBack, "ptr", lData, "ptr", wData, "int", x, "int", y, "int", cx, "int", cy, "uint", uFlags, "int")
        return result
    }

    /**
     * The TabbedTextOut function writes a character string at a specified location, expanding tabs to the values specified in an array of tab-stop positions. Text is written in the currently selected font, background color, and text color.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate of the starting point of the string, in logical units.
     * @param {Integer} y The y-coordinate of the starting point of the string, in logical units.
     * @param {PSTR} lpString A pointer to the character string to draw. The string does not need to be zero-terminated, since <i>nCount</i> specifies the length of the string.
     * @param {Integer} chCount The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Integer} nTabPositions The number of values in the array of tab-stop positions.
     * @param {Pointer<Integer>} lpnTabStopPositions A pointer to an array containing the tab-stop positions, in logical units. The tab stops must be sorted in increasing order; the smallest x-value should be the first item in the array.
     * @param {Integer} nTabOrigin The x-coordinate of the starting position from which tabs are expanded, in logical units.
     * @returns {Integer} If the function succeeds, the return value is the dimensions, in logical units, of the string. The height is in the high-order word and the width is in the low-order word.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-tabbedtextouta
     * @since windows5.0
     */
    static TabbedTextOutA(hdc, x, y, lpString, chCount, nTabPositions, lpnTabStopPositions, nTabOrigin) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        lpnTabStopPositionsMarshal := lpnTabStopPositions is VarRef ? "int*" : "ptr"

        result := DllCall("USER32.dll\TabbedTextOutA", "ptr", hdc, "int", x, "int", y, "ptr", lpString, "int", chCount, "int", nTabPositions, lpnTabStopPositionsMarshal, lpnTabStopPositions, "int", nTabOrigin, "int")
        return result
    }

    /**
     * The TabbedTextOut function writes a character string at a specified location, expanding tabs to the values specified in an array of tab-stop positions. Text is written in the currently selected font, background color, and text color.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} x The x-coordinate of the starting point of the string, in logical units.
     * @param {Integer} y The y-coordinate of the starting point of the string, in logical units.
     * @param {PWSTR} lpString A pointer to the character string to draw. The string does not need to be zero-terminated, since <i>nCount</i> specifies the length of the string.
     * @param {Integer} chCount The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <i>lpString</i>.
     * @param {Integer} nTabPositions The number of values in the array of tab-stop positions.
     * @param {Pointer<Integer>} lpnTabStopPositions A pointer to an array containing the tab-stop positions, in logical units. The tab stops must be sorted in increasing order; the smallest x-value should be the first item in the array.
     * @param {Integer} nTabOrigin The x-coordinate of the starting position from which tabs are expanded, in logical units.
     * @returns {Integer} If the function succeeds, the return value is the dimensions, in logical units, of the string. The height is in the high-order word and the width is in the low-order word.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-tabbedtextoutw
     * @since windows5.0
     */
    static TabbedTextOutW(hdc, x, y, lpString, chCount, nTabPositions, lpnTabStopPositions, nTabOrigin) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        lpnTabStopPositionsMarshal := lpnTabStopPositions is VarRef ? "int*" : "ptr"

        result := DllCall("USER32.dll\TabbedTextOutW", "ptr", hdc, "int", x, "int", y, "ptr", lpString, "int", chCount, "int", nTabPositions, lpnTabStopPositionsMarshal, lpnTabStopPositions, "int", nTabOrigin, "int")
        return result
    }

    /**
     * The GetTabbedTextExtent function computes the width and height of a character string.
     * @param {HDC} hdc A handle to the device context.
     * @param {PSTR} lpString A pointer to a character string.
     * @param {Integer} chCount The length of the text string. For the ANSI function it is a BYTE count and for the Unicode function it is a WORD count. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
     * @param {Integer} nTabPositions The number of tab-stop positions in the array pointed to by the <i>lpnTabStopPositions</i> parameter.
     * @param {Pointer<Integer>} lpnTabStopPositions A pointer to an array containing the tab-stop positions, in device units. The tab stops must be sorted in increasing order; the smallest x-value should be the first item in the array.
     * @returns {Integer} If the function succeeds, the return value is the dimensions of the string in logical units. The height is in the high-order word and the width is in the low-order word.
     * 
     * If the function fails, the return value is 0. <b>GetTabbedTextExtent</b> will fail if <i>hDC</i> is invalid and if <i>nTabPositions</i> is less than 0.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-gettabbedtextextenta
     * @since windows5.0
     */
    static GetTabbedTextExtentA(hdc, lpString, chCount, nTabPositions, lpnTabStopPositions) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        lpnTabStopPositionsMarshal := lpnTabStopPositions is VarRef ? "int*" : "ptr"

        result := DllCall("USER32.dll\GetTabbedTextExtentA", "ptr", hdc, "ptr", lpString, "int", chCount, "int", nTabPositions, lpnTabStopPositionsMarshal, lpnTabStopPositions, "uint")
        return result
    }

    /**
     * The GetTabbedTextExtent function computes the width and height of a character string.
     * @param {HDC} hdc A handle to the device context.
     * @param {PWSTR} lpString A pointer to a character string.
     * @param {Integer} chCount The length of the text string. For the ANSI function it is a BYTE count and for the Unicode function it is a WORD count. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
     * @param {Integer} nTabPositions The number of tab-stop positions in the array pointed to by the <i>lpnTabStopPositions</i> parameter.
     * @param {Pointer<Integer>} lpnTabStopPositions A pointer to an array containing the tab-stop positions, in device units. The tab stops must be sorted in increasing order; the smallest x-value should be the first item in the array.
     * @returns {Integer} If the function succeeds, the return value is the dimensions of the string in logical units. The height is in the high-order word and the width is in the low-order word.
     * 
     * If the function fails, the return value is 0. <b>GetTabbedTextExtent</b> will fail if <i>hDC</i> is invalid and if <i>nTabPositions</i> is less than 0.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-gettabbedtextextentw
     * @since windows5.0
     */
    static GetTabbedTextExtentW(hdc, lpString, chCount, nTabPositions, lpnTabStopPositions) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        lpString := lpString is String ? StrPtr(lpString) : lpString

        lpnTabStopPositionsMarshal := lpnTabStopPositions is VarRef ? "int*" : "ptr"

        result := DllCall("USER32.dll\GetTabbedTextExtentW", "ptr", hdc, "ptr", lpString, "int", chCount, "int", nTabPositions, lpnTabStopPositionsMarshal, lpnTabStopPositions, "uint")
        return result
    }

    /**
     * The UpdateWindow function updates the client area of the specified window by sending a WM_PAINT message to the window if the window's update region is not empty.
     * @param {HWND} hWnd Handle to the window to be updated.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-updatewindow
     * @since windows5.0
     */
    static UpdateWindow(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\UpdateWindow", "ptr", hWnd, "int")
        return result
    }

    /**
     * The PaintDesktop function fills the clipping region in the specified device context with the desktop pattern or wallpaper. The function is provided primarily for shell desktops.
     * @param {HDC} hdc Handle to the device context.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-paintdesktop
     * @since windows5.0
     */
    static PaintDesktop(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("USER32.dll\PaintDesktop", "ptr", hdc, "int")
        return result
    }

    /**
     * The WindowFromDC function returns a handle to the window associated with the specified display device context (DC). Output functions that use the specified device context draw into this window.
     * @param {HDC} hDC Handle to the device context from which a handle to the associated window is to be retrieved.
     * @returns {HWND} The return value is a handle to the window associated with the specified DC. If no window is associated with the specified DC, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-windowfromdc
     * @since windows5.0
     */
    static WindowFromDC(hDC) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := DllCall("USER32.dll\WindowFromDC", "ptr", hDC, "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * The GetDC function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
     * @param {HWND} hWnd A handle to the window whose DC is to be retrieved. If this value is <b>NULL</b>, <b>GetDC</b> retrieves the DC for the entire screen.
     * @returns {HDC} If the function succeeds, the return value is a handle to the DC for the specified window's client area.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdc
     * @since windows5.0
     */
    static GetDC(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\GetDC", "ptr", hWnd, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The GetDCEx function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
     * @param {HWND} hWnd A handle to the window whose DC is to be retrieved. If this value is <b>NULL</b>, <b>GetDCEx</b> retrieves the DC for the entire screen.
     * @param {HRGN} hrgnClip A clipping region that may be combined with the visible region of the DC. If the value of <i>flags</i> is DCX_INTERSECTRGN or DCX_EXCLUDERGN, then the operating system assumes ownership of the region and will automatically delete it when it is no longer needed. In this case, the application should not use or delete the region after a successful call to <b>GetDCEx</b>.
     * @param {Integer} flags 
     * @returns {HDC} If the function succeeds, the return value is the handle to the DC for the specified window.
     * 
     * If the function fails, the return value is <b>NULL</b>. An invalid value for the <i>hWnd</i> parameter will cause the function to fail.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdcex
     * @since windows5.0
     */
    static GetDCEx(hWnd, hrgnClip, flags) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hrgnClip := hrgnClip is Win32Handle ? NumGet(hrgnClip, "ptr") : hrgnClip

        result := DllCall("USER32.dll\GetDCEx", "ptr", hWnd, "ptr", hrgnClip, "uint", flags, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The GetWindowDC function retrieves the device context (DC) for the entire window, including title bar, menus, and scroll bars.
     * @param {HWND} hWnd A handle to the window with a device context that is to be retrieved. If this value is <b>NULL</b>, <b>GetWindowDC</b> retrieves the device context for the entire screen.
     * 
     * If this parameter is <b>NULL</b>, <b>GetWindowDC</b> retrieves the device context for the primary display monitor. To get the device context for other display monitors, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> functions.
     * @returns {HDC} If the function succeeds, the return value is a handle to a device context for the specified window.
     * 
     * If the function fails, the return value is <b>NULL</b>, indicating an error or an invalid <i>hWnd</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindowdc
     * @since windows5.0
     */
    static GetWindowDC(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\GetWindowDC", "ptr", hWnd, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The ReleaseDC function releases a device context (DC), freeing it for use by other applications. The effect of the ReleaseDC function depends on the type of DC. It frees only common and window DCs. It has no effect on class or private DCs.
     * @param {HWND} hWnd A handle to the window whose DC is to be released.
     * @param {HDC} hDC A handle to the DC to be released.
     * @returns {Integer} The return value indicates whether the DC was released. If the DC was released, the return value is 1.
     * 
     * If the DC was not released, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-releasedc
     * @since windows5.0
     */
    static ReleaseDC(hWnd, hDC) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := DllCall("USER32.dll\ReleaseDC", "ptr", hWnd, "ptr", hDC, "int")
        return result
    }

    /**
     * The BeginPaint function prepares the specified window for painting and fills a PAINTSTRUCT structure with information about the painting.
     * @param {HWND} hWnd Handle to the window to be repainted.
     * @param {Pointer<PAINTSTRUCT>} lpPaint Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-paintstruct">PAINTSTRUCT</a> structure that will receive painting information.
     * @returns {HDC} If the function succeeds, the return value is the handle to a display device context for the specified window.
     * 
     * If the function fails, the return value is <b>NULL</b>, indicating that no display device context is available.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-beginpaint
     * @since windows5.0
     */
    static BeginPaint(hWnd, lpPaint) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\BeginPaint", "ptr", hWnd, "ptr", lpPaint, "ptr")
        return HDC({Value: result}, True)
    }

    /**
     * The EndPaint function marks the end of painting in the specified window. This function is required for each call to the BeginPaint function, but only after painting is complete.
     * @param {HWND} hWnd Handle to the window that has been repainted.
     * @param {Pointer<PAINTSTRUCT>} lpPaint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-paintstruct">PAINTSTRUCT</a> structure that contains the painting information retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a>.
     * @returns {BOOL} The return value is always nonzero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-endpaint
     * @since windows5.0
     */
    static EndPaint(hWnd, lpPaint) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\EndPaint", "ptr", hWnd, "ptr", lpPaint, "int")
        return result
    }

    /**
     * The GetUpdateRect function retrieves the coordinates of the smallest rectangle that completely encloses the update region of the specified window.
     * @param {HWND} hWnd Handle to the window whose update region is to be retrieved.
     * @param {Pointer<RECT>} lpRect Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the coordinates, in device units, of the enclosing rectangle.
     * 
     * An application can set this parameter to <b>NULL</b> to determine whether an update region exists for the window. If this parameter is <b>NULL</b>, <b>GetUpdateRect</b> returns nonzero if an update region exists, and zero if one does not. This provides a simple and efficient means of determining whether a <b>WM_PAINT</b> message resulted from an invalid area.
     * @param {BOOL} bErase Specifies whether the background in the update region is to be erased. If this parameter is <b>TRUE</b> and the update region is not empty, <b>GetUpdateRect</b> sends a <b>WM_ERASEBKGND</b> message to the specified window to erase the background.
     * @returns {BOOL} If the update region is not empty, the return value is nonzero.
     * 
     * If there is no update region, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getupdaterect
     * @since windows5.0
     */
    static GetUpdateRect(hWnd, lpRect, bErase) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\GetUpdateRect", "ptr", hWnd, "ptr", lpRect, "int", bErase, "int")
        return result
    }

    /**
     * The GetUpdateRgn function retrieves the update region of a window by copying it into the specified region. The coordinates of the update region are relative to the upper-left corner of the window (that is, they are client coordinates).
     * @param {HWND} hWnd Handle to the window with an update region that is to be retrieved.
     * @param {HRGN} hRgn Handle to the region to receive the update region.
     * @param {BOOL} bErase Specifies whether the window background should be erased and whether nonclient areas of child windows should be drawn. If this parameter is <b>FALSE</b>, no drawing is done.
     * @returns {Integer} The return value indicates the complexity of the resulting region; it can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>COMPLEXREGION</td>
     * <td>Region consists of more than one rectangle.</td>
     * </tr>
     * <tr>
     * <td>ERROR</td>
     * <td>An error occurred.</td>
     * </tr>
     * <tr>
     * <td>NULLREGION</td>
     * <td>Region is empty.</td>
     * </tr>
     * <tr>
     * <td>SIMPLEREGION</td>
     * <td>Region is a single rectangle.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getupdatergn
     * @since windows5.0
     */
    static GetUpdateRgn(hWnd, hRgn, bErase) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hRgn := hRgn is Win32Handle ? NumGet(hRgn, "ptr") : hRgn

        result := DllCall("USER32.dll\GetUpdateRgn", "ptr", hWnd, "ptr", hRgn, "int", bErase, "int")
        return result
    }

    /**
     * The SetWindowRgn function sets the window region of a window.
     * @param {HWND} hWnd A handle to the window whose window region is to be set.
     * @param {HRGN} hRgn A handle to a region. The function sets the window region of the window to this region.
     * 
     * If <i>hRgn</i> is <b>NULL</b>, the function sets the window region to <b>NULL</b>.
     * @param {BOOL} bRedraw Specifies whether the system redraws the window after setting the window region. If <i>bRedraw</i> is <b>TRUE</b>, the system does so; otherwise, it does not.
     * 
     * Typically, you set <i>bRedraw</i> to <b>TRUE</b> if the window is visible.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setwindowrgn
     * @since windows5.0
     */
    static SetWindowRgn(hWnd, hRgn, bRedraw) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hRgn := hRgn is Win32Handle ? NumGet(hRgn, "ptr") : hRgn

        result := DllCall("USER32.dll\SetWindowRgn", "ptr", hWnd, "ptr", hRgn, "int", bRedraw, "int")
        return result
    }

    /**
     * The GetWindowRgn function obtains a copy of the window region of a window.
     * @param {HWND} hWnd Handle to the window whose window region is to be obtained.
     * @param {HRGN} hRgn Handle to the region which will be modified to represent the window region.
     * @returns {Integer} The return value specifies the type of the region that the function obtains. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULLREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The region is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SIMPLEREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The region is a single rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMPLEXREGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The region is more than one rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified window does not have a region, or an error occurred while attempting to return the region.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindowrgn
     * @since windows5.0
     */
    static GetWindowRgn(hWnd, hRgn) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hRgn := hRgn is Win32Handle ? NumGet(hRgn, "ptr") : hRgn

        result := DllCall("USER32.dll\GetWindowRgn", "ptr", hWnd, "ptr", hRgn, "int")
        return result
    }

    /**
     * The GetWindowRgnBox function retrieves the dimensions of the tightest bounding rectangle for the window region of a window.
     * @param {HWND} hWnd Handle to the window.
     * @param {Pointer<RECT>} lprc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the rectangle dimensions, in device units relative to the upper-left corner of the window.
     * @returns {Integer} The return value specifies the type of the region that the function obtains. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>COMPLEXREGION</td>
     * <td>The region is more than one rectangle.</td>
     * </tr>
     * <tr>
     * <td>ERROR</td>
     * <td>The specified window does not have a region, or an error occurred while attempting to return the region.</td>
     * </tr>
     * <tr>
     * <td>NULLREGION</td>
     * <td>The region is empty.</td>
     * </tr>
     * <tr>
     * <td>SIMPLEREGION</td>
     * <td>The region is a single rectangle.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindowrgnbox
     * @since windows5.0
     */
    static GetWindowRgnBox(hWnd, lprc) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\GetWindowRgnBox", "ptr", hWnd, "ptr", lprc, "int")
        return result
    }

    /**
     * The ExcludeUpdateRgn function prevents drawing within invalid areas of a window by excluding an updated region in the window from a clipping region.
     * @param {HDC} hDC Handle to the device context associated with the clipping region.
     * @param {HWND} hWnd Handle to the window to update.
     * @returns {Integer} The return value specifies the complexity of the excluded region; it can be any one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>COMPLEXREGION</td>
     * <td>Region consists of more than one rectangle.</td>
     * </tr>
     * <tr>
     * <td>ERROR</td>
     * <td>An error occurred.</td>
     * </tr>
     * <tr>
     * <td>NULLREGION</td>
     * <td>Region is empty.</td>
     * </tr>
     * <tr>
     * <td>SIMPLEREGION</td>
     * <td>Region is a single rectangle.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-excludeupdatergn
     * @since windows5.0
     */
    static ExcludeUpdateRgn(hDC, hWnd) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\ExcludeUpdateRgn", "ptr", hDC, "ptr", hWnd, "int")
        return result
    }

    /**
     * The InvalidateRect function adds a rectangle to the specified window's update region. The update region represents the portion of the window's client area that must be redrawn.
     * @param {HWND} hWnd A handle to the window whose update region has changed. If this parameter is <b>NULL</b>, the system invalidates and redraws all windows, not just the windows for this application, and sends the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-erasebkgnd">WM_ERASEBKGND</a> and <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-ncpaint">WM_NCPAINT</a> messages before the function returns. Setting this parameter to <b>NULL</b> is not recommended.
     * @param {Pointer<RECT>} lpRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the client coordinates of the rectangle to be added to the update region. If this parameter is <b>NULL</b>, the entire client area is added to the update region.
     * @param {BOOL} bErase Specifies whether the background within the update region is to be erased when the update region is processed. If this parameter is <b>TRUE</b>, the background is erased when the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a> function is called. If this parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-invalidaterect
     * @since windows5.0
     */
    static InvalidateRect(hWnd, lpRect, bErase) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\InvalidateRect", "ptr", hWnd, "ptr", lpRect, "int", bErase, "int")
        return result
    }

    /**
     * The ValidateRect function validates the client area within a rectangle by removing the rectangle from the update region of the specified window.
     * @param {HWND} hWnd Handle to the window whose update region is to be modified. If this parameter is <b>NULL</b>, the system invalidates and redraws all windows and sends the <b>WM_ERASEBKGND</b> and <b>WM_NCPAINT</b> messages to the window procedure before the function returns.
     * @param {Pointer<RECT>} lpRect Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the client coordinates of the rectangle to be removed from the update region. If this parameter is <b>NULL</b>, the entire client area is removed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-validaterect
     * @since windows5.0
     */
    static ValidateRect(hWnd, lpRect) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\ValidateRect", "ptr", hWnd, "ptr", lpRect, "int")
        return result
    }

    /**
     * The InvalidateRgn function invalidates the client area within the specified region by adding it to the current update region of a window.
     * @param {HWND} hWnd A handle to the window with an update region that is to be modified.
     * @param {HRGN} hRgn A handle to the region to be added to the update region. The region is assumed to have client coordinates. If this parameter is <b>NULL</b>, the entire client area is added to the update region.
     * @param {BOOL} bErase Specifies whether the background within the update region should be erased when the update region is processed. If this parameter is <b>TRUE</b>, the background is erased when the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a> function is called. If the parameter is <b>FALSE</b>, the background remains unchanged.
     * @returns {BOOL} The return value is always nonzero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-invalidatergn
     * @since windows5.0
     */
    static InvalidateRgn(hWnd, hRgn, bErase) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hRgn := hRgn is Win32Handle ? NumGet(hRgn, "ptr") : hRgn

        result := DllCall("USER32.dll\InvalidateRgn", "ptr", hWnd, "ptr", hRgn, "int", bErase, "int")
        return result
    }

    /**
     * The ValidateRgn function validates the client area within a region by removing the region from the current update region of the specified window.
     * @param {HWND} hWnd Handle to the window whose update region is to be modified.
     * @param {HRGN} hRgn Handle to a region that defines the area to be removed from the update region. If this parameter is <b>NULL</b>, the entire client area is removed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-validatergn
     * @since windows5.0
     */
    static ValidateRgn(hWnd, hRgn) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hRgn := hRgn is Win32Handle ? NumGet(hRgn, "ptr") : hRgn

        result := DllCall("USER32.dll\ValidateRgn", "ptr", hWnd, "ptr", hRgn, "int")
        return result
    }

    /**
     * The RedrawWindow function updates the specified rectangle or region in a window's client area.
     * @param {HWND} hWnd A handle to the window to be redrawn. If this parameter is <b>NULL</b>, the desktop window is updated.
     * @param {Pointer<RECT>} lprcUpdate A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates, in device units, of the update rectangle. This parameter is ignored if the <i>hrgnUpdate</i> parameter identifies a region.
     * @param {HRGN} hrgnUpdate A handle to the update region. If both the <i>hrgnUpdate</i> and <i>lprcUpdate</i> parameters are <b>NULL</b>, the entire client area is added to the update region.
     * @param {Integer} flags One or more redraw flags. This parameter can be used to invalidate or validate a window, control repainting, and control which windows are affected by <b>RedrawWindow</b>.
     * 
     * The following flags are used to invalidate the window.
     * 
     * <table>
     * <tr>
     * <th>Flag (invalidation)</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_ERASE"></a><a id="rdw_erase"></a><dl>
     * <dt><b>RDW_ERASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the window to receive a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-erasebkgnd">WM_ERASEBKGND</a> message when the window is repainted. The RDW_INVALIDATE flag must also be specified; otherwise, RDW_ERASE has no effect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_FRAME"></a><a id="rdw_frame"></a><dl>
     * <dt><b>RDW_FRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes any part of the nonclient area of the window that intersects the update region to receive a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-ncpaint">WM_NCPAINT</a> message. The RDW_INVALIDATE flag must also be specified; otherwise, RDW_FRAME has no effect. The <b>WM_NCPAINT</b> message is typically not sent during the execution of <b>RedrawWindow</b> unless either RDW_UPDATENOW or RDW_ERASENOW is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_INTERNALPAINT"></a><a id="rdw_internalpaint"></a><dl>
     * <dt><b>RDW_INTERNALPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message to be posted to the window regardless of whether any portion of the window is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_INVALIDATE"></a><a id="rdw_invalidate"></a><dl>
     * <dt><b>RDW_INVALIDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalidates <i>lprcUpdate</i> or <i>hrgnUpdate</i> (only one may be non-<b>NULL</b>). If both are <b>NULL</b>, the entire window is invalidated.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags are used to validate the window.
     * 
     * <table>
     * <tr>
     * <th>Flag (validation)</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_NOERASE"></a><a id="rdw_noerase"></a><dl>
     * <dt><b>RDW_NOERASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses any pending <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-erasebkgnd">WM_ERASEBKGND</a> messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_NOFRAME"></a><a id="rdw_noframe"></a><dl>
     * <dt><b>RDW_NOFRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses any pending <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-ncpaint">WM_NCPAINT</a> messages. This flag must be used with RDW_VALIDATE and is typically used with RDW_NOCHILDREN. RDW_NOFRAME should be used with care, as it could cause parts of a window to be painted improperly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_NOINTERNALPAINT"></a><a id="rdw_nointernalpaint"></a><dl>
     * <dt><b>RDW_NOINTERNALPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses any pending internal <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> messages. This flag does not affect <b>WM_PAINT</b> messages resulting from a non-<b>NULL</b> update area.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_VALIDATE"></a><a id="rdw_validate"></a><dl>
     * <dt><b>RDW_VALIDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validates <i>lprcUpdate</i> or <i>hrgnUpdate</i> (only one may be non-<b>NULL</b>). If both are <b>NULL</b>, the entire window is validated. This flag does not affect internal <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> messages.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags control when repainting occurs. <b>RedrawWindow</b> will not repaint unless one of these flags is specified.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_ERASENOW"></a><a id="rdw_erasenow"></a><dl>
     * <dt><b>RDW_ERASENOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the affected windows (as specified by the RDW_ALLCHILDREN and RDW_NOCHILDREN flags) to receive <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-ncpaint">WM_NCPAINT</a> and <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-erasebkgnd">WM_ERASEBKGND</a> messages, if necessary, before the function returns. <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> messages are received at the ordinary time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_UPDATENOW"></a><a id="rdw_updatenow"></a><dl>
     * <dt><b>RDW_UPDATENOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the affected windows (as specified by the RDW_ALLCHILDREN and RDW_NOCHILDREN flags) to receive <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-ncpaint">WM_NCPAINT</a>, <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-erasebkgnd">WM_ERASEBKGND</a>, and <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> messages, if necessary, before the function returns.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * By default, the windows affected by <b>RedrawWindow</b> depend on whether the specified window has the WS_CLIPCHILDREN style. Child windows that are not the WS_CLIPCHILDREN style are unaffected; non-WS_CLIPCHILDREN windows are recursively validated or invalidated until a WS_CLIPCHILDREN window is encountered. The following flags control which windows are affected by the <b>RedrawWindow</b> function.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_ALLCHILDREN"></a><a id="rdw_allchildren"></a><dl>
     * <dt><b>RDW_ALLCHILDREN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Includes child windows, if any, in the repainting operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDW_NOCHILDREN"></a><a id="rdw_nochildren"></a><dl>
     * <dt><b>RDW_NOCHILDREN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Excludes child windows, if any, from the repainting operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-redrawwindow
     * @since windows5.0
     */
    static RedrawWindow(hWnd, lprcUpdate, hrgnUpdate, flags) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        hrgnUpdate := hrgnUpdate is Win32Handle ? NumGet(hrgnUpdate, "ptr") : hrgnUpdate

        result := DllCall("USER32.dll\RedrawWindow", "ptr", hWnd, "ptr", lprcUpdate, "ptr", hrgnUpdate, "uint", flags, "int")
        return result
    }

    /**
     * The LockWindowUpdate function disables or enables drawing in the specified window. Only one window can be locked at a time.
     * @param {HWND} hWndLock The window in which drawing will be disabled. If this parameter is <b>NULL</b>, drawing in the locked window is enabled.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero, indicating that an error occurred or another window was already locked.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-lockwindowupdate
     * @since windows5.0
     */
    static LockWindowUpdate(hWndLock) {
        hWndLock := hWndLock is Win32Handle ? NumGet(hWndLock, "ptr") : hWndLock

        result := DllCall("USER32.dll\LockWindowUpdate", "ptr", hWndLock, "int")
        return result
    }

    /**
     * The ClientToScreen function converts the client-area coordinates of a specified point to screen coordinates.
     * @param {HWND} hWnd A handle to the window whose client area is used for the conversion.
     * @param {Pointer<POINT>} lpPoint A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the client coordinates to be converted. The new screen coordinates are copied into this structure if the function succeeds.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-clienttoscreen
     * @since windows5.0
     */
    static ClientToScreen(hWnd, lpPoint) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\ClientToScreen", "ptr", hWnd, "ptr", lpPoint, "int")
        return result
    }

    /**
     * The ScreenToClient function converts the screen coordinates of a specified point on the screen to client-area coordinates.
     * @param {HWND} hWnd A handle to the window whose client area will be used for the conversion.
     * @param {Pointer<POINT>} lpPoint A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that specifies the screen coordinates to be converted.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-screentoclient
     * @since windows5.0
     */
    static ScreenToClient(hWnd, lpPoint) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\ScreenToClient", "ptr", hWnd, "ptr", lpPoint, "int")
        return result
    }

    /**
     * The MapWindowPoints function converts (maps) a set of points from a coordinate space relative to one window to a coordinate space relative to another window.
     * @param {HWND} hWndFrom A handle to the window from which points are converted. If this parameter is <b>NULL</b> or HWND_DESKTOP, the points are presumed to be in screen coordinates.
     * @param {HWND} hWndTo A handle to the window to which points are converted. If this parameter is <b>NULL</b> or HWND_DESKTOP, the points are converted to screen coordinates.
     * @param {Pointer<POINT>} lpPoints A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures that contain the set of points to be converted. The points are in device units. This parameter can also point to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure, in which case the <i>cPoints</i> parameter should be set to 2.
     * @param {Integer} cPoints The number of <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structures in the array pointed to by the <i>lpPoints</i> parameter.
     * @returns {Integer} If the function succeeds, the low-order word of the return value is the number of pixels added to the horizontal coordinate of each source point in order to compute the horizontal coordinate of each destination point. (In addition to that, if precisely one of <i>hWndFrom</i> and <i>hWndTo</i> is mirrored, then each resulting horizontal coordinate is multiplied by -1.) The high-order word is the number of pixels added to the vertical coordinate of each source point in order to compute the vertical coordinate of each destination point.
     * 
     * If the function fails, the return value is zero. Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> prior to calling this method to differentiate an error return value from a legitimate "0" return value.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-mapwindowpoints
     * @since windows5.0
     */
    static MapWindowPoints(hWndFrom, hWndTo, lpPoints, cPoints) {
        hWndFrom := hWndFrom is Win32Handle ? NumGet(hWndFrom, "ptr") : hWndFrom
        hWndTo := hWndTo is Win32Handle ? NumGet(hWndTo, "ptr") : hWndTo

        result := DllCall("USER32.dll\MapWindowPoints", "ptr", hWndFrom, "ptr", hWndTo, "ptr", lpPoints, "uint", cPoints, "int")
        return result
    }

    /**
     * Retrieves the current color of the specified display element.
     * @param {Integer} nIndex Type: <b>int</b>
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The function returns the red, green, blue (RGB) color value of the given element.
     * 
     * If the <i>nIndex</i> parameter is out of range, the return value is zero. Because zero is also a valid RGB value, you cannot use 
     * <b>GetSysColor</b> to determine whether a system color is supported by the current platform. Instead, use the 
     * <a href="/windows/desktop/api/winuser/nf-winuser-getsyscolorbrush">GetSysColorBrush</a> function, which returns <b>NULL</b> if the color is not supported.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getsyscolor
     * @since windows5.0
     */
    static GetSysColor(nIndex) {
        result := DllCall("USER32.dll\GetSysColor", "int", nIndex, "uint")
        return result
    }

    /**
     * The GetSysColorBrush function retrieves a handle identifying a logical brush that corresponds to the specified color index.
     * @param {Integer} nIndex A color index. This value corresponds to the color used to paint one of the window elements. See <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> for system color index values.
     * @returns {HBRUSH} The return value identifies a logical brush if the <i>nIndex</i> parameter is supported by the current platform. Otherwise, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getsyscolorbrush
     * @since windows5.0
     */
    static GetSysColorBrush(nIndex) {
        result := DllCall("USER32.dll\GetSysColorBrush", "int", nIndex, "ptr")
        return HBRUSH({Value: result}, True)
    }

    /**
     * Sets the colors for the specified display elements.
     * @param {Integer} cElements Type: <b>int</b>
     * 
     * The number of display elements in the <i>lpaElements</i> array.
     * @param {Pointer<Integer>} lpaElements Type: <b>const INT*</b>
     * 
     * An array of integers that specify the display elements to be changed. For a list of display elements, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a>.
     * @param {Pointer<COLORREF>} lpaRgbValues Type: <b>const COLORREF*</b>
     * 
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> values that contain the new red, green, blue (RGB) color values for the display elements in the array pointed to by the <i>lpaElements</i> parameter.
     * 
     * To generate a 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setsyscolors
     * @since windows5.0
     */
    static SetSysColors(cElements, lpaElements, lpaRgbValues) {
        lpaElementsMarshal := lpaElements is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\SetSysColors", "int", cElements, lpaElementsMarshal, lpaElements, "ptr", lpaRgbValues, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The DrawFocusRect function draws a rectangle in the style used to indicate that the rectangle has the focus.
     * @param {HDC} hDC A handle to the device context.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the logical coordinates of the rectangle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-drawfocusrect
     * @since windows5.0
     */
    static DrawFocusRect(hDC, lprc) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := DllCall("USER32.dll\DrawFocusRect", "ptr", hDC, "ptr", lprc, "int")
        return result
    }

    /**
     * The FillRect function fills a rectangle by using the specified brush. This function includes the left and top borders, but excludes the right and bottom borders of the rectangle.
     * @param {HDC} hDC A handle to the device context.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the rectangle to be filled.
     * @param {HBRUSH} hbr A handle to the brush used to fill the rectangle.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-fillrect
     * @since windows5.0
     */
    static FillRect(hDC, lprc, hbr) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hbr := hbr is Win32Handle ? NumGet(hbr, "ptr") : hbr

        result := DllCall("USER32.dll\FillRect", "ptr", hDC, "ptr", lprc, "ptr", hbr, "int")
        return result
    }

    /**
     * The FrameRect function draws a border around the specified rectangle by using the specified brush. The width and height of the border are always one logical unit.
     * @param {HDC} hDC A handle to the device context in which the border is drawn.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the upper-left and lower-right corners of the rectangle.
     * @param {HBRUSH} hbr A handle to the brush used to draw the border.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-framerect
     * @since windows5.0
     */
    static FrameRect(hDC, lprc, hbr) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hbr := hbr is Win32Handle ? NumGet(hbr, "ptr") : hbr

        result := DllCall("USER32.dll\FrameRect", "ptr", hDC, "ptr", lprc, "ptr", hbr, "int")
        return result
    }

    /**
     * The InvertRect function inverts a rectangle in a window by performing a logical NOT operation on the color values for each pixel in the rectangle's interior.
     * @param {HDC} hDC A handle to the device context.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the rectangle to be inverted.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-invertrect
     * @since windows5.0
     */
    static InvertRect(hDC, lprc) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := DllCall("USER32.dll\InvertRect", "ptr", hDC, "ptr", lprc, "int")
        return result
    }

    /**
     * The SetRect function sets the coordinates of the specified rectangle. This is equivalent to assigning the left, top, right, and bottom arguments to the appropriate members of the RECT structure.
     * @param {Pointer<RECT>} lprc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle to be set.
     * @param {Integer} xLeft Specifies the x-coordinate of the rectangle's upper-left corner.
     * @param {Integer} yTop Specifies the y-coordinate of the rectangle's upper-left corner.
     * @param {Integer} xRight Specifies the x-coordinate of the rectangle's lower-right corner.
     * @param {Integer} yBottom Specifies the y-coordinate of the rectangle's lower-right corner.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setrect
     * @since windows5.0
     */
    static SetRect(lprc, xLeft, yTop, xRight, yBottom) {
        result := DllCall("USER32.dll\SetRect", "ptr", lprc, "int", xLeft, "int", yTop, "int", xRight, "int", yBottom, "int")
        return result
    }

    /**
     * The SetRectEmpty function creates an empty rectangle in which all coordinates are set to zero.
     * @param {Pointer<RECT>} lprc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the coordinates of the rectangle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setrectempty
     * @since windows5.0
     */
    static SetRectEmpty(lprc) {
        result := DllCall("USER32.dll\SetRectEmpty", "ptr", lprc, "int")
        return result
    }

    /**
     * The CopyRect function copies the coordinates of one rectangle to another.
     * @param {Pointer<RECT>} lprcDst Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the logical coordinates of the source rectangle.
     * @param {Pointer<RECT>} lprcSrc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure whose coordinates are to be copied in logical units.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-copyrect
     * @since windows5.0
     */
    static CopyRect(lprcDst, lprcSrc) {
        result := DllCall("USER32.dll\CopyRect", "ptr", lprcDst, "ptr", lprcSrc, "int")
        return result
    }

    /**
     * The InflateRect function increases or decreases the width and height of the specified rectangle.
     * @param {Pointer<RECT>} lprc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that increases or decreases in size.
     * @param {Integer} dx The amount to increase or decrease the rectangle width. This parameter must be negative to decrease the width.
     * @param {Integer} dy The amount to increase or decrease the rectangle height. This parameter must be negative to decrease the height.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-inflaterect
     * @since windows5.0
     */
    static InflateRect(lprc, dx, dy) {
        result := DllCall("USER32.dll\InflateRect", "ptr", lprc, "int", dx, "int", dy, "int")
        return result
    }

    /**
     * The IntersectRect function calculates the intersection of two source rectangles and places the coordinates of the intersection rectangle into the destination rectangle.
     * @param {Pointer<RECT>} lprcDst A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that is to receive the intersection of the rectangles pointed to by the <i>lprcSrc1</i> and <i>lprcSrc2</i> parameters. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<RECT>} lprcSrc1 A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the first source rectangle.
     * @param {Pointer<RECT>} lprcSrc2 A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the second source rectangle.
     * @returns {BOOL} If the rectangles intersect, the return value is nonzero.
     * 
     * If the rectangles do not intersect, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-intersectrect
     * @since windows5.0
     */
    static IntersectRect(lprcDst, lprcSrc1, lprcSrc2) {
        result := DllCall("USER32.dll\IntersectRect", "ptr", lprcDst, "ptr", lprcSrc1, "ptr", lprcSrc2, "int")
        return result
    }

    /**
     * The UnionRect function creates the union of two rectangles. The union is the smallest rectangle that contains both source rectangles.
     * @param {Pointer<RECT>} lprcDst A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that will receive a rectangle containing the rectangles pointed to by the <i>lprcSrc1</i> and <i>lprcSrc2</i> parameters.
     * @param {Pointer<RECT>} lprcSrc1 A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the first source rectangle.
     * @param {Pointer<RECT>} lprcSrc2 A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the second source rectangle.
     * @returns {BOOL} If the specified structure contains a nonempty rectangle, the return value is nonzero.
     * 
     * If the specified structure does not contain a nonempty rectangle, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-unionrect
     * @since windows5.0
     */
    static UnionRect(lprcDst, lprcSrc1, lprcSrc2) {
        result := DllCall("USER32.dll\UnionRect", "ptr", lprcDst, "ptr", lprcSrc1, "ptr", lprcSrc2, "int")
        return result
    }

    /**
     * The SubtractRect function determines the coordinates of a rectangle formed by subtracting one rectangle from another.
     * @param {Pointer<RECT>} lprcDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the coordinates of the rectangle determined by subtracting the rectangle pointed to by <i>lprcSrc2</i> from the rectangle pointed to by <i>lprcSrc1</i>.
     * @param {Pointer<RECT>} lprcSrc1 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure from which the function subtracts the rectangle pointed to by <i>lprcSrc2</i>.
     * @param {Pointer<RECT>} lprcSrc2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that the function subtracts from the rectangle pointed to by <i>lprcSrc1</i>.
     * @returns {BOOL} If the resulting rectangle is empty, the return value is zero.
     * 
     * If the resulting rectangle is not empty, the return value is nonzero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-subtractrect
     * @since windows5.0
     */
    static SubtractRect(lprcDst, lprcSrc1, lprcSrc2) {
        result := DllCall("USER32.dll\SubtractRect", "ptr", lprcDst, "ptr", lprcSrc1, "ptr", lprcSrc2, "int")
        return result
    }

    /**
     * The OffsetRect function moves the specified rectangle by the specified offsets.
     * @param {Pointer<RECT>} lprc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the rectangle to be moved.
     * @param {Integer} dx Specifies the amount to move the rectangle left or right. This parameter must be a negative value to move the rectangle to the left.
     * @param {Integer} dy Specifies the amount to move the rectangle up or down. This parameter must be a negative value to move the rectangle up.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-offsetrect
     * @since windows5.0
     */
    static OffsetRect(lprc, dx, dy) {
        result := DllCall("USER32.dll\OffsetRect", "ptr", lprc, "int", dx, "int", dy, "int")
        return result
    }

    /**
     * The IsRectEmpty function determines whether the specified rectangle is empty.
     * @param {Pointer<RECT>} lprc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the rectangle.
     * @returns {BOOL} If the rectangle is empty, the return value is nonzero.
     * 
     * If the rectangle is not empty, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-isrectempty
     * @since windows5.0
     */
    static IsRectEmpty(lprc) {
        result := DllCall("USER32.dll\IsRectEmpty", "ptr", lprc, "int")
        return result
    }

    /**
     * The EqualRect function determines whether the two specified rectangles are equal by comparing the coordinates of their upper-left and lower-right corners.
     * @param {Pointer<RECT>} lprc1 Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the first rectangle.
     * @param {Pointer<RECT>} lprc2 Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the logical coordinates of the second rectangle.
     * @returns {BOOL} If the two rectangles are identical, the return value is nonzero.
     * 
     * If the two rectangles are not identical, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-equalrect
     * @since windows5.0
     */
    static EqualRect(lprc1, lprc2) {
        result := DllCall("USER32.dll\EqualRect", "ptr", lprc1, "ptr", lprc2, "int")
        return result
    }

    /**
     * The PtInRect function determines whether the specified point lies within the specified rectangle.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the specified rectangle.
     * @param {POINT} pt A <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the specified point.
     * @returns {BOOL} If the specified point lies within the rectangle, the return value is nonzero.
     * 
     * If the specified point does not lie within the rectangle, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-ptinrect
     * @since windows5.0
     */
    static PtInRect(lprc, pt) {
        result := DllCall("USER32.dll\PtInRect", "ptr", lprc, "ptr", pt, "int")
        return result
    }

    /**
     * The LoadBitmap function loads the specified bitmap resource from a module's executable file.
     * @param {HINSTANCE} hInstance A handle to the instance of the module whose executable file contains the bitmap to be loaded.
     * @param {PSTR} lpBitmapName A pointer to a null-terminated string that contains the name of the bitmap resource to be loaded. Alternatively, this parameter can consist of the resource identifier in the low-order word and zero in the high-order word. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro can be used to create this value.
     * @returns {HBITMAP} If the function succeeds, the return value is the handle to the specified bitmap.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-loadbitmapa
     * @since windows5.0
     */
    static LoadBitmapA(hInstance, lpBitmapName) {
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance
        lpBitmapName := lpBitmapName is String ? StrPtr(lpBitmapName) : lpBitmapName

        result := DllCall("USER32.dll\LoadBitmapA", "ptr", hInstance, "ptr", lpBitmapName, "ptr")
        return HBITMAP({Value: result}, True)
    }

    /**
     * The LoadBitmap function loads the specified bitmap resource from a module's executable file.
     * @param {HINSTANCE} hInstance A handle to the instance of the module whose executable file contains the bitmap to be loaded.
     * @param {PWSTR} lpBitmapName A pointer to a null-terminated string that contains the name of the bitmap resource to be loaded. Alternatively, this parameter can consist of the resource identifier in the low-order word and zero in the high-order word. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro can be used to create this value.
     * @returns {HBITMAP} If the function succeeds, the return value is the handle to the specified bitmap.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-loadbitmapw
     * @since windows5.0
     */
    static LoadBitmapW(hInstance, lpBitmapName) {
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance
        lpBitmapName := lpBitmapName is String ? StrPtr(lpBitmapName) : lpBitmapName

        result := DllCall("USER32.dll\LoadBitmapW", "ptr", hInstance, "ptr", lpBitmapName, "ptr")
        return HBITMAP({Value: result}, True)
    }

    /**
     * The ChangeDisplaySettings function changes the settings of the default display device to the specified graphics mode.
     * @param {Pointer<DEVMODEA>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure that describes the new graphics mode. If <i>lpDevMode</i> is <b>NULL</b>, all the values currently in the registry will be used for the display setting. Passing <b>NULL</b> for the <i>lpDevMode</i> parameter and 0 for the <i>dwFlags</i> parameter is the easiest way to return to the default mode after a dynamic mode change.
     * 
     * The <b>dmSize</b> member of <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> must be initialized to the size, in bytes, of the <b>DEVMODE</b> structure. The <b>dmDriverExtra</b> member of <b>DEVMODE</b> must be initialized to indicate the number of bytes of private driver data following the <b>DEVMODE</b> structure. In addition, you can use any or all of the following members of the <b>DEVMODE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>dmBitsPerPel</b></td>
     * <td>Bits per pixel</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsWidth</b></td>
     * <td>Pixel width</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsHeight</b></td>
     * <td>Pixel height</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFlags</b></td>
     * <td>Mode flags</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFrequency</b></td>
     * <td>Mode frequency</td>
     * </tr>
     * <tr>
     * <td><b>dmPosition</b></td>
     * <td>Position of the device in a multi-monitor configuration.</td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags 
     * @returns {Integer} The <b>ChangeDisplaySettings</b> function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_SUCCESSFUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADDUALVIEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was unsuccessful because the system is DualView capable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADFLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid set of flags was passed in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graphics mode is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed in. This can include an invalid flag or combination of flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display driver failed the specified graphics mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_NOTUPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to write settings to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_RESTART</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer must be restarted for the graphics mode to work.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-changedisplaysettingsa
     * @since windows5.0
     */
    static ChangeDisplaySettingsA(lpDevMode, dwFlags) {
        result := DllCall("USER32.dll\ChangeDisplaySettingsA", "ptr", lpDevMode, "uint", dwFlags, "int")
        return result
    }

    /**
     * The ChangeDisplaySettings function changes the settings of the default display device to the specified graphics mode.
     * @param {Pointer<DEVMODEW>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure that describes the new graphics mode. If <i>lpDevMode</i> is <b>NULL</b>, all the values currently in the registry will be used for the display setting. Passing <b>NULL</b> for the <i>lpDevMode</i> parameter and 0 for the <i>dwFlags</i> parameter is the easiest way to return to the default mode after a dynamic mode change.
     * 
     * The <b>dmSize</b> member of <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> must be initialized to the size, in bytes, of the <b>DEVMODE</b> structure. The <b>dmDriverExtra</b> member of <b>DEVMODE</b> must be initialized to indicate the number of bytes of private driver data following the <b>DEVMODE</b> structure. In addition, you can use any or all of the following members of the <b>DEVMODE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>dmBitsPerPel</b></td>
     * <td>Bits per pixel</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsWidth</b></td>
     * <td>Pixel width</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsHeight</b></td>
     * <td>Pixel height</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFlags</b></td>
     * <td>Mode flags</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFrequency</b></td>
     * <td>Mode frequency</td>
     * </tr>
     * <tr>
     * <td><b>dmPosition</b></td>
     * <td>Position of the device in a multi-monitor configuration.</td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags 
     * @returns {Integer} The <b>ChangeDisplaySettings</b> function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_SUCCESSFUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADDUALVIEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was unsuccessful because the system is DualView capable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADFLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid set of flags was passed in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graphics mode is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed in. This can include an invalid flag or combination of flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display driver failed the specified graphics mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_NOTUPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to write settings to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_RESTART</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer must be restarted for the graphics mode to work.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-changedisplaysettingsw
     * @since windows5.0
     */
    static ChangeDisplaySettingsW(lpDevMode, dwFlags) {
        result := DllCall("USER32.dll\ChangeDisplaySettingsW", "ptr", lpDevMode, "uint", dwFlags, "int")
        return result
    }

    /**
     * The ChangeDisplaySettingsEx function changes the settings of the specified display device to the specified graphics mode.
     * @param {PSTR} lpszDeviceName A pointer to a null-terminated string that specifies the display device whose graphics mode will change. Only display device names as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a> are valid. See <b>EnumDisplayDevices</b> for further information on the names associated with these display devices.
     * 
     * The <i>lpszDeviceName</i> parameter can be <b>NULL</b>. A <b>NULL</b> value specifies the default display device. The default device can be determined by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a> and checking for the DISPLAY_DEVICE_PRIMARY_DEVICE flag.
     * @param {Pointer<DEVMODEA>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure that describes the new graphics mode. If <i>lpDevMode</i> is <b>NULL</b>, all the values currently in the registry will be used for the display setting. Passing <b>NULL</b> for the <i>lpDevMode</i> parameter and 0 for the <i>dwFlags</i> parameter is the easiest way to return to the default mode after a dynamic mode change.
     * 
     * The <b>dmSize</b> member must be initialized to the size, in bytes, of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. The <b>dmDriverExtra</b> member must be initialized to indicate the number of bytes of private driver data following the <b>DEVMODE</b> structure. In addition, you can use any of the following members of the <b>DEVMODE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>dmBitsPerPel</b></td>
     * <td>Bits per pixel</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsWidth</b></td>
     * <td>Pixel width</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsHeight</b></td>
     * <td>Pixel height</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFlags</b></td>
     * <td>Mode flags</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFrequency</b></td>
     * <td>Mode frequency</td>
     * </tr>
     * <tr>
     * <td><b>dmPosition</b></td>
     * <td>Position of the device in a multi-monitor configuration.</td>
     * </tr>
     * </table>
     * @param {Integer} dwflags 
     * @param {Pointer<Void>} lParam If <i>dwFlags</i> is <b>CDS_VIDEOPARAMETERS</b>, <i>lParam</i> is a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145196(v=vs.85)">VIDEOPARAMETERS</a> structure. Otherwise <i>lParam</i> must be <b>NULL</b>.
     * @returns {Integer} The <b>ChangeDisplaySettingsEx</b> function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_SUCCESSFUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADDUALVIEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was unsuccessful because the system is DualView capable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADFLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid set of flags was passed in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graphics mode is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed in. This can include an invalid flag or combination of flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display driver failed the specified graphics mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_NOTUPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to write settings to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_RESTART</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer must be restarted for the graphics mode to work.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-changedisplaysettingsexa
     * @since windows5.0
     */
    static ChangeDisplaySettingsExA(lpszDeviceName, lpDevMode, dwflags, lParam) {
        static hwnd := 0 ;Reserved parameters must always be NULL

        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        lParamMarshal := lParam is VarRef ? "ptr" : "ptr"

        result := DllCall("USER32.dll\ChangeDisplaySettingsExA", "ptr", lpszDeviceName, "ptr", lpDevMode, "ptr", hwnd, "uint", dwflags, lParamMarshal, lParam, "int")
        return result
    }

    /**
     * The ChangeDisplaySettingsEx function changes the settings of the specified display device to the specified graphics mode.
     * @param {PWSTR} lpszDeviceName A pointer to a null-terminated string that specifies the display device whose graphics mode will change. Only display device names as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a> are valid. See <b>EnumDisplayDevices</b> for further information on the names associated with these display devices.
     * 
     * The <i>lpszDeviceName</i> parameter can be <b>NULL</b>. A <b>NULL</b> value specifies the default display device. The default device can be determined by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a> and checking for the DISPLAY_DEVICE_PRIMARY_DEVICE flag.
     * @param {Pointer<DEVMODEW>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure that describes the new graphics mode. If <i>lpDevMode</i> is <b>NULL</b>, all the values currently in the registry will be used for the display setting. Passing <b>NULL</b> for the <i>lpDevMode</i> parameter and 0 for the <i>dwFlags</i> parameter is the easiest way to return to the default mode after a dynamic mode change.
     * 
     * The <b>dmSize</b> member must be initialized to the size, in bytes, of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. The <b>dmDriverExtra</b> member must be initialized to indicate the number of bytes of private driver data following the <b>DEVMODE</b> structure. In addition, you can use any of the following members of the <b>DEVMODE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>dmBitsPerPel</b></td>
     * <td>Bits per pixel</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsWidth</b></td>
     * <td>Pixel width</td>
     * </tr>
     * <tr>
     * <td><b>dmPelsHeight</b></td>
     * <td>Pixel height</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFlags</b></td>
     * <td>Mode flags</td>
     * </tr>
     * <tr>
     * <td><b>dmDisplayFrequency</b></td>
     * <td>Mode frequency</td>
     * </tr>
     * <tr>
     * <td><b>dmPosition</b></td>
     * <td>Position of the device in a multi-monitor configuration.</td>
     * </tr>
     * </table>
     * @param {Integer} dwflags 
     * @param {Pointer<Void>} lParam If <i>dwFlags</i> is <b>CDS_VIDEOPARAMETERS</b>, <i>lParam</i> is a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145196(v=vs.85)">VIDEOPARAMETERS</a> structure. Otherwise <i>lParam</i> must be <b>NULL</b>.
     * @returns {Integer} The <b>ChangeDisplaySettingsEx</b> function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_SUCCESSFUL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADDUALVIEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The settings change was unsuccessful because the system is DualView capable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADFLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid set of flags was passed in.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graphics mode is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_BADPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed in. This can include an invalid flag or combination of flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display driver failed the specified graphics mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_NOTUPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to write settings to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_CHANGE_RESTART</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer must be restarted for the graphics mode to work.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-changedisplaysettingsexw
     * @since windows5.0
     */
    static ChangeDisplaySettingsExW(lpszDeviceName, lpDevMode, dwflags, lParam) {
        static hwnd := 0 ;Reserved parameters must always be NULL

        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        lParamMarshal := lParam is VarRef ? "ptr" : "ptr"

        result := DllCall("USER32.dll\ChangeDisplaySettingsExW", "ptr", lpszDeviceName, "ptr", lpDevMode, "ptr", hwnd, "uint", dwflags, lParamMarshal, lParam, "int")
        return result
    }

    /**
     * The EnumDisplaySettings function retrieves information about one of the graphics modes for a display device. To retrieve information for all the graphics modes of a display device, make a series of calls to this function.
     * @param {PSTR} lpszDeviceName A pointer to a null-terminated string that specifies the display device about whose graphics mode the function will obtain information.
     * 
     * This parameter is either <b>NULL</b> or a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a>.<b>DeviceName</b> returned from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>. A <b>NULL</b> value specifies the current display device on the computer on which the calling thread is running.
     * @param {Integer} iModeNum 
     * @param {Pointer<DEVMODEA>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure into which the function stores information about the specified graphics mode. Before calling <b>EnumDisplaySettings</b>, set the <b>dmSize</b> member to <c>sizeof(DEVMODE)</c>, and set the <b>dmDriverExtra</b> member to indicate the size, in bytes, of the additional space available to receive private driver data.
     * 
     * The <b>EnumDisplaySettings</b> function sets values for the following five <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> members:
     * 
     * <ul>
     * <li><b>dmBitsPerPel</b></li>
     * <li><b>dmPelsWidth</b></li>
     * <li><b>dmPelsHeight</b></li>
     * <li><b>dmDisplayFlags</b></li>
     * <li><b>dmDisplayFrequency</b></li>
     * </ul>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdisplaysettingsa
     * @since windows5.0
     */
    static EnumDisplaySettingsA(lpszDeviceName, iModeNum, lpDevMode) {
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName

        result := DllCall("USER32.dll\EnumDisplaySettingsA", "ptr", lpszDeviceName, "uint", iModeNum, "ptr", lpDevMode, "int")
        return result
    }

    /**
     * The EnumDisplaySettings function retrieves information about one of the graphics modes for a display device. To retrieve information for all the graphics modes of a display device, make a series of calls to this function.
     * @param {PWSTR} lpszDeviceName A pointer to a null-terminated string that specifies the display device about whose graphics mode the function will obtain information.
     * 
     * This parameter is either <b>NULL</b> or a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a>.<b>DeviceName</b> returned from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>. A <b>NULL</b> value specifies the current display device on the computer on which the calling thread is running.
     * @param {Integer} iModeNum 
     * @param {Pointer<DEVMODEW>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure into which the function stores information about the specified graphics mode. Before calling <b>EnumDisplaySettings</b>, set the <b>dmSize</b> member to <c>sizeof(DEVMODE)</c>, and set the <b>dmDriverExtra</b> member to indicate the size, in bytes, of the additional space available to receive private driver data.
     * 
     * The <b>EnumDisplaySettings</b> function sets values for the following five <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> members:
     * 
     * <ul>
     * <li><b>dmBitsPerPel</b></li>
     * <li><b>dmPelsWidth</b></li>
     * <li><b>dmPelsHeight</b></li>
     * <li><b>dmDisplayFlags</b></li>
     * <li><b>dmDisplayFrequency</b></li>
     * </ul>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdisplaysettingsw
     * @since windows5.0
     */
    static EnumDisplaySettingsW(lpszDeviceName, iModeNum, lpDevMode) {
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName

        result := DllCall("USER32.dll\EnumDisplaySettingsW", "ptr", lpszDeviceName, "uint", iModeNum, "ptr", lpDevMode, "int")
        return result
    }

    /**
     * The EnumDisplaySettingsEx function retrieves information about one of the graphics modes for a display device. To retrieve information for all the graphics modes for a display device, make a series of calls to this function.
     * @param {PSTR} lpszDeviceName A pointer to a null-terminated string that specifies the display device about which graphics mode the function will obtain information.
     * 
     * This parameter is either <b>NULL</b> or a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a>.<b>DeviceName</b> returned from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>. A <b>NULL</b> value specifies the current display device on the computer that the calling thread is running on.
     * @param {Integer} iModeNum 
     * @param {Pointer<DEVMODEA>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure into which the function stores information about the specified graphics mode. Before calling <b>EnumDisplaySettingsEx</b>, set the <b>dmSize</b> member to <b>sizeof</b> (<a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>), and set the <b>dmDriverExtra</b> member to indicate the size, in bytes, of the additional space available to receive private driver data.
     * 
     * The <b>EnumDisplaySettingsEx</b> function will populate the <b>dmFields</b> member of the <b>lpDevMode</b> and one or more other members of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. To determine which members were set by the call to <b>EnumDisplaySettingsEx</b>, inspect the <i>dmFields</i> bitmask. Some of the fields typically populated by this function include:
     * 
     * <ul>
     * <li><b>dmBitsPerPel</b></li>
     * <li><b>dmPelsWidth</b></li>
     * <li><b>dmPelsHeight</b></li>
     * <li><b>dmDisplayFlags</b></li>
     * <li><b>dmDisplayFrequency</b></li>
     * <li><b>dmPosition</b></li>
     * <li><b>dmDisplayOrientation</b></li>
     * </ul>
     * @param {Integer} dwFlags This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDS_RAWMODE"></a><a id="eds_rawmode"></a><dl>
     * <dt><b>EDS_RAWMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the function will return all graphics modes reported by the adapter driver, regardless of monitor capabilities. Otherwise, it will only return modes that are compatible with current monitors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDS_ROTATEDMODE_"></a><a id="eds_rotatedmode_"></a><dl>
     * <dt><b>EDS_ROTATEDMODE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the function will return graphics modes in all orientations. Otherwise, it will only return modes that have the same orientation as the one currently set for the requested display.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdisplaysettingsexa
     * @since windows5.0
     */
    static EnumDisplaySettingsExA(lpszDeviceName, iModeNum, lpDevMode, dwFlags) {
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName

        result := DllCall("USER32.dll\EnumDisplaySettingsExA", "ptr", lpszDeviceName, "uint", iModeNum, "ptr", lpDevMode, "uint", dwFlags, "int")
        return result
    }

    /**
     * The EnumDisplaySettingsEx function retrieves information about one of the graphics modes for a display device. To retrieve information for all the graphics modes for a display device, make a series of calls to this function.
     * @param {PWSTR} lpszDeviceName A pointer to a null-terminated string that specifies the display device about which graphics mode the function will obtain information.
     * 
     * This parameter is either <b>NULL</b> or a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a>. <b>DeviceName</b> returned from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaydevicesa">EnumDisplayDevices</a>. A <b>NULL</b> value specifies the current display device on the computer that the calling thread is running on.
     * @param {Integer} iModeNum 
     * @param {Pointer<DEVMODEW>} lpDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure into which the function stores information about the specified graphics mode. Before calling <b>EnumDisplaySettingsEx</b>, set the <b>dmSize</b> member to <b>sizeof</b> (<a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>), and set the <b>dmDriverExtra</b> member to indicate the size, in bytes, of the additional space available to receive private driver data.
     * 
     * The <b>EnumDisplaySettingsEx</b> function will populate the <b>dmFields</b> member of the <b>lpDevMode</b> and one or more other members of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. To determine which members were set by the call to <b>EnumDisplaySettingsEx</b>, inspect the <i>dmFields</i> bitmask. Some of the fields typically populated by this function include:
     * 
     * <ul>
     * <li><b>dmBitsPerPel</b></li>
     * <li><b>dmPelsWidth</b></li>
     * <li><b>dmPelsHeight</b></li>
     * <li><b>dmDisplayFlags</b></li>
     * <li><b>dmDisplayFrequency</b></li>
     * <li><b>dmPosition</b></li>
     * <li><b>dmDisplayOrientation</b></li>
     * </ul>
     * @param {Integer} dwFlags This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDS_RAWMODE"></a><a id="eds_rawmode"></a><dl>
     * <dt><b>EDS_RAWMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the function will return all graphics modes reported by the adapter driver, regardless of monitor capabilities. Otherwise, it will only return modes that are compatible with current monitors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EDS_ROTATEDMODE_"></a><a id="eds_rotatedmode_"></a><dl>
     * <dt><b>EDS_ROTATEDMODE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the function will return graphics modes in all orientations. Otherwise, it will only return modes that have the same orientation as the one currently set for the requested display.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdisplaysettingsexw
     * @since windows5.0
     */
    static EnumDisplaySettingsExW(lpszDeviceName, iModeNum, lpDevMode, dwFlags) {
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName

        result := DllCall("USER32.dll\EnumDisplaySettingsExW", "ptr", lpszDeviceName, "uint", iModeNum, "ptr", lpDevMode, "uint", dwFlags, "int")
        return result
    }

    /**
     * The EnumDisplayDevices function lets you obtain information about the display devices in the current session.
     * @param {PSTR} lpDevice A pointer to the device name. If <b>NULL</b>, function returns information for the display adapter(s) on the machine, based on <i>iDevNum</i>.
     * 
     * For more information, see Remarks.
     * @param {Integer} iDevNum An index value that specifies the display device of interest.
     * 
     * The operating system identifies each display device in the current session with an index value. The index values are consecutive integers, starting at 0. If the current session has three display devices, for example, they are specified by the index values 0, 1, and 2.
     * @param {Pointer<DISPLAY_DEVICEA>} lpDisplayDevice A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a> structure that receives information about the display device specified by <i>iDevNum</i>. 
     * 
     * Before calling <b>EnumDisplayDevices</b>, you must initialize the <b>cb</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a> to the size, in bytes, of <b>DISPLAY_DEVICE</b>.
     * @param {Integer} dwFlags Set this flag to EDD_GET_DEVICE_INTERFACE_NAME (0x00000001) to retrieve the device interface name for GUID_DEVINTERFACE_MONITOR, which is registered by the operating system on a per monitor basis. The value is placed in the DeviceID member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a> structure returned in <i>lpDisplayDevice</i>. The resulting device interface name can be used with <a href="https://docs.microsoft.com/windows-hardware/drivers/install/setupapi">SetupAPI functions</a> and serves as a link between GDI monitor devices and SetupAPI monitor devices.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. The function fails if <i>iDevNum</i> is greater than the largest device index.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdisplaydevicesa
     * @since windows5.0
     */
    static EnumDisplayDevicesA(lpDevice, iDevNum, lpDisplayDevice, dwFlags) {
        lpDevice := lpDevice is String ? StrPtr(lpDevice) : lpDevice

        result := DllCall("USER32.dll\EnumDisplayDevicesA", "ptr", lpDevice, "uint", iDevNum, "ptr", lpDisplayDevice, "uint", dwFlags, "int")
        return result
    }

    /**
     * The EnumDisplayDevices function lets you obtain information about the display devices in the current session.
     * @param {PWSTR} lpDevice A pointer to the device name. If <b>NULL</b>, function returns information for the display adapter(s) on the machine, based on <i>iDevNum</i>.
     * 
     * For more information, see Remarks.
     * @param {Integer} iDevNum An index value that specifies the display device of interest.
     * 
     * The operating system identifies each display device in the current session with an index value. The index values are consecutive integers, starting at 0. If the current session has three display devices, for example, they are specified by the index values 0, 1, and 2.
     * @param {Pointer<DISPLAY_DEVICEW>} lpDisplayDevice A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a> structure that receives information about the display device specified by <i>iDevNum</i>. 
     * 
     * Before calling <b>EnumDisplayDevices</b>, you must initialize the <b>cb</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a> to the size, in bytes, of <b>DISPLAY_DEVICE</b>.
     * @param {Integer} dwFlags Set this flag to EDD_GET_DEVICE_INTERFACE_NAME (0x00000001) to retrieve the device interface name for GUID_DEVINTERFACE_MONITOR, which is registered by the operating system on a per monitor basis. The value is placed in the DeviceID member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-display_devicea">DISPLAY_DEVICE</a> structure returned in <i>lpDisplayDevice</i>. The resulting device interface name can be used with <a href="https://docs.microsoft.com/windows-hardware/drivers/install/setupapi">SetupAPI functions</a> and serves as a link between GDI monitor devices and SetupAPI monitor devices.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. The function fails if <i>iDevNum</i> is greater than the largest device index.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdisplaydevicesw
     * @since windows5.0
     */
    static EnumDisplayDevicesW(lpDevice, iDevNum, lpDisplayDevice, dwFlags) {
        lpDevice := lpDevice is String ? StrPtr(lpDevice) : lpDevice

        result := DllCall("USER32.dll\EnumDisplayDevicesW", "ptr", lpDevice, "uint", iDevNum, "ptr", lpDisplayDevice, "uint", dwFlags, "int")
        return result
    }

    /**
     * The MonitorFromPoint function retrieves a handle to the display monitor that contains a specified point.
     * @param {POINT} pt A <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that specifies the point of interest in virtual-screen coordinates.
     * @param {Integer} dwFlags Determines the function's return value if the point is not contained within any display monitor.
     * @returns {HMONITOR} If the point is contained by a display monitor, the return value is an <b>HMONITOR</b> handle to that display monitor.
     * 
     * If the point is not contained by a display monitor, the return value depends on the value of <i>dwFlags</i>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-monitorfrompoint
     * @since windows5.0
     */
    static MonitorFromPoint(pt, dwFlags) {
        result := DllCall("USER32.dll\MonitorFromPoint", "ptr", pt, "uint", dwFlags, "ptr")
        return HMONITOR({Value: result}, True)
    }

    /**
     * The MonitorFromRect function retrieves a handle to the display monitor that has the largest area of intersection with a specified rectangle.
     * @param {Pointer<RECT>} lprc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the rectangle of interest in virtual-screen coordinates.
     * @param {Integer} dwFlags Determines the function's return value if the rectangle does not intersect any display monitor.
     * @returns {HMONITOR} If the rectangle intersects one or more display monitor rectangles, the return value is an <b>HMONITOR</b> handle to the display monitor that has the largest area of intersection with the rectangle.
     * 
     * If the rectangle does not intersect a display monitor, the return value depends on the value of <i>dwFlags</i>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-monitorfromrect
     * @since windows5.0
     */
    static MonitorFromRect(lprc, dwFlags) {
        result := DllCall("USER32.dll\MonitorFromRect", "ptr", lprc, "uint", dwFlags, "ptr")
        return HMONITOR({Value: result}, True)
    }

    /**
     * The MonitorFromWindow function retrieves a handle to the display monitor that has the largest area of intersection with the bounding rectangle of a specified window.
     * @param {HWND} hwnd A handle to the window of interest.
     * @param {Integer} dwFlags Determines the function's return value if the window does not intersect any display monitor.
     * @returns {HMONITOR} If the window intersects one or more display monitor rectangles, the return value is an <b>HMONITOR</b> handle to the display monitor that has the largest area of intersection with the window.
     * 
     * If the window does not intersect a display monitor, the return value depends on the value of <i>dwFlags</i>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-monitorfromwindow
     * @since windows5.0
     */
    static MonitorFromWindow(hwnd, dwFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("USER32.dll\MonitorFromWindow", "ptr", hwnd, "uint", dwFlags, "ptr")
        return HMONITOR({Value: result}, True)
    }

    /**
     * The GetMonitorInfo function retrieves information about a display monitor.
     * @param {HMONITOR} hMonitor A handle to the display monitor of interest.
     * @param {Pointer<MONITORINFO>} lpmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfo">MONITORINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure that receives information about the specified display monitor.
     * 
     * You must set the <b>cbSize</b> member of the structure to sizeof(MONITORINFO) or sizeof(MONITORINFOEX) before calling the <b>GetMonitorInfo</b> function. Doing so lets the function determine the type of structure you are passing to it.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure is a superset of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfo">MONITORINFO</a> structure. It has one additional member: a string that contains a name for the display monitor. Most applications have no use for a display monitor name, and so can save some bytes by using a <b>MONITORINFO</b> structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmonitorinfoa
     * @since windows5.0
     */
    static GetMonitorInfoA(hMonitor, lpmi) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := DllCall("USER32.dll\GetMonitorInfoA", "ptr", hMonitor, "ptr", lpmi, "int")
        return result
    }

    /**
     * The GetMonitorInfo function retrieves information about a display monitor.
     * @param {HMONITOR} hMonitor A handle to the display monitor of interest.
     * @param {Pointer<MONITORINFO>} lpmi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfo">MONITORINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure that receives information about the specified display monitor.
     * 
     * You must set the <b>cbSize</b> member of the structure to sizeof(MONITORINFO) or sizeof(MONITORINFOEX) before calling the <b>GetMonitorInfo</b> function. Doing so lets the function determine the type of structure you are passing to it.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure is a superset of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfo">MONITORINFO</a> structure. It has one additional member: a string that contains a name for the display monitor. Most applications have no use for a display monitor name, and so can save some bytes by using a <b>MONITORINFO</b> structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmonitorinfow
     * @since windows5.0
     */
    static GetMonitorInfoW(hMonitor, lpmi) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := DllCall("USER32.dll\GetMonitorInfoW", "ptr", hMonitor, "ptr", lpmi, "int")
        return result
    }

    /**
     * The EnumDisplayMonitors function enumerates display monitors (including invisible pseudo-monitors associated with the mirroring drivers) that intersect a region formed by the intersection of a specified clipping rectangle and the visible region of a device context. EnumDisplayMonitors calls an application-defined MonitorEnumProc callback function once for each monitor that is enumerated. Note that GetSystemMetrics (SM_CMONITORS) counts only the display monitors.
     * @param {HDC} hdc A handle to a display device context that defines the visible region of interest.
     * 
     * If this parameter is <b>NULL</b>, the <i>hdcMonitor</i> parameter passed to the callback function will be <b>NULL</b>, and the visible region of interest is the virtual screen that encompasses all the displays on the desktop.
     * @param {Pointer<RECT>} lprcClip A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies a clipping rectangle. The region of interest is the intersection of the clipping rectangle with the visible region specified by <i>hdc</i>.
     * 
     * If <i>hdc</i> is non-<b>NULL</b>, the coordinates of the clipping rectangle are relative to the origin of the <i>hdc</i>. If <i>hdc</i> is <b>NULL</b>, the coordinates are virtual-screen coordinates.
     * 
     * This parameter can be <b>NULL</b> if you don't want to clip the region specified by <i>hdc</i>.
     * @param {Pointer<MONITORENUMPROC>} lpfnEnum A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-monitorenumproc">MonitorEnumProc</a> application-defined callback function.
     * @param {LPARAM} dwData Application-defined data that <b>EnumDisplayMonitors</b> passes directly to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-monitorenumproc">MonitorEnumProc</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumdisplaymonitors
     * @since windows5.0
     */
    static EnumDisplayMonitors(hdc, lprcClip, lpfnEnum, dwData) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("USER32.dll\EnumDisplayMonitors", "ptr", hdc, "ptr", lprcClip, "ptr", lpfnEnum, "ptr", dwData, "int")
        return result
    }

;@endregion Methods
}
