#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ATM_CONNECTION_ID.ahk
#Include .\FLOWSPEC.ahk
#Include .\WSABUF.ahk
#Include .\QOS.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ATM_PVC_PARAMS extends Win32Struct
{
    static sizeof => 92

    static packingSize => 4

    /**
     * @type {ATM_CONNECTION_ID}
     */
    PvcConnectionId{
        get {
            if(!this.HasProp("__PvcConnectionId"))
                this.__PvcConnectionId := ATM_CONNECTION_ID(this.ptr + 0)
            return this.__PvcConnectionId
        }
    }

    /**
     * @type {QOS}
     */
    PvcQos{
        get {
            if(!this.HasProp("__PvcQos"))
                this.__PvcQos := QOS(this.ptr + 12)
            return this.__PvcQos
        }
    }
}
