#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\HRASCONN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 * @architecture X64, Arm64
 */
class RASCONNA extends Win32Struct {
    static sizeof => 728

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
        get => StrGet(this.ptr + 16, 256, "UTF-8")
        set => StrPut(value, this.ptr + 16, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 273, 16, "UTF-8")
        set => StrPut(value, this.ptr + 273, 16, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 290, 128, "UTF-8")
        set => StrPut(value, this.ptr + 290, 128, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPhonebook {
        get => StrGet(this.ptr + 419, 259, "UTF-8")
        set => StrPut(value, this.ptr + 419, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwSubEntry {
        get => NumGet(this, 680, "uint")
        set => NumPut("uint", value, this, 680)
    }

    /**
     * @type {Guid}
     */
    guidEntry {
        get {
            if(!this.HasProp("__guidEntry"))
                this.__guidEntry := Guid(684, this)
            return this.__guidEntry
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 700, "uint")
        set => NumPut("uint", value, this, 700)
    }

    /**
     * @type {LUID}
     */
    luid {
        get {
            if(!this.HasProp("__luid"))
                this.__luid := LUID(704, this)
            return this.__luid
        }
    }

    /**
     * @type {Guid}
     */
    guidCorrelationId {
        get {
            if(!this.HasProp("__guidCorrelationId"))
                this.__guidCorrelationId := Guid(712, this)
            return this.__guidCorrelationId
        }
    }
}
