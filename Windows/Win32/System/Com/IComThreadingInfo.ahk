#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\APTTYPE.ahk" { APTTYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\THDTYPE.ahk" { THDTYPE }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IComThreadingInfo (objidlbase.h) interface enables you to obtain the following information about the apartment and thread that the caller is executing.
 * @remarks
 * An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-icomthreadinginfo
 * @namespace Windows.Win32.System.Com
 */
export default struct IComThreadingInfo extends IUnknown {
    /**
     * The interface identifier for IComThreadingInfo
     * @type {Guid}
     */
    static IID := Guid("{000001ce-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComThreadingInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentApartmentType   : IntPtr
        GetCurrentThreadType      : IntPtr
        GetCurrentLogicalThreadId : IntPtr
        SetCurrentLogicalThreadId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComThreadingInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IComThreadingInfo::GetCurrentApartmentType (objidlbase.h) method retrieves the type of apartment in which the caller is executing.
     * @returns {APTTYPE} A points to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-apttype">APTTYPE</a> enumeration value that characterizes the caller's apartment.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-getcurrentapartmenttype
     */
    GetCurrentApartmentType() {
        result := ComCall(3, this, "int*", &pAptType := 0, "HRESULT")
        return pAptType
    }

    /**
     * The IComThreadingInfo::GetCurrentThreadType (objidlbase.h) method retrieves the type of thread in which the caller is executing.
     * @returns {THDTYPE} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-thdtype">THDTYPE</a> enumeration value that characterizes the caller's thread.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-getcurrentthreadtype
     */
    GetCurrentThreadType() {
        result := ComCall(4, this, "int*", &pThreadType := 0, "HRESULT")
        return pThreadType
    }

    /**
     * The IComThreadingInfo::GetCurrentLogicalThreadId (objidlbase.h) method retrieves the GUID of the thread in which the caller is executing.
     * @returns {Guid} A pointer to the GUID of the caller's thread.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-getcurrentlogicalthreadid
     */
    GetCurrentLogicalThreadId() {
        pguidLogicalThreadId := Guid()
        result := ComCall(5, this, Guid.Ptr, pguidLogicalThreadId, "HRESULT")
        return pguidLogicalThreadId
    }

    /**
     * The IComThreadingInfo::SetCurrentLogicalThreadId (objidlbase.h) method sets the GUID of the thread in which the caller is executing.
     * @param {Pointer<Guid>} rguid A reference to a GUID for the caller's thread.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
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
     * The caller is not executing in an apartment.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-setcurrentlogicalthreadid
     */
    SetCurrentLogicalThreadId(rguid) {
        result := ComCall(6, this, Guid.Ptr, rguid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComThreadingInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentApartmentType := CallbackCreate(GetMethod(implObj, "GetCurrentApartmentType"), flags, 2)
        this.vtbl.GetCurrentThreadType := CallbackCreate(GetMethod(implObj, "GetCurrentThreadType"), flags, 2)
        this.vtbl.GetCurrentLogicalThreadId := CallbackCreate(GetMethod(implObj, "GetCurrentLogicalThreadId"), flags, 2)
        this.vtbl.SetCurrentLogicalThreadId := CallbackCreate(GetMethod(implObj, "SetCurrentLogicalThreadId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentApartmentType)
        CallbackFree(this.vtbl.GetCurrentThreadType)
        CallbackFree(this.vtbl.GetCurrentLogicalThreadId)
        CallbackFree(this.vtbl.SetCurrentLogicalThreadId)
    }
}
