#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ACT_AUTHORIZATION_STATE.ahk" { ACT_AUTHORIZATION_STATE }
#Import ".\IEnhancedStorageSilo.ahk" { IEnhancedStorageSilo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface to obtain information and perform operations for a 1667 Addressable Contact Target (ACT).
 * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nn-ehstorapi-ienhancedstorageact
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct IEnhancedStorageACT extends IUnknown {
    /**
     * The interface identifier for IEnhancedStorageACT
     * @type {Guid}
     */
    static IID := Guid("{6e7781f4-e0f2-4239-b976-a01abab52930}")

    /**
     * The class identifier for EnhancedStorageACT
     * @type {Guid}
     */
    static CLSID := Guid("{af076a15-2ece-4ad4-bb21-29f040e176d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnhancedStorageACT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Authorize             : IntPtr
        Unauthorize           : IntPtr
        GetAuthorizationState : IntPtr
        GetMatchingVolume     : IntPtr
        GetUniqueIdentity     : IntPtr
        GetSilos              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnhancedStorageACT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates the Addressable Command Target (ACT) with the Authorized state defined by ACT_AUTHORIZATION_STATE, and ensures the authentication of each individual silo according to the required sequence and logical combination necessary to authorize access to the ACT.
     * @remarks
     * This interface method can be used when an application wants to change the ACT to the 'Authorized' state.
     * @param {Integer} hwndParent Not used.
     * @param {Integer} dwFlags Not used.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authorization completed successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authorization operation has failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-authorize
     */
    Authorize(hwndParent, dwFlags) {
        result := ComCall(3, this, "uint", hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Associates the Addressable Command Target (ACT) with the Unauthorized state defined by ACT_AUTHORIZATION_STATE, and ensures the deauthentication of each individual silo according to the required sequence and logical combination necessary to restrict access to the ACT.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unauthorization completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-unauthorize
     */
    Unauthorize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Returns the current authorization state of the ACT.
     * @returns {ACT_AUTHORIZATION_STATE} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ehstorapi/ns-ehstorapi-act_authorization_state">ACT_AUTHORIZATION_STATE</a> that specifies the current authorization state of the ACT.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getauthorizationstate
     */
    GetAuthorizationState() {
        pState := ACT_AUTHORIZATION_STATE()
        result := ComCall(5, this, ACT_AUTHORIZATION_STATE.Ptr, pState, "HRESULT")
        return pState
    }

    /**
     * Returns the volume associated with the Addressable Command Target (ACT).
     * @returns {PWSTR} Pointer to a string that represents the volume associated with the ACT.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getmatchingvolume
     */
    GetMatchingVolume() {
        result := ComCall(6, this, PWSTR.Ptr, &ppwszVolume := 0, "HRESULT")
        return ppwszVolume
    }

    /**
     * Retrieves the unique identity of the Addressable Command Target (ACT).
     * @remarks
     * The memory containing the unique identity of the ACT is allocated by the Enhanced Storage API and must be freed by passing the returned pointer to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Pointer to a string that represents the unique identity of the ACT.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getuniqueidentity
     */
    GetUniqueIdentity() {
        result := ComCall(7, this, PWSTR.Ptr, &ppwszIdentity := 0, "HRESULT")
        return ppwszIdentity
    }

    /**
     * Returns an enumeration of all silos associated with the Addressable Command Target (ACT).
     * @remarks
     * The memory containing the array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstoragesilo">IEnhancedStorageSilo</a> interfaces is allocated by the Enhanced Storage API and must be freed by passing the returned pointer to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Pointer<IEnhancedStorageSilo>>} pppIEnhancedStorageSilos Returns an array of one or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstoragesilo">IEnhancedStorageSilo</a> interface pointers associated with  the ACT.
     * @param {Pointer<Integer>} pcEnhancedStorageSilos Count of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstoragesilo">IEnhancedStorageSilo</a> pointers returned. This value indicates the dimension of the  array represented by <i>pppIEnhancedStorageSilos</i>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Command was sent successfully and all associated silos have been enumerated. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Command failed due to insufficient memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pppIEnhancedStorageSilos</i> or <i>pcEnhancedStorageSilos</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getsilos
     */
    GetSilos(pppIEnhancedStorageSilos, pcEnhancedStorageSilos) {
        pppIEnhancedStorageSilosMarshal := pppIEnhancedStorageSilos is VarRef ? "ptr*" : "ptr"
        pcEnhancedStorageSilosMarshal := pcEnhancedStorageSilos is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pppIEnhancedStorageSilosMarshal, pppIEnhancedStorageSilos, pcEnhancedStorageSilosMarshal, pcEnhancedStorageSilos, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnhancedStorageACT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Authorize := CallbackCreate(GetMethod(implObj, "Authorize"), flags, 3)
        this.vtbl.Unauthorize := CallbackCreate(GetMethod(implObj, "Unauthorize"), flags, 1)
        this.vtbl.GetAuthorizationState := CallbackCreate(GetMethod(implObj, "GetAuthorizationState"), flags, 2)
        this.vtbl.GetMatchingVolume := CallbackCreate(GetMethod(implObj, "GetMatchingVolume"), flags, 2)
        this.vtbl.GetUniqueIdentity := CallbackCreate(GetMethod(implObj, "GetUniqueIdentity"), flags, 2)
        this.vtbl.GetSilos := CallbackCreate(GetMethod(implObj, "GetSilos"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Authorize)
        CallbackFree(this.vtbl.Unauthorize)
        CallbackFree(this.vtbl.GetAuthorizationState)
        CallbackFree(this.vtbl.GetMatchingVolume)
        CallbackFree(this.vtbl.GetUniqueIdentity)
        CallbackFree(this.vtbl.GetSilos)
    }
}
