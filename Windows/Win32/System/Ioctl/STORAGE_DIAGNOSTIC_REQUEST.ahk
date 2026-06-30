#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_DIAGNOSTIC_LEVEL.ahk
#Include .\STORAGE_DIAGNOSTIC_TARGET_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DIAGNOSTIC_REQUEST extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {STORAGE_DIAGNOSTIC_TARGET_TYPE}
     */
    TargetType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {STORAGE_DIAGNOSTIC_LEVEL}
     */
    Level {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
