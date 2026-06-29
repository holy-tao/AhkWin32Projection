#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global GDI_ERROR := -1

/**
 * @type {Integer (Int32)}
 */
export global Win32ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global MAXSTRETCHBLTMODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global POLYFILL_LAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global LAYOUT_BTT := 2

/**
 * @type {Integer (UInt32)}
 */
export global LAYOUT_VBH := 4

/**
 * @type {Integer (UInt32)}
 */
export global ASPECT_FILTERING := 1

/**
 * @type {Integer (UInt32)}
 */
export global META_SETBKCOLOR := 513

/**
 * @type {Integer (UInt32)}
 */
export global META_SETBKMODE := 258

/**
 * @type {Integer (UInt32)}
 */
export global META_SETMAPMODE := 259

/**
 * @type {Integer (UInt32)}
 */
export global META_SETROP2 := 260

/**
 * @type {Integer (UInt32)}
 */
export global META_SETRELABS := 261

/**
 * @type {Integer (UInt32)}
 */
export global META_SETPOLYFILLMODE := 262

/**
 * @type {Integer (UInt32)}
 */
export global META_SETSTRETCHBLTMODE := 263

/**
 * @type {Integer (UInt32)}
 */
export global META_SETTEXTCHAREXTRA := 264

/**
 * @type {Integer (UInt32)}
 */
export global META_SETTEXTCOLOR := 521

/**
 * @type {Integer (UInt32)}
 */
export global META_SETTEXTJUSTIFICATION := 522

/**
 * @type {Integer (UInt32)}
 */
export global META_SETWINDOWORG := 523

/**
 * @type {Integer (UInt32)}
 */
export global META_SETWINDOWEXT := 524

/**
 * @type {Integer (UInt32)}
 */
export global META_SETVIEWPORTORG := 525

/**
 * @type {Integer (UInt32)}
 */
export global META_SETVIEWPORTEXT := 526

/**
 * @type {Integer (UInt32)}
 */
export global META_OFFSETWINDOWORG := 527

/**
 * @type {Integer (UInt32)}
 */
export global META_SCALEWINDOWEXT := 1040

/**
 * @type {Integer (UInt32)}
 */
export global META_OFFSETVIEWPORTORG := 529

/**
 * @type {Integer (UInt32)}
 */
export global META_SCALEVIEWPORTEXT := 1042

/**
 * @type {Integer (UInt32)}
 */
export global META_LINETO := 531

/**
 * @type {Integer (UInt32)}
 */
export global META_MOVETO := 532

/**
 * @type {Integer (UInt32)}
 */
export global META_EXCLUDECLIPRECT := 1045

/**
 * @type {Integer (UInt32)}
 */
export global META_INTERSECTCLIPRECT := 1046

/**
 * @type {Integer (UInt32)}
 */
export global META_ARC := 2071

/**
 * @type {Integer (UInt32)}
 */
export global META_ELLIPSE := 1048

/**
 * @type {Integer (UInt32)}
 */
export global META_FLOODFILL := 1049

/**
 * @type {Integer (UInt32)}
 */
export global META_PIE := 2074

/**
 * @type {Integer (UInt32)}
 */
export global META_RECTANGLE := 1051

/**
 * @type {Integer (UInt32)}
 */
export global META_ROUNDRECT := 1564

/**
 * @type {Integer (UInt32)}
 */
export global META_PATBLT := 1565

/**
 * @type {Integer (UInt32)}
 */
export global META_SAVEDC := 30

/**
 * @type {Integer (UInt32)}
 */
export global META_SETPIXEL := 1055

/**
 * @type {Integer (UInt32)}
 */
export global META_OFFSETCLIPRGN := 544

/**
 * @type {Integer (UInt32)}
 */
export global META_TEXTOUT := 1313

/**
 * @type {Integer (UInt32)}
 */
export global META_BITBLT := 2338

/**
 * @type {Integer (UInt32)}
 */
export global META_STRETCHBLT := 2851

/**
 * @type {Integer (UInt32)}
 */
export global META_POLYGON := 804

/**
 * @type {Integer (UInt32)}
 */
export global META_POLYLINE := 805

/**
 * @type {Integer (UInt32)}
 */
export global META_ESCAPE := 1574

/**
 * @type {Integer (UInt32)}
 */
export global META_RESTOREDC := 295

/**
 * @type {Integer (UInt32)}
 */
export global META_FILLREGION := 552

/**
 * @type {Integer (UInt32)}
 */
export global META_FRAMEREGION := 1065

/**
 * @type {Integer (UInt32)}
 */
export global META_INVERTREGION := 298

/**
 * @type {Integer (UInt32)}
 */
export global META_PAINTREGION := 299

/**
 * @type {Integer (UInt32)}
 */
export global META_SELECTCLIPREGION := 300

/**
 * @type {Integer (UInt32)}
 */
export global META_SELECTOBJECT := 301

/**
 * @type {Integer (UInt32)}
 */
export global META_SETTEXTALIGN := 302

/**
 * @type {Integer (UInt32)}
 */
export global META_CHORD := 2096

/**
 * @type {Integer (UInt32)}
 */
export global META_SETMAPPERFLAGS := 561

/**
 * @type {Integer (UInt32)}
 */
export global META_EXTTEXTOUT := 2610

/**
 * @type {Integer (UInt32)}
 */
export global META_SETDIBTODEV := 3379

/**
 * @type {Integer (UInt32)}
 */
export global META_SELECTPALETTE := 564

/**
 * @type {Integer (UInt32)}
 */
export global META_REALIZEPALETTE := 53

/**
 * @type {Integer (UInt32)}
 */
export global META_ANIMATEPALETTE := 1078

/**
 * @type {Integer (UInt32)}
 */
export global META_SETPALENTRIES := 55

/**
 * @type {Integer (UInt32)}
 */
export global META_POLYPOLYGON := 1336

/**
 * @type {Integer (UInt32)}
 */
export global META_RESIZEPALETTE := 313

/**
 * @type {Integer (UInt32)}
 */
export global META_DIBBITBLT := 2368

/**
 * @type {Integer (UInt32)}
 */
export global META_DIBSTRETCHBLT := 2881

/**
 * @type {Integer (UInt32)}
 */
export global META_DIBCREATEPATTERNBRUSH := 322

