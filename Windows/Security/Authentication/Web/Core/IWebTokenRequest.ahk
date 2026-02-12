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
class IWebTokenRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebTokenRequest
     * @type {Guid}
     */
    static IID => Guid("{b77b4d68-adcb-4673-b364-0cf7b35caf97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccountProvider", "get_Scope", "get_ClientId", "get_PromptType", "get_Properties"]

    /**
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * @type {HSTRING} 
     */
    Scope {
        get => this.get_Scope()
    }

    /**
     * @type {HSTRING} 
     */
    ClientId {
        get => this.get_ClientId()
    }

    /**
     * @type {Integer} 
     */
    PromptType {
        get => this.get_PromptType()
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
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
    get_Scope() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClientId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PromptType() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Properties() {
        result := ComCall(10, this, "ptr*", &requestProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), requestProperties)
    }
}
