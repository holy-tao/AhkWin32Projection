#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class IWebViewControlProcessOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlProcessOptions
     * @type {Guid}
     */
    static IID => Guid("{1cca72a7-3bd6-4826-8261-6c8189505d89}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_EnterpriseId", "get_EnterpriseId", "put_PrivateNetworkClientServerCapability", "get_PrivateNetworkClientServerCapability"]

    /**
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
        set => this.put_EnterpriseId(value)
    }

    /**
     * @type {Integer} 
     */
    PrivateNetworkClientServerCapability {
        get => this.get_PrivateNetworkClientServerCapability()
        set => this.put_PrivateNetworkClientServerCapability(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EnterpriseId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrivateNetworkClientServerCapability(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivateNetworkClientServerCapability() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