/**
 * @type {Integer (UInt32)}
 */
export global META_STRETCHDIB := 3907

/**
 * @type {Integer (UInt32)}
 */
export global META_EXTFLOODFILL := 1352

/**
 * @type {Integer (UInt32)}
 */
export global META_SETLAYOUT := 329

/**
 * @type {Integer (UInt32)}
 */
export global META_DELETEOBJECT := 496

/**
 * @type {Integer (UInt32)}
 */
export global META_CREATEPALETTE := 247

/**
 * @type {Integer (UInt32)}
 */
export global META_CREATEPATTERNBRUSH := 505

/**
 * @type {Integer (UInt32)}
 */
export global META_CREATEPENINDIRECT := 762

/**
 * @type {Integer (UInt32)}
 */
export global META_CREATEFONTINDIRECT := 763

/**
 * @type {Integer (UInt32)}
 */
export global META_CREATEBRUSHINDIRECT := 764

/**
 * @type {Integer (UInt32)}
 */
export global META_CREATEREGION := 1791

/**
 * @type {Integer (UInt32)}
 */
export global NEWFRAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global ABORTDOC := 2

/**
 * @type {Integer (UInt32)}
 */
export global NEXTBAND := 3

/**
 * @type {Integer (UInt32)}
 */
export global SETCOLORTABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global GETCOLORTABLE := 5

/**
 * @type {Integer (UInt32)}
 */
export global FLUSHOUTPUT := 6

/**
 * @type {Integer (UInt32)}
 */
export global DRAFTMODE := 7

/**
 * @type {Integer (UInt32)}
 */
export global QUERYESCSUPPORT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SETABORTPROC := 9

/**
 * @type {Integer (UInt32)}
 */
export global STARTDOC := 10

/**
 * @type {Integer (UInt32)}
 */
export global ENDDOC := 11

/**
 * @type {Integer (UInt32)}
 */
export global GETPHYSPAGESIZE := 12

/**
 * @type {Integer (UInt32)}
 */
export global GETPRINTINGOFFSET := 13

/**
 * @type {Integer (UInt32)}
 */
export global GETSCALINGFACTOR := 14

/**
 * @type {Integer (UInt32)}
 */
export global MFCOMMENT := 15

/**
 * @type {Integer (UInt32)}
 */
export global GETPENWIDTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global SETCOPYCOUNT := 17

/**
 * @type {Integer (UInt32)}
 */
export global SELECTPAPERSOURCE := 18

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEDATA := 19

/**
 * @type {Integer (UInt32)}
 */
export global PASSTHROUGH := 19

/**
 * @type {Integer (UInt32)}
 */
export global GETTECHNOLGY := 20

/**
 * @type {Integer (UInt32)}
 */
export global GETTECHNOLOGY := 20

/**
 * @type {Integer (UInt32)}
 */
export global SETLINECAP := 21

/**
 * @type {Integer (UInt32)}
 */
export global SETLINEJOIN := 22

/**
 * @type {Integer (UInt32)}
 */
export global SETMITERLIMIT := 23

/**
 * @type {Integer (UInt32)}
 */
export global BANDINFO := 24

/**
 * @type {Integer (UInt32)}
 */
export global DRAWPATTERNRECT := 25

/**
 * @type {Integer (UInt32)}
 */
export global GETVECTORPENSIZE := 26

/**
 * @type {Integer (UInt32)}
 */
export global GETVECTORBRUSHSIZE := 27

/**
 * @type {Integer (UInt32)}
 */
export global ENABLEDUPLEX := 28

/**
 * @type {Integer (UInt32)}
 */
export global GETSETPAPERBINS := 29

/**
 * @type {Integer (UInt32)}
 */
export global GETSETPRINTORIENT := 30

/**
 * @type {Integer (UInt32)}
 */
export global ENUMPAPERBINS := 31

/**
 * @type {Integer (UInt32)}
 */
export global SETDIBSCALING := 32

/**
 * @type {Integer (UInt32)}
 */
export global EPSPRINTING := 33

/**
 * @type {Integer (UInt32)}
 */
export global ENUMPAPERMETRICS := 34

/**
 * @type {Integer (UInt32)}
 */
export global GETSETPAPERMETRICS := 35

/**
 * @type {Integer (UInt32)}
 */
export global POSTSCRIPT_DATA := 37

/**
 * @type {Integer (UInt32)}
 */
export global POSTSCRIPT_IGNORE := 38

/**
 * @type {Integer (UInt32)}
 */
export global MOUSETRAILS := 39

/**
 * @type {Integer (UInt32)}
 */
export global GETDEVICEUNITS := 42

/**
 * @type {Integer (UInt32)}
 */
export global GETEXTENDEDTEXTMETRICS := 256

/**
 * @type {Integer (UInt32)}
 */
export global GETEXTENTTABLE := 257

/**
 * @type {Integer (UInt32)}
 */
export global GETPAIRKERNTABLE := 258

/**
 * @type {Integer (UInt32)}
 */
export global GETTRACKKERNTABLE := 259

/**
 * @type {Integer (UInt32)}
 */
export global EXTTEXTOUT := 512

/**
 * @type {Integer (UInt32)}
 */
export global GETFACENAME := 513

/**
 * @type {Integer (UInt32)}
 */
export global DOWNLOADFACE := 514

/**
 * @type {Integer (UInt32)}
 */
export global ENABLERELATIVEWIDTHS := 768

/**
 * @type {Integer (UInt32)}
 */
export global ENABLEPAIRKERNING := 769

/**
 * @type {Integer (UInt32)}
 */
export global SETKERNTRACK := 770

/**
 * @type {Integer (UInt32)}
 */
export global SETALLJUSTVALUES := 771

/**
 * @type {Integer (UInt32)}
 */
export global SETCHARSET := 772

/**
 * @type {Integer (UInt32)}
 */
export global STRETCHBLT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global METAFILE_DRIVER := 2049

/**
 * @type {Integer (UInt32)}
 */
export global GETSETSCREENPARAMS := 3072

/**
 * @type {Integer (UInt32)}
 */
export global QUERYDIBSUPPORT := 3073

/**
 * @type {Integer (UInt32)}
 */
export global BEGIN_PATH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CLIP_TO_PATH := 4097

