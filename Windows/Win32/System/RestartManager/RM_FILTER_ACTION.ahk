#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of modification that is applied to restart or shutdown actions.
 * @see https://docs.microsoft.com/windows/win32/api//restartmanager/ne-restartmanager-rm_filter_action
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_FILTER_ACTION extends Win32Enum{

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
