#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Credentials\WebAccountProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationTransferTokenRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationTransferTokenRequest
     * @type {Guid}
     */
    static IID => Guid("{7acfa5b6-529d-5e76-9846-f3fd999304d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccountProvider", "get_TransferToken", "put_TransferToken", "get_Properties", "get_CorrelationId", "put_CorrelationId"]

    /**
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * @type {HSTRING} 
     */
    TransferToken {
        get => this.get_TransferToken()
        set => this.put_TransferToken(value)
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {HSTRING} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
        set => this.put_CorrelationId(value)
    }

    /**
     * 
     * @returns {WebAccountProvider} 
     */
    get_WebAccountProvider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountProvider(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransferToken() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TransferToken(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Properties() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CorrelationId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CorrelationId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
