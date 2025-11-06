#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods of interaction with a connected identity provider.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iconnectedidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IConnectedIdentityProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectedIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{b7417b54-e08c-429b-96c8-678d1369ecb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectIdentity", "DisconnectIdentity", "IsConnected", "GetUrl", "GetAccountState"]

    /**
     * 
     * @param {Pointer<Integer>} AuthBuffer 
     * @param {Integer} AuthBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iconnectedidentityprovider-connectidentity
     */
    ConnectIdentity(AuthBuffer, AuthBufferSize) {
        AuthBufferMarshal := AuthBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, AuthBufferMarshal, AuthBuffer, "uint", AuthBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iconnectedidentityprovider-disconnectidentity
     */
    DisconnectIdentity() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsConnected() {
        result := ComCall(5, this, "int*", &Connected := 0, "HRESULT")
        return Connected
    }

    /**
     * 
     * @param {Integer} Identifier 
     * @param {IBindCtx} Context 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<PWSTR>} Url 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iconnectedidentityprovider-geturl
     */
    GetUrl(Identifier, Context, PostData, Url) {
        UrlMarshal := Url is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "int", Identifier, "ptr", Context, "ptr", PostData, UrlMarshal, Url, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAccountState() {
        result := ComCall(7, this, "int*", &pState := 0, "HRESULT")
        return pState
    }
}
