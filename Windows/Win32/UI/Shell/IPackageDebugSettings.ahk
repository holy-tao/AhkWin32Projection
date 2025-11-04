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
     * 
     * @param {PWSTR} packageFullName 
     * @param {PWSTR} debuggerCommandLine 
     * @param {PWSTR} environment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-enabledebugging
     */
    EnableDebugging(packageFullName, debuggerCommandLine, environment) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        debuggerCommandLine := debuggerCommandLine is String ? StrPtr(debuggerCommandLine) : debuggerCommandLine
        environment := environment is String ? StrPtr(environment) : environment

        result := ComCall(3, this, "ptr", packageFullName, "ptr", debuggerCommandLine, "ptr", environment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-disabledebugging
     */
    DisableDebugging(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(4, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinRT/ipackagedebugsettings-suspend
     */
    Suspend(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(5, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinRT/ipackagedebugsettings-resume
     */
    Resume(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(6, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-terminateallprocesses
     */
    TerminateAllProcesses(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(7, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-settargetsessionid
     */
    SetTargetSessionId(sessionId) {
        result := ComCall(8, this, "uint", sessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<Integer>} taskCount 
     * @param {Pointer<Pointer<Guid>>} taskIds 
     * @param {Pointer<Pointer<PWSTR>>} taskNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-enumeratebackgroundtasks
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
     * 
     * @param {Pointer<Guid>} taskId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-activatebackgroundtask
     */
    ActivateBackgroundTask(taskId) {
        result := ComCall(10, this, "ptr", taskId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-startservicing
     */
    StartServicing(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(11, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-stopservicing
     */
    StopServicing(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(12, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Integer} sessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-startsessionredirection
     */
    StartSessionRedirection(packageFullName, sessionId) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(13, this, "ptr", packageFullName, "uint", sessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-stopsessionredirection
     */
    StopSessionRedirection(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(14, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<Integer>} packageExecutionState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-getpackageexecutionstate
     */
    GetPackageExecutionState(packageFullName, packageExecutionState) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        packageExecutionStateMarshal := packageExecutionState is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", packageFullName, packageExecutionStateMarshal, packageExecutionState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {IPackageExecutionStateChangeNotification} pPackageExecutionStateChangeNotification 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-registerforpackagestatechanges
     */
    RegisterForPackageStateChanges(packageFullName, pPackageExecutionStateChangeNotification, pdwCookie) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", packageFullName, "ptr", pPackageExecutionStateChangeNotification, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-unregisterforpackagestatechanges
     */
    UnregisterForPackageStateChanges(dwCookie) {
        result := ComCall(17, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
