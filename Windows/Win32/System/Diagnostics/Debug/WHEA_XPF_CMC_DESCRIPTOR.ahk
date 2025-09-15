#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WHEA_NOTIFICATION_FLAGS.ahk
#Include .\WHEA_NOTIFICATION_DESCRIPTOR.ahk
#Include .\XPF_MC_BANK_FLAGS.ahk
#Include .\WHEA_XPF_MC_BANK_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_XPF_CMC_DESCRIPTOR extends Win32Struct
{
    static sizeof => 280

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
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {WHEA_NOTIFICATION_DESCRIPTOR}
     */
    Notify{
        get {
            if(!this.HasProp("__Notify"))
                this.__Notify := WHEA_NOTIFICATION_DESCRIPTOR(this.ptr + 8)
            return this.__Notify
        }
    }

    /**
     * @type {Array<WHEA_XPF_MC_BANK_DESCRIPTOR>}
     */
    Banks{
        get {
            if(!this.HasProp("__BanksProxyArray"))
                this.__BanksProxyArray := Win32FixedArray(this.ptr + 24, 32, WHEA_XPF_MC_BANK_DESCRIPTOR, "")
            return this.__BanksProxyArray
        }
    }
}
