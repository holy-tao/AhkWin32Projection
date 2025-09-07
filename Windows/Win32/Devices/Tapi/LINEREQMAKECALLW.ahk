#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 * @charset Unicode
 */
class LINEREQMAKECALLW extends Win32Struct
{
    static sizeof => 480

    static packingSize => 1

    /**
     * @type {String}
     */
    szDestAddress {
        get => StrGet(this.ptr + 0, 79, "UTF-16")
        set => StrPut(value, this.ptr + 0, 79, "UTF-16")
    }

    /**
     * @type {String}
     */
    szAppName {
        get => StrGet(this.ptr + 160, 39, "UTF-16")
        set => StrPut(value, this.ptr + 160, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    szCalledParty {
        get => StrGet(this.ptr + 240, 39, "UTF-16")
        set => StrPut(value, this.ptr + 240, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    szComment {
        get => StrGet(this.ptr + 320, 79, "UTF-16")
        set => StrPut(value, this.ptr + 320, 79, "UTF-16")
    }
}
