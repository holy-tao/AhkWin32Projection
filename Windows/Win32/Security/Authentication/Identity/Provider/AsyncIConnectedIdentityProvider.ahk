#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIConnectedIdentityProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIConnectedIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{9ce55141-bce9-4e15-824d-43d79f512f93}")

    /**
     * The class identifier for AsyncIConnectedIdentityProvider
     * @type {Guid}
     */
    static CLSID => Guid("{9ce55141-bce9-4e15-824d-43d79f512f93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_ConnectIdentity", "Finish_ConnectIdentity", "Begin_DisconnectIdentity", "Finish_DisconnectIdentity", "Begin_IsConnected", "Finish_IsConnected", "Begin_GetUrl", "Finish_GetUrl", "Begin_GetAccountState", "Finish_GetAccountState"]

    /**
     * 
     * @param {Pointer<Integer>} AuthBuffer 
     * @param {Integer} AuthBufferSize 
     * @returns {HRESULT} 
     */
    Begin_ConnectIdentity(AuthBuffer, AuthBufferSize) {
        AuthBufferMarshal := AuthBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, AuthBufferMarshal, AuthBuffer, "uint", AuthBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_ConnectIdentity() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_DisconnectIdentity() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_DisconnectIdentity() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_IsConnected() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Connected 
     * @returns {HRESULT} 
     */
    Finish_IsConnected(Connected) {
        result := ComCall(8, this, "ptr", Connected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Identifier 
     * @param {IBindCtx} Context 
     * @returns {HRESULT} 
     */
    Begin_GetUrl(Identifier, Context) {
        result := ComCall(9, this, "int", Identifier, "ptr", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<PWSTR>} Url 
     * @returns {HRESULT} 
     */
    Finish_GetUrl(PostData, Url) {
        result := ComCall(10, this, "ptr", PostData, "ptr", Url, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_GetAccountState() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     */
    Finish_GetAccountState(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pStateMarshal, pState, "HRESULT")
        return result
    }
}
