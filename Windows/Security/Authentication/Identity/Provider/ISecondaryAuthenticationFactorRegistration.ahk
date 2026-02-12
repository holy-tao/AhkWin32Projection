#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorRegistration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorRegistration
     * @type {Guid}
     */
    static IID => Guid("{9f4cbbb4-8cba-48b0-840d-dbb22a54c678}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FinishRegisteringDeviceAsync", "AbortRegisteringDeviceAsync"]

    /**
     * 
     * @param {IBuffer} deviceConfigurationData 
     * @returns {IAsyncAction} 
     */
    FinishRegisteringDeviceAsync(deviceConfigurationData) {
        result := ComCall(6, this, "ptr", deviceConfigurationData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} errorLogMessage 
     * @returns {IAsyncAction} 
     */
    AbortRegisteringDeviceAsync(errorLogMessage) {
        if(errorLogMessage is String) {
            pin := HSTRING.Create(errorLogMessage)
            errorLogMessage := pin.Value
        }
        errorLogMessage := errorLogMessage is Win32Handle ? NumGet(errorLogMessage, "ptr") : errorLogMessage

        result := ComCall(7, this, "ptr", errorLogMessage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
