#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASCONNW extends Win32Struct
{
    static sizeof => 1384

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<HRASCONN>}
     */
    hrasconn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {String}
     */
    szEntryName {
        get => StrGet(this.ptr + 16, 256, "UTF-16")
        set => StrPut(value, this.ptr + 16, 256, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 530, 16, "UTF-16")
        set => StrPut(value, this.ptr + 530, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 564, 128, "UTF-16")
        set => StrPut(value, this.ptr + 564, 128, "UTF-16")
    }

    /**
     * @type {String}
     */
    szPhonebook {
        get => StrGet(this.ptr + 822, 259, "UTF-16")
        set => StrPut(value, this.ptr + 822, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwSubEntry {
        get => NumGet(this, 1344, "uint")
        set => NumPut("uint", value, this, 1344)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidEntry {
        get => NumGet(this, 1352, "ptr")
        set => NumPut("ptr", value, this, 1352)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 1360, "uint")
        set => NumPut("uint", value, this, 1360)
    }

    /**
     * @type {LUID}
     */
    luid{
        get {
            if(!this.HasProp("__luid"))
                this.__luid := LUID(this.ptr + 1368)
            return this.__luid
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidCorrelationId {
        get => NumGet(this, 1376, "ptr")
        set => NumPut("ptr", value, this, 1376)
    }
}