/**
 * @type {Integer (UInt32)}
 */
export global END_PATH := 4098

/**
 * @type {Integer (UInt32)}
 */
export global EXT_DEVICE_CAPS := 4099

/**
 * @type {Integer (UInt32)}
 */
export global RESTORE_CTM := 4100

/**
 * @type {Integer (UInt32)}
 */
export global SAVE_CTM := 4101

/**
 * @type {Integer (UInt32)}
 */
export global SET_ARC_DIRECTION := 4102

/**
 * @type {Integer (UInt32)}
 */
export global SET_BACKGROUND_COLOR := 4103

/**
 * @type {Integer (UInt32)}
 */
export global SET_POLY_MODE := 4104

/**
 * @type {Integer (UInt32)}
 */
export global SET_SCREEN_ANGLE := 4105

/**
 * @type {Integer (UInt32)}
 */
export global SET_SPREAD := 4106

/**
 * @type {Integer (UInt32)}
 */
export global TRANSFORM_CTM := 4107

/**
 * @type {Integer (UInt32)}
 */
export global SET_CLIP_BOX := 4108

/**
 * @type {Integer (UInt32)}
 */
export global SET_BOUNDS := 4109

/**
 * @type {Integer (UInt32)}
 */
export global SET_MIRROR_MODE := 4110

/**
 * @type {Integer (UInt32)}
 */
export global OPENCHANNEL := 4110

/**
 * @type {Integer (UInt32)}
 */
export global DOWNLOADHEADER := 4111

/**
 * @type {Integer (UInt32)}
 */
export global CLOSECHANNEL := 4112

/**
 * @type {Integer (UInt32)}
 */
export global POSTSCRIPT_PASSTHROUGH := 4115

/**
 * @type {Integer (UInt32)}
 */
export global ENCAPSULATED_POSTSCRIPT := 4116

/**
 * @type {Integer (UInt32)}
 */
export global POSTSCRIPT_IDENTIFY := 4117

/**
 * @type {Integer (UInt32)}
 */
export global POSTSCRIPT_INJECTION := 4118

/**
 * @type {Integer (UInt32)}
 */
export global CHECKJPEGFORMAT := 4119

/**
 * @type {Integer (UInt32)}
 */
export global CHECKPNGFORMAT := 4120

/**
 * @type {Integer (UInt32)}
 */
export global GET_PS_FEATURESETTING := 4121

/**
 * @type {Integer (UInt32)}
 */
export global GDIPLUS_TS_QUERYVER := 4122

/**
 * @type {Integer (UInt32)}
 */
export global GDIPLUS_TS_RECORD := 4123

/**
 * @type {Integer (UInt32)}
 */
export global MILCORE_TS_QUERYVER_RESULT_FALSE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MILCORE_TS_QUERYVER_RESULT_TRUE := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global SPCLPASSTHROUGH2 := 4568

/**
 * @type {Integer (UInt32)}
 */
export global PSIDENT_GDICENTRIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSIDENT_PSCENTRIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSINJECT_DLFONT := 3722304989

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_NUP := 0

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_OUTPUT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_PSLEVEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_CUSTPAPER := 3

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_MIRROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_NEGATIVE := 5

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_PROTOCOL := 6

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_PRIVATE_BEGIN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FEATURESETTING_PRIVATE_END := 8191

/**
 * @type {Integer (UInt32)}
 */
export global PSPROTOCOL_ASCII := 0

/**
 * @type {Integer (UInt32)}
 */
export global PSPROTOCOL_BCP := 1

/**
 * @type {Integer (UInt32)}
 */
export global PSPROTOCOL_TBCP := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSPROTOCOL_BINARY := 3

/**
 * @type {Integer (UInt32)}
 */
export global QDI_SETDIBITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global QDI_GETDIBITS := 2

/**
 * @type {Integer (UInt32)}
 */
export global QDI_DIBTOSCREEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global QDI_STRETCHDIB := 8

/**
 * @type {Integer (UInt32)}
 */
export global SP_NOTREPORTED := 16384

/**
 * @type {Integer (Int32)}
 */
export global SP_ERROR := -1

/**
 * @type {Integer (Int32)}
 */
export global SP_APPABORT := -2

/**
 * @type {Integer (Int32)}
 */
export global SP_USERABORT := -3

/**
 * @type {Integer (Int32)}
 */
export global SP_OUTOFDISK := -4

/**
 * @type {Integer (Int32)}
 */
export global SP_OUTOFMEMORY := -5

/**
 * @type {Integer (UInt32)}
 */
export global PR_JOBSTATUS := 0

/**
 * @type {Integer (Int32)}
 */
export global LCS_GM_BUSINESS := 1

/**
 * @type {Integer (Int32)}
 */
export global LCS_GM_GRAPHICS := 2

/**
 * @type {Integer (Int32)}
 */
export global LCS_GM_IMAGES := 4

/**
 * @type {Integer (Int32)}
 */
export global LCS_GM_ABS_COLORIMETRIC := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_OUT_OF_GAMUT := 255

/**
 * @type {Integer (UInt32)}
 */
export global CM_IN_GAMUT := 0

/**
 * @type {Integer (Int32)}
 */
export global NTM_REGULAR := 64

/**
 * @type {Integer (Int32)}
 */
export global NTM_BOLD := 32

/**
 * @type {Integer (Int32)}
 */
export global NTM_ITALIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTM_NONNEGATIVE_AC := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NTM_PS_OPENTYPE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global NTM_TT_OPENTYPE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global NTM_MULTIPLEMASTER := 524288

/**
 * @type {Integer (UInt32)}
 */
export global NTM_TYPE1 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global NTM_DSIG := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LF_FACESIZE := 32

/**
 * @type {Integer (UInt32)}
 */
export global LF_FULLFACESIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CLEARTYPE_NATURAL_QUALITY := 6

/**
 * @type {Integer (UInt32)}
 */
export global MONO_FONT := 8

/**
 * @type {Integer (Int32)}
 */
export global FS_LATIN1 := 1

/**
 * @type {Integer (Int32)}
 */
export global FS_LATIN2 := 2

/**
 * @type {Integer (Int32)}
 */
export global FS_CYRILLIC := 4

/**
 * @type {Integer (Int32)}
 */
