#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WebProviderError.ahk
#Include ..\..\..\Credentials\WebAccount.ahk
#Include ..\..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebTokenResponse extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebTokenResponse
     * @type {Guid}
     */
    static IID => Guid("{67a7c5ca-83f6-44c6-a3b1-0eb69e41fa8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Token", "get_ProviderError", "get_WebAccount", "get_Properties"]

    /**
     * @type {HSTRING} 
     */
    Token {
        get => this.get_Token()
    }

    /**
     * @type {WebProviderError} 
     */
    ProviderError {
        get => this.get_ProviderError()
    }

    /**
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Token() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WebProviderError} 
     */
    get_ProviderError() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebProviderError(value)
    }

    /**
     * 
     * @returns {WebAccount} 
     */
    get_WebAccount() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccount(value)
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
}
