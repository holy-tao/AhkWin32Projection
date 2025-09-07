#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_NETNAME_PWD_INFOEX extends Win32Struct
{
    static sizeof => 904

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    Password {
        get => StrGet(this.ptr + 4, 127, "UTF-16")
        set => StrPut(value, this.ptr + 4, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    CreatingDC {
        get => StrGet(this.ptr + 260, 257, "UTF-16")
        set => StrPut(value, this.ptr + 260, 257, "UTF-16")
    }

    /**
     * @type {String}
     */
    ObjectGuid {
        get => StrGet(this.ptr + 776, 63, "UTF-16")
        set => StrPut(value, this.ptr + 776, 63, "UTF-16")
    }
}