export global FS_GREEK := 8

/**
 * @type {Integer (Int32)}
 */
export global FS_TURKISH := 16

/**
 * @type {Integer (Int32)}
 */
export global FS_HEBREW := 32

/**
 * @type {Integer (Int32)}
 */
export global FS_ARABIC := 64

/**
 * @type {Integer (Int32)}
 */
export global FS_BALTIC := 128

/**
 * @type {Integer (Int32)}
 */
export global FS_VIETNAMESE := 256

/**
 * @type {Integer (Int32)}
 */
export global FS_THAI := 65536

/**
 * @type {Integer (Int32)}
 */
export global FS_JISJAPAN := 131072

/**
 * @type {Integer (Int32)}
 */
export global FS_CHINESESIMP := 262144

/**
 * @type {Integer (Int32)}
 */
export global FS_WANSUNG := 524288

/**
 * @type {Integer (Int32)}
 */
export global FS_CHINESETRAD := 1048576

/**
 * @type {Integer (Int32)}
 */
export global FS_JOHAB := 2097152

/**
 * @type {Integer (Int32)}
 */
export global FS_SYMBOL := -2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PANOSE_COUNT := 10

/**
 * @type {Integer (UInt32)}
 */
export global PAN_FAMILYTYPE_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global PAN_SERIFSTYLE_INDEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global PAN_PROPORTION_INDEX := 3

/**
 * @type {Integer (UInt32)}
 */
export global PAN_STROKEVARIATION_INDEX := 5

/**
 * @type {Integer (UInt32)}
 */
export global PAN_ARMSTYLE_INDEX := 6

/**
 * @type {Integer (UInt32)}
 */
export global PAN_LETTERFORM_INDEX := 7

/**
 * @type {Integer (UInt32)}
 */
export global PAN_CULTURE_LATIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PAN_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global PAN_NO_FIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ELF_VENDOR_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ELF_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global ELF_CULTURE_LATIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global RASTER_FONTTYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_FONTTYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRUETYPE_FONTTYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PC_RESERVED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PC_EXPLICIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PC_NOCOLLAPSE := 4

/**
 * @type {Integer (UInt32)}
 */
export global BKMODE_LAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global GM_LAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global PT_CLOSEFIGURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PT_LINETO := 2

/**
 * @type {Integer (UInt32)}
 */
export global PT_BEZIERTO := 4

/**
 * @type {Integer (UInt32)}
 */
export global PT_MOVETO := 6

/**
 * @type {Integer (UInt32)}
 */
export global ABSOLUTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RELATIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STOCK_LAST := 19

/**
 * @type {Integer (UInt32)}
 */
export global CLR_INVALID := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global HS_API_MAX := 12

/**
 * @type {Integer (UInt32)}
 */
export global DT_PLOTTER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DT_RASDISPLAY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DT_RASPRINTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DT_RASCAMERA := 3

/**
 * @type {Integer (UInt32)}
 */
export global DT_CHARSTREAM := 4

/**
 * @type {Integer (UInt32)}
 */
export global DT_METAFILE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DT_DISPFILE := 6

/**
 * @type {Integer (UInt32)}
 */
export global CC_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CC_CIRCLES := 1

/**
 * @type {Integer (UInt32)}
 */
export global CC_PIE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CC_CHORD := 4

/**
 * @type {Integer (UInt32)}
 */
export global CC_ELLIPSES := 8

/**
 * @type {Integer (UInt32)}
 */
export global CC_WIDE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CC_STYLED := 32

/**
 * @type {Integer (UInt32)}
 */
export global CC_WIDESTYLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global CC_INTERIORS := 128

/**
 * @type {Integer (UInt32)}
 */
export global CC_ROUNDRECT := 256

/**
 * @type {Integer (UInt32)}
 */
export global LC_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LC_POLYLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LC_MARKER := 4

/**
 * @type {Integer (UInt32)}
 */
export global LC_POLYMARKER := 8

/**
 * @type {Integer (UInt32)}
 */
export global LC_WIDE := 16

/**
 * @type {Integer (UInt32)}
 */
export global LC_STYLED := 32

/**
 * @type {Integer (UInt32)}
 */
export global LC_WIDESTYLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global LC_INTERIORS := 128

/**
 * @type {Integer (UInt32)}
 */
export global PC_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PC_POLYGON := 1

/**
 * @type {Integer (UInt32)}
 */
export global PC_RECTANGLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PC_WINDPOLYGON := 4

/**
 * @type {Integer (UInt32)}
 */
export global PC_TRAPEZOID := 4

/**
 * @type {Integer (UInt32)}
 */
export global PC_SCANLINE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PC_WIDE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PC_STYLED := 32

/**
 * @type {Integer (UInt32)}
 */
export global PC_WIDESTYLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global PC_INTERIORS := 128

/**
 * @type {Integer (UInt32)}
 */
export global PC_POLYPOLYGON := 256

/**
 * @type {Integer (UInt32)}
 */
export global PC_PATHS := 512

/**
 * @type {Integer (UInt32)}
 */
export global CP_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CP_RECTANGLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CP_REGION := 2

/**
 * @type {Integer (UInt32)}
 */
export global TC_OP_CHARACTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global TC_OP_STROKE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TC_CP_STROKE := 4

/**
 * @type {Integer (UInt32)}
 */
export global TC_CR_90 := 8

/**
 * @type {Integer (UInt32)}
 */
export global TC_CR_ANY := 16

/**
 * @type {Integer (UInt32)}
 */
export global TC_SF_X_YINDEP := 32

/**
 * @type {Integer (UInt32)}
 */
export global TC_SA_DOUBLE := 64

/**
 * @type {Integer (UInt32)}
 */
export global TC_SA_INTEGER := 128

/**
 * @type {Integer (UInt32)}
 */
export global TC_SA_CONTIN := 256

/**
 * @type {Integer (UInt32)}
 */
export global TC_EA_DOUBLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global TC_IA_ABLE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TC_UA_ABLE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TC_SO_ABLE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TC_RA_ABLE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global TC_VA_ABLE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TC_RESERVED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TC_SCROLLBLT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RC_BITBLT := 1

/**
 * @type {Integer (UInt32)}
 */
export global RC_BANDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global RC_SCALING := 4

