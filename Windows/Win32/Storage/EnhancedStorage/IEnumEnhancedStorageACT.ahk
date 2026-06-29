#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnhancedStorageACT.ahk" { IEnhancedStorageACT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface as the top level enumerator for all IEEE 1667 Addressable Contact Targets (ACT).
 * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nn-ehstorapi-ienumenhancedstorageact
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct IEnumEnhancedStorageACT extends IUnknown {
    /**
     * The interface identifier for IEnumEnhancedStorageACT
     * @type {Guid}
     */
    static IID := Guid("{09b224bd-1335-4631-a7ff-cfd3a92646d7}")

    /**
     * The class identifier for EnumEnhancedStorageACT
     * @type {Guid}
     */
    static CLSID := Guid("{fe841493-835c-4fa3-b6cc-b4b2d4719848}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumEnhancedStorageACT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetACTs        : IntPtr
        GetMatchingACT : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumEnhancedStorageACT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an enumeration of all the Addressable Command Targets (ACT) currently connected to the system. If at least one ACT is present, the Enhanced Storage API allocates an array of 1 or more IEnumEnhancedStorageACT pointers.
     * @remarks
     * The memory containing the array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstorageact">IEnhancedStorageACT</a> interfaces is allocated by the Enhanced Storage API and must be freed by passing the returned pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> method.
     * @param {Pointer<Pointer<IEnhancedStorageACT>>} pppIEnhancedStorageACTs Array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstorageact">IEnhancedStorageACT</a> interface pointers that represent the ACTs for all devices connected to the system. This array is allocated within the API.
     * @param {Pointer<Integer>} pcEnhancedStorageACTs Count of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstorageact">IEnhancedStorageACT</a> pointers returned. This is the dimension of the  array represented by <i>pppIEnhancedStorageACTs</i>.
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
     * One or more ACTs were found. 
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
     * pppIEnhancedStorageACTs or pcEnhancedStorageACTs is <b>NULL</b>.
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
     * Operation failed due to insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienumenhancedstorageact-getacts
     */
    GetACTs(pppIEnhancedStorageACTs, pcEnhancedStorageACTs) {
        pppIEnhancedStorageACTsMarshal := pppIEnhancedStorageACTs is VarRef ? "ptr*" : "ptr"
        pcEnhancedStorageACTsMarshal := pcEnhancedStorageACTs is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pppIEnhancedStorageACTsMarshal, pppIEnhancedStorageACTs, pcEnhancedStorageACTsMarshal, pcEnhancedStorageACTs, "HRESULT")
        return result
    }

    /**
     * Returns the Addressable Command Target (ACT) associated with the volume specified via the string supplied by the client.
     * @remarks
     * This method can also be utilized by the client to determine if the specified volume resides on, and is represented by an IEEE 1667 ACT.
     * @param {PWSTR} szVolume A string that specifies the volume for which a matching ACT is searched for.
     * @returns {IEnhancedStorageACT} Pointer to an <b>IEnhancedStorageACT</b> interface pointer that represents the matching ACT. If no matching ACT is found the error <b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienumenhancedstorageact-getmatchingact
     */
    GetMatchingACT(szVolume) {
        szVolume := szVolume is String ? StrPtr(szVolume) : szVolume

        result := ComCall(4, this, "ptr", szVolume, "ptr*", &ppIEnhancedStorageACT := 0, "HRESULT")
        return IEnhancedStorageACT(ppIEnhancedStorageACT)
    }

    Query(iid) {
        if (IEnumEnhancedStorageACT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetACTs := CallbackCreate(GetMethod(implObj, "GetACTs"), flags, 3)
        this.vtbl.GetMatchingACT := CallbackCreate(GetMethod(implObj, "GetMatchingACT"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetACTs)
        CallbackFree(this.vtbl.GetMatchingACT)
    }
}
