#Requires AutoHotkey v2.0.0 64-bit

/**
 * Configures the shut down of applications.
 * @remarks
 * 
 * The  time to wait before initiating a forced shutdown of applications is specified by the following registry key. <b>HKCU</b>&#92;<b>Control Panel</b>&#92;<b>Desktop</b>&#92;<b>HungAppTimeout</b>
 * 
 * 
 * 
 * The time to wait before initiating a forced shutdown of services is specified by the following registry key. <b>HKLM</b>&#92;<b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Control</b>&#92;<b>WaitToKillServiceTimeout</b>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//restartmanager/ne-restartmanager-rm_shutdown_type
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_SHUTDOWN_TYPE{

    /**
     * Forces unresponsive applications and services to shut down after the timeout period. An application that does not respond to a shutdown request by the Restart Manager is forced to shut down after 30 seconds. A service that does not respond to a shutdown request is forced to shut down after 20 seconds. These default times can be changed by modifying the registry keys described in the Remarks section.
     * @type {Integer (Int32)}
     */
    static RmForceShutdown => 1

    /**
     * Shuts down applications if and only if all the applications have been registered for restart  using the <b>RegisterApplicationRestart</b> function. If any processes or services cannot be restarted, then no processes or services are shut down.
     * @type {Integer (Int32)}
     */
    static RmShutdownOnlyRegistered => 16
}
