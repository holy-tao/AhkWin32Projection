#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global OFN_SHAREFALLTHROUGH := 2

/**
 * @type {Integer (UInt32)}
 */
export global OFN_SHARENOWARN := 1

/**
 * @type {Integer (UInt32)}
 */
export global OFN_SHAREWARN := 0

/**
 * @type {Integer (UInt32)}
 */
export global CDN_INITDONE := 4294966695

/**
 * @type {Integer (UInt32)}
 */
export global CDN_SELCHANGE := 4294966694

/**
 * @type {Integer (UInt32)}
 */
export global CDN_FOLDERCHANGE := 4294966693

/**
 * @type {Integer (UInt32)}
 */
export global CDN_SHAREVIOLATION := 4294966692

/**
 * @type {Integer (UInt32)}
 */
export global CDN_HELP := 4294966691

/**
 * @type {Integer (UInt32)}
 */
export global CDN_FILEOK := 4294966690

/**
 * @type {Integer (UInt32)}
 */
export global CDN_TYPECHANGE := 4294966689

/**
 * @type {Integer (UInt32)}
 */
export global CDN_INCLUDEITEM := 4294966688

/**
 * @type {Integer (UInt32)}
 */
export global CDM_FIRST := 1124

/**
 * @type {Integer (UInt32)}
 */
export global CDM_LAST := 1224

/**
 * @type {Integer (UInt32)}
 */
export global CDM_GETSPEC := 1124

/**
 * @type {Integer (UInt32)}
 */
export global CDM_GETFILEPATH := 1125

/**
 * @type {Integer (UInt32)}
 */
export global CDM_GETFOLDERPATH := 1126

/**
 * @type {Integer (UInt32)}
 */
export global CDM_GETFOLDERIDLIST := 1127

/**
 * @type {Integer (UInt32)}
 */
export global CDM_SETCONTROLTEXT := 1128

/**
 * @type {Integer (UInt32)}
 */
export global CDM_HIDECONTROL := 1129

/**
 * @type {Integer (UInt32)}
 */
export global CDM_SETDEFEXT := 1130

/**
 * @type {Integer (UInt32)}
 */
export global FRM_FIRST := 1124

/**
 * @type {Integer (UInt32)}
 */
export global FRM_LAST := 1224

/**
 * @type {Integer (UInt32)}
 */
export global FRM_SETOPERATIONRESULT := 1124

/**
 * @type {Integer (UInt32)}
 */
export global FRM_SETOPERATIONRESULTTEXT := 1125

/**
 * @type {Integer (UInt32)}
 */
export global PS_OPENTYPE_FONTTYPE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TT_OPENTYPE_FONTTYPE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TYPE1_FONTTYPE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SYMBOL_FONTTYPE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHOOSEFONT_GETLOGFONT := 1025

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHOOSEFONT_SETLOGFONT := 1125

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHOOSEFONT_SETFLAGS := 1126

/**
 * @type {String}
 */
export global LBSELCHSTRINGA := "commdlg_LBSelChangedNotify"

/**
 * @type {String}
 */
export global SHAREVISTRINGA := "commdlg_ShareViolation"

/**
 * @type {String}
 */
export global FILEOKSTRINGA := "commdlg_FileNameOK"

/**
 * @type {String}
 */
export global COLOROKSTRINGA := "commdlg_ColorOK"

/**
 * @type {String}
 */
export global SETRGBSTRINGA := "commdlg_SetRGBColor"

/**
 * @type {String}
 */
export global HELPMSGSTRINGA := "commdlg_help"

/**
 * @type {String}
 */
export global FINDMSGSTRINGA := "commdlg_FindReplace"

/**
 * @type {String}
 */
export global LBSELCHSTRINGW := "commdlg_LBSelChangedNotify"

/**
 * @type {String}
 */
export global SHAREVISTRINGW := "commdlg_ShareViolation"

/**
 * @type {String}
 */
export global FILEOKSTRINGW := "commdlg_FileNameOK"

/**
 * @type {String}
 */
export global COLOROKSTRINGW := "commdlg_ColorOK"

/**
 * @type {String}
 */
export global SETRGBSTRINGW := "commdlg_SetRGBColor"

/**
 * @type {String}
 */
export global HELPMSGSTRINGW := "commdlg_help"

/**
 * @type {String}
 */
export global FINDMSGSTRINGW := "commdlg_FindReplace"

/**
 * @type {String}
 */
export global LBSELCHSTRING := "commdlg_LBSelChangedNotify"

/**
 * @type {String}
 */
export global SHAREVISTRING := "commdlg_ShareViolation"

/**
 * @type {String}
 */
export global FILEOKSTRING := "commdlg_FileNameOK"

/**
 * @type {String}
 */
export global COLOROKSTRING := "commdlg_ColorOK"

/**
 * @type {String}
 */
export global SETRGBSTRING := "commdlg_SetRGBColor"

/**
 * @type {String}
 */
export global HELPMSGSTRING := "commdlg_help"

/**
 * @type {String}
 */
export global FINDMSGSTRING := "commdlg_FindReplace"

/**
 * @type {Integer (Int32)}
 */
export global CD_LBSELNOITEMS := -1

/**
 * @type {Integer (UInt32)}
 */
export global CD_LBSELCHANGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CD_LBSELSUB := 1

/**
 * @type {Integer (UInt32)}
 */
export global CD_LBSELADD := 2

/**
 * @type {Integer (UInt32)}
 */
export global START_PAGE_GENERAL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global PD_RESULT_CANCEL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PD_RESULT_PRINT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PD_RESULT_APPLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DN_DEFAULTPRN := 1

/**
 * @type {Integer (UInt32)}
 */
export global WM_PSD_FULLPAGERECT := 1025

/**
 * @type {Integer (UInt32)}
 */
export global WM_PSD_MINMARGINRECT := 1026

/**
 * @type {Integer (UInt32)}
 */
export global WM_PSD_MARGINRECT := 1027

/**
 * @type {Integer (UInt32)}
 */
export global WM_PSD_GREEKTEXTRECT := 1028

/**
 * @type {Integer (UInt32)}
 */
export global WM_PSD_ENVSTAMPRECT := 1029

/**
 * @type {Integer (UInt32)}
 */
export global WM_PSD_YAFULLPAGERECT := 1030

/**
 * @type {Integer (UInt32)}
 */
export global DLG_COLOR := 10

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_HUESCROLL := 700

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SATSCROLL := 701

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_LUMSCROLL := 702

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_HUE := 703

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SAT := 704

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_LUM := 705

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_RED := 706

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_GREEN := 707

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_BLUE := 708

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_CURRENT := 709

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_RAINBOW := 710

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SAVE := 711

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_ADD := 712

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SOLID := 713

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_TUNE := 714

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SCHEMES := 715

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_ELEMENT := 716

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SAMPLES := 717

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_PALETTE := 718

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_MIX := 719

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_BOX1 := 720

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_CUSTOM1 := 721

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_HUEACCEL := 723

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SATACCEL := 724

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_LUMACCEL := 725

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_REDACCEL := 726

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_GREENACCEL := 727

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_BLUEACCEL := 728

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SOLID_LEFT := 730

/**
 * @type {Integer (UInt32)}
 */
export global COLOR_SOLID_RIGHT := 731

/**
 * @type {Integer (UInt32)}
 */
export global NUM_BASIC_COLORS := 48

/**
 * @type {Integer (UInt32)}
 */
export global NUM_CUSTOM_COLORS := 16
;@endregion Constants
