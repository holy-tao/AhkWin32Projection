#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_RECOVER_ACTION.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_SERVICE_NOTIFICATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VDS_RECOVER_ACTION}
     */
    action {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
