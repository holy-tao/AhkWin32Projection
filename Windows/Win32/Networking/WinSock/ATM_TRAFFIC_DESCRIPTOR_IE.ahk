#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
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
                this.__Forward := ATM_TD(this.ptr + 0)
            return this.__Forward
        }
    }

    /**
     * @type {ATM_TD}
     */
    Backward{
        get {
            if(!this.HasProp("__Backward"))
                this.__Backward := ATM_TD(this.ptr + 32)
            return this.__Backward
        }
    }

    /**
     * @type {BOOL}
     */
    BestEffort{
        get {
            if(!this.HasProp("__BestEffort"))
                this.__BestEffort := BOOL(this.ptr + 60)
            return this.__BestEffort
        }
    }
}
