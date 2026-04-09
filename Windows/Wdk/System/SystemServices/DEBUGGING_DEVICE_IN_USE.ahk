#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KD_NAMESPACE_ENUM.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEBUGGING_DEVICE_IN_USE extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {KD_NAMESPACE_ENUM}
     */
    NameSpace {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StructureLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    AcpiDevice {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    PciDevice {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