/**
 * @type {Integer (UInt32)}
 */
export global RC_BITMAP64 := 8

/**
 * @type {Integer (UInt32)}
 */
export global RC_GDI20_OUTPUT := 16

/**
 * @type {Integer (UInt32)}
 */
export global RC_GDI20_STATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global RC_SAVEBITMAP := 64

/**
 * @type {Integer (UInt32)}
 */
export global RC_DI_BITMAP := 128

/**
 * @type {Integer (UInt32)}
 */
export global RC_PALETTE := 256

/**
 * @type {Integer (UInt32)}
 */
export global RC_DIBTODEV := 512

/**
 * @type {Integer (UInt32)}
 */
export global RC_BIGFONT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RC_STRETCHBLT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RC_FLOODFILL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RC_STRETCHDIB := 8192

/**
 * @type {Integer (UInt32)}
 */
export global RC_OP_DX_OUTPUT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global RC_DEVBITS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SB_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SB_CONST_ALPHA := 1

/**
 * @type {Integer (UInt32)}
 */
export global SB_PIXEL_ALPHA := 2

/**
 * @type {Integer (UInt32)}
 */
export global SB_PREMULT_ALPHA := 4

/**
 * @type {Integer (UInt32)}
 */
export global SB_GRAD_RECT := 16

/**
 * @type {Integer (UInt32)}
 */
export global SB_GRAD_TRI := 32

/**
 * @type {Integer (UInt32)}
 */
export global CM_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_DEVICE_ICM := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_GAMMA_RAMP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_CMYK_COLOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYSPAL_ERROR := 0

/**
 * @type {Integer (Int32)}
 */
export global CBM_INIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CCHFORMNAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global DMORIENT_PORTRAIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMORIENT_LANDSCAPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LETTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LETTERSMALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_TABLOID := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LEDGER := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LEGAL := 5

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_STATEMENT := 6

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_EXECUTIVE := 7

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A3 := 8

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A4 := 9

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A4SMALL := 10

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A5 := 11

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B4 := 12

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B5 := 13

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_FOLIO := 14

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_QUARTO := 15

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_10X14 := 16

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_11X17 := 17

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_NOTE := 18

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_9 := 19

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_10 := 20

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_11 := 21

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_12 := 22

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_14 := 23

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_CSHEET := 24

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_DSHEET := 25

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ESHEET := 26

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_DL := 27

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_C5 := 28

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_C3 := 29

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_C4 := 30

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_C6 := 31

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_C65 := 32

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_B4 := 33

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_B5 := 34

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_B6 := 35

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_ITALY := 36

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_MONARCH := 37

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_PERSONAL := 38

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_FANFOLD_US := 39

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_FANFOLD_STD_GERMAN := 40

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_FANFOLD_LGL_GERMAN := 41

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ISO_B4 := 42

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JAPANESE_POSTCARD := 43

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_9X11 := 44

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_10X11 := 45

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_15X11 := 46

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_ENV_INVITE := 47

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_RESERVED_48 := 48

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_RESERVED_49 := 49

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LETTER_EXTRA := 50

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LEGAL_EXTRA := 51

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_TABLOID_EXTRA := 52

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A4_EXTRA := 53

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LETTER_TRANSVERSE := 54

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A4_TRANSVERSE := 55

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LETTER_EXTRA_TRANSVERSE := 56

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A_PLUS := 57

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B_PLUS := 58

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LETTER_PLUS := 59

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A4_PLUS := 60

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A5_TRANSVERSE := 61

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B5_TRANSVERSE := 62

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A3_EXTRA := 63

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A5_EXTRA := 64

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B5_EXTRA := 65

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A2 := 66

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A3_TRANSVERSE := 67

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A3_EXTRA_TRANSVERSE := 68

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_DBL_JAPANESE_POSTCARD := 69

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A6 := 70

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_KAKU2 := 71

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_KAKU3 := 72

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_CHOU3 := 73

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_CHOU4 := 74

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LETTER_ROTATED := 75

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A3_ROTATED := 76

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A4_ROTATED := 77

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A5_ROTATED := 78

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B4_JIS_ROTATED := 79

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B5_JIS_ROTATED := 80

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JAPANESE_POSTCARD_ROTATED := 81

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED := 82

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_A6_ROTATED := 83

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_KAKU2_ROTATED := 84

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_KAKU3_ROTATED := 85

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_CHOU3_ROTATED := 86

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_CHOU4_ROTATED := 87

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B6_JIS := 88

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_B6_JIS_ROTATED := 89

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_12X11 := 90

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_YOU4 := 91

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_JENV_YOU4_ROTATED := 92

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_P16K := 93

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_P32K := 94

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_P32KBIG := 95

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_1 := 96

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_2 := 97

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_3 := 98

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_4 := 99

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_5 := 100

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_6 := 101

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_7 := 102

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_8 := 103

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_9 := 104

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_10 := 105

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_P16K_ROTATED := 106

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_P32K_ROTATED := 107

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_P32KBIG_ROTATED := 108

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_1_ROTATED := 109

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_2_ROTATED := 110

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_3_ROTATED := 111

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_4_ROTATED := 112

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_5_ROTATED := 113

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_6_ROTATED := 114

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_7_ROTATED := 115

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_8_ROTATED := 116

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_9_ROTATED := 117

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_PENV_10_ROTATED := 118

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_LAST := 118

/**
 * @type {Integer (UInt32)}
 */
export global DMPAPER_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_UPPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_ONLYONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_LOWER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_MIDDLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_MANUAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_ENVELOPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_ENVMANUAL := 6

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_AUTO := 7

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_TRACTOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_SMALLFMT := 9

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_LARGEFMT := 10

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_LARGECAPACITY := 11

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_CASSETTE := 14

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_FORMSOURCE := 15

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_LAST := 15

/**
 * @type {Integer (UInt32)}
 */
export global DMBIN_USER := 256

/**
 * @type {Integer (Int32)}
 */
export global DMRES_DRAFT := -1

/**
 * @type {Integer (Int32)}
 */
export global DMRES_LOW := -2

/**
 * @type {Integer (Int32)}
 */
export global DMRES_MEDIUM := -3

/**
 * @type {Integer (Int32)}
 */
export global DMRES_HIGH := -4

