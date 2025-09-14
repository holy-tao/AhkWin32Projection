#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDDEVICEIDENTIFIER extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * @type {Array<SByte>}
     */
    szDriver{
        get {
            if(!this.HasProp("__szDriverProxyArray"))
                this.__szDriverProxyArray := Win32FixedArray(this.ptr + 0, 512, Primitive, "char")
            return this.__szDriverProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDescription{
        get {
            if(!this.HasProp("__szDescriptionProxyArray"))
                this.__szDescriptionProxyArray := Win32FixedArray(this.ptr + 512, 512, Primitive, "char")
            return this.__szDescriptionProxyArray
        }
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
     * @type {Pointer<Guid>}
     */
    guidDeviceIdentifier {
        get => NumGet(this, 1048, "ptr")
        set => NumPut("ptr", value, this, 1048)
    }
}
