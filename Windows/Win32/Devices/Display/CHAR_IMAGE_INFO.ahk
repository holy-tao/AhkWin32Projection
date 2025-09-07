#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Console\CHAR_INFO.ahk
#Include ..\..\System\Console\COORD.ahk
#Include .\FONT_IMAGE_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class CHAR_IMAGE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CHAR_INFO}
     */
    CharInfo{
        get {
            if(!this.HasProp("__CharInfo"))
                this.__CharInfo := CHAR_INFO(this.ptr + 0)
            return this.__CharInfo
        }
    }

    /**
     * @type {FONT_IMAGE_INFO}
     */
    FontImageInfo{
        get {
            if(!this.HasProp("__FontImageInfo"))
                this.__FontImageInfo := FONT_IMAGE_INFO(this.ptr + 8)
            return this.__FontImageInfo
        }
    }
}
