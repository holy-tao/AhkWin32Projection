#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * The CREDUI_INFO structure is used to pass information to the CredUIPromptForCredentials function that creates a dialog box used to obtain credentials information. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wincred.h header defines CREDUI_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ns-wincred-credui_infow
 * @namespace Windows.Win32.Security.Credentials
 * @charset Unicode
 */
export default struct CREDUI_INFOW {
    #StructPack 8

    /**
     * Set to the size of the CREDUI_INFO structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Specifies the handle to the parent window of the dialog box. The dialog box is modal with respect to the parent window. If this member is <b>NULL</b>, the desktop is the parent window of the dialog box.
     */
    hwndParent : HWND

    /**
     * Pointer to a string containing a brief message to display in the dialog box. The length of this string should not exceed CREDUI_MAX_MESSAGE_LENGTH.
     */
    pszMessageText : PWSTR

    /**
     * Pointer to a string containing the title for the dialog box. The length of this string should not exceed CREDUI_MAX_CAPTION_LENGTH.
     */
    pszCaptionText : PWSTR

    /**
     * Bitmap to display in the dialog box. If this member is <b>NULL</b>, a default bitmap is used. The bitmap size is limited to 320x60 pixels.
     */
    hbmBanner : HBITMAP

}
