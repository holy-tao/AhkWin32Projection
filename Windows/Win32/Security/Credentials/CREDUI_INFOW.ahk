#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CREDUI_INFO structure is used to pass information to the CredUIPromptForCredentials function that creates a dialog box used to obtain credentials information.
 * @remarks
 * 
  * > [!NOTE]
  * > The wincred.h header defines CREDUI_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincred/ns-wincred-credui_infow
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset Unicode
 */
class CREDUI_INFOW extends Win32Struct
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
     * @type {Pointer<Void>}
     */
    hwndParent {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string containing a brief message to display in the dialog box. The length of this string should not exceed CREDUI_MAX_MESSAGE_LENGTH.
     * @type {Pointer<Char>}
     */
    pszMessageText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a string containing the title for the dialog box. The length of this string should not exceed CREDUI_MAX_CAPTION_LENGTH.
     * @type {Pointer<Char>}
     */
    pszCaptionText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Bitmap to display in the dialog box. If this member is <b>NULL</b>, a default bitmap is used. The bitmap size is limited to 320x60 pixels.
     * @type {Pointer<Void>}
     */
    hbmBanner {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
