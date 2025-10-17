#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Console\COORD.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FONT_IMAGE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {COORD}
     */
    FontSize{
        get {
            if(!this.HasProp("__FontSize"))
                this.__FontSize := COORD(0, this)
            return this.__FontSize
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    ImageBits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