/**
 * @type {Integer (UInt32)}
 */
export global DMDISPLAYFLAGS_TEXTMODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMNUP_SYSTEM := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMNUP_ONEUP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMICMMETHOD_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMICMMETHOD_SYSTEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMICMMETHOD_DRIVER := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMICMMETHOD_DEVICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMICMMETHOD_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global DMICM_SATURATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMICM_CONTRAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMICM_COLORIMETRIC := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMICM_ABS_COLORIMETRIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMICM_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global DMMEDIA_STANDARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMMEDIA_TRANSPARENCY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMMEDIA_GLOSSY := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMMEDIA_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_COARSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_FINE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_LINEART := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_ERRORDIFFUSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_RESERVED6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_RESERVED7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_RESERVED8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_RESERVED9 := 9

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_GRAYSCALE := 10

/**
 * @type {Integer (UInt32)}
 */
export global DMDITHER_USER := 256

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_MAXPATH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_MODE_IDX_INVALID := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_TARGET_MODE_IDX_INVALID := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_DESKTOP_IMAGE_IDX_INVALID := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_SOURCE_MODE_IDX_INVALID := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_CLONE_GROUP_INVALID := 65535

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_SOURCE_IN_USE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_TARGET_IN_USE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_TARGET_FORCIBLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_BOOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_PATH := 8

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_SYSTEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_TARGET_IS_HMD := 32

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_PREFERRED_UNSCALED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_SUPPORT_VIRTUAL_MODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_BOOST_REFRESH_RATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYCONFIG_PATH_VALID_FLAGS := 29

/**
 * @type {Integer (UInt32)}
 */
export global RDH_RECTANGLES := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYSRGN := 4

/**
 * @type {Integer (UInt32)}
 */
export global TT_POLYGON_TYPE := 24

/**
 * @type {Integer (UInt32)}
 */
export global TT_PRIM_LINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TT_PRIM_QSPLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TT_PRIM_CSPLINE := 3

/**
 * @type {Integer (UInt32)}
 */
export global GCP_DBCS := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCP_ERROR := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FLI_MASK := 4155

/**
 * @type {Integer (Int32)}
 */
export global FLI_GLYPHS := 262144

/**
 * @type {Integer (Int32)}
 */
export global GCP_JUSTIFYIN := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_LATIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_HEBREW := 2

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_ARABIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_NEUTRAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_LOCALNUMBER := 4

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_LATINNUMBER := 5

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_LATINNUMERICTERMINATOR := 6

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_LATINNUMERICSEPARATOR := 7

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_NUMERICSEPARATOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_PREBOUNDLTR := 128

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_PREBOUNDRTL := 64

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_POSTBOUNDLTR := 32

/**
 * @type {Integer (UInt32)}
 */
export global GCPCLASS_POSTBOUNDRTL := 16

/**
 * @type {Integer (UInt32)}
 */
export global GCPGLYPH_LINKBEFORE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global GCPGLYPH_LINKAFTER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TT_AVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TT_ENABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DC_BINADJUST := 19

/**
 * @type {Integer (UInt32)}
 */
export global DC_EMF_COMPLIANT := 20

/**
 * @type {Integer (UInt32)}
 */
export global DC_DATATYPE_PRODUCED := 21

/**
 * @type {Integer (UInt32)}
 */
export global DC_MANUFACTURER := 23

/**
 * @type {Integer (UInt32)}
 */
export global DC_MODEL := 24

/**
 * @type {Integer (UInt32)}
 */
export global PRINTRATEUNIT_PPM := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTRATEUNIT_CPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTRATEUNIT_LPM := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRINTRATEUNIT_IPM := 4

/**
 * @type {Integer (Int32)}
 */
export global DCTT_BITMAP := 1

/**
 * @type {Integer (Int32)}
 */
export global DCTT_DOWNLOAD := 2

/**
 * @type {Integer (Int32)}
 */
export global DCTT_SUBDEV := 4

/**
 * @type {Integer (Int32)}
 */
export global DCTT_DOWNLOAD_OUTLINE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEUPNONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEUPCENTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEUPLEFT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEUPRIGHT := 3

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEDOWNNONE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEDOWNCENTER := 257

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEDOWNLEFT := 258

/**
 * @type {Integer (UInt32)}
 */
export global DCBA_FACEDOWNRIGHT := 259

/**
 * @type {Integer (UInt32)}
 */
export global GS_8BIT_INDICES := 1

/**
 * @type {Integer (UInt32)}
 */
export global GGI_MARK_NONEXISTING_GLYPHS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_MAX_NUMAXES := 16

/**
 * @type {Integer (UInt32)}
 */
export global MM_MAX_AXES_NAMELEN := 16

/**
 * @type {Integer (UInt32)}
 */
export global GDIREGISTERDDRAWPACKETVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global AC_SRC_OVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global AC_SRC_ALPHA := 1

/**
 * @type {Integer (UInt32)}
 */
export global GRADIENT_FILL_OP_FLAG := 255

/**
 * @type {Integer (UInt32)}
 */
export global CA_NEGATIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CA_LOG_FILTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_DEVICE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_A := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_B := 2

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_C := 3

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_D50 := 4

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_D55 := 5

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_D65 := 6

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_D75 := 7

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_F2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_MAX_INDEX := 8

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_TUNGSTEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_DAYLIGHT := 3

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_FLUORESCENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global ILLUMINANT_NTSC := 3

/**
 * @type {Integer (UInt32)}
 */
export global DI_APPBANDING := 1

/**
 * @type {Integer (UInt32)}
 */
export global DI_ROPS_READ_DESTINATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global FONTMAPPER_MAX := 10

/**
 * @type {Integer (UInt32)}
 */
export global ENHMETA_SIGNATURE := 1179469088

/**
 * @type {Integer (UInt32)}
 */
export global ENHMETA_STOCK_OBJECT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SETICMPROFILE_EMBEDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREATECOLORSPACE_EMBEDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global COLORMATCHTOTARGET_EMBEDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global GDICOMMENT_IDENTIFIER := 1128875079

/**
 * @type {Integer (UInt32)}
 */
export global GDICOMMENT_WINDOWS_METAFILE := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global GDICOMMENT_BEGINGROUP := 2

