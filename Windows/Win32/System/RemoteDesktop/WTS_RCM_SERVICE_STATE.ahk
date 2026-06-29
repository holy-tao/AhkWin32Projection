#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the state of the Remote Desktop Services service.
 * @remarks
 * This enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_service_state">WTS_SERVICE_STATE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_rcm_service_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_RCM_SERVICE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * There has been no change in the state of the service.
     * @type {Integer (Int32)}
     */
    static WTS_SERVICE_NONE => 0

    /**
     * The RCM service is starting.
     * @type {Integer (Int32)}
     */
    static WTS_SERVICE_START => 1

    /**
     * The RCM service is stopping.
     * @type {Integer (Int32)}
     */
    static WTS_SERVICE_STOP => 2
}
