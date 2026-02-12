#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\WindowsSoftwareUpdateResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateProviderStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateProviderStatus
     * @type {Guid}
     */
    static IID => Guid("{076741b8-7a8e-53b6-9fb7-e290b13c52e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_CancelRequested", "remove_CancelRequested", "SetScanResult", "SetActionProgress", "SetActionResult"]

    /**
     * 
     * @param {TypedEventHandler<WindowsSoftwareUpdateProviderStatus, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CancelRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CancelRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @param {Integer} extendedError 
     * @param {IIterable<WindowsSoftwareUpdate>} updates 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    SetScanResult(succeeded, resultCode, extendedError, updates) {
        result := ComCall(8, this, "int", succeeded, "uint", resultCode, "uint", extendedError, "ptr", updates, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateResult(result_)
    }

    /**
     * 
     * @param {Integer} current 
     * @param {Integer} total 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    SetActionProgress(current, total) {
        result := ComCall(9, this, "uint", current, "uint", total, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateResult(result_)
    }

    /**
     * 
     * @param {WindowsSoftwareUpdateProviderActionResult} actionResult 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    SetActionResult(actionResult) {
        result := ComCall(10, this, "ptr", actionResult, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateResult(result_)
    }
}
