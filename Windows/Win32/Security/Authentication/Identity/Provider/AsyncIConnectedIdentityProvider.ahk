#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import ".\ACCOUNT_STATE.ahk" { ACCOUNT_STATE }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDENTITY_URL.ahk" { IDENTITY_URL }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct AsyncIConnectedIdentityProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIConnectedIdentityProvider
     * @type {Guid}
     */
    static IID := Guid("{9ce55141-bce9-4e15-824d-43d79f512f93}")

    /**
     * The class identifier for AsyncIConnectedIdentityProvider
     * @type {Guid}
     */
    static CLSID := Guid("{9ce55141-bce9-4e15-824d-43d79f512f93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIConnectedIdentityProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_ConnectIdentity     : IntPtr
        Finish_ConnectIdentity    : IntPtr
        Begin_DisconnectIdentity  : IntPtr
        Finish_DisconnectIdentity : IntPtr
        Begin_IsConnected         : IntPtr
        Finish_IsConnected        : IntPtr
        Begin_GetUrl              : IntPtr
        Finish_GetUrl             : IntPtr
        Begin_GetAccountState     : IntPtr
        Finish_GetAccountState    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIConnectedIdentityProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {BOOL} 
     */
    Finish_IsConnected() {
        result := ComCall(8, this, BOOL.Ptr, &Connected := 0, "HRESULT")
        return Connected
    }

    /**
     * 
     * @param {IDENTITY_URL} Identifier 
     * @param {IBindCtx} _Context 
     * @returns {HRESULT} 
     */
    Begin_GetUrl(Identifier, _Context) {
        result := ComCall(9, this, IDENTITY_URL, Identifier, "ptr", _Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<PWSTR>} Url 
     * @returns {HRESULT} 
     */
    Finish_GetUrl(PostData, Url) {
        UrlMarshal := Url is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, VARIANT.Ptr, PostData, UrlMarshal, Url, "HRESULT")
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
     * @returns {ACCOUNT_STATE} 
     */
    Finish_GetAccountState() {
        result := ComCall(12, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    Query(iid) {
        if (AsyncIConnectedIdentityProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_ConnectIdentity := CallbackCreate(GetMethod(implObj, "Begin_ConnectIdentity"), flags, 3)
        this.vtbl.Finish_ConnectIdentity := CallbackCreate(GetMethod(implObj, "Finish_ConnectIdentity"), flags, 1)
        this.vtbl.Begin_DisconnectIdentity := CallbackCreate(GetMethod(implObj, "Begin_DisconnectIdentity"), flags, 1)
        this.vtbl.Finish_DisconnectIdentity := CallbackCreate(GetMethod(implObj, "Finish_DisconnectIdentity"), flags, 1)
        this.vtbl.Begin_IsConnected := CallbackCreate(GetMethod(implObj, "Begin_IsConnected"), flags, 1)
        this.vtbl.Finish_IsConnected := CallbackCreate(GetMethod(implObj, "Finish_IsConnected"), flags, 2)
        this.vtbl.Begin_GetUrl := CallbackCreate(GetMethod(implObj, "Begin_GetUrl"), flags, 3)
        this.vtbl.Finish_GetUrl := CallbackCreate(GetMethod(implObj, "Finish_GetUrl"), flags, 3)
        this.vtbl.Begin_GetAccountState := CallbackCreate(GetMethod(implObj, "Begin_GetAccountState"), flags, 1)
        this.vtbl.Finish_GetAccountState := CallbackCreate(GetMethod(implObj, "Finish_GetAccountState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_ConnectIdentity)
        CallbackFree(this.vtbl.Finish_ConnectIdentity)
        CallbackFree(this.vtbl.Begin_DisconnectIdentity)
        CallbackFree(this.vtbl.Finish_DisconnectIdentity)
        CallbackFree(this.vtbl.Begin_IsConnected)
        CallbackFree(this.vtbl.Finish_IsConnected)
        CallbackFree(this.vtbl.Begin_GetUrl)
        CallbackFree(this.vtbl.Finish_GetUrl)
        CallbackFree(this.vtbl.Begin_GetAccountState)
        CallbackFree(this.vtbl.Finish_GetAccountState)
    }
}
