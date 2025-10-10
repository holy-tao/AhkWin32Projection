#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An EncoderParameter object holds a parameter that can be passed to an image encoder. An EncoderParameter object can also be used to receive a list of possible values supported by a particular parameter of a particular image encoder.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/nl-gdiplusimaging-encoderparameter
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EncoderParameter extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfValues {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
