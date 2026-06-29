#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHAR_IMAGE_INFO.ahk
#Include ..\..\System\Console\COORD.ahk
#Include .\FSCNTL_SCREEN_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class FSVIDEO_WRITE_TO_FRAME_BUFFER extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<CHAR_IMAGE_INFO>}
     */
    SrcBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {FSCNTL_SCREEN_INFO}
     */
    DestScreen {
        get {
            if(!this.HasProp("__DestScreen"))
                this.__DestScreen := FSCNTL_SCREEN_INFO(8, this)
            return this.__DestScreen
        }
    }
}
