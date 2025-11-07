#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FLOWSPEC.ahk
#Include .\WSABUF.ahk

/**
 * The QOS structure provides the means by which QOS-enabled applications can specify quality of service parameters for sent and received traffic on a particular flow.
 * @remarks
 * 
 * Most applications can fulfill their quality of service requirements without using the 
 * <a href="https://docs.microsoft.com/previous-versions/aa374467(v=vs.80)">ProviderSpecific</a> buffer. However, if the application must provide information not available with standard Windows 2000 QOS parameters, the ProviderSpecific buffer allows the application to provide additional parameters for RSVP and/or traffic control.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-qos
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class QOS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Specifies QOS parameters for the sending direction of a particular flow. SendingFlowspec is sent in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure.
     * @type {FLOWSPEC}
     */
    SendingFlowspec{
        get {
            if(!this.HasProp("__SendingFlowspec"))
                this.__SendingFlowspec := FLOWSPEC(0, this)
            return this.__SendingFlowspec
        }
    }

    /**
     * Specifies QOS parameters for the receiving direction of a particular flow. ReceivingFlowspec is sent in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure.
     * @type {FLOWSPEC}
     */
    ReceivingFlowspec{
        get {
            if(!this.HasProp("__ReceivingFlowspec"))
                this.__ReceivingFlowspec := FLOWSPEC(32, this)
            return this.__ReceivingFlowspec
        }
    }

    /**
     * Pointer to a structure of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-wsabuf">WSABUF</a> that can provide additional provider-specific quality of service parameters to the RSVP SP for a given flow.
     * @type {WSABUF}
     */
    ProviderSpecific{
        get {
            if(!this.HasProp("__ProviderSpecific"))
                this.__ProviderSpecific := WSABUF(64, this)
            return this.__ProviderSpecific
        }
    }
}
