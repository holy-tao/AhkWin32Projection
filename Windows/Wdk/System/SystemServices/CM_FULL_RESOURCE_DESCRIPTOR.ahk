#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INTERFACE_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class CM_FULL_RESOURCE_DESCRIPTOR extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {INTERFACE_TYPE}
     */
    InterfaceType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BusNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    PartialResourceList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
