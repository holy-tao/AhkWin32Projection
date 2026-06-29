#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible restart behaviors for an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-installationrebootbehavior
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct InstallationRebootBehavior {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The update never requires a system restart during or after an installation or an uninstallation.
     * @type {Integer (Int32)}
     */
    static irbNeverReboots => 0

    /**
     * The update always requires a system restart after a successful installation or uninstallation.
     * @type {Integer (Int32)}
     */
    static irbAlwaysRequiresReboot => 1

    /**
     * The update can request a system restart after a successful installation or uninstallation.
     * @type {Integer (Int32)}
     */
    static irbCanRequestReboot => 2
}
