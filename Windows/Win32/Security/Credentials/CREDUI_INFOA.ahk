#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * The CREDUI_INFO structure is used to pass information to the CredUIPromptForCredentials function that creates a dialog box used to obtain credentials information.
 * @remarks
 * 
  * > [!NOTE]
  * > The wincred.h header defines CREDUI_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincred/ns-wincred-credui_infoa
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset ANSI
 */
class CREDUI_INFOA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Set to the size of the CREDUI_INFO structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the handle to the parent window of the dialog box. The dialog box is modal with respect to the parent window. If this member is <b>NULL</b>, the desktop is the parent window of the dialog box.
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(this.ptr + 8)
            return this.__hwndParent
        }
    }

    /**
     * Pointer to a string containing a brief message to display in the dialog box. The length of this string should not exceed CREDUI_MAX_MESSAGE_LENGTH.
     * @type {PSTR}
     */
    pszMessageText{
        get {
            if(!this.HasProp("__pszMessageText"))
                this.__pszMessageText := PSTR(this.ptr + 16)
            return this.__pszMessageText
        }
    }

    /**
     * Pointer to a string containing the title for the dialog box. The length of this string should not exceed CREDUI_MAX_CAPTION_LENGTH.
     * @type {PSTR}
     */
    pszCaptionText{
        get {
            if(!this.HasProp("__pszCaptionText"))
                this.__pszCaptionText := PSTR(this.ptr + 24)
            return this.__pszCaptionText
        }
    }

    /**
     * Bitmap to display in the dialog box. If this member is <b>NULL</b>, a default bitmap is used. The bitmap size is limited to 320x60 pixels.
     * @type {HBITMAP}
     */
    hbmBanner{
        get {
            if(!this.HasProp("__hbmBanner"))
                this.__hbmBanner := HBITMAP(this.ptr + 32)
            return this.__hbmBanner
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
