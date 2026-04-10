#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOMAIN_CONFIGURATION_ARCH.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DOMAIN_CONFIGURATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {DOMAIN_CONFIGURATION_ARCH}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Arm64 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    X64 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
