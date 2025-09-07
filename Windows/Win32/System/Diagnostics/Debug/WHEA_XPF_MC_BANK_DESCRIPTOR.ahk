#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XPF_MC_BANK_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_XPF_MC_BANK_DESCRIPTOR extends Win32Struct
{
    static sizeof => 29

    static packingSize => 1

    /**
     * @type {Integer}
     */
    BankNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ClearOnInitialization {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    StatusDataFormat {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {XPF_MC_BANK_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := XPF_MC_BANK_FLAGS(this.ptr + 3)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    ControlMsr {
        get => NumGet(this, 5, "uint")
        set => NumPut("uint", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    StatusMsr {
        get => NumGet(this, 9, "uint")
        set => NumPut("uint", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    AddressMsr {
        get => NumGet(this, 13, "uint")
        set => NumPut("uint", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    MiscMsr {
        get => NumGet(this, 17, "uint")
        set => NumPut("uint", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    ControlData {
        get => NumGet(this, 21, "uint")
        set => NumPut("uint", value, this, 21)
    }
}
