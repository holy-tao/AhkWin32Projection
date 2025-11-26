#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables debugger developers to control the life cycle of a Windows Store app, such as suspending or resuming.
 * @remarks
 * 
 * Any debug options set remain in effect until they are cleared or this interface is released.
 * 
 * For debug settings to take effect on Internet Explorer in the new Windows UI, use "DefaultBrowser_NOPUBLISHERID" as the <i>packageFullName</i> parameter  for  <a href="https://docs.microsoft.com/previous-versions/hh438393(v=vs.85)">IPackageDebugSettings</a> methods.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipackagedebugsettings
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPackageDebugSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageDebugSettings
     * @type {Guid}
     */
    static IID => Guid("{f27c3930-8029-4ad1-94e3-3dba417810c1}")

    /**
     * The class identifier for PackageDebugSettings
     * @type {Guid}
     */
    static CLSID => Guid("{b1aec16f-2383-4852-b0e9-8f0b1dc66b4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableDebugging", "DisableDebugging", "Suspend", "Resume", "TerminateAllProcesses", "SetTargetSessionId", "EnumerateBackgroundTasks", "ActivateBackgroundTask", "StartServicing", "StopServicing", "StartSessionRedirection", "StopSessionRedirection", "GetPackageExecutionState", "RegisterForPackageStateChanges", "UnregisterForPackageStateChanges"]

    /**
     * Enables debug mode for the processes of the specified package.
     * @param {PWSTR} packageFullName The package full name.
     * @param {PWSTR} debuggerCommandLine The command line to use to launch processes from this package. This parameter is optional.
     * @param {PWSTR} environment Any environment strings to pass to processes. This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-enabledebugging
     */
    EnableDebugging(packageFullName, debuggerCommandLine, environment) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        debuggerCommandLine := debuggerCommandLine is String ? StrPtr(debuggerCommandLine) : debuggerCommandLine
        environment := environment is String ? StrPtr(environment) : environment

        result := ComCall(3, this, "ptr", packageFullName, "ptr", debuggerCommandLine, "ptr", environment, "HRESULT")
        return result
    }

    /**
     * Disables debug mode for the processes of the specified package.
     * @param {PWSTR} packageFullName The package full name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-disabledebugging
     */
    DisableDebugging(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(4, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Suspends the processes of the package if they are currently running.
     * @param {PWSTR} packageFullName The package full name.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ILLEGAL_STATECHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process is not currently running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-suspend
     */
    Suspend(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(5, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Resumes the processes of the package if they are currently suspended.
     * @param {PWSTR} packageFullName The package full name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-resume
     */
    Resume(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(6, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Terminates all processes for the specified package.
     * @param {PWSTR} packageFullName The package full name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-terminateallprocesses
     */
    TerminateAllProcesses(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(7, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Sets the session identifier.
     * @param {Integer} sessionId The session identifier.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-settargetsessionid
     */
    SetTargetSessionId(sessionId) {
        result := ComCall(8, this, "uint", sessionId, "HRESULT")
        return result
    }

    /**
     * Gets the background tasks that are provided by the specified package.
     * @param {PWSTR} packageFullName The package full name to query for background tasks.
     * @param {Pointer<Integer>} taskCount The count of <i>taskIds</i> and <i>taskNames</i> entries.
     * @param {Pointer<Pointer<Guid>>} taskIds An array of background task identifiers. You can use these identifiers in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-activatebackgroundtask">ActivateBackgroundTask</a> method to activate specified tasks.
     * @param {Pointer<Pointer<PWSTR>>} taskNames An array of task names that corresponds with background <i>taskIds</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-enumeratebackgroundtasks
     */
    EnumerateBackgroundTasks(packageFullName, taskCount, taskIds, taskNames) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        taskCountMarshal := taskCount is VarRef ? "uint*" : "ptr"
        taskIdsMarshal := taskIds is VarRef ? "ptr*" : "ptr"
        taskNamesMarshal := taskNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", packageFullName, taskCountMarshal, taskCount, taskIdsMarshal, taskIds, taskNamesMarshal, taskNames, "HRESULT")
        return result
    }

    /**
     * Activates the specified background task.
     * @param {Pointer<Guid>} taskId The identifier of the background task to activate.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-activatebackgroundtask
     */
    ActivateBackgroundTask(taskId) {
        result := ComCall(10, this, "ptr", taskId, "HRESULT")
        return result
    }

    /**
     * Suspends and terminates the non-background portion of the apps associated with the specified package and cancels the background tasks associated with the package.
     * @param {PWSTR} packageFullName The package full name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-startservicing
     */
    StartServicing(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(11, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Completes the previous servicing operation that was started by a call to the StartServicing method.
     * @param {PWSTR} packageFullName The package full name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-stopservicing
     */
    StopServicing(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(12, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Causes background tasks for the specified package to activate in the specified user session.
     * @param {PWSTR} packageFullName The package full name.
     * @param {Integer} sessionId The identifier of the session which background tasks are redirected to.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-startsessionredirection
     */
    StartSessionRedirection(packageFullName, sessionId) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(13, this, "ptr", packageFullName, "uint", sessionId, "HRESULT")
        return result
    }

    /**
     * Stops redirection of background tasks for the specified package.
     * @param {PWSTR} packageFullName The package full name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-stopsessionredirection
     */
    StopSessionRedirection(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(14, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Returns the current execution state of the specified package.
     * @param {PWSTR} packageFullName Type: <b>LPCWSTR</b>
     * 
     * The package full name.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-package_execution_state">PACKAGE_EXECUTION_STATE</a>*</b>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-getpackageexecutionstate
     */
    GetPackageExecutionState(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(15, this, "ptr", packageFullName, "int*", &packageExecutionState := 0, "HRESULT")
        return packageExecutionState
    }

    /**
     * Register for package state-change notifications.
     * @param {PWSTR} packageFullName The package full name.
     * @param {IPackageExecutionStateChangeNotification} pPackageExecutionStateChangeNotification Package state-change notifications are delivered by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipackageexecutionstatechangenotification-onstatechanged">OnStateChanged</a> function on <i>pPackageExecutionStateChangeNotification</i>.
     * @returns {Integer} A unique registration identifier for the current listener. Use this identifier  to unregister for package state-change notifications by using the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-unregisterforpackagestatechanges">UnregisterForPackageStateChanges</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-registerforpackagestatechanges
     */
    RegisterForPackageStateChanges(packageFullName, pPackageExecutionStateChangeNotification) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(16, this, "ptr", packageFullName, "ptr", pPackageExecutionStateChangeNotification, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Stops receiving package state-change notifications associated with a previous call to RegisterForPackageStateChanges.
     * @param {Integer} dwCookie The notification to cancel. This identifier is returned by a previous call to the  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-registerforpackagestatechanges">RegisterForPackageStateChanges</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-unregisterforpackagestatechanges
     */
    UnregisterForPackageStateChanges(dwCookie) {
        result := ComCall(17, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
