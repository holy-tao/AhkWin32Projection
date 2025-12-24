#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_TPH_REQUESTER_CAPABILITY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<PCI_EXPRESS_ENHANCED_CAPABILITY_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_TPH_REQUESTER_CAPABILITY_REGISTER>}
     */
    RequesterCapability {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PCI_EXPRESS_TPH_REQUESTER_CONTROL_REGISTER>}
     */
    RequesterControl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
