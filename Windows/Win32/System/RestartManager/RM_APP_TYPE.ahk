#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of application that is described by the RM_PROCESS_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ne-restartmanager-rm_app_type
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_APP_TYPE{

    /**
     * The application cannot be classified as any other type. An application of this type can only be shut down by a forced shutdown.
     * @type {Integer (Int32)}
     */
    static RmUnknownApp => 0

    /**
     * A Windows application run as a stand-alone process that displays a top-level window.
     * @type {Integer (Int32)}
     */
    static RmMainWindow => 1

    /**
     * A Windows application that does not run as a stand-alone process and does not display a top-level window.
     * @type {Integer (Int32)}
     */
    static RmOtherWindow => 2

    /**
     * The application is a Windows service.
     * @type {Integer (Int32)}
     */
    static RmService => 3

    /**
     * The application is Windows Explorer.
     * @type {Integer (Int32)}
     */
    static RmExplorer => 4

    /**
     * The application is a stand-alone console application.
     * @type {Integer (Int32)}
     */
    static RmConsole => 5

    /**
     * A system restart is required to complete the installation because a process cannot be shut down. The process cannot be shut down because of the following reasons.  The process may be a critical process.  The current user may not have permission to shut down the process. The process may belong to the primary installer that started the Restart Manager.
     * @type {Integer (Int32)}
     */
    static RmCritical => 1000
}
