#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Networking\WinSock\FLOWSPEC.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class CO_CALL_MANAGER_PARAMETERS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {FLOWSPEC}
     */
    Transmit{
        get {
            if(!this.HasProp("__Transmit"))
                this.__Transmit := FLOWSPEC(0, this)
            return this.__Transmit
        }
    }

    /**
     * @type {FLOWSPEC}
     */
    Receive{
        get {
            if(!this.HasProp("__Receive"))
                this.__Receive := FLOWSPEC(32, this)
            return this.__Receive
        }
    }

    /**
     * @type {Pointer<CO_SPECIFIC_PARAMETERS>}
     */
    CallMgrSpecific {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