/**
 * @type {Integer (UInt32)}
 */
export global GDICOMMENT_ENDGROUP := 3

/**
 * @type {Integer (UInt32)}
 */
export global GDICOMMENT_MULTIFORMATS := 1073741828

/**
 * @type {Integer (UInt32)}
 */
export global EPS_SIGNATURE := 1179865157

/**
 * @type {Integer (UInt32)}
 */
export global GDICOMMENT_UNICODE_STRING := 64

/**
 * @type {Integer (UInt32)}
 */
export global GDICOMMENT_UNICODE_END := 128

/**
 * @type {Integer (UInt32)}
 */
export global WGL_FONT_LINES := 0

/**
 * @type {Integer (UInt32)}
 */
export global WGL_FONT_POLYGONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LPD_DOUBLEBUFFER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LPD_STEREO := 2

/**
 * @type {Integer (UInt32)}
 */
export global LPD_SUPPORT_GDI := 16

/**
 * @type {Integer (UInt32)}
 */
export global LPD_SUPPORT_OPENGL := 32

/**
 * @type {Integer (UInt32)}
 */
export global LPD_SHARE_DEPTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global LPD_SHARE_STENCIL := 128

/**
 * @type {Integer (UInt32)}
 */
export global LPD_SHARE_ACCUM := 256

/**
 * @type {Integer (UInt32)}
 */
export global LPD_SWAP_EXCHANGE := 512

/**
 * @type {Integer (UInt32)}
 */
export global LPD_SWAP_COPY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LPD_TRANSPARENT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LPD_TYPE_RGBA := 0

/**
 * @type {Integer (UInt32)}
 */
export global LPD_TYPE_COLORINDEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_MAIN_PLANE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY3 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY4 := 16

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY5 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY6 := 64

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY7 := 128

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY8 := 256

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY9 := 512

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY10 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY11 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY12 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY13 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY14 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_OVERLAY15 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY1 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY2 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY3 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY4 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY5 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY6 := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY7 := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY8 := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY9 := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY10 := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY11 := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY12 := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY13 := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY14 := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAP_UNDERLAY15 := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global WGL_SWAPMULTIPLE_MAX := 16

/**
 * @type {Integer (UInt32)}
 */
export global NEWTRANSPARENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global QUERYROPSUPPORT := 40

/**
 * @type {Integer (UInt32)}
 */
export global SELECTDIB := 41

/**
 * @type {Integer (UInt32)}
 */
export global SC_SCREENSAVE := 61760

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_SUBSET := 0

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_SUBSET1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_DELTA := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_APPLE_PLATFORMID := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_MS_PLATFORMID := 3

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_DONT_CARE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_LANG_KEEP_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_FLAGS_SUBSET := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_FLAGS_COMPRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_FLAGS_TTC := 4

/**
 * @type {Integer (UInt32)}
 */
export global TTFCFP_FLAGS_GLYPHLIST := 8

/**
 * @type {Integer (UInt32)}
 */
export global TTFMFP_SUBSET := 0

/**
 * @type {Integer (UInt32)}
 */
export global TTFMFP_SUBSET1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTFMFP_DELTA := 2

/**
 * @type {Integer (UInt32)}
 */
export global ERR_GENERIC := 1000

/**
 * @type {Integer (UInt32)}
 */
export global ERR_READOUTOFBOUNDS := 1001

/**
 * @type {Integer (UInt32)}
 */
export global ERR_WRITEOUTOFBOUNDS := 1002

/**
 * @type {Integer (UInt32)}
 */
export global ERR_READCONTROL := 1003

/**
 * @type {Integer (UInt32)}
 */
export global ERR_WRITECONTROL := 1004

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MEM := 1005

/**
 * @type {Integer (UInt32)}
 */
export global ERR_FORMAT := 1006

/**
 * @type {Integer (UInt32)}
 */
export global ERR_WOULD_GROW := 1007

/**
 * @type {Integer (UInt32)}
 */
export global ERR_VERSION := 1008

/**
 * @type {Integer (UInt32)}
 */
export global ERR_NO_GLYPHS := 1009

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_MERGE_FORMATS := 1010

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_MERGE_CHECKSUMS := 1011

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_MERGE_NUMGLYPHS := 1012

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_DELTA_FORMAT := 1013

/**
 * @type {Integer (UInt32)}
 */
export global ERR_NOT_TTC := 1014

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_TTC_INDEX := 1015

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_CMAP := 1030

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_GLYF := 1031

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_HEAD := 1032

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_HHEA := 1033

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_HMTX := 1034

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_LOCA := 1035

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_MAXP := 1036

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_NAME := 1037

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_POST := 1038

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_OS2 := 1039

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_VHEA := 1040

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_VMTX := 1041

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_HHEA_OR_VHEA := 1042

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_HMTX_OR_VMTX := 1043

/**
 * @type {Integer (UInt32)}
 */
export global ERR_MISSING_EBDT := 1044

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_CMAP := 1060

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_GLYF := 1061

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_HEAD := 1062

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_HHEA := 1063

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_HMTX := 1064

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_LOCA := 1065

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_MAXP := 1066

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_NAME := 1067

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_POST := 1068

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_OS2 := 1069

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_VHEA := 1070

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_VMTX := 1071

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_HHEA_OR_VHEA := 1072

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_HMTX_OR_VMTX := 1073

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_TTO := 1080

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_GSUB := 1081

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_GPOS := 1082

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_GDEF := 1083

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_JSTF := 1084

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_BASE := 1085

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_EBLC := 1086

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_LTSH := 1087

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_VDMX := 1088

/**
 * @type {Integer (UInt32)}
 */
export global ERR_INVALID_HDMX := 1089

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER0 := 1100

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER1 := 1101

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER2 := 1102

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER3 := 1103

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER4 := 1104

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER5 := 1105

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER6 := 1106

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER7 := 1107

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER8 := 1108

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER9 := 1109

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER10 := 1110

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER11 := 1111

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER12 := 1112

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER13 := 1113

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER14 := 1114

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER15 := 1115

/**
 * @type {Integer (UInt32)}
 */
export global ERR_PARAMETER16 := 1116

