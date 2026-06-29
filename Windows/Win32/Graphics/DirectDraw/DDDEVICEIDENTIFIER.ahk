#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDDEVICEIDENTIFIER extends Win32Struct {
    static sizeof => 1064

    static packingSize => 8

    /**
     * @type {String}
     */
    szDriver {
        get => StrGet(this.ptr + 0, 511, "UTF-8")
        set => StrPut(value, this.ptr + 0, 511, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 512, 511, "UTF-8")
        set => StrPut(value, this.ptr + 512, 511, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    liDriverVersion {
        get => NumGet(this, 1024, "int64")
        set => NumPut("int64", value, this, 1024)
    }

    /**
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 1032, "uint")
        set => NumPut("uint", value, this, 1032)
    }

    /**
     * @type {Integer}
     */
    dwDeviceId {
        get => NumGet(this, 1036, "uint")
        set => NumPut("uint", value, this, 1036)
    }

    /**
     * @type {Integer}
     */
    dwSubSysId {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }

    /**
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 1044, "uint")
        set => NumPut("uint", value, this, 1044)
    }

    /**
     * @type {Guid}
     */
    guidDeviceIdentifier {
        get {
            if(!this.HasProp("__guidDeviceIdentifier"))
                this.__guidDeviceIdentifier := Guid(1048, this)
            return this.__guidDeviceIdentifier
        }
    }
}
