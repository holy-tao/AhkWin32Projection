#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about changes in the state of the Remote Desktop Services service.
 * @remarks
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifyservicestatechange">NotifyServiceStateChange</a> method.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_service_state
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_SERVICE_STATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_rcm_service_state">WTS_RCM_SERVICE_STATE</a> enumeration type that specifies whether the service is starting or stopping.
     * @type {Integer}
     */
    RcmServiceState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_rcm_drain_state">WTS_RCM_DRAIN_STATE</a> enumeration type that specifies whether the  RD Session Host server is changing its drain state.
     * @type {Integer}
     */
    RcmDrainState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
