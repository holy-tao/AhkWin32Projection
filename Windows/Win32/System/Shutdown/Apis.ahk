#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Shutdown
 * @version v4.0.30319
 */
class Shutdown {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_REASON_NAME_LEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_REASON_DESC_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_REASON_BUGID_LEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_REASON_COMMENT_LEN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_TYPE_LEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_SHOWREASONUI_NEVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_SHOWREASONUI_ALWAYS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_SHOWREASONUI_WORKSTATIONONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_SHOWREASONUI_SERVERONLY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNAPSHOT_POLICY_NEVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNAPSHOT_POLICY_ALWAYS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNAPSHOT_POLICY_UNPLANNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NUM_REASONS => 256
;@endregion Constants

;@region Methods
    /**
     * Initiates a shutdown and optional restart of the specified computer. (ANSI)
     * @remarks
     * To shut down the local computer, the calling thread must have the <b>SE_SHUTDOWN_NAME</b> privilege. To shut down a remote computer, the calling thread must have the <b>SE_REMOTE_SHUTDOWN_NAME</b> privilege on the remote computer. By default, users can enable the <b>SE_SHUTDOWN_NAME</b> privilege on the computer they are logged onto, and administrators can enable the <b>SE_REMOTE_SHUTDOWN_NAME</b> privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid or inaccessible computer name or insufficient privilege. The error <b>ERROR_SHUTDOWN_IN_PROGRESS</b> is returned if a shutdown is already in progress on the specified computer. The error <b>ERROR_NOT_READY</b> can be returned if fast-user switching is enabled but no user is logged on.
     * 
     * A non-zero return value does not mean the logoff was or will be successful. The shutdown is an asynchronous process, and it can occur long  after the API call has returned, or not  at all. Even if the timeout value is zero,  the shutdown can still be aborted by applications, services or even the system. The non-zero return value indicates that the validation of the rights and parameters was  successful and that the system accepted the shutdown request.
     * 
     * When this function is called, the caller must specify whether or not applications with unsaved changes should be forcibly closed.  If the caller chooses not to force these applications closed, and an application with unsaved changes is running on the console session, the shutdown will remain in progress until the user logged into the console session aborts the shutdown, saves changes, closes the application, or forces the application to close.  During this period, the shutdown may not be aborted except by the console user, and another shutdown may not be initiated.
     * 
     * Note that calling this function with the value of the <i>bForceAppsClosed</i> parameter set to <b>TRUE</b> avoids this situation. Remember that doing this  may result in loss of data.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the computer is locked and the <i>bForceAppsClosed</i> parameter is <b>FALSE</b>, the last error code is <b>ERROR_MACHINE_LOCKED</b>. If the system is not ready to handle the request, the last error code is <b>ERROR_NOT_READY</b>. The application should wait a short while and retry the call. For example, the system can be unready to initiate a shutdown, and return <b>ERROR_NOT_READY</b>,  if the shutdown request comes at the same time a user tries to log onto the system. In this case, the application should wait a short while and retry the call.
     * @param {PSTR} lpMachineName The network name of the computer to be shut down. If <i>lpMachineName</i> is <b>NULL</b> or an empty string, the function shuts down the local computer.
     * @param {PSTR} lpMessage The  message to be displayed in the shutdown dialog box. This parameter can be <b>NULL</b> if no message is required.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This string is also stored as a comment in the event log entry.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The string is limited to 3072 <b>TCHARs</b>.
     * @param {Integer} dwTimeout The length of time that the shutdown dialog box should be displayed, in seconds. While this dialog box is displayed, the shutdown can be stopped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a> function.
     * 
     * If <i>dwTimeout</i> is not zero, 
     * <b>InitiateSystemShutdown</b> displays a dialog box on the specified computer. The dialog box displays the name of the user who called the function, displays the message specified by the <i>lpMessage</i> parameter, and prompts the user to log off. The dialog box beeps when it is created and remains on top of other windows in the system. The dialog box can be moved but not closed. A timer counts down the remaining time before a forced shutdown.
     * 
     * If <i>dwTimeout</i> is zero, the computer shuts down without displaying the dialog box, and the shutdown cannot be stopped by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a>.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The time-out value is limited to <b>MAX_SHUTDOWN_TIMEOUT</b> seconds.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>If the computer to be shut down is a Terminal Services server, the system displays a dialog box to all local and remote users warning them that shutdown has been initiated. The dialog box includes who requested the shutdown, the display message (see <i>lpMessage</i>), and how much time there is until the server is shut down.
     * @param {BOOL} bForceAppsClosed If this parameter is <b>TRUE</b>, applications with unsaved changes are to be forcibly closed. Note that this can result in data loss.
     * 
     * If this parameter is <b>FALSE</b>, the system displays a dialog box instructing the user to close the applications.
     * @param {BOOL} bRebootAfterShutdown If this parameter is <b>TRUE</b>, the computer is to restart immediately after shutting down. If this parameter is <b>FALSE</b>, the system flushes all caches to disk  and  safely powers down the system.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-initiatesystemshutdowna
     * @since windows5.1.2600
     */
    static InitiateSystemShutdownA(lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\InitiateSystemShutdownA", "ptr", lpMachineName, "ptr", lpMessage, "uint", dwTimeout, "int", bForceAppsClosed, "int", bRebootAfterShutdown, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a shutdown and optional restart of the specified computer. (Unicode)
     * @remarks
     * To shut down the local computer, the calling thread must have the <b>SE_SHUTDOWN_NAME</b> privilege. To shut down a remote computer, the calling thread must have the <b>SE_REMOTE_SHUTDOWN_NAME</b> privilege on the remote computer. By default, users can enable the <b>SE_SHUTDOWN_NAME</b> privilege on the computer they are logged onto, and administrators can enable the <b>SE_REMOTE_SHUTDOWN_NAME</b> privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid or inaccessible computer name or insufficient privilege. The error <b>ERROR_SHUTDOWN_IN_PROGRESS</b> is returned if a shutdown is already in progress on the specified computer. The error <b>ERROR_NOT_READY</b> can be returned if fast-user switching is enabled but no user is logged on.
     * 
     * A non-zero return value does not mean the logoff was or will be successful. The shutdown is an asynchronous process, and it can occur long  after the API call has returned, or not  at all. Even if the timeout value is zero,  the shutdown can still be aborted by applications, services or even the system. The non-zero return value indicates that the validation of the rights and parameters was  successful and that the system accepted the shutdown request.
     * 
     * When this function is called, the caller must specify whether or not applications with unsaved changes should be forcibly closed.  If the caller chooses not to force these applications closed, and an application with unsaved changes is running on the console session, the shutdown will remain in progress until the user logged into the console session aborts the shutdown, saves changes, closes the application, or forces the application to close.  During this period, the shutdown may not be aborted except by the console user, and another shutdown may not be initiated.
     * 
     * Note that calling this function with the value of the <i>bForceAppsClosed</i> parameter set to <b>TRUE</b> avoids this situation. Remember that doing this  may result in loss of data.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the computer is locked and the <i>bForceAppsClosed</i> parameter is <b>FALSE</b>, the last error code is <b>ERROR_MACHINE_LOCKED</b>. If the system is not ready to handle the request, the last error code is <b>ERROR_NOT_READY</b>. The application should wait a short while and retry the call. For example, the system can be unready to initiate a shutdown, and return <b>ERROR_NOT_READY</b>,  if the shutdown request comes at the same time a user tries to log onto the system. In this case, the application should wait a short while and retry the call.
     * @param {PWSTR} lpMachineName The network name of the computer to be shut down. If <i>lpMachineName</i> is <b>NULL</b> or an empty string, the function shuts down the local computer.
     * @param {PWSTR} lpMessage The  message to be displayed in the shutdown dialog box. This parameter can be <b>NULL</b> if no message is required.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This string is also stored as a comment in the event log entry.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The string is limited to 3072 <b>TCHARs</b>.
     * @param {Integer} dwTimeout The length of time that the shutdown dialog box should be displayed, in seconds. While this dialog box is displayed, the shutdown can be stopped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a> function.
     * 
     * If <i>dwTimeout</i> is not zero, 
     * <b>InitiateSystemShutdown</b> displays a dialog box on the specified computer. The dialog box displays the name of the user who called the function, displays the message specified by the <i>lpMessage</i> parameter, and prompts the user to log off. The dialog box beeps when it is created and remains on top of other windows in the system. The dialog box can be moved but not closed. A timer counts down the remaining time before a forced shutdown.
     * 
     * If <i>dwTimeout</i> is zero, the computer shuts down without displaying the dialog box, and the shutdown cannot be stopped by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a>.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The time-out value is limited to <b>MAX_SHUTDOWN_TIMEOUT</b> seconds.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>If the computer to be shut down is a Terminal Services server, the system displays a dialog box to all local and remote users warning them that shutdown has been initiated. The dialog box includes who requested the shutdown, the display message (see <i>lpMessage</i>), and how much time there is until the server is shut down.
     * @param {BOOL} bForceAppsClosed If this parameter is <b>TRUE</b>, applications with unsaved changes are to be forcibly closed. Note that this can result in data loss.
     * 
     * If this parameter is <b>FALSE</b>, the system displays a dialog box instructing the user to close the applications.
     * @param {BOOL} bRebootAfterShutdown If this parameter is <b>TRUE</b>, the computer is to restart immediately after shutting down. If this parameter is <b>FALSE</b>, the system flushes all caches to disk  and  safely powers down the system.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-initiatesystemshutdownw
     * @since windows5.1.2600
     */
    static InitiateSystemShutdownW(lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\InitiateSystemShutdownW", "ptr", lpMachineName, "ptr", lpMessage, "uint", dwTimeout, "int", bForceAppsClosed, "int", bRebootAfterShutdown, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops a system shutdown that has been initiated. (ANSI)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-initiatesystemshutdowna">InitiateSystemShutdown</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-initiatesystemshutdownexa">InitiateSystemShutdownEx</a> functions display a dialog box that notifies the user that the system is shutting down. During the shutdown time-out period, the 
     * <b>AbortSystemShutdown</b> function can prevent the system from shutting down.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>If the computer to be shut down is a Terminal Services server, the system displays a dialog box to all local and remote users warning them that shutdown has been initiated. If shutdown is prevented by 
     * <b>AbortSystemShutdown</b>, the system displays dialog box to the users informing them that the server is no longer shutting down.
     * 
     * To stop the local computer from shutting down, the calling process must have the SE_SHUTDOWN_NAME privilege. To stop a remote computer from shutting down, the calling process must have the SE_REMOTE_SHUTDOWN_NAME privilege on the remote computer. By default, users can enable the SE_SHUTDOWN_NAME privilege on the computer they are logged onto, and administrators can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid computer name, an inaccessible computer, or insufficient privilege.
     * @param {PSTR} lpMachineName The network name of the computer where the shutdown is to be stopped. If <i>lpMachineName</i> is <b>NULL</b> or an empty string, the function stops the shutdown on the local computer.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-abortsystemshutdowna
     * @since windows5.1.2600
     */
    static AbortSystemShutdownA(lpMachineName) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AbortSystemShutdownA", "ptr", lpMachineName, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops a system shutdown that has been initiated. (Unicode)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-initiatesystemshutdowna">InitiateSystemShutdown</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-initiatesystemshutdownexa">InitiateSystemShutdownEx</a> functions display a dialog box that notifies the user that the system is shutting down. During the shutdown time-out period, the 
     * <b>AbortSystemShutdown</b> function can prevent the system from shutting down.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>If the computer to be shut down is a Terminal Services server, the system displays a dialog box to all local and remote users warning them that shutdown has been initiated. If shutdown is prevented by 
     * <b>AbortSystemShutdown</b>, the system displays dialog box to the users informing them that the server is no longer shutting down.
     * 
     * To stop the local computer from shutting down, the calling process must have the SE_SHUTDOWN_NAME privilege. To stop a remote computer from shutting down, the calling process must have the SE_REMOTE_SHUTDOWN_NAME privilege on the remote computer. By default, users can enable the SE_SHUTDOWN_NAME privilege on the computer they are logged onto, and administrators can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid computer name, an inaccessible computer, or insufficient privilege.
     * @param {PWSTR} lpMachineName The network name of the computer where the shutdown is to be stopped. If <i>lpMachineName</i> is <b>NULL</b> or an empty string, the function stops the shutdown on the local computer.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-abortsystemshutdownw
     * @since windows5.1.2600
     */
    static AbortSystemShutdownW(lpMachineName) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AbortSystemShutdownW", "ptr", lpMachineName, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a shutdown and optional restart of the specified computer, and optionally records the reason for the shutdown. (ANSI)
     * @remarks
     * To shut down the local computer, the calling thread must have the SE_SHUTDOWN_NAME privilege. To shut down a remote computer, the calling thread must have the SE_REMOTE_SHUTDOWN_NAME privilege on the remote computer. By default, users can enable the SE_SHUTDOWN_NAME privilege on the computer they are logged onto, and administrators can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid or inaccessible computer name or insufficient privilege. The error ERROR_SHUTDOWN_IN_PROGRESS is returned if a shutdown is already in progress on the specified computer. The error ERROR_NOT_READY can be returned if fast-user switching is enabled but no user is logged on.
     * 
     * A non-zero return value does not mean the logoff was or will be successful. The shutdown is an asynchronous process, and it can occur long  after the API call has returned, or not  at all. Even if the timeout value is zero,  the shutdown can still be aborted by applications, services, or even the system. The non-zero return value indicates that the validation of the rights and parameters was  successful and that the system accepted the shutdown request.
     * 
     * When this function is called, the caller must specify whether or not applications with unsaved changes should be forcibly closed.  If the caller chooses not to force these applications to close and an application with unsaved changes is running on the console session, the shutdown will remain in progress until the user logged into the console session aborts the shutdown, saves changes, closes the application, or forces the application to close.  During this period the shutdown may not be aborted except by the console user, and another shutdown may not be initiated.
     * 
     * Note that calling this function with the value of the <i>bForceAppsClosed</i> parameter set to <b>TRUE</b> avoids this situation. Remember that doing this  may result in loss of data.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the computer is locked and the <i>bForceAppsClosed</i> parameter is <b>FALSE</b>, the last error code is ERROR_MACHINE_LOCKED. If the system is not ready to handle the request, the last error code is ERROR_NOT_READY. The application should wait a short while and retry the call. For example, the system can be unready to initiate a shutdown, and return ERROR_NOT_READY,  if the shutdown request comes at the same time a user tries to log onto the system. In this case, the application should wait a short while and retry the call.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winreg.h header defines InitiateSystemShutdownEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} lpMachineName The network name of the computer to be shut down. If <i>lpMachineName</i> is <b>NULL</b> or an empty string, the function shuts down the local computer.
     * @param {PSTR} lpMessage The message to be displayed in the shutdown dialog box. This parameter can be <b>NULL</b> if no message is required. 
     * 
     * 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This string is also stored as a comment in the event log entry.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The string is limited to 3072 <b>TCHARs</b>.
     * @param {Integer} dwTimeout The length of time that the shutdown dialog box should be displayed, in seconds. While this dialog box is displayed, shutdown can be stopped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a> function. 
     * 
     * 
     * 
     * 
     * If <i>dwTimeout</i> is not zero, 
     * <b>InitiateSystemShutdownEx</b> displays a dialog box on the specified computer. The dialog box displays the name of the user who called the function, displays the message specified by the <i>lpMessage</i> parameter, and prompts the user to log off. The dialog box beeps when it is created and remains on top of other windows in the system. The dialog box can be moved but not closed. A timer counts down the remaining time before shutdown.
     * 
     * If <i>dwTimeout</i> is zero, the computer shuts down without displaying the dialog box, and the shutdown cannot be stopped by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a>.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The time-out value is limited to MAX_SHUTDOWN_TIMEOUT seconds.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>If the computer to be shut down is a Terminal Services server, the system displays a dialog box to all local and remote users warning them that shutdown has been initiated. The dialog box includes who requested the shutdown, the display message (see <i>lpMessage</i>), and how much time there is until the server is shut down.
     * @param {BOOL} bForceAppsClosed If this parameter is <b>TRUE</b>, applications with unsaved changes are to be forcibly closed. If this parameter is <b>FALSE</b>, the system displays a dialog box instructing the user to close the applications.
     * @param {BOOL} bRebootAfterShutdown If this parameter is <b>TRUE</b>, the computer is to restart immediately after shutting down. If this parameter is <b>FALSE</b>, the system flushes all caches to disk  and  safely powers down the system.
     * @param {Integer} dwReason The reason for initiating the shutdown. This parameter must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Shutdown/system-shutdown-reason-codes">system shutdown reason codes</a>. 
     * 
     * 
     * 
     * 
     * If this parameter is zero, the default is an undefined shutdown that is logged as "No title for this reason could be found". By default, it is also an unplanned shutdown. Depending on how the system is configured, an unplanned shutdown triggers the creation of a file that contains the system state information, which can delay shutdown. Therefore, do not use zero for this parameter.
     * 
     * <b>Windows XP:  </b>System state information is not saved during an unplanned system shutdown. The preceding text does not apply.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-initiatesystemshutdownexa
     * @since windows5.1.2600
     */
    static InitiateSystemShutdownExA(lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown, dwReason) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\InitiateSystemShutdownExA", "ptr", lpMachineName, "ptr", lpMessage, "uint", dwTimeout, "int", bForceAppsClosed, "int", bRebootAfterShutdown, "uint", dwReason, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a shutdown and optional restart of the specified computer, and optionally records the reason for the shutdown. (Unicode)
     * @remarks
     * To shut down the local computer, the calling thread must have the SE_SHUTDOWN_NAME privilege. To shut down a remote computer, the calling thread must have the SE_REMOTE_SHUTDOWN_NAME privilege on the remote computer. By default, users can enable the SE_SHUTDOWN_NAME privilege on the computer they are logged onto, and administrators can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid or inaccessible computer name or insufficient privilege. The error ERROR_SHUTDOWN_IN_PROGRESS is returned if a shutdown is already in progress on the specified computer. The error ERROR_NOT_READY can be returned if fast-user switching is enabled but no user is logged on.
     * 
     * A non-zero return value does not mean the logoff was or will be successful. The shutdown is an asynchronous process, and it can occur long  after the API call has returned, or not  at all. Even if the timeout value is zero,  the shutdown can still be aborted by applications, services, or even the system. The non-zero return value indicates that the validation of the rights and parameters was  successful and that the system accepted the shutdown request.
     * 
     * When this function is called, the caller must specify whether or not applications with unsaved changes should be forcibly closed.  If the caller chooses not to force these applications to close and an application with unsaved changes is running on the console session, the shutdown will remain in progress until the user logged into the console session aborts the shutdown, saves changes, closes the application, or forces the application to close.  During this period the shutdown may not be aborted except by the console user, and another shutdown may not be initiated.
     * 
     * Note that calling this function with the value of the <i>bForceAppsClosed</i> parameter set to <b>TRUE</b> avoids this situation. Remember that doing this  may result in loss of data.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the computer is locked and the <i>bForceAppsClosed</i> parameter is <b>FALSE</b>, the last error code is ERROR_MACHINE_LOCKED. If the system is not ready to handle the request, the last error code is ERROR_NOT_READY. The application should wait a short while and retry the call. For example, the system can be unready to initiate a shutdown, and return ERROR_NOT_READY,  if the shutdown request comes at the same time a user tries to log onto the system. In this case, the application should wait a short while and retry the call.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winreg.h header defines InitiateSystemShutdownEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} lpMachineName The network name of the computer to be shut down. If <i>lpMachineName</i> is <b>NULL</b> or an empty string, the function shuts down the local computer.
     * @param {PWSTR} lpMessage The message to be displayed in the shutdown dialog box. This parameter can be <b>NULL</b> if no message is required. 
     * 
     * 
     * 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This string is also stored as a comment in the event log entry.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The string is limited to 3072 <b>TCHARs</b>.
     * @param {Integer} dwTimeout The length of time that the shutdown dialog box should be displayed, in seconds. While this dialog box is displayed, shutdown can be stopped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a> function. 
     * 
     * 
     * 
     * 
     * If <i>dwTimeout</i> is not zero, 
     * <b>InitiateSystemShutdownEx</b> displays a dialog box on the specified computer. The dialog box displays the name of the user who called the function, displays the message specified by the <i>lpMessage</i> parameter, and prompts the user to log off. The dialog box beeps when it is created and remains on top of other windows in the system. The dialog box can be moved but not closed. A timer counts down the remaining time before shutdown.
     * 
     * If <i>dwTimeout</i> is zero, the computer shuts down without displaying the dialog box, and the shutdown cannot be stopped by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-abortsystemshutdowna">AbortSystemShutdown</a>.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>The time-out value is limited to MAX_SHUTDOWN_TIMEOUT seconds.
     * 
     * <b>Windows Server 2003 and Windows XP with SP1:  </b>If the computer to be shut down is a Terminal Services server, the system displays a dialog box to all local and remote users warning them that shutdown has been initiated. The dialog box includes who requested the shutdown, the display message (see <i>lpMessage</i>), and how much time there is until the server is shut down.
     * @param {BOOL} bForceAppsClosed If this parameter is <b>TRUE</b>, applications with unsaved changes are to be forcibly closed. If this parameter is <b>FALSE</b>, the system displays a dialog box instructing the user to close the applications.
     * @param {BOOL} bRebootAfterShutdown If this parameter is <b>TRUE</b>, the computer is to restart immediately after shutting down. If this parameter is <b>FALSE</b>, the system flushes all caches to disk  and  safely powers down the system.
     * @param {Integer} dwReason The reason for initiating the shutdown. This parameter must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Shutdown/system-shutdown-reason-codes">system shutdown reason codes</a>. 
     * 
     * 
     * 
     * 
     * If this parameter is zero, the default is an undefined shutdown that is logged as "No title for this reason could be found". By default, it is also an unplanned shutdown. Depending on how the system is configured, an unplanned shutdown triggers the creation of a file that contains the system state information, which can delay shutdown. Therefore, do not use zero for this parameter.
     * 
     * <b>Windows XP:  </b>System state information is not saved during an unplanned system shutdown. The preceding text does not apply.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-initiatesystemshutdownexw
     * @since windows5.1.2600
     */
    static InitiateSystemShutdownExW(lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown, dwReason) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\InitiateSystemShutdownExW", "ptr", lpMachineName, "ptr", lpMessage, "uint", dwTimeout, "int", bForceAppsClosed, "int", bRebootAfterShutdown, "uint", dwReason, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a shutdown and restart of the specified computer, and restarts any applications that have been registered for restart. (ANSI)
     * @remarks
     * To shut down the local computer, the calling thread must have the SE_SHUTDOWN_NAME privilege. To shut down a remote computer, the calling thread must have the SE_REMOTE_SHUTDOWN_NAME privilege on the remote computer. By default, users can enable the SE_SHUTDOWN_NAME privilege on the computer they are logged onto, and administrators can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid or inaccessible computer name or insufficient privilege. The error ERROR_SHUTDOWN_IN_PROGRESS is returned if a shutdown is already in progress on the specified computer. The error ERROR_NOT_READY can be returned if fast-user switching is enabled but no user is logged on.
     * 
     * A non-zero return value does not mean the logoff was or will be successful. The shutdown is an asynchronous process, and it can occur long  after the API call has returned, or not  at all. Even if the timeout value is zero,  the shutdown can still be aborted by applications, services, or even the system. The non-zero return value indicates that the validation of the rights and parameters was  successful and that the system accepted the shutdown request.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winreg.h header defines InitiateShutdown as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} lpMachineName The name of the computer to be shut down. If the value of this parameter is <b>NULL</b>, the local computer is shut down.
     * @param {PSTR} lpMessage The message to be displayed in the interactive shutdown dialog box.
     * @param {Integer} dwGracePeriod The number of seconds to wait before shutting down the computer. If the value of this parameter is zero, the computer is shut down immediately. This value is limited to <b>MAX_SHUTDOWN_TIMEOUT</b>.
     * 
     * If the value of this parameter is greater than zero, and the <i>dwShutdownFlags</i> parameter specifies the flag <b>SHUTDOWN_GRACE_OVERRIDE</b>, the function fails and returns the error code <b>ERROR_BAD_ARGUMENTS</b>.
     * @param {Integer} dwShutdownFlags One or more bit flags that specify options for the shutdown. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_FORCE_OTHERS"></a><a id="shutdown_force_others"></a><dl>
     * <dt><b>SHUTDOWN_FORCE_OTHERS</b></dt>
     * <dt>0x00000001 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All sessions are forcefully logged off. If this flag is not set and users other than the current user are logged on to the computer specified by the <i>lpMachineName</i> parameter, this function fails with a return value of <b>ERROR_SHUTDOWN_USERS_LOGGED_ON</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_FORCE_SELF"></a><a id="shutdown_force_self"></a><dl>
     * <dt><b>SHUTDOWN_FORCE_SELF</b></dt>
     * <dt>0x00000002 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the originating session is logged off forcefully. If this flag is not set, the originating session is shut down interactively, so a shutdown is not guaranteed even if the function returns successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_GRACE_OVERRIDE"></a><a id="shutdown_grace_override"></a><dl>
     * <dt><b>SHUTDOWN_GRACE_OVERRIDE</b></dt>
     * <dt>0x00000020 (0x20)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Overrides the grace period so that the computer is shut down immediately.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_HYBRID"></a><a id="shutdown_hybrid"></a><dl>
     * <dt><b>SHUTDOWN_HYBRID</b></dt>
     * <dt>0x00000200 (0x200)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Beginning with <b>InitiateShutdown</b> running on Windows 8, you must include the <b>SHUTDOWN_HYBRID</b> flag with one or more of the flags in this table to specify options for the shutdown.  
     * 
     * Beginning with Windows 8, <b>InitiateShutdown</b> always initiate a full system shutdown if the <b>SHUTDOWN_HYBRID</b> flag is absent.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_INSTALL_UPDATES"></a><a id="shutdown_install_updates"></a><dl>
     * <dt><b>SHUTDOWN_INSTALL_UPDATES</b></dt>
     * <dt>0x00000040 (0x40)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer installs any updates before starting the shutdown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_NOREBOOT"></a><a id="shutdown_noreboot"></a><dl>
     * <dt><b>SHUTDOWN_NOREBOOT</b></dt>
     * <dt>0x00000010 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is shut down but is not powered down or rebooted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_POWEROFF"></a><a id="shutdown_poweroff"></a><dl>
     * <dt><b>SHUTDOWN_POWEROFF</b></dt>
     * <dt>0x00000008 (0x8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is shut down and powered down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_RESTART"></a><a id="shutdown_restart"></a><dl>
     * <dt><b>SHUTDOWN_RESTART</b></dt>
     * <dt>0x00000004 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is shut down and rebooted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_RESTARTAPPS"></a><a id="shutdown_restartapps"></a><dl>
     * <dt><b>SHUTDOWN_RESTARTAPPS</b></dt>
     * <dt>0x00000080 (0x80)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is rebooted using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-exitwindowsex">ExitWindowsEx</a> function with the EWX_RESTARTAPPS flag. This restarts any applications that have been registered for restart using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerapplicationrestart">RegisterApplicationRestart</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwReason The reason for initiating the shutdown. This parameter must be one of the <a href="https://docs.microsoft.com/windows/desktop/Shutdown/system-shutdown-reason-codes">system shutdown reason codes</a>. 
     * If this parameter is zero, the default is an undefined shutdown that is logged as "No title for this reason could be found". By default, it is also an unplanned shutdown. Depending on how the system is configured, an unplanned shutdown triggers the creation of a file that contains the system state information, which can delay shutdown. Therefore, do not use zero for this parameter.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the required privilege (SE_SHUTDOWN_PRIVILEGE or SE_REMOTE_SHUTDOWN_PRIVILEGE) to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NETPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer does not exist or is not accessible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_COMPUTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified  computer name is not a valid computer name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer does not support a shutdown interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid set of parameters was passed. This includes the following combinations.
     * 
     * <ul>
     * <li>The <i>lpMachineName</i> parameter specifies a remote computer, and the <i>dwShutdownFlags</i> parameter does not specify <b>SHUTDOWN_FORCE_SELF</b>.</li>
     * <li>The value of the <i>dwGracePeriod</i> is greater than zero and the <i>dwShutdownFlags</i> parameter does not specify <b>SHUTDOWN_FORCE_SELF</b>.</li>
     * <li>The value of the <i>dwGracePeriod</i> is greater than zero and the <i>dwShutdownFlags</i> parameter specifies <b>SHUTDOWN_GRACE_OVERRIDE</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A shutdown has already been started on the specified computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IS_SCHEDULED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A shutdown for the specified computer has been scheduled but not started. For this function to succeed, the <b>SHUTDOWN_GRACE_OVERRIDE</b> flag must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_USERS_LOGGED_ON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more users other than the current user are logged on the specified machine, and the <b>SHUTDOWN_FORCE_OTHERS</b> flag was not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-initiateshutdowna
     * @since windows6.0.6000
     */
    static InitiateShutdownA(lpMachineName, lpMessage, dwGracePeriod, dwShutdownFlags, dwReason) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        result := DllCall("ADVAPI32.dll\InitiateShutdownA", "ptr", lpMachineName, "ptr", lpMessage, "uint", dwGracePeriod, "uint", dwShutdownFlags, "uint", dwReason, "uint")
        return result
    }

    /**
     * Initiates a shutdown and restart of the specified computer, and restarts any applications that have been registered for restart. (Unicode)
     * @remarks
     * To shut down the local computer, the calling thread must have the SE_SHUTDOWN_NAME privilege. To shut down a remote computer, the calling thread must have the SE_REMOTE_SHUTDOWN_NAME privilege on the remote computer. By default, users can enable the SE_SHUTDOWN_NAME privilege on the computer they are logged onto, and administrators can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * Common reasons for failure include an invalid or inaccessible computer name or insufficient privilege. The error ERROR_SHUTDOWN_IN_PROGRESS is returned if a shutdown is already in progress on the specified computer. The error ERROR_NOT_READY can be returned if fast-user switching is enabled but no user is logged on.
     * 
     * A non-zero return value does not mean the logoff was or will be successful. The shutdown is an asynchronous process, and it can occur long  after the API call has returned, or not  at all. Even if the timeout value is zero,  the shutdown can still be aborted by applications, services, or even the system. The non-zero return value indicates that the validation of the rights and parameters was  successful and that the system accepted the shutdown request.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winreg.h header defines InitiateShutdown as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} lpMachineName The name of the computer to be shut down. If the value of this parameter is <b>NULL</b>, the local computer is shut down.
     * @param {PWSTR} lpMessage The message to be displayed in the interactive shutdown dialog box.
     * @param {Integer} dwGracePeriod The number of seconds to wait before shutting down the computer. If the value of this parameter is zero, the computer is shut down immediately. This value is limited to <b>MAX_SHUTDOWN_TIMEOUT</b>.
     * 
     * If the value of this parameter is greater than zero, and the <i>dwShutdownFlags</i> parameter specifies the flag <b>SHUTDOWN_GRACE_OVERRIDE</b>, the function fails and returns the error code <b>ERROR_BAD_ARGUMENTS</b>.
     * @param {Integer} dwShutdownFlags One or more bit flags that specify options for the shutdown. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_FORCE_OTHERS"></a><a id="shutdown_force_others"></a><dl>
     * <dt><b>SHUTDOWN_FORCE_OTHERS</b></dt>
     * <dt>0x00000001 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All sessions are forcefully logged off. If this flag is not set and users other than the current user are logged on to the computer specified by the <i>lpMachineName</i> parameter, this function fails with a return value of <b>ERROR_SHUTDOWN_USERS_LOGGED_ON</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_FORCE_SELF"></a><a id="shutdown_force_self"></a><dl>
     * <dt><b>SHUTDOWN_FORCE_SELF</b></dt>
     * <dt>0x00000002 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the originating session is logged off forcefully. If this flag is not set, the originating session is shut down interactively, so a shutdown is not guaranteed even if the function returns successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_GRACE_OVERRIDE"></a><a id="shutdown_grace_override"></a><dl>
     * <dt><b>SHUTDOWN_GRACE_OVERRIDE</b></dt>
     * <dt>0x00000020 (0x20)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Overrides the grace period so that the computer is shut down immediately.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_HYBRID"></a><a id="shutdown_hybrid"></a><dl>
     * <dt><b>SHUTDOWN_HYBRID</b></dt>
     * <dt>0x00000200 (0x200)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Beginning with <b>InitiateShutdown</b> running on Windows 8, you must include the <b>SHUTDOWN_HYBRID</b> flag with one or more of the flags in this table to specify options for the shutdown.  
     * 
     * Beginning with Windows 8, <b>InitiateShutdown</b> always initiate a full system shutdown if the <b>SHUTDOWN_HYBRID</b> flag is absent.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_INSTALL_UPDATES"></a><a id="shutdown_install_updates"></a><dl>
     * <dt><b>SHUTDOWN_INSTALL_UPDATES</b></dt>
     * <dt>0x00000040 (0x40)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer installs any updates before starting the shutdown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_NOREBOOT"></a><a id="shutdown_noreboot"></a><dl>
     * <dt><b>SHUTDOWN_NOREBOOT</b></dt>
     * <dt>0x00000010 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is shut down but is not powered down or rebooted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_POWEROFF"></a><a id="shutdown_poweroff"></a><dl>
     * <dt><b>SHUTDOWN_POWEROFF</b></dt>
     * <dt>0x00000008 (0x8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is shut down and powered down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_RESTART"></a><a id="shutdown_restart"></a><dl>
     * <dt><b>SHUTDOWN_RESTART</b></dt>
     * <dt>0x00000004 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is shut down and rebooted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_RESTARTAPPS"></a><a id="shutdown_restartapps"></a><dl>
     * <dt><b>SHUTDOWN_RESTARTAPPS</b></dt>
     * <dt>0x00000080 (0x80)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is rebooted using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-exitwindowsex">ExitWindowsEx</a> function with the EWX_RESTARTAPPS flag. This restarts any applications that have been registered for restart using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerapplicationrestart">RegisterApplicationRestart</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwReason The reason for initiating the shutdown. This parameter must be one of the <a href="https://docs.microsoft.com/windows/desktop/Shutdown/system-shutdown-reason-codes">system shutdown reason codes</a>. 
     * If this parameter is zero, the default is an undefined shutdown that is logged as "No title for this reason could be found". By default, it is also an unplanned shutdown. Depending on how the system is configured, an unplanned shutdown triggers the creation of a file that contains the system state information, which can delay shutdown. Therefore, do not use zero for this parameter.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the required privilege (SE_SHUTDOWN_PRIVILEGE or SE_REMOTE_SHUTDOWN_PRIVILEGE) to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NETPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer does not exist or is not accessible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_COMPUTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified  computer name is not a valid computer name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer does not support a shutdown interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid set of parameters was passed. This includes the following combinations.
     * 
     * <ul>
     * <li>The <i>lpMachineName</i> parameter specifies a remote computer, and the <i>dwShutdownFlags</i> parameter does not specify <b>SHUTDOWN_FORCE_SELF</b>.</li>
     * <li>The value of the <i>dwGracePeriod</i> is greater than zero and the <i>dwShutdownFlags</i> parameter does not specify <b>SHUTDOWN_FORCE_SELF</b>.</li>
     * <li>The value of the <i>dwGracePeriod</i> is greater than zero and the <i>dwShutdownFlags</i> parameter specifies <b>SHUTDOWN_GRACE_OVERRIDE</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A shutdown has already been started on the specified computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IS_SCHEDULED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A shutdown for the specified computer has been scheduled but not started. For this function to succeed, the <b>SHUTDOWN_GRACE_OVERRIDE</b> flag must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_USERS_LOGGED_ON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more users other than the current user are logged on the specified machine, and the <b>SHUTDOWN_FORCE_OTHERS</b> flag was not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-initiateshutdownw
     * @since windows6.0.6000
     */
    static InitiateShutdownW(lpMachineName, lpMessage, dwGracePeriod, dwShutdownFlags, dwReason) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        result := DllCall("ADVAPI32.dll\InitiateShutdownW", "ptr", lpMachineName, "ptr", lpMessage, "uint", dwGracePeriod, "uint", dwShutdownFlags, "uint", dwReason, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOLEAN>} pHiberboot 
     * @param {BOOLEAN} bClearFlag 
     * @returns {Integer} 
     */
    static CheckForHiberboot(pHiberboot, bClearFlag) {
        pHiberbootMarshal := pHiberboot is VarRef ? "char*" : "ptr"

        result := DllCall("ADVAPI32.dll\CheckForHiberboot", pHiberbootMarshal, pHiberboot, "char", bClearFlag, "uint")
        return result
    }

    /**
     * Logs off the interactive user, shuts down the system, or shuts down and restarts the system.
     * @remarks
     * The 
     * <b>ExitWindowsEx</b> function returns as soon as it has initiated the shutdown process. The shutdown or logoff then proceeds asynchronously. The function is designed to stop all processes in the caller's logon session. Therefore, if you are not the interactive user, the function can succeed without actually shutting down the computer. If you are not the interactive user, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-initiatesystemshutdowna">InitiateSystemShutdown</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-initiatesystemshutdownexa">InitiateSystemShutdownEx</a> function.
     * 
     * A non-zero return value does not mean the logoff was or will be successful. The shutdown is an asynchronous process, and it can occur long  after the API call has returned, or not  at all. Even if the timeout value is zero,  the shutdown can still be aborted by applications, services, or even the system. The non-zero return value indicates that the validation of the rights and parameters was  successful and that the system accepted the shutdown request.
     * 
     * When this function is called, the caller must specify whether or not applications with unsaved changes should be forcibly closed.  If the caller chooses not to force these applications to close and an application with unsaved changes is running on the console session, the shutdown will remain in progress until the user logged into the console session aborts the shutdown, saves changes, closes the application, or forces the application to close.  During this period, the shutdown may not be aborted except by the console user, and another shutdown may not be initiated.
     * 
     * Calling this function with the value of the <i>uFlags</i> parameter set to EWX_FORCE avoids this situation. Remember that doing this  may result in loss of data.
     * 
     * To set a shutdown priority for an application relative to other applications in the system, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setprocessshutdownparameters">SetProcessShutdownParameters</a> function.
     * 
     * During a shutdown or log-off operation, running applications are allowed a specific amount of time to respond to the shutdown request. If this time expires before all applications have stopped, the system displays a user interface that allows the user to forcibly shut down the system or to cancel the shutdown request. If the EWX_FORCE value is specified, the system forces running applications to stop when the time expires.
     * 
     * If the EWX_FORCEIFHUNG value is specified, the system forces hung applications to close and does not display the dialog box.
     * 
     * Console processes receive a separate notification message, CTRL_SHUTDOWN_EVENT or CTRL_LOGOFF_EVENT, as the situation warrants. A console process routes these messages to its 
     * <a href="https://docs.microsoft.com/windows/console/handlerroutine">HandlerRoutine</a> function. 
     * <b>ExitWindowsEx</b> sends these notification messages asynchronously; thus, an application cannot assume that the console notification messages have been handled when a call to 
     * <b>ExitWindowsEx</b> returns.
     * 
     * To shut down or restart the system, the calling process must use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges">AdjustTokenPrivileges</a> function to enable the SE_SHUTDOWN_NAME privilege. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * @param {Integer} uFlags 
     * @param {Integer} dwReason The reason for initiating the shutdown. This parameter must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Shutdown/system-shutdown-reason-codes">system shutdown reason codes</a>.
     * 
     * If this parameter is zero, the SHTDN_REASON_FLAG_PLANNED reason code  will not be set and therefore the default action is an undefined shutdown that is logged as "No title for this reason could be found". By default, it is also an unplanned shutdown. Depending on how the system is configured, an unplanned shutdown triggers the creation of a file that contains the system state information, which can delay shutdown. Therefore, do not use zero for this parameter.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. Because the function executes asynchronously, a nonzero return value indicates that the shutdown has been initiated. It does not indicate whether the shutdown will succeed. It is possible that the system, the user, or another application will abort the shutdown.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-exitwindowsex
     * @since windows5.1.2600
     */
    static ExitWindowsEx(uFlags, dwReason) {
        A_LastError := 0

        result := DllCall("USER32.dll\ExitWindowsEx", "uint", uFlags, "uint", dwReason, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Locks the workstation's display.
     * @remarks
     * The 
     * <b>LockWorkStation</b> function is callable only by processes running on the interactive desktop. In addition, the user must be logged on, and the workstation cannot already be locked.
     * 
     * Common reasons the workstation might not be locked even if the function succeeds include the following: no user is logged on, the workstation is already locked, the process is not running on the interactive desktop, or the request is denied by the Graphical Identification and Authentication (GINA) DLL.
     * 
     * This function has the same result as pressing Ctrl+Alt+Del and clicking <b>Lock</b>. To unlock the workstation, the user must log in. There is no function you can call to determine whether the workstation is locked. To receive a notification when the user locks the workstation or logs in, use the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification">WTSRegisterSessionNotification</a> function to receive <a href="https://docs.microsoft.com/windows/desktop/TermServ/wm-wtssession-change">WM_WTSSESSION_CHANGE</a> messages. You can use session notifications to track the desktop state so you know whether it is possible to interact with the user.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. Because the function executes asynchronously, a nonzero return value indicates that the operation has been initiated. It does not indicate whether the workstation has been successfully locked.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-lockworkstation
     * @since windows5.1.2600
     */
    static LockWorkStation() {
        A_LastError := 0

        result := DllCall("USER32.dll\LockWorkStation", "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates that the system cannot be shut down and sets a reason string to be displayed to the user if system shutdown is initiated.
     * @remarks
     * This function can only be called from the thread that created the window specified by the <i>hWnd</i> parameter. Otherwise, the function fails and the last error code is ERROR_ACCESS_DENIED.
     * 
     * Applications should call this function as they begin an operation that cannot be interrupted, such as burning a CD or DVD. When the operation has completed, call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-shutdownblockreasondestroy">ShutdownBlockReasonDestroy</a> function to indicate that the system can be shut down.
     * 
     * Because users are typically in a hurry when shutting down the system, they may spend only  a few seconds looking at the shutdown reasons that are displayed by the system. Therefore, it is important that your reason strings are short and clear. For example "A CD burn is in progress." is better than "This application is blocking system shutdown because a CD burn is in progress. Do not shut down."
     * @param {HWND} hWnd A handle to the main window of the application.
     * @param {PWSTR} pwszReason The reason the application must block system shutdown. This string will be truncated for display purposes after MAX_STR_BLOCKREASON characters.
     * @returns {BOOL} If the call succeeds, the return value is nonzero.
     * 
     * If the call fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-shutdownblockreasoncreate
     * @since windows6.0.6000
     */
    static ShutdownBlockReasonCreate(hWnd, pwszReason) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        pwszReason := pwszReason is String ? StrPtr(pwszReason) : pwszReason

        A_LastError := 0

        result := DllCall("USER32.dll\ShutdownBlockReasonCreate", "ptr", hWnd, "ptr", pwszReason, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the reason string set by the ShutdownBlockReasonCreate function.
     * @remarks
     * This function can only be called from the thread that created the window specified by the <i>hWnd</i> parameter. Otherwise, the function fails and the last error code is ERROR_ACCESS_DENIED.
     * @param {HWND} hWnd A handle to the main window of the application.
     * @param {PWSTR} pwszBuff A pointer to a buffer that receives the reason string. If this parameter is <b>NULL</b>, the function retrieves the number of characters in the reason string.
     * @param {Pointer<Integer>} pcchBuff A pointer to a variable that specifies the size of the <i>pwszBuff</i> buffer, in characters. If the function succeeds, this variable receives the number of characters copied into the buffer, including the <b>null</b>-terminating character. If the buffer is too small, the variable receives the required buffer size, in characters, not including the <b>null</b>-terminating character.
     * @returns {BOOL} If the call succeeds, the return value is nonzero.
     * 
     * If the call fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-shutdownblockreasonquery
     * @since windows6.0.6000
     */
    static ShutdownBlockReasonQuery(hWnd, pwszBuff, pcchBuff) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        pwszBuff := pwszBuff is String ? StrPtr(pwszBuff) : pwszBuff

        pcchBuffMarshal := pcchBuff is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\ShutdownBlockReasonQuery", "ptr", hWnd, "ptr", pwszBuff, pcchBuffMarshal, pcchBuff, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates that the system can be shut down and frees the reason string.
     * @remarks
     * This function can only be called from the thread that created the window specified by the <i>hWnd</i> parameter. Otherwise, the function fails and the last error code is ERROR_ACCESS_DENIED.
     * 
     * If system shutdown has been previously blocked by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-shutdownblockreasoncreate">ShutdownBlockReasonCreate</a> function, this function frees the reason string. Otherwise, this function is a no-op.
     * @param {HWND} hWnd A handle to the main window of the application.
     * @returns {BOOL} If the call succeeds, the return value is nonzero.
     * 
     * If the call fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-shutdownblockreasondestroy
     * @since windows6.0.6000
     */
    static ShutdownBlockReasonDestroy(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("USER32.dll\ShutdownBlockReasonDestroy", "ptr", hWnd, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
