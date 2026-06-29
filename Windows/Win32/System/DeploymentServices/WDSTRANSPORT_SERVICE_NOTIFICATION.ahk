#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies what action needs to be taken when notifying WDS transport services, such as rereading their settings following a configuration change.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_service_notification
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDSTRANSPORT_SERVICE_NOTIFICATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default value that indicates that the notification type is not known.
     * @type {Integer (Int32)}
     */
    static WdsTptServiceNotifyUnknown => 0

    /**
     * Specifies that the WDS transport services should reread their settings to pick up recent updates.
     * @type {Integer (Int32)}
     */
    static WdsTptServiceNotifyReadSettings => 1
}
