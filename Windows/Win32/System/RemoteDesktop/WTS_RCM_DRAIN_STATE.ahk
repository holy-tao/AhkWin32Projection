#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains information about the drain state of the Remote Desktop Session Host (RD Session Host) server.
 * @remarks
 * This enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_service_state">WTS_SERVICE_STATE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_rcm_drain_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTS_RCM_DRAIN_STATE extends Win32Enum {

    /**
     * There has been no change in the drain state.
     * Native name: WTS_DRAIN_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The server is in drain mode, or it is entering drain mode. (It is not accepting new connections.)
     * Native name: WTS_DRAIN_IN_DRAIN
     * @type {Integer (Int32)}
     */
    static IN_DRAIN => 1

    /**
     * The server is not in drain mode, or it is exiting drain mode. (It is accepting new connections.)
     * Native name: WTS_DRAIN_NOT_IN_DRAIN
     * @type {Integer (Int32)}
     */
    static NOT_IN_DRAIN => 2
}
