#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FAULT_INFORMATION_ARM64_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class FAULT_INFORMATION_X64 extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    DomainHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    FaultAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {FAULT_INFORMATION_ARM64_TYPE}
     */
    Type {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    IommuBaseAddress {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    PciSegment {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
