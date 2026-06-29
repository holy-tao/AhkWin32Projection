#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the restart or shutdown actions for an application or service.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ne-restartmanager-rm_filter_trigger
 * @namespace Windows.Win32.System.RestartManager
 */
export default struct RM_FILTER_TRIGGER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * An invalid filter trigger.
     * @type {Integer (Int32)}
     */
    static RmFilterTriggerInvalid => 0

    /**
     * Modifies the shutdown or restart actions for an application identified by its   executable filename.
     * @type {Integer (Int32)}
     */
    static RmFilterTriggerFile => 1

    /**
     * Modifies the shutdown or restart actions for an application identified by a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure.
     * @type {Integer (Int32)}
     */
    static RmFilterTriggerProcess => 2

    /**
     * Modifies the shutdown or restart actions for a service identified by a service short name.
     * @type {Integer (Int32)}
     */
    static RmFilterTriggerService => 3
}
