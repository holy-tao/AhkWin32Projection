#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_SUPL_NI_INFO extends Win32Struct
{
    static sizeof => 1568

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    RequestorId {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    ClientName {
        get => StrGet(this.ptr + 528, 259, "UTF-16")
        set => StrPut(value, this.ptr + 528, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    SuplNiUrl {
        get => StrGet(this.ptr + 1048, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1048, 259, "UTF-16")
    }
}
