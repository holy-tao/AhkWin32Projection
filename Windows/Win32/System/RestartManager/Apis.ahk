#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RestartManager {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CCH_RM_SESSION_KEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CCH_RM_MAX_APP_NAME => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CCH_RM_MAX_SVC_NAME => 63

    /**
     * @type {Integer (Int32)}
     */
    static RM_INVALID_TS_SESSION => -1

    /**
     * @type {Integer (Int32)}
     */
    static RM_INVALID_PROCESS => -1
;@endregion Constants

;@region Methods
    /**
     * Starts a new Restart Manager session.
     * @remarks
     * The <b>RmStartSession</b> function returns an error if a session with the same session key already exists.
     * 
     * The <b>RmStartSession</b> function should be called by the primary installer that controls the user interface or that controls the installation sequence of multiple patches in an update.
     * 
     * A secondary installer can join an existing Restart Manager session by calling the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmjoinsession">RmJoinSession</a> function with the session handle and session key returned from the <b>RmStartSession</b> function call of the primary installer.
     * @param {Pointer<UInt32>} pSessionHandle A pointer to the handle of a Restart Manager session. The session handle can be passed in subsequent calls to the Restart Manager API.
     * @param {Pointer<PWSTR>} strSessionKey A <b>null</b>-terminated string that contains the session key to the new session. The string must be allocated before calling  the <b>RmStartSession</b> function.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * <dt>121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager function could not obtain a Registry write mutex in the allotted time. A system restart is recommended because further use of the Restart Manager is likely to fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MAX_SESSIONS_REACHED</b></dt>
     * <dt>353</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of sessions has been reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT</b></dt>
     * <dt>29</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot write to the specified device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not complete because not enough memory was available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmstartsession
     * @since windows6.0.6000
     */
    static RmStartSession(pSessionHandle, strSessionKey) {
        static dwSessionFlags := 0 ;Reserved parameters must always be NULL

        result := DllCall("rstrtmgr.dll\RmStartSession", "ptr", pSessionHandle, "uint", dwSessionFlags, "ptr", strSessionKey, "uint")
        return result
    }

    /**
     * Joins a secondary installer to an existing Restart Manager session.
     * @remarks
     * The <b>RmJoinSession</b> function joins a secondary installer to an existing Restart Manager session. This is typically an installer that does not control the user interface and can run either in-process or out-of-process of the primary installer. Only the primary installer can call the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmstartsession">RmStartSession</a> function and this is typically the application that controls the user interface or that controls the installation sequence of multiple patches in an update.
     * @param {Pointer<UInt32>} pSessionHandle A pointer to the handle of an existing Restart Manager Session.
     * @param {Pointer<PWSTR>} strSessionKey A <b>null</b>-terminated string that contains the session key of an existing session.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SESSION_CREDENTIAL_CONFLICT</b></dt>
     * <dt>1219</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session key cannot be validated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * <dt>121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager function could not obtain a Registry write mutex in the allotted time. A system restart is recommended because further use of the Restart Manager is likely to fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>22</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT</b></dt>
     * <dt>29</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An operation was unable  to read or write to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MAX_SESSIONS_REACHED</b></dt>
     * <dt>353</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of sessions has been reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not complete because not enough memory was available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmjoinsession
     * @since windows6.0.6000
     */
    static RmJoinSession(pSessionHandle, strSessionKey) {
        result := DllCall("RstrtMgr.dll\RmJoinSession", "ptr", pSessionHandle, "ptr", strSessionKey, "uint")
        return result
    }

    /**
     * Ends the Restart Manager session.
     * @param {Integer} dwSessionHandle A handle to an existing Restart Manager session.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * <dt>121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager function could not obtain a Registry write mutex in the allotted time. A system restart is recommended because further use of the Restart Manager is likely to fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT</b></dt>
     * <dt>29</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An operation was unable  to read or write to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not complete because not enough memory was available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid handle was passed to the function. No Restart Manager session exists for the handle supplied.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmendsession
     * @since windows6.0.6000
     */
    static RmEndSession(dwSessionHandle) {
        result := DllCall("rstrtmgr.dll\RmEndSession", "uint", dwSessionHandle, "uint")
        return result
    }

    /**
     * Registers resources to a Restart Manager session.
     * @remarks
     * Each call to the <b>RmRegisterResources</b> function performs relatively expensive write operations. Do not call this function once per file, instead group related files together into components and register these together.
     * @param {Integer} dwSessionHandle A handle to an existing Restart Manager session.
     * @param {Integer} nFiles The number of files being registered.
     * @param {Pointer<PWSTR>} rgsFileNames An array of <b>null</b>-terminated strings of full filename paths. This parameter can be <b>NULL</b> if <i>nFiles</i> is 0.
     * @param {Integer} nApplications The number of processes being registered.
     * @param {Pointer<RM_UNIQUE_PROCESS>} rgApplications An array of <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structures. This parameter can be <b>NULL</b> if <i>nApplications</i> is 0.
     * @param {Integer} nServices The number of services to be registered.
     * @param {Pointer<PWSTR>} rgsServiceNames An array of <b>null</b>-terminated strings of service short names. This parameter can be <b>NULL</b> if <i>nServices</i> is 0.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resources specified have been registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * <dt>121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager function could not obtain a Registry write mutex in the allotted time. A system restart is recommended because further use of the Restart Manager is likely to fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by Restart Manager function if a <b>NULL</b> pointer or 0 is passed in a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT</b></dt>
     * <dt>29</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An operation was unable  to read or write to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not complete because not enough memory was available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  No Restart Manager session exists for the handle supplied.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmregisterresources
     * @since windows6.0.6000
     */
    static RmRegisterResources(dwSessionHandle, nFiles, rgsFileNames, nApplications, rgApplications, nServices, rgsServiceNames) {
        result := DllCall("rstrtmgr.dll\RmRegisterResources", "uint", dwSessionHandle, "uint", nFiles, "ptr", rgsFileNames, "uint", nApplications, "ptr", rgApplications, "uint", nServices, "ptr", rgsServiceNames, "uint")
        return result
    }

    /**
     * Gets a list of all applications and services that are currently using resources that have been registered with the Restart Manager session.
     * @param {Integer} dwSessionHandle A handle to an existing Restart Manager session.
     * @param {Pointer<UInt32>} pnProcInfoNeeded A pointer to an array size necessary to receive <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structures required to return information for all affected applications and services.
     * @param {Pointer<UInt32>} pnProcInfo A pointer to the total number of <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structures in an array and number of structures filled.
     * @param {Pointer<RM_PROCESS_INFO>} rgAffectedApps An array of <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structures that list the applications and services  using resources that have been registered with the session.
     * @param {Pointer<UInt32>} lpdwRebootReasons Pointer to location that receives a value of the  <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_reboot_reason">RM_REBOOT_REASON</a> enumeration that describes the reason a system restart is needed.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error value is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmgetlist">RmGetList</a> function if the <i>rgAffectedApps</i> buffer is too small to hold all application information in the list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * <dt>1223</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current operation is canceled by user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * <dt>121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager function could not obtain a Registry write mutex in the allotted time. A system restart is recommended because further use of the Restart Manager is likely to fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT</b></dt>
     * <dt>29</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An operation was unable  to read or write to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not complete because not enough memory was available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Restart Manager session exists for the handle supplied.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmgetlist
     * @since windows6.0.6000
     */
    static RmGetList(dwSessionHandle, pnProcInfoNeeded, pnProcInfo, rgAffectedApps, lpdwRebootReasons) {
        result := DllCall("rstrtmgr.dll\RmGetList", "uint", dwSessionHandle, "ptr", pnProcInfoNeeded, "ptr", pnProcInfo, "ptr", rgAffectedApps, "ptr", lpdwRebootReasons, "uint")
        return result
    }

    /**
     * Initiates the shutdown of applications.
     * @remarks
     * The <b>RmShutdown</b> function  calls <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmgetlist">RmGetList</a> and updates the list of processes currently using registered resources before attempting to shut down any processes. The  <b>RmShutdown</b> function then attempts to shut down the processes using registered resources in the most current list. The  <b>RmShutdown</b> function updates the <b>AppStatus</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structures that are returned by the <b>RmGetList</b> function with detailed status information.
     * 
     * The Restart Manager respects the privileges that separate different user or terminal sessions. An installer that is running as a service with LocalSystem privileges cannot shut down or restart any applications in another user or terminal session.  Installers should implement custom methods to shut down and restart applications that are running in other sessions. One method would be to start a new   installer process  in the other session to perform shutdown and restart operations.
     * 
     * Installers should always restart application and services using the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmrestart">RmRestart</a> function even when the <b>RmShutdown</b> function returns an error indicating that not all applications and services could be shut down.
     * @param {Integer} dwSessionHandle A handle to an existing Restart Manager session.
     * @param {Integer} lActionFlags One or more   <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_shutdown_type">RM_SHUTDOWN_TYPE</a> options that configure the shut down of components. The following values can be combined by an OR operator to specify that unresponsive applications and services are to be forced to shut down if, and only if, all applications have been registered for restart.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RmForceShutdown"></a><a id="rmforceshutdown"></a><a id="RMFORCESHUTDOWN"></a><dl>
     * <dt><b>RmForceShutdown</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Force unresponsive applications and services to shut down after the timeout period. An application that does not respond to a shutdown request is forced to shut down within 30 seconds. A service that does not respond to a shutdown request is forced to shut down after 20 seconds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RmShutdownOnlyRegistered"></a><a id="rmshutdownonlyregistered"></a><a id="RMSHUTDOWNONLYREGISTERED"></a><dl>
     * <dt><b>RmShutdownOnlyRegistered</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Shut down applications if and only if all the applications have been registered for restart  using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerapplicationrestart">RegisterApplicationRestart</a> function. If any processes or services cannot be restarted, then no processes or services are shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<RM_WRITE_STATUS_CALLBACK>} fnStatus A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nc-restartmanager-rm_write_status_callback">RM_WRITE_STATUS_CALLBACK</a> function that is used to communicate detailed status while this function is executing. If <b>NULL</b>, no status is provided.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All shutdown, restart, and callback operations were successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FAIL_NOACTION_REBOOT</b></dt>
     * <dt>350</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No shutdown actions were performed. One or more processes or services require a restart of the system to be shut down. This error code is returned when the Restart Manager detects that a restart of the system is required before shutting down any application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FAIL_SHUTDOWN</b></dt>
     * <dt>351</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some applications could not be shut down. The <b>AppStatus</b>  of the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structures returned by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmgetlist">RmGetList</a> function contain updated status information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * <dt>1223</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  This error value is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmshutdown">RmShutdown</a> function when the request to cancel an operation is successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * <dt>121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager function could not obtain a Registry write mutex in the allotted time. A system restart is recommended because further use of the Restart Manager is likely to fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct.  This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT</b></dt>
     * <dt>29</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An operation was unable  to read or write to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not be completed because not enough memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Restart Manager session exists for the handle supplied.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmshutdown
     * @since windows6.0.6000
     */
    static RmShutdown(dwSessionHandle, lActionFlags, fnStatus) {
        result := DllCall("rstrtmgr.dll\RmShutdown", "uint", dwSessionHandle, "uint", lActionFlags, "ptr", fnStatus, "uint")
        return result
    }

    /**
     * Restarts applications and services that have been shut down by the RmShutdown function and that have been registered to be restarted using the RegisterApplicationRestart function.
     * @remarks
     * After calling the <b>RmRestart</b> function, the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structures that are returned by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmgetlist">RmGetList</a> function contain updated status information.  
     * 
     * The Restart Manager respects the privileges that separate different user or terminal sessions. An installer that is running as a service with LocalSystem privileges cannot shut down or restart any applications in another user or terminal session.  Installers should implement custom methods to shut down and restart applications that are running in other sessions. One method would be to start a new   installer process  in the other session to perform shutdown and restart operations.
     * 
     * When a console application is shut down and restarted by Restart Manager, the application is restarted in a new console.
     * 
     * Installers should always restart application and services using the <b>RmRestart</b> function even when the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmshutdown">RmShutdown</a> function returns an error indicating that not all applications and services could be shut down.
     * 
     * The <b>RmRestart</b> function does not restart any applications that run with elevated privileges. Even if the application was shutdown by Restart Manager. 
     * 
     * 
     *  The <b>RmRestart</b> function does not restart any applications that do not run as the currently-logged on user. Even if the application was shutdown by Restart Manager. For example, the <b>RmRestart</b> function does not restart applications started with the <b>Run As</b> command that do not run as the currently-logged on user. These applications must be manually restarted.
     * @param {Integer} dwSessionHandle A handle to the existing Restart Manager session.
     * @param {Pointer<RM_WRITE_STATUS_CALLBACK>} fnStatus A pointer to a status message callback function that is used to communicate status while the <b>RmRestart</b> function is running. If <b>NULL</b>, no status is provided.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REQUEST_OUT_OF_SEQUENCE</b></dt>
     * <dt>776</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error value is returned if the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmrestart">RmRestart</a> function is called with a valid session handle before calling the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmshutdown">RmShutdown</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FAIL_RESTART</b></dt>
     * <dt>352</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more applications could not be restarted. The <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structures that are returned by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmgetlist">RmGetList</a> function contain updated status information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * <dt>121</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager function could not obtain a registry write mutex in the allotted time. A system restart is recommended because further use of the Restart Manager is likely to fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * <dt>1223</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error value is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmrestart">RmRestart</a> function when the request to cancel an operation is successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WRITE_FAULT</b></dt>
     * <dt>29</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An operation was unable  to read or write to the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not complete because not enough memory was available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Restart Manager session exists for the handle supplied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeds and returns.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmrestart
     * @since windows6.0.6000
     */
    static RmRestart(dwSessionHandle, fnStatus) {
        static dwRestartFlags := 0 ;Reserved parameters must always be NULL

        result := DllCall("rstrtmgr.dll\RmRestart", "uint", dwSessionHandle, "uint", dwRestartFlags, "ptr", fnStatus, "uint")
        return result
    }

    /**
     * Cancels the current RmShutdown or RmRestart operation. This function must be called from the application that has started the session by calling the RmStartSession function.
     * @param {Integer} dwSessionHandle A handle to an existing session.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A cancellation of the current operation is requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Restart Manager operation could not complete because not enough memory was available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Restart Manager session exists for the handle supplied.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmcancelcurrenttask
     * @since windows6.0.6000
     */
    static RmCancelCurrentTask(dwSessionHandle) {
        result := DllCall("RstrtMgr.dll\RmCancelCurrentTask", "uint", dwSessionHandle, "uint")
        return result
    }

    /**
     * Modifies the shutdown or restart actions that are applied to an application or service.
     * @param {Integer} dwSessionHandle A handle to an existing Restart Manager session.
     * @param {Pointer<PWSTR>} strModuleName A pointer to a <b>null</b>-terminated string value that contains the full path to the application's executable file. Modifications to shutdown or restart actions are applied for the application that is referenced by the full path.  This parameter must be <b>NULL</b> if the <i>Application</i> or <i>strServiceShortName</i> parameter is non-<b>NULL</b>.
     * @param {Pointer<RM_UNIQUE_PROCESS>} pProcess A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure for the application.  Modifications to shutdown or restart actions are applied for the application that is referenced by the <b>RM_UNIQUE_PROCESS</b> structure. This parameter must be <b>NULL</b> if the <i>strFilename</i>  or <i>strShortServiceName</i> parameter is non-<b>NULL</b>.
     * @param {Pointer<PWSTR>} strServiceShortName A pointer to a <b>null</b>-terminated string value that contains the short service name. Modifications to shutdown or restart actions are applied for the service that is referenced by short service filename.  This parameter must be <b>NULL</b> if the <i>strFilename</i> or <i>Application</i> parameter is non-<b>NULL</b>.
     * @param {Integer} FilterAction An <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_filter_action">RM_FILTER_ACTION</a> enumeration value that specifies the type of modification to be applied.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in as a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SESSION_CREDENTIAL_CONFLICT</b></dt>
     * <dt> 1219</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned when a secondary installer calls this function. This function is only available to primary installers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmaddfilter
     * @since windows6.0.6000
     */
    static RmAddFilter(dwSessionHandle, strModuleName, pProcess, strServiceShortName, FilterAction) {
        result := DllCall("RstrtMgr.dll\RmAddFilter", "uint", dwSessionHandle, "ptr", strModuleName, "ptr", pProcess, "ptr", strServiceShortName, "int", FilterAction, "uint")
        return result
    }

    /**
     * Removes any modifications to shutdown or restart actions that have been applied using the RmAddFilter function.
     * @param {Integer} dwSessionHandle A handle to an existing Restart Manager session.
     * @param {Pointer<PWSTR>} strModuleName A pointer to a <b>null</b>-terminated string value that contains the full path for the application's  executable file. The <b>RmRemoveFilter</b> function removes any modifications to the referenced application's shutdown or restart actions previously applied by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmaddfilter">RmAddFilter</a> function.  This parameter must be <b>NULL</b> if the <i>Application</i> or <i>strServiceShortName</i> parameter is non-<b>NULL</b>.
     * @param {Pointer<RM_UNIQUE_PROCESS>} pProcess The <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure for the application. The <b>RmRemoveFilter</b> function removes any modifications to the referenced application's shutdown or restart actions previously applied by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmaddfilter">RmAddFilter</a> function.  This parameter must be <b>NULL</b> if the <i>strFilename</i>  or <i>strShortServiceName</i> parameter is non-<b>NULL</b>.
     * @param {Pointer<PWSTR>} strServiceShortName A pointer to a <b>null</b>-terminated string value that contains the short service name.  The <b>RmRemoveFilter</b> function removes any modifications to the referenced service's shutdown or restart actions previously applied by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmaddfilter">RmAddFilter</a> function.  This parameter must be <b>NULL</b> if the <i>strFilename</i> or <i>Application</i> parameter is non-<b>NULL</b>.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified filter could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SESSION_CREDENTIAL_CONFLICT</b></dt>
     * <dt> 1219</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned when a secondary installer calls this function. This function is only available to primary installers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmremovefilter
     * @since windows6.0.6000
     */
    static RmRemoveFilter(dwSessionHandle, strModuleName, pProcess, strServiceShortName) {
        result := DllCall("RstrtMgr.dll\RmRemoveFilter", "uint", dwSessionHandle, "ptr", strModuleName, "ptr", pProcess, "ptr", strServiceShortName, "uint")
        return result
    }

    /**
     * Lists the modifications to shutdown and restart actions that have already been applied by the RmAddFilter function.
     * @remarks
     * The returned <i>pbFilterBuf</i> buffer has to be typecast to <b>RM_FILTER_INFO</b> to access the filter list.
     * @param {Integer} dwSessionHandle A handle to an existing Restart Manager session.
     * @param {Pointer<Byte>} pbFilterBuf A pointer to a buffer that contains modification information.
     * @param {Integer} cbFilterBuf The size of the buffer that contains modification information in bytes.
     * @param {Pointer<UInt32>} cbFilterBufNeeded The number of bytes needed in the buffer.
     * @returns {Integer} This is the most recent error received. The function can return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> that are defined in Winerror.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * <dt>160</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not correct. This error value is returned by the Restart Manager function if a <b>NULL</b> pointer or 0 is passed in as a parameter that requires a non-<b>null</b> and non-zero value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error value is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmgetfilterlist">RmGetFilterList</a> function if the <i>pbFilterBuf</i> buffer is too small to hold all the application information in the list or if <i>cbFilterBufNeeded</i> was not specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SESSION_CREDENTIAL_CONFLICT</b></dt>
     * <dt> 1219</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned when a secondary installer calls this function. This function is only available to primary installers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nf-restartmanager-rmgetfilterlist
     * @since windows6.0.6000
     */
    static RmGetFilterList(dwSessionHandle, pbFilterBuf, cbFilterBuf, cbFilterBufNeeded) {
        result := DllCall("RstrtMgr.dll\RmGetFilterList", "uint", dwSessionHandle, "ptr", pbFilterBuf, "uint", cbFilterBuf, "ptr", cbFilterBufNeeded, "uint")
        return result
    }

;@endregion Methods
}
