#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Console\COORD.ahk
#Include .\FSCNTL_SCREEN_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FSVIDEO_COPY_FRAME_BUFFER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {FSCNTL_SCREEN_INFO}
     */
    SrcScreen{
        get {
            if(!this.HasProp("__SrcScreen"))
                this.__SrcScreen := FSCNTL_SCREEN_INFO(this.ptr + 0)
            return this.__SrcScreen
        }
    }

    /**
     * @type {FSCNTL_SCREEN_INFO}
     */
    DestScreen{
        get {
            if(!this.HasProp("__DestScreen"))
                this.__DestScreen := FSCNTL_SCREEN_INFO(this.ptr + 16)
            return this.__DestScreen
        }
    }
}
