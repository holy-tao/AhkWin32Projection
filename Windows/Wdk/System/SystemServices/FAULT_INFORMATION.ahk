#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FAULT_INFORMATION_ARCH.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class FAULT_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {FAULT_INFORMATION_ARCH}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    IsStage1 {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
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
