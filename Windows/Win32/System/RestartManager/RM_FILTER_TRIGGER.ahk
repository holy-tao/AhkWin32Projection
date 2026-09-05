#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the restart or shutdown actions for an application or service.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ne-restartmanager-rm_filter_trigger
 * @namespace Windows.Win32.System.RestartManager
 */
class RM_FILTER_TRIGGER extends Win32Enum {

    /**
     * An invalid filter trigger.
     * Native name: RmFilterTriggerInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Modifies the shutdown or restart actions for an application identified by its   executable filename.
     * Native name: RmFilterTriggerFile
     * @type {Integer (Int32)}
     */
    static File => 1

    /**
     * Modifies the shutdown or restart actions for an application identified by a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure.
     * Native name: RmFilterTriggerProcess
     * @type {Integer (Int32)}
     */
    static Process => 2

    /**
     * Modifies the shutdown or restart actions for a service identified by a service short name.
     * Native name: RmFilterTriggerService
     * @type {Integer (Int32)}
     */
    static Service => 3
}
