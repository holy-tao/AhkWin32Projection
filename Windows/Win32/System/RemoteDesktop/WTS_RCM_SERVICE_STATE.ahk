#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains information about the state of the Remote Desktop Services service.
 * @remarks
 * This enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_service_state">WTS_SERVICE_STATE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_rcm_service_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTS_RCM_SERVICE_STATE extends Win32Enum {

    /**
     * There has been no change in the state of the service.
     * Native name: WTS_SERVICE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The RCM service is starting.
     * Native name: WTS_SERVICE_START
     * @type {Integer (Int32)}
     */
    static START => 1

    /**
     * The RCM service is stopping.
     * Native name: WTS_SERVICE_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 2
}
