#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WHEA_PCI_SLOT_NUMBER.ahk
#Include .\AER_ROOTPORT_DESCRIPTOR_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_AER_ROOTPORT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 38

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    BusNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {WHEA_PCI_SLOT_NUMBER}
     */
    Slot{
        get {
            if(!this.HasProp("__Slot"))
                this.__Slot := WHEA_PCI_SLOT_NUMBER(this.ptr + 8)
            return this.__Slot
        }
    }

    /**
     * @type {Integer}
     */
    DeviceControl {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {AER_ROOTPORT_DESCRIPTOR_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := AER_ROOTPORT_DESCRIPTOR_FLAGS(this.ptr + 14)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    UncorrectableErrorMask {
        get => NumGet(this, 18, "uint")
        set => NumPut("uint", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    UncorrectableErrorSeverity {
        get => NumGet(this, 22, "uint")
        set => NumPut("uint", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    CorrectableErrorMask {
        get => NumGet(this, 26, "uint")
        set => NumPut("uint", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    AdvancedCapsAndControl {
        get => NumGet(this, 30, "uint")
        set => NumPut("uint", value, this, 30)
    }

    /**
     * @type {Integer}
     */
    RootErrorCommand {
        get => NumGet(this, 34, "uint")
        set => NumPut("uint", value, this, 34)
    }
}
