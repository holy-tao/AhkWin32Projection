#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class Dialogs {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_SHAREFALLTHROUGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_SHARENOWARN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_SHAREWARN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_INITDONE => 4294966695

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_SELCHANGE => 4294966694

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_FOLDERCHANGE => 4294966693

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_SHAREVIOLATION => 4294966692

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_HELP => 4294966691

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_FILEOK => 4294966690

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_TYPECHANGE => 4294966689

    /**
     * @type {Integer (UInt32)}
     */
    static CDN_INCLUDEITEM => 4294966688

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_FIRST => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_LAST => 1224

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_GETSPEC => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_GETFILEPATH => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_GETFOLDERPATH => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_GETFOLDERIDLIST => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_SETCONTROLTEXT => 1128

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_HIDECONTROL => 1129

    /**
     * @type {Integer (UInt32)}
     */
    static CDM_SETDEFEXT => 1130

    /**
     * @type {Integer (UInt32)}
     */
    static FRM_FIRST => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static FRM_LAST => 1224

    /**
     * @type {Integer (UInt32)}
     */
    static FRM_SETOPERATIONRESULT => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static FRM_SETOPERATIONRESULTTEXT => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static PS_OPENTYPE_FONTTYPE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TT_OPENTYPE_FONTTYPE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TYPE1_FONTTYPE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOL_FONTTYPE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CHOOSEFONT_GETLOGFONT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CHOOSEFONT_SETLOGFONT => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CHOOSEFONT_SETFLAGS => 1126

    /**
     * @type {String}
     */
    static LBSELCHSTRINGA => "commdlg_LBSelChangedNotify"

    /**
     * @type {String}
     */
    static SHAREVISTRINGA => "commdlg_ShareViolation"

    /**
     * @type {String}
     */
    static FILEOKSTRINGA => "commdlg_FileNameOK"

    /**
     * @type {String}
     */
    static COLOROKSTRINGA => "commdlg_ColorOK"

    /**
     * @type {String}
     */
    static SETRGBSTRINGA => "commdlg_SetRGBColor"

    /**
     * @type {String}
     */
    static HELPMSGSTRINGA => "commdlg_help"

    /**
     * @type {String}
     */
    static FINDMSGSTRINGA => "commdlg_FindReplace"

    /**
     * @type {String}
     */
    static LBSELCHSTRINGW => "commdlg_LBSelChangedNotify"

    /**
     * @type {String}
     */
    static SHAREVISTRINGW => "commdlg_ShareViolation"

    /**
     * @type {String}
     */
    static FILEOKSTRINGW => "commdlg_FileNameOK"

    /**
     * @type {String}
     */
    static COLOROKSTRINGW => "commdlg_ColorOK"

    /**
     * @type {String}
     */
    static SETRGBSTRINGW => "commdlg_SetRGBColor"

    /**
     * @type {String}
     */
    static HELPMSGSTRINGW => "commdlg_help"

    /**
     * @type {String}
     */
    static FINDMSGSTRINGW => "commdlg_FindReplace"

    /**
     * @type {String}
     */
    static LBSELCHSTRING => "commdlg_LBSelChangedNotify"

    /**
     * @type {String}
     */
    static SHAREVISTRING => "commdlg_ShareViolation"

    /**
     * @type {String}
     */
    static FILEOKSTRING => "commdlg_FileNameOK"

    /**
     * @type {String}
     */
    static COLOROKSTRING => "commdlg_ColorOK"

    /**
     * @type {String}
     */
    static SETRGBSTRING => "commdlg_SetRGBColor"

    /**
     * @type {String}
     */
    static HELPMSGSTRING => "commdlg_help"

    /**
     * @type {String}
     */
    static FINDMSGSTRING => "commdlg_FindReplace"

    /**
     * @type {Integer (Int32)}
     */
    static CD_LBSELNOITEMS => -1

    /**
     * @type {Integer (UInt32)}
     */
    static CD_LBSELCHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CD_LBSELSUB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CD_LBSELADD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static START_PAGE_GENERAL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PD_RESULT_CANCEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PD_RESULT_PRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PD_RESULT_APPLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DN_DEFAULTPRN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WM_PSD_FULLPAGERECT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static WM_PSD_MINMARGINRECT => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static WM_PSD_MARGINRECT => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static WM_PSD_GREEKTEXTRECT => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static WM_PSD_ENVSTAMPRECT => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static WM_PSD_YAFULLPAGERECT => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_COLOR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_HUESCROLL => 700

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SATSCROLL => 701

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_LUMSCROLL => 702

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_HUE => 703

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SAT => 704

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_LUM => 705

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_RED => 706

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_GREEN => 707

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_BLUE => 708

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_CURRENT => 709

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_RAINBOW => 710

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SAVE => 711

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_ADD => 712

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SOLID => 713

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_TUNE => 714

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SCHEMES => 715

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_ELEMENT => 716

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SAMPLES => 717

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_PALETTE => 718

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_MIX => 719

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_BOX1 => 720

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_CUSTOM1 => 721

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_HUEACCEL => 723

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SATACCEL => 724

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_LUMACCEL => 725

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_REDACCEL => 726

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_GREENACCEL => 727

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_BLUEACCEL => 728

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SOLID_LEFT => 730

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_SOLID_RIGHT => 731

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_BASIC_COLORS => 48

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_CUSTOM_COLORS => 16
;@endregion Constants

