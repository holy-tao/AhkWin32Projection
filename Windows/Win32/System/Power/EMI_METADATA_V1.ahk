#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_metadata_v1
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_METADATA_V1 extends Win32Struct
{
    static sizeof => 76

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MeasurementUnit {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {String}
     */
    HardwareOEM {
        get => StrGet(this.ptr + 4, 15, "UTF-16")
        set => StrPut(value, this.ptr + 4, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    HardwareModel {
        get => StrGet(this.ptr + 36, 15, "UTF-16")
        set => StrPut(value, this.ptr + 36, 15, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    HardwareRevision {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    MeteredHardwareNameSize {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * @type {String}
     */
    MeteredHardwareName {
        get => StrGet(this.ptr + 72, 0, "UTF-16")
        set => StrPut(value, this.ptr + 72, 0, "UTF-16")
    }
}
