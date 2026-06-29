#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IIdentityStoreEx extends IUnknown {
    /**
     * The interface identifier for IIdentityStoreEx
     * @type {Guid}
     */
    static IID := Guid("{f9f9eb98-8f7f-4e38-9577-6980114ce32b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdentityStoreEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateConnectedIdentity : IntPtr
        DeleteConnectedIdentity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdentityStoreEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} LocalName 
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    CreateConnectedIdentity(LocalName, ConnectedName, ProviderGUID) {
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(3, this, "ptr", LocalName, "ptr", ConnectedName, Guid.Ptr, ProviderGUID, "HRESULT")
        return result
    }

    /**
     * Deletes the user credential used for the connected identity.
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} If the function succeeds, the function returns SEC\_E\_OK.
     * 
     * If the function fails, the function may return one of the following error codes.
     * 
     * 
     * 
     * | Return value                                                                                               | Description                                                                                                                                                 |
     * |------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>STATUS\_INVALID\_PARAMETER</dt> </dl>      | A parameter is not valid.<br/>                                                                                                                        |
     * | <dl> <dt>STATUS\_NO\_SUCH\_USER</dt> </dl>          | The user identified by *UserSid* does not exist, is not currently connected, or there is no identity whose user name matches *IdentityUserName*.<br/> |
     * | <dl> <dt>STATUS\_INSUFFICIENT\_RESOURCES</dt> </dl> | There is not enough memory to process the request.<br/>                                                                                               |
     * @see https://learn.microsoft.com/windows/win32/SecAuthN/deleteconnectedidentity
     */
    DeleteConnectedIdentity(ConnectedName, ProviderGUID) {
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(4, this, "ptr", ConnectedName, Guid.Ptr, ProviderGUID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIdentityStoreEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateConnectedIdentity := CallbackCreate(GetMethod(implObj, "CreateConnectedIdentity"), flags, 4)
        this.vtbl.DeleteConnectedIdentity := CallbackCreate(GetMethod(implObj, "DeleteConnectedIdentity"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateConnectedIdentity)
        CallbackFree(this.vtbl.DeleteConnectedIdentity)
    }
}
