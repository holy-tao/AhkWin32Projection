#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the action for which an update is explicitly deployed.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-deploymentaction
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct DeploymentAction {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No explicit deployment action is specified on the update. The update  inherits the value from its bundled updates.
     * @type {Integer (Int32)}
     */
    static daNone => 0

    /**
     * The update should be installed on the computer and/or for the specified user.
     * @type {Integer (Int32)}
     */
    static daInstallation => 1

    /**
     * The update should be uninstalled from the computer and/or for the specified user.
     * @type {Integer (Int32)}
     */
    static daUninstallation => 2

    /**
     * The update is deployed only to determine the applicability of the update. The update will not be installed.
     * @type {Integer (Int32)}
     */
    static daDetection => 3

    /**
     * The update may be installed on the computer and/or for the specified user.
     * @type {Integer (Int32)}
     */
    static daOptionalInstallation => 4
}
