#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDDEVICEIDENTIFIER extends Win32Struct
{
    static sizeof => 2080

    static packingSize => 8

    /**
     * @type {String}
     */
    szDriver {
        get => StrGet(this.ptr + 0, 511, "UTF-16")
        set => StrPut(value, this.ptr + 0, 511, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 1024, 511, "UTF-16")
        set => StrPut(value, this.ptr + 1024, 511, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    liDriverVersion {
        get => NumGet(this, 2048, "int64")
        set => NumPut("int64", value, this, 2048)
    }

    /**
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 2056, "uint")
        set => NumPut("uint", value, this, 2056)
    }

    /**
     * @type {Integer}
     */
    dwDeviceId {
        get => NumGet(this, 2060, "uint")
        set => NumPut("uint", value, this, 2060)
    }

    /**
     * @type {Integer}
     */
    dwSubSysId {
        get => NumGet(this, 2064, "uint")
        set => NumPut("uint", value, this, 2064)
    }

    /**
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 2068, "uint")
        set => NumPut("uint", value, this, 2068)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidDeviceIdentifier {
        get => NumGet(this, 2072, "ptr")
        set => NumPut("ptr", value, this, 2072)
    }
}
