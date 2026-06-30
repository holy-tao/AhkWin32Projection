#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\HRASCONN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 * @architecture X64, Arm64
 */
class RASCONNW extends Win32Struct {
    static sizeof => 1392

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HRASCONN}
     */
    hrasconn {
        get {
            if(!this.HasProp("__hrasconn"))
                this.__hrasconn := HRASCONN(8, this)
            return this.__hrasconn
        }
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
     * @type {Guid}
     */
    guidEntry {
        get {
            if(!this.HasProp("__guidEntry"))
                this.__guidEntry := Guid(1348, this)
            return this.__guidEntry
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 1364, "uint")
        set => NumPut("uint", value, this, 1364)
    }

    /**
     * @type {LUID}
     */
    luid {
        get {
            if(!this.HasProp("__luid"))
                this.__luid := LUID(1368, this)
            return this.__luid
        }
    }

    /**
     * @type {Guid}
     */
    guidCorrelationId {
        get {
            if(!this.HasProp("__guidCorrelationId"))
                this.__guidCorrelationId := Guid(1376, this)
            return this.__guidCorrelationId
        }
    }
}
