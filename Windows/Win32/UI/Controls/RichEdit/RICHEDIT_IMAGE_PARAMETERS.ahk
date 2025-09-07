#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Defines the attributes of an image to be inserted by the EM_INSERTIMAGE message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-richedit_image_parameters
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class RICHEDIT_IMAGE_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The width, in HIMETRIC units (0.01 mm), of the image.
     * @type {Integer}
     */
    xWidth {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    yHeight {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If <i>Type</i> is TA_BASELINE, this parameter is the distance, in HIMETRIC units, that the top of the image extends above the text baseline. If <i>Type</i> is TA_BASELINE and ascent is zero, the bottom of the image is placed at the text baseline.
     * @type {Integer}
     */
    Ascent {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The alternate text for the image.
     * @type {PWSTR}
     */
    pwszAlternateText{
        get {
            if(!this.HasProp("__pwszAlternateText"))
                this.__pwszAlternateText := PWSTR(this.ptr + 16)
            return this.__pwszAlternateText
        }
    }

    /**
     * The stream that contains the image data.
     * @type {Pointer<IStream>}
     */
    pIStream {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
