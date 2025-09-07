#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class SET_ACTIVE_COLOR_PROFILE_NAME extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * @type {String}
     */
    ColorProfileName {
        get => StrGet(this.ptr + 0, 0, "UTF-16")
        set => StrPut(value, this.ptr + 0, 0, "UTF-16")
    }
}
