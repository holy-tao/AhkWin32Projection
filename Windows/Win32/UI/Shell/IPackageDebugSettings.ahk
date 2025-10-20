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
     * 
     * @param {PWSTR} packageFullName 
     * @param {PWSTR} debuggerCommandLine 
     * @param {PWSTR} environment 
     * @returns {HRESULT} 
     */
    EnableDebugging(packageFullName, debuggerCommandLine, environment) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        debuggerCommandLine := debuggerCommandLine is String ? StrPtr(debuggerCommandLine) : debuggerCommandLine
        environment := environment is String ? StrPtr(environment) : environment

        result := ComCall(3, this, "ptr", packageFullName, "ptr", debuggerCommandLine, "ptr", environment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     */
    DisableDebugging(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(4, this, "ptr", packageFullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     */
    Suspend(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(5, this, "ptr", packageFullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     */
    Resume(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(6, this, "ptr", packageFullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     */
    TerminateAllProcesses(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(7, this, "ptr", packageFullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} sessionId 
     * @returns {HRESULT} 
     */
    SetTargetSessionId(sessionId) {
        result := ComCall(8, this, "uint", sessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<UInt32>} taskCount 
     * @param {Pointer<Guid>} taskIds 
     * @param {Pointer<PWSTR>} taskNames 
     * @returns {HRESULT} 
     */
    EnumerateBackgroundTasks(packageFullName, taskCount, taskIds, taskNames) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(9, this, "ptr", packageFullName, "uint*", taskCount, "ptr", taskIds, "ptr", taskNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} taskId 
     * @returns {HRESULT} 
     */
    ActivateBackgroundTask(taskId) {
        result := ComCall(10, this, "ptr", taskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     */
    StartServicing(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(11, this, "ptr", packageFullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     */
    StopServicing(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(12, this, "ptr", packageFullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Integer} sessionId 
     * @returns {HRESULT} 
     */
    StartSessionRedirection(packageFullName, sessionId) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(13, this, "ptr", packageFullName, "uint", sessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     */
    StopSessionRedirection(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(14, this, "ptr", packageFullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<Int32>} packageExecutionState 
     * @returns {HRESULT} 
     */
    GetPackageExecutionState(packageFullName, packageExecutionState) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(15, this, "ptr", packageFullName, "int*", packageExecutionState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<IPackageExecutionStateChangeNotification>} pPackageExecutionStateChangeNotification 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    RegisterForPackageStateChanges(packageFullName, pPackageExecutionStateChangeNotification, pdwCookie) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(16, this, "ptr", packageFullName, "ptr", pPackageExecutionStateChangeNotification, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnregisterForPackageStateChanges(dwCookie) {
        result := ComCall(17, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
