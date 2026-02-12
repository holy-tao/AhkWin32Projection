#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WindowsUpdateGetAdministratorResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateAdministratorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateAdministratorStatics
     * @type {Guid}
     */
    static IID => Guid("{013e6d36-ef69-53bc-8db8-c403bca550ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRegisteredAdministrator", "RegisterForAdministration", "UnregisterForAdministration", "GetRegisteredAdministratorName", "RequestRestart", "CancelRestartRequest"]

    /**
     * 
     * @param {HSTRING} organizationName 
     * @returns {WindowsUpdateGetAdministratorResult} 
     */
    GetRegisteredAdministrator(organizationName) {
        if(organizationName is String) {
            pin := HSTRING.Create(organizationName)
            organizationName := pin.Value
        }
        organizationName := organizationName is Win32Handle ? NumGet(organizationName, "ptr") : organizationName

        result := ComCall(6, this, "ptr", organizationName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdateGetAdministratorResult(result_)
    }

    /**
     * 
     * @param {HSTRING} organizationName 
     * @param {Integer} options 
     * @returns {Integer} 
     */
    RegisterForAdministration(organizationName, options) {
        if(organizationName is String) {
            pin := HSTRING.Create(organizationName)
            organizationName := pin.Value
        }
        organizationName := organizationName is Win32Handle ? NumGet(organizationName, "ptr") : organizationName

        result := ComCall(7, this, "ptr", organizationName, "uint", options, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} organizationName 
     * @returns {Integer} 
     */
    UnregisterForAdministration(organizationName) {
        if(organizationName is String) {
            pin := HSTRING.Create(organizationName)
            organizationName := pin.Value
        }
        organizationName := organizationName is Win32Handle ? NumGet(organizationName, "ptr") : organizationName

        result := ComCall(8, this, "ptr", organizationName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetRegisteredAdministratorName() {
        result_ := HSTRING()
        result := ComCall(9, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {WindowsUpdateRestartRequestOptions} restartOptions 
     * @returns {HSTRING} 
     */
    RequestRestart(restartOptions) {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", restartOptions, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} requestRestartToken 
     * @returns {HRESULT} 
     */
    CancelRestartRequest(requestRestartToken) {
        if(requestRestartToken is String) {
            pin := HSTRING.Create(requestRestartToken)
            requestRestartToken := pin.Value
        }
        requestRestartToken := requestRestartToken is Win32Handle ? NumGet(requestRestartToken, "ptr") : requestRestartToken

        result := ComCall(11, this, "ptr", requestRestartToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
