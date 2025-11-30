#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies what action needs to be taken when notifying WDS transport services, such as rereading their settings following a configuration change.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_service_notification
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_SERVICE_NOTIFICATION extends Win32Enum{

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
