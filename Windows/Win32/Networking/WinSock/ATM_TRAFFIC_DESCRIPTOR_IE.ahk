#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ATM_TD.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ATM_TRAFFIC_DESCRIPTOR_IE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {ATM_TD}
     */
    Forward{
        get {
            if(!this.HasProp("__Forward"))
                this.__Forward := ATM_TD(0, this)
            return this.__Forward
        }
    }

    /**
     * @type {ATM_TD}
     */
    Backward{
        get {
            if(!this.HasProp("__Backward"))
                this.__Backward := ATM_TD(32, this)
            return this.__Backward
        }
    }

    /**
     * @type {BOOL}
     */
    BestEffort {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