/**
 * @type {Integer (UInt32)}
 */
export global CHARSET_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CHARSET_GLYPHIDX := 3

/**
 * @type {Integer (UInt32)}
 */
export global TTEMBED_FAILIFVARIATIONSIMULATED := 16

/**
 * @type {Integer (UInt32)}
 */
export global TTEMBED_WEBOBJECT := 128

/**
 * @type {Integer (UInt32)}
 */
export global TTEMBED_XORENCRYPTDATA := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global TTEMBED_VARIATIONSIMULATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTEMBED_EUDCEMBEDDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTEMBED_SUBSETCANCEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global TTLOAD_PRIVATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTLOAD_EUDC_OVERWRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTLOAD_EUDC_SET := 4

/**
 * @type {Integer (UInt32)}
 */
export global TTDELETE_DONTREMOVEFONT := 1

/**
 * @type {Integer (Int32)}
 */
export global E_NONE := 0

/**
 * @type {Integer (Int32)}
 */
export global E_API_NOTIMPL := 1

/**
 * @type {Integer (Int32)}
 */
export global E_CHARCODECOUNTINVALID := 2

/**
 * @type {Integer (Int32)}
 */
export global E_CHARCODESETINVALID := 3

/**
 * @type {Integer (Int32)}
 */
export global E_DEVICETRUETYPEFONT := 4

/**
 * @type {Integer (Int32)}
 */
export global E_HDCINVALID := 6

/**
 * @type {Integer (Int32)}
 */
export global E_NOFREEMEMORY := 7

/**
 * @type {Integer (Int32)}
 */
export global E_FONTREFERENCEINVALID := 8

/**
 * @type {Integer (Int32)}
 */
export global E_NOTATRUETYPEFONT := 10

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORACCESSINGFONTDATA := 12

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORACCESSINGFACENAME := 13

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORUNICODECONVERSION := 17

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORCONVERTINGCHARS := 18

/**
 * @type {Integer (Int32)}
 */
export global E_EXCEPTION := 19

/**
 * @type {Integer (Int32)}
 */
export global E_RESERVEDPARAMNOTNULL := 20

/**
 * @type {Integer (Int32)}
 */
export global E_CHARSETINVALID := 21

/**
 * @type {Integer (Int32)}
 */
export global E_FILE_NOT_FOUND := 23

/**
 * @type {Integer (Int32)}
 */
export global E_TTC_INDEX_OUT_OF_RANGE := 24

/**
 * @type {Integer (Int32)}
 */
export global E_INPUTPARAMINVALID := 25

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORCOMPRESSINGFONTDATA := 256

/**
 * @type {Integer (Int32)}
 */
export global E_FONTDATAINVALID := 258

/**
 * @type {Integer (Int32)}
 */
export global E_NAMECHANGEFAILED := 259

/**
 * @type {Integer (Int32)}
 */
export global E_FONTNOTEMBEDDABLE := 260

/**
 * @type {Integer (Int32)}
 */
export global E_PRIVSINVALID := 261

/**
 * @type {Integer (Int32)}
 */
export global E_SUBSETTINGFAILED := 262

/**
 * @type {Integer (Int32)}
 */
export global E_READFROMSTREAMFAILED := 263

/**
 * @type {Integer (Int32)}
 */
export global E_SAVETOSTREAMFAILED := 264

/**
 * @type {Integer (Int32)}
 */
export global E_NOOS2 := 265

/**
 * @type {Integer (Int32)}
 */
export global E_T2NOFREEMEMORY := 266

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORREADINGFONTDATA := 267

/**
 * @type {Integer (Int32)}
 */
export global E_FLAGSINVALID := 268

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORCREATINGFONTFILE := 269

/**
 * @type {Integer (Int32)}
 */
export global E_FONTALREADYEXISTS := 270

/**
 * @type {Integer (Int32)}
 */
export global E_FONTNAMEALREADYEXISTS := 271

/**
 * @type {Integer (Int32)}
 */
export global E_FONTINSTALLFAILED := 272

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORDECOMPRESSINGFONTDATA := 273

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORACCESSINGEXCLUDELIST := 274

/**
 * @type {Integer (Int32)}
 */
export global E_FACENAMEINVALID := 275

/**
 * @type {Integer (Int32)}
 */
export global E_STREAMINVALID := 276

/**
 * @type {Integer (Int32)}
 */
export global E_STATUSINVALID := 277

/**
 * @type {Integer (Int32)}
 */
export global E_PRIVSTATUSINVALID := 278

/**
 * @type {Integer (Int32)}
 */
export global E_PERMISSIONSINVALID := 279

/**
 * @type {Integer (Int32)}
 */
export global E_PBENABLEDINVALID := 280

/**
 * @type {Integer (Int32)}
 */
export global E_SUBSETTINGEXCEPTION := 281

/**
 * @type {Integer (Int32)}
 */
export global E_SUBSTRING_TEST_FAIL := 282

/**
 * @type {Integer (Int32)}
 */
export global E_FONTVARIATIONSIMULATED := 283

/**
 * @type {Integer (Int32)}
 */
export global E_FONTFAMILYNAMENOTINFULL := 285

/**
 * @type {Integer (Int32)}
 */
export global E_ADDFONTFAILED := 512

/**
 * @type {Integer (Int32)}
 */
export global E_COULDNTCREATETEMPFILE := 513

/**
 * @type {Integer (Int32)}
 */
export global E_FONTFILECREATEFAILED := 515

/**
 * @type {Integer (Int32)}
 */
export global E_WINDOWSAPI := 516

/**
 * @type {Integer (Int32)}
 */
export global E_FONTFILENOTFOUND := 517

/**
 * @type {Integer (Int32)}
 */
export global E_RESOURCEFILECREATEFAILED := 518

/**
 * @type {Integer (Int32)}
 */
export global E_ERROREXPANDINGFONTDATA := 519

/**
 * @type {Integer (Int32)}
 */
export global E_ERRORGETTINGDC := 520

/**
 * @type {Integer (Int32)}
 */
export global E_EXCEPTIONINDECOMPRESSION := 521

/**
 * @type {Integer (Int32)}
 */
export global E_EXCEPTIONINCOMPRESSION := 522
;@endregion Constants
