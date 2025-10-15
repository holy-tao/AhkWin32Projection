#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XPF_MCE_FLAGS.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk
#Include .\XPF_MC_BANK_FLAGS.ahk
#Include .\WHEA_XPF_MC_BANK_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_XPF_MCE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

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
    NumberOfBanks {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {XPF_MCE_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := XPF_MCE_FLAGS(this.ptr + 8)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    MCG_Capability {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MCG_GlobalControl {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<WHEA_XPF_MC_BANK_DESCRIPTOR>}
     */
    Banks{
        get {
            if(!this.HasProp("__BanksProxyArray"))
                this.__BanksProxyArray := Win32FixedArray(this.ptr + 32, 32, WHEA_XPF_MC_BANK_DESCRIPTOR, "")
            return this.__BanksProxyArray
        }
    }
}
