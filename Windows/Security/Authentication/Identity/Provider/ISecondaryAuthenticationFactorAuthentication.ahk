#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorAuthentication extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorAuthentication
     * @type {Guid}
     */
    static IID => Guid("{020a16e5-6a25-40a3-8c00-50a023f619d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServiceAuthenticationHmac", "get_SessionNonce", "get_DeviceNonce", "get_DeviceConfigurationData", "FinishAuthenticationAsync", "AbortAuthenticationAsync"]

    /**
     * @type {IBuffer} 
     */
    ServiceAuthenticationHmac {
        get => this.get_ServiceAuthenticationHmac()
    }

    /**
     * @type {IBuffer} 
     */
    SessionNonce {
        get => this.get_SessionNonce()
    }

    /**
     * @type {IBuffer} 
     */
    DeviceNonce {
        get => this.get_DeviceNonce()
    }

    /**
     * @type {IBuffer} 
     */
    DeviceConfigurationData {
        get => this.get_DeviceConfigurationData()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ServiceAuthenticationHmac() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionNonce() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeviceNonce() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeviceConfigurationData() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} deviceHmac 
     * @param {IBuffer} sessionHmac 
     * @returns {IAsyncOperation<Integer>} 
     */
    FinishAuthenticationAsync(deviceHmac, sessionHmac) {
        result := ComCall(10, this, "ptr", deviceHmac, "ptr", sessionHmac, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} errorLogMessage 
     * @returns {IAsyncAction} 
     */
    AbortAuthenticationAsync(errorLogMessage) {
        if(errorLogMessage is String) {
            pin := HSTRING.Create(errorLogMessage)
            errorLogMessage := pin.Value
        }
        errorLogMessage := errorLogMessage is Win32Handle ? NumGet(errorLogMessage, "ptr") : errorLogMessage

        result := ComCall(11, this, "ptr", errorLogMessage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
