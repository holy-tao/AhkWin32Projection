#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of modification that is applied to restart or shutdown actions.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ne-restartmanager-rm_filter_action
 * @namespace Windows.Win32.System.RestartManager
 */
export default struct RM_FILTER_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * An invalid filter action.
     * @type {Integer (Int32)}
     */
    static RmInvalidFilterAction => 0

    /**
     * Prevents the restart of the specified application or service.
     * @type {Integer (Int32)}
     */
    static RmNoRestart => 1

    /**
     * Prevents the shut down and restart of the specified application or service.
     * @type {Integer (Int32)}
     */
    static RmNoShutdown => 2
}
