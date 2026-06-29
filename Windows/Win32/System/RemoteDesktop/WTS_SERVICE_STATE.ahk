#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_RCM_SERVICE_STATE.ahk" { WTS_RCM_SERVICE_STATE }
#Import ".\WTS_RCM_DRAIN_STATE.ahk" { WTS_RCM_DRAIN_STATE }

/**
 * Contains information about changes in the state of the Remote Desktop Services service.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolmanager-notifyservicestatechange">NotifyServiceStateChange</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_service_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SERVICE_STATE {
    #StructPack 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_rcm_service_state">WTS_RCM_SERVICE_STATE</a> enumeration type that specifies whether the service is starting or stopping.
     */
    RcmServiceState : WTS_RCM_SERVICE_STATE

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wts_rcm_drain_state">WTS_RCM_DRAIN_STATE</a> enumeration type that specifies whether the  RD Session Host server is changing its drain state.
     */
    RcmDrainState : WTS_RCM_DRAIN_STATE

}
