#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_LIMIT_TYPES.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class POWER_LIMIT_VALUE extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {POWER_LIMIT_TYPES}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DomainId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TargetValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TimeParameter {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
