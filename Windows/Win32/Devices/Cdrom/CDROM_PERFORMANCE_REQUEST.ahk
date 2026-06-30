#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CDROM_PERFORMANCE_TYPE.ahk
#Include .\CDROM_PERFORMANCE_REQUEST_TYPE.ahk
#Include .\CDROM_PERFORMANCE_EXCEPTION_TYPE.ahk
#Include .\CDROM_PERFORMANCE_TOLERANCE_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class CDROM_PERFORMANCE_REQUEST extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {CDROM_PERFORMANCE_REQUEST_TYPE}
     */
    RequestType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {CDROM_PERFORMANCE_TYPE}
     */
    PerformanceType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {CDROM_PERFORMANCE_EXCEPTION_TYPE}
     */
    Exceptions {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {CDROM_PERFORMANCE_TOLERANCE_TYPE}
     */
    Tolerance {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    StaringLba {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