;@region Methods
    /**
     * Creates an Open dialog box that lets the user specify the drive, directory, and the name of a file or set of files to be opened.
     * @param {Pointer<OPENFILENAMEA>} param0 
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the <b>OK</b> button, the return value is nonzero. The buffer pointed to by the <b>lpstrFile</b> member of the <a href="/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the <b>Open</b> dialog box or an error occurs, the return value is zero. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-getopenfilenamea
     * @since windows5.0
     */
    static GetOpenFileNameA(param0) {
        result := DllCall("COMDLG32.dll\GetOpenFileNameA", "ptr", param0, "int")
        return result
    }

    /**
     * Creates an Open dialog box that lets the user specify the drive, directory, and the name of a file or set of files to be opened.
     * @param {Pointer<OPENFILENAMEW>} param0 
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the <b>OK</b> button, the return value is nonzero. The buffer pointed to by the <b>lpstrFile</b> member of the <a href="/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the <b>Open</b> dialog box or an error occurs, the return value is zero. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-getopenfilenamew
     * @since windows5.0
     */
    static GetOpenFileNameW(param0) {
        result := DllCall("COMDLG32.dll\GetOpenFileNameW", "ptr", param0, "int")
        return result
    }

    /**
     * Creates a Save dialog box that lets the user specify the drive, directory, and name of a file to save.
     * @param {Pointer<OPENFILENAMEA>} param0 
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the 
     * 						<b>OK</b> button and the function is successful, the return value is nonzero. The buffer pointed to by the 
     * 						<b>lpstrFile</b> member of the <a href="/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the 
     * 						<b>Save</b> dialog box or an error such as the file name buffer being too small occurs, the return value is zero. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-getsavefilenamea
     * @since windows5.0
     */
    static GetSaveFileNameA(param0) {
        result := DllCall("COMDLG32.dll\GetSaveFileNameA", "ptr", param0, "int")
        return result
    }

    /**
     * Creates a Save dialog box that lets the user specify the drive, directory, and name of a file to save.
     * @param {Pointer<OPENFILENAMEW>} param0 
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the 
     * 						<b>OK</b> button and the function is successful, the return value is nonzero. The buffer pointed to by the 
     * 						<b>lpstrFile</b> member of the <a href="/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the 
     * 						<b>Save</b> dialog box or an error such as the file name buffer being too small occurs, the return value is zero. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-getsavefilenamew
     * @since windows5.0
     */
    static GetSaveFileNameW(param0) {
        result := DllCall("COMDLG32.dll\GetSaveFileNameW", "ptr", param0, "int")
        return result
    }

    /**
     * Retrieves the name of the specified file.
     * @param {PSTR} param0 
     * @param {PSTR} Buf Type: <b>LPTSTR</b>
     * 
     * The buffer that receives the name of the file.
     * @param {Integer} cchSize Type: <b>WORD</b>
     * 
     * The length, in 
     * 					characters, of the buffer pointed to by the <i>lpszTitle</i> parameter.
     * @returns {Integer} Type: <b>short</b>
     * 
     * If the function succeeds, the return value is zero.
     * 
     * If the file name is invalid, the return value is unknown. If there is an error, the return value is a negative number.
     * 
     * If the buffer pointed to by the <i>lpszTitle</i> parameter is too small, the return value is a positive integer that specifies the required buffer size, in characters. The required buffer size includes the terminating null character.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-getfiletitlea
     * @since windows5.0
     */
    static GetFileTitleA(param0, Buf, cchSize) {
        param0 := param0 is String ? StrPtr(param0) : param0
        Buf := Buf is String ? StrPtr(Buf) : Buf

        result := DllCall("COMDLG32.dll\GetFileTitleA", "ptr", param0, "ptr", Buf, "ushort", cchSize, "short")
        return result
    }

    /**
     * Retrieves the name of the specified file.
     * @param {PWSTR} param0 
     * @param {PWSTR} Buf Type: <b>LPTSTR</b>
     * 
     * The buffer that receives the name of the file.
     * @param {Integer} cchSize Type: <b>WORD</b>
     * 
     * The length, in 
     * 					characters, of the buffer pointed to by the <i>lpszTitle</i> parameter.
     * @returns {Integer} Type: <b>short</b>
     * 
     * If the function succeeds, the return value is zero.
     * 
     * If the file name is invalid, the return value is unknown. If there is an error, the return value is a negative number.
     * 
     * If the buffer pointed to by the <i>lpszTitle</i> parameter is too small, the return value is a positive integer that specifies the required buffer size, in characters. The required buffer size includes the terminating null character.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-getfiletitlew
     * @since windows5.0
     */
    static GetFileTitleW(param0, Buf, cchSize) {
        param0 := param0 is String ? StrPtr(param0) : param0
        Buf := Buf is String ? StrPtr(Buf) : Buf

        result := DllCall("COMDLG32.dll\GetFileTitleW", "ptr", param0, "ptr", Buf, "ushort", cchSize, "short")
        return result
    }

    /**
     * 
     * @param {Pointer<CHOOSECOLORA>} param0 
     * @returns {BOOL} 
     */
    static ChooseColorA(param0) {
        result := DllCall("COMDLG32.dll\ChooseColorA", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CHOOSECOLORW>} param0 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosecolorw
     */
    static ChooseColorW(param0) {
        result := DllCall("COMDLG32.dll\ChooseColorW", "ptr", param0, "int")
        return result
    }

    /**
     * Creates a system-defined modeless Find dialog box that lets the user specify a string to search for and options to use when searching for text in a document.
     * @param {Pointer<FINDREPLACEA>} param0 
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with or to close the dialog box.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function. <b>CommDlgExtendedError</b> may return one of the following error codes:
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-findtexta
     * @since windows5.0
     */
    static FindTextA(param0) {
        result := DllCall("COMDLG32.dll\FindTextA", "ptr", param0, "ptr")
        resultHandle := HWND({Value: result}, True)
        return resultHandle
    }

    /**
     * Creates a system-defined modeless Find dialog box that lets the user specify a string to search for and options to use when searching for text in a document.
     * @param {Pointer<FINDREPLACEW>} param0 
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with or to close the dialog box.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function. <b>CommDlgExtendedError</b> may return one of the following error codes:
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-findtextw
     * @since windows5.0
     */
    static FindTextW(param0) {
        result := DllCall("COMDLG32.dll\FindTextW", "ptr", param0, "ptr")
        resultHandle := HWND({Value: result}, True)
        return resultHandle
    }

    /**
     * Creates a system-defined modeless dialog box that lets the user specify a string to search for and a replacement string, as well as options to control the find and replace operations.
     * @param {Pointer<FINDREPLACEA>} param0 
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with the dialog box or close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following error codes:
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-replacetexta
     * @since windows5.0
     */
    static ReplaceTextA(param0) {
        result := DllCall("COMDLG32.dll\ReplaceTextA", "ptr", param0, "ptr")
        resultHandle := HWND({Value: result}, True)
        return resultHandle
    }

    /**
     * Creates a system-defined modeless dialog box that lets the user specify a string to search for and a replacement string, as well as options to control the find and replace operations.
     * @param {Pointer<FINDREPLACEW>} param0 
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with the dialog box or close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following error codes:
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-replacetextw
     * @since windows5.0
     */
    static ReplaceTextW(param0) {
        result := DllCall("COMDLG32.dll\ReplaceTextW", "ptr", param0, "ptr")
        resultHandle := HWND({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {Pointer<CHOOSEFONTA>} param0 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosefonta
     */
    static ChooseFontA(param0) {
        result := DllCall("COMDLG32.dll\ChooseFontA", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CHOOSEFONTW>} param0 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosefontw
     */
    static ChooseFontW(param0) {
        result := DllCall("COMDLG32.dll\ChooseFontW", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTDLGA>} pPD 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlga
     */
    static PrintDlgA(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgA", "ptr", pPD, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTDLGW>} pPD 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgw
     */
    static PrintDlgW(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgW", "ptr", pPD, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRINTDLGEXA>} pPD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgexa
     */
    static PrintDlgExA(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgExA", "ptr", pPD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PRINTDLGEXW>} pPD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgexw
     */
    static PrintDlgExW(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgExW", "ptr", pPD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a common dialog box error code. This code indicates the most recent error to occur during the execution of one of the common dialog box functions.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * If the most recent call to a common dialog box function succeeded, the return value is undefined. If the common dialog box function returned <b>FALSE</b> because the user closed or canceled the dialog box, the return value is zero. Otherwise, the return value is a nonzero error code.
     * 
     * The <b>CommDlgExtendedError</b> function can return general error codes for any of the common dialog box functions. In addition, there are error codes that are returned only for a specific common dialog box. All of these error codes are defined in Cderr.h. The following general error codes can be returned for any of the common dialog box functions.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_DIALOGFAILURE</b></dt>
     * <dt>0xFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box could not be created. The common dialog box function's call to the <a href="/windows/desktop/api/winuser/nf-winuser-dialogboxa">DialogBox</a> function failed. For example, this error occurs if the common dialog box call specifies an invalid window handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_FINDRESFAILURE</b></dt>
     * <dt>0x0006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The common dialog box function failed to find a specified resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_INITIALIZATION</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The common dialog box function failed during initialization. This error often occurs when sufficient memory is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_LOADRESFAILURE</b></dt>
     * <dt>0x0007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The common dialog box function failed to load a specified resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_LOADSTRFAILURE</b></dt>
     * <dt>0x0005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The common dialog box function failed to load a specified string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_LOCKRESFAILURE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The common dialog box function failed to lock a specified resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_MEMALLOCFAILURE</b></dt>
     * <dt>0x0009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The common dialog box function was unable to allocate memory for internal structures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_MEMLOCKFAILURE</b></dt>
     * <dt>0x000A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The common dialog box function was unable to lock the memory associated with a handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_NOHINSTANCE</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ENABLETEMPLATE</b> flag was set in the <b>Flags</b> member of the initialization structure for the corresponding common dialog box, but you failed to provide a corresponding instance handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_NOHOOK</b></dt>
     * <dt>0x000B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ENABLEHOOK</b> flag was set in the <b>Flags</b> member of the initialization structure for the corresponding common dialog box, but you failed to provide a pointer to a corresponding hook procedure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_NOTEMPLATE</b></dt>
     * <dt>0x0003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ENABLETEMPLATE</b> flag was set in the <b>Flags</b> member of the initialization structure for the corresponding common dialog box, but you failed to provide a corresponding template.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_REGISTERMSGFAIL</b></dt>
     * <dt>0x000C</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function returned an error code when it was called by the common dialog box function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CDERR_STRUCTSIZE</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lStructSize</b> member of the initialization structure for the corresponding common dialog box is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following error codes can be returned for the <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_CREATEICFAILURE</b></dt>
     * <dt>0x100A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed when it attempted to create an information context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_DEFAULTDIFFERENT</b></dt>
     * <dt>0x100C</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You called the <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function with the <b>DN_DEFAULTPRN</b> flag specified in the <b>wDefault</b> member of the <a href="/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure, but the printer described by the other structure members did not match the current default printer. This error occurs when you store the <b>DEVNAMES</b> structure, and the user changes the default printer by using the Control Panel.
     * 
     * To use the printer described by the <a href="/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure, clear the <b>DN_DEFAULTPRN</b> flag and call <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> again.
     * 
     * To use the default printer, replace the <a href="/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure (and the  structure, if one exists) with <b>NULL</b>; and call <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_DNDMMISMATCH</b></dt>
     * <dt>0x1009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data in the <a href="/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> and <a href="/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structures describes two different printers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_GETDEVMODEFAIL</b></dt>
     * <dt>0x1005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The printer driver failed to initialize a <a href="/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_INITFAILURE</b></dt>
     * <dt>0x1006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed during initialization, and there is no more specific extended error code to describe the failure. This is the generic default error code for the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_LOADDRVFAILURE</b></dt>
     * <dt>0x1004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to load the device driver for the specified printer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_NODEFAULTPRN</b></dt>
     * <dt>0x1008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A default printer does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_NODEVICES</b></dt>
     * <dt>0x1007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No printer drivers were found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_PARSEFAILURE</b></dt>
     * <dt>0x1002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to parse the strings in the [devices] section of the WIN.INI file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_PRINTERNOTFOUND</b></dt>
     * <dt>0x100B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The [devices] section of the WIN.INI file did not contain an entry for the requested printer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_RETDEFFAILURE</b></dt>
     * <dt>0x1003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PD_RETURNDEFAULT flag was specified in the <b>Flags</b> member of the <a href="/windows/win32/api/commdlg/ns-commdlg-printdlga">PRINTDLG</a> structure, but the 
     * 							<b>hDevMode</b> or <b>hDevNames</b> member was not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDERR_SETUPFAILURE</b></dt>
     * <dt>0x1001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to load the required resources.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following error codes can be returned for the <a href="/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CFERR_MAXLESSTHANMIN</b></dt>
     * <dt>CFERR_MAXLESSTHANMIN</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified in the <b>nSizeMax</b> member of the <a href="/windows/desktop/api/commdlg/ns-commdlg-choosefonta">CHOOSEFONT</a> structure is less than the size specified in the 
     * 							<b>nSizeMin</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CFERR_NOFONTS</b></dt>
     * <dt>0x2001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No fonts exist.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following error codes can be returned for the <a href="/windows/desktop/api/commdlg/nf-commdlg-getopenfilenamea">GetOpenFileName</a> and <a href="/windows/desktop/api/commdlg/nf-commdlg-getsavefilenamea">GetSaveFileName</a> functions.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FNERR_BUFFERTOOSMALL</b></dt>
     * <dt>0x3003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <b>lpstrFile</b> member of the <a href="/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure is too small for the file name specified by the user. The first two bytes of the 
     * 							<b>lpstrFile</b> buffer contain an integer value specifying the size required to receive the full name, in 
     * 							characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FNERR_INVALIDFILENAME</b></dt>
     * <dt>0x3002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FNERR_SUBCLASSFAILURE</b></dt>
     * <dt>0x3001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt to subclass a list box failed because sufficient memory was not available.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following error code can be returned for the <a href="/windows/desktop/api/commdlg/nf-commdlg-findtexta">FindText</a> and <a href="/windows/desktop/api/commdlg/nf-commdlg-replacetexta">ReplaceText</a> functions.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FRERR_BUFFERLENGTHZERO</b></dt>
     * <dt>0x4001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A member of the <a href="/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure points to an invalid buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-commdlgextendederror
     * @since windows5.0
     */
    static CommDlgExtendedError() {
        result := DllCall("COMDLG32.dll\CommDlgExtendedError", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PAGESETUPDLGA>} param0 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-pagesetupdlga
     */
    static PageSetupDlgA(param0) {
        result := DllCall("COMDLG32.dll\PageSetupDlgA", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PAGESETUPDLGW>} param0 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-pagesetupdlgw
     */
    static PageSetupDlgW(param0) {
        result := DllCall("COMDLG32.dll\PageSetupDlgW", "ptr", param0, "int")
        return result
    }

;@endregion Methods
}
