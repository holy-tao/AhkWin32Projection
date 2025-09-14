#Requires AutoHotkey v2.0.0 64-bit

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
     * Creates an Open dialog box that lets the user specify the drive, directory, and the name of a file or set of files to be opened. (ANSI)
     * @remarks
     * The Explorer-style <b>Open</b> dialog box provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Open</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the <b>lpfnHook</b> member.
     * 
     * Windows continues to support the old-style <b>Open</b> dialog box for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Open</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
     * 
     * To display a dialog box that allows the user to select a directory instead of a file, call the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a> function.
     * 
     * Note, when selecting multiple files, the total character limit for the file names depends on the version of the function.
     * 
     * <ul>
     * <li>ANSI: 32k limit</li>
     * <li>Unicode: no restriction </li>
     * </ul>
     * @param {Pointer<OPENFILENAMEA>} param0 
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the <b>OK</b> button, the return value is nonzero. The buffer pointed to by the <b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the <b>Open</b> dialog box or an error occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getopenfilenamea
     * @since windows5.0
     */
    static GetOpenFileNameA(param0) {
        result := DllCall("COMDLG32.dll\GetOpenFileNameA", "ptr", param0, "int")
        return result
    }

    /**
     * Creates an Open dialog box that lets the user specify the drive, directory, and the name of a file or set of files to be opened. (Unicode)
     * @remarks
     * The Explorer-style <b>Open</b> dialog box provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Open</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the <b>lpfnHook</b> member.
     * 
     * Windows continues to support the old-style <b>Open</b> dialog box for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Open</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
     * 
     * To display a dialog box that allows the user to select a directory instead of a file, call the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a> function.
     * 
     * Note, when selecting multiple files, the total character limit for the file names depends on the version of the function.
     * 
     * <ul>
     * <li>ANSI: 32k limit</li>
     * <li>Unicode: no restriction </li>
     * </ul>
     * @param {Pointer<OPENFILENAMEW>} param0 
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the <b>OK</b> button, the return value is nonzero. The buffer pointed to by the <b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the <b>Open</b> dialog box or an error occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getopenfilenamew
     * @since windows5.0
     */
    static GetOpenFileNameW(param0) {
        result := DllCall("COMDLG32.dll\GetOpenFileNameW", "ptr", param0, "int")
        return result
    }

    /**
     * Creates a Save dialog box that lets the user specify the drive, directory, and name of a file to save. (ANSI)
     * @remarks
     * The Explorer-style <b>Save</b> dialog box that provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Save</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * 
     * Windows continues to support old-style <b>Save</b> dialog boxes for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Save</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
     * @param {Pointer<OPENFILENAMEA>} param0 
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the 
     * 						<b>OK</b> button and the function is successful, the return value is nonzero. The buffer pointed to by the 
     * 						<b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the 
     * 						<b>Save</b> dialog box or an error such as the file name buffer being too small occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getsavefilenamea
     * @since windows5.0
     */
    static GetSaveFileNameA(param0) {
        result := DllCall("COMDLG32.dll\GetSaveFileNameA", "ptr", param0, "int")
        return result
    }

    /**
     * Creates a Save dialog box that lets the user specify the drive, directory, and name of a file to save. (Unicode)
     * @remarks
     * The Explorer-style <b>Save</b> dialog box that provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Save</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * 
     * Windows continues to support old-style <b>Save</b> dialog boxes for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Save</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
     * @param {Pointer<OPENFILENAMEW>} param0 
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the user specifies a file name and clicks the 
     * 						<b>OK</b> button and the function is successful, the return value is nonzero. The buffer pointed to by the 
     * 						<b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
     * 
     * If the user cancels or closes the 
     * 						<b>Save</b> dialog box or an error such as the file name buffer being too small occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getsavefilenamew
     * @since windows5.0
     */
    static GetSaveFileNameW(param0) {
        result := DllCall("COMDLG32.dll\GetSaveFileNameW", "ptr", param0, "int")
        return result
    }

    /**
     * Retrieves the name of the specified file. (ANSI)
     * @remarks
     * <b>GetFileTitle</b> should only be called with legal file names; using an illegal file name has an undefined result.
     * 
     * To get the buffer size needed for the name of a file, call the function with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero. The function returns the required size.
     * 
     * <b>GetFileTitle</b> returns the string that the system would use to display the file name to the user. The display name includes an extension only if that is the user's preference for displaying file names. This means that the returned string may not accurately identify the file if it is used in calls to file system functions.
     * 
     * If the  <i>lpszTitle</i> buffer is too small, <b>GetFileTitle</b> returns the size required to hold the display name. However, there is no guaranteed relationship between the required size and the characters originally specified in the  <i>lpszFile</i> buffer. For example, do not call <b>GetFileTitle</b> with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero, and then try to use the return value as an index into the  <i>lpszFile</i> string. You can usually achieve similar results (and superior performance) with C run-time library functions such as <b>strrchr</b>, <b>wcsrchr</b>, and <b>_mbsrchr</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The commdlg.h header defines GetFileTitle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} param0 
     * @param {Pointer<PSTR>} Buf Type: <b>LPTSTR</b>
     * 
     * The buffer that receives the name of the file.
     * @param {Integer} cchSize Type: <b>WORD</b>
     * 
     * The length, in 
     * 					characters, of the buffer pointed to by the <i>lpszTitle</i> parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getfiletitlea
     * @since windows5.0
     */
    static GetFileTitleA(param0, Buf, cchSize) {
        DllCall("COMDLG32.dll\GetFileTitleA", "ptr", param0, "ptr", Buf, "ushort", cchSize)
    }

    /**
     * Retrieves the name of the specified file. (Unicode)
     * @remarks
     * <b>GetFileTitle</b> should only be called with legal file names; using an illegal file name has an undefined result.
     * 
     * To get the buffer size needed for the name of a file, call the function with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero. The function returns the required size.
     * 
     * <b>GetFileTitle</b> returns the string that the system would use to display the file name to the user. The display name includes an extension only if that is the user's preference for displaying file names. This means that the returned string may not accurately identify the file if it is used in calls to file system functions.
     * 
     * If the  <i>lpszTitle</i> buffer is too small, <b>GetFileTitle</b> returns the size required to hold the display name. However, there is no guaranteed relationship between the required size and the characters originally specified in the  <i>lpszFile</i> buffer. For example, do not call <b>GetFileTitle</b> with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero, and then try to use the return value as an index into the  <i>lpszFile</i> string. You can usually achieve similar results (and superior performance) with C run-time library functions such as <b>strrchr</b>, <b>wcsrchr</b>, and <b>_mbsrchr</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The commdlg.h header defines GetFileTitle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} param0 
     * @param {Pointer<PWSTR>} Buf Type: <b>LPTSTR</b>
     * 
     * The buffer that receives the name of the file.
     * @param {Integer} cchSize Type: <b>WORD</b>
     * 
     * The length, in 
     * 					characters, of the buffer pointed to by the <i>lpszTitle</i> parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getfiletitlew
     * @since windows5.0
     */
    static GetFileTitleW(param0, Buf, cchSize) {
        DllCall("COMDLG32.dll\GetFileTitleW", "ptr", param0, "ptr", Buf, "ushort", cchSize)
    }

    /**
     * 
     * @param {Pointer<CHOOSECOLORA>} param0 
     * @returns {Integer} 
     */
    static ChooseColorA(param0) {
        result := DllCall("COMDLG32.dll\ChooseColorA", "ptr", param0, "int")
        return result
    }

    /**
     * Wide string version of ChooseColor
     * @param {Pointer<CHOOSECOLORW>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosecolorw
     */
    static ChooseColorW(param0) {
        result := DllCall("COMDLG32.dll\ChooseColorW", "ptr", param0, "int")
        return result
    }

    /**
     * Creates a system-defined modeless Find dialog box that lets the user specify a string to search for and options to use when searching for text in a document. (ANSI)
     * @remarks
     * The <b>FindText</b> function does not perform a search operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
     * 
     * Before calling <b>FindText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b> button, or when the dialog box is closing. The  <i>lParam</i> parameter of the <b>FINDMSGSTRING</b> message contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
     * 
     * If you create a <b>Find</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. <b>IsDialogMessage</b> returns a value that indicates whether the <b>Find</b> dialog box processed the message.
     * 
     * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Find</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * @param {Pointer<FINDREPLACEA>} param0 
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with or to close the dialog box.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function. <b>CommDlgExtendedError</b> may return one of the following error codes:
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-findtexta
     * @since windows5.0
     */
    static FindTextA(param0) {
        result := DllCall("COMDLG32.dll\FindTextA", "ptr", param0, "ptr")
        return result
    }

    /**
     * Creates a system-defined modeless Find dialog box that lets the user specify a string to search for and options to use when searching for text in a document. (Unicode)
     * @remarks
     * The <b>FindText</b> function does not perform a search operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
     * 
     * Before calling <b>FindText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b> button, or when the dialog box is closing. The  <i>lParam</i> parameter of the <b>FINDMSGSTRING</b> message contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
     * 
     * If you create a <b>Find</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. <b>IsDialogMessage</b> returns a value that indicates whether the <b>Find</b> dialog box processed the message.
     * 
     * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Find</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * @param {Pointer<FINDREPLACEW>} param0 
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with or to close the dialog box.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function. <b>CommDlgExtendedError</b> may return one of the following error codes:
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-findtextw
     * @since windows5.0
     */
    static FindTextW(param0) {
        result := DllCall("COMDLG32.dll\FindTextW", "ptr", param0, "ptr")
        return result
    }

    /**
     * Creates a system-defined modeless dialog box that lets the user specify a string to search for and a replacement string, as well as options to control the find and replace operations. (ANSI)
     * @remarks
     * The <b>ReplaceText</b> function does not perform a text replacement operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
     * 
     * Before calling <b>ReplaceText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b>, <b>Replace</b>, or <b>Replace All</b> buttons, or when the dialog box is closing. The  <i>lParam</i> parameter of a <b>FINDMSGSTRING</b> message contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
     * 
     * If you create a <b>Replace</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. The <b>IsDialogMessage</b> function returns a value that indicates whether the Replace dialog box processed the message.
     * 
     * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Replace</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The commdlg.h header defines ReplaceText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<FINDREPLACEA>} param0 
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with the dialog box or close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following error codes:
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-replacetexta
     * @since windows5.0
     */
    static ReplaceTextA(param0) {
        result := DllCall("COMDLG32.dll\ReplaceTextA", "ptr", param0, "ptr")
        return result
    }

    /**
     * Creates a system-defined modeless dialog box that lets the user specify a string to search for and a replacement string, as well as options to control the find and replace operations. (Unicode)
     * @remarks
     * The <b>ReplaceText</b> function does not perform a text replacement operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
     * 
     * Before calling <b>ReplaceText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b>, <b>Replace</b>, or <b>Replace All</b> buttons, or when the dialog box is closing. The  <i>lParam</i> parameter of a <b>FINDMSGSTRING</b> message contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
     * 
     * If you create a <b>Replace</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. The <b>IsDialogMessage</b> function returns a value that indicates whether the Replace dialog box processed the message.
     * 
     * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Replace</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The commdlg.h header defines ReplaceText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<FINDREPLACEW>} param0 
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with the dialog box or close it.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following error codes:
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-replacetextw
     * @since windows5.0
     */
    static ReplaceTextW(param0) {
        result := DllCall("COMDLG32.dll\ReplaceTextW", "ptr", param0, "ptr")
        return result
    }

    /**
     * ASCII version of ChooseFont
     * @param {Pointer<CHOOSEFONTA>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosefonta
     */
    static ChooseFontA(param0) {
        result := DllCall("COMDLG32.dll\ChooseFontA", "ptr", param0, "int")
        return result
    }

    /**
     * Wide string version of ChooseFont
     * @param {Pointer<CHOOSEFONTW>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosefontw
     */
    static ChooseFontW(param0) {
        result := DllCall("COMDLG32.dll\ChooseFontW", "ptr", param0, "int")
        return result
    }

    /**
     * ASCII version of PrintDlg
     * @param {Pointer<PRINTDLGA>} pPD 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlga
     */
    static PrintDlgA(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgA", "ptr", pPD, "int")
        return result
    }

    /**
     * Wide string version of PrintDlg
     * @param {Pointer<PRINTDLGW>} pPD 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgw
     */
    static PrintDlgW(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgW", "ptr", pPD, "int")
        return result
    }

    /**
     * ASCII version of PrintDlgEx
     * @param {Pointer<PRINTDLGEXA>} pPD 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgexa
     */
    static PrintDlgExA(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgExA", "ptr", pPD, "int")
        return result
    }

    /**
     * Wide string version of PrintDlgEx
     * @param {Pointer<PRINTDLGEXW>} pPD 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgexw
     */
    static PrintDlgExW(pPD) {
        result := DllCall("COMDLG32.dll\PrintDlgExW", "ptr", pPD, "int")
        return result
    }

    /**
     * The CommDlgExtendedError function (commdlg.h) returns a common dialog box error code.
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
     * The dialog box could not be created. The common dialog box function's call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxa">DialogBox</a> function failed. For example, this error occurs if the common dialog box call specifies an invalid window handle.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function returned an error code when it was called by the common dialog box function.
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
     * The following error codes can be returned for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function.
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
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed when it attempted to create an information context.
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
     * You called the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function with the <b>DN_DEFAULTPRN</b> flag specified in the <b>wDefault</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure, but the printer described by the other structure members did not match the current default printer. This error occurs when you store the <b>DEVNAMES</b> structure, and the user changes the default printer by using the Control Panel.
     * 
     * To use the printer described by the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure, clear the <b>DN_DEFAULTPRN</b> flag and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> again.
     * 
     * To use the default printer, replace the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure (and the  structure, if one exists) with <b>NULL</b>; and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> again.
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
     * The data in the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structures describes two different printers.
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
     * The printer driver failed to initialize a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure.
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
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed during initialization, and there is no more specific extended error code to describe the failure. This is the generic default error code for the function.
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
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to load the device driver for the specified printer.
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
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to parse the strings in the [devices] section of the WIN.INI file.
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
     * The PD_RETURNDEFAULT flag was specified in the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-printdlga">PRINTDLG</a> structure, but the 
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
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to load the required resources.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following error codes can be returned for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> function.
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
     * <dt>0x2002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified in the <b>nSizeMax</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-choosefonta">CHOOSEFONT</a> structure is less than the size specified in the 
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
     * The following error codes can be returned for the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-getopenfilenamea">GetOpenFileName</a> and <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-getsavefilenamea">GetSaveFileName</a> functions.
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
     * The buffer pointed to by the <b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure is too small for the file name specified by the user. The first two bytes of the 
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
     * The following error code can be returned for the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-findtexta">FindText</a> and <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-replacetexta">ReplaceText</a> functions.
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
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure points to an invalid buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-commdlgextendederror
     * @since windows5.0
     */
    static CommDlgExtendedError() {
        result := DllCall("COMDLG32.dll\CommDlgExtendedError", "uint")
        return result
    }

    /**
     * ASCII version of PageSetupDlg
     * @param {Pointer<PAGESETUPDLGA>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-pagesetupdlga
     */
    static PageSetupDlgA(param0) {
        result := DllCall("COMDLG32.dll\PageSetupDlgA", "ptr", param0, "int")
        return result
    }

    /**
     * Wide string version of PageSetupDlg
     * @param {Pointer<PAGESETUPDLGW>} param0 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-pagesetupdlgw
     */
    static PageSetupDlgW(param0) {
        result := DllCall("COMDLG32.dll\PageSetupDlgW", "ptr", param0, "int")
        return result
    }

;@endregion Methods
}
