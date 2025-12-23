#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ATM_ADDRESS.ahk
#Include .\ATM_BLLI.ahk
#Include .\ATM_BHLI.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_ATM extends Win32Struct
{
    static sizeof => 76

    static packingSize => 4

    /**
     * @type {Integer}
     */
    satm_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {ATM_ADDRESS}
     */
    satm_number{
        get {
            if(!this.HasProp("__satm_number"))
                this.__satm_number := ATM_ADDRESS(4, this)
            return this.__satm_number
        }
    }

    /**
     * @type {ATM_BLLI}
     */
    satm_blli{
        get {
            if(!this.HasProp("__satm_blli"))
                this.__satm_blli := ATM_BLLI(32, this)
            return this.__satm_blli
        }
    }

    /**
     * @type {ATM_BHLI}
     */
    satm_bhli{
        get {
            if(!this.HasProp("__satm_bhli"))
                this.__satm_bhli := ATM_BHLI(60, this)
            return this.__satm_bhli
        }
    }
}
