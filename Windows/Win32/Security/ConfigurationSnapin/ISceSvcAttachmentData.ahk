#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISceSvcAttachmentPersistInfo.ahk" { ISceSvcAttachmentPersistInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SCESVC_INFO_TYPE.ahk" { SCESVC_INFO_TYPE }

/**
 * The ISceSvcAttachmentData interface retrieves configuration and analysis data about a specified security service from the Security Configuration snap-ins.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/nn-scesvc-iscesvcattachmentdata
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct ISceSvcAttachmentData extends IUnknown {
    /**
     * The interface identifier for ISceSvcAttachmentData
     * @type {Guid}
     */
    static IID := Guid("{17c35fde-200d-11d1-affb-00c04fb984f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISceSvcAttachmentData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetData     : IntPtr
        Initialize  : IntPtr
        FreeBuffer  : IntPtr
        CloseHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISceSvcAttachmentData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetData method retrieves configuration information from the Security Configuration snap-in.
     * @param {Pointer<Void>} scesvcHandle Type: <b>SCESVC_HANDLE</b>
     * 
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/scesvc-handle">SCESVC_HANDLE</a> returned during a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentdata-initialize">ISceSvcAttachmentData::Initialize</a>.
     * @param {SCESVC_INFO_TYPE} sceType Type: <b>SCESVC_INFO_TYPE</b>
     * 
     * A
     * @param {Pointer<Pointer<Void>>} ppvData Type: <b>PVOID*</b>
     * 
     * Pointer to a buffer which receives the data.
     * @param {Pointer<Integer>} psceEnumHandle Type: <b>PSCE_ENUMERATION_CONTEXT</b>
     * 
     * An opaque handle used to navigate through the security database.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The return value is an <b>HRESULT</b>. A value of S_OK indicates the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentdata-getdata
     */
    GetData(scesvcHandle, sceType, ppvData, psceEnumHandle) {
        scesvcHandleMarshal := scesvcHandle is VarRef ? "ptr" : "ptr"
        ppvDataMarshal := ppvData is VarRef ? "ptr*" : "ptr"
        psceEnumHandleMarshal := psceEnumHandle is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, scesvcHandleMarshal, scesvcHandle, SCESVC_INFO_TYPE, sceType, ppvDataMarshal, ppvData, psceEnumHandleMarshal, psceEnumHandle, "HRESULT")
        return result
    }

    /**
     * The Initialize method informs the Security Configuration snap-in that the snap-in extension is loaded, and it establishes a context for communications.
     * @param {Pointer<Integer>} lpServiceName String that specifies the name of the security service to retrieve information about.
     * @param {Pointer<Integer>} lpTemplateName String that specifies the name of the template.
     * @param {ISceSvcAttachmentPersistInfo} lpSceSvcPersistInfo Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nn-scesvc-iscesvcattachmentpersistinfo">ISceSvcAttachmentPersistInfo</a> interface of the attachment snap-in extension.
     * @param {Pointer<Pointer<Void>>} pscesvcHandle Pointer that receives an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/scesvc-handle">SCESVC_HANDLE</a> that represents the communication context between the Security Configuration snap-in and the snap-in extension. This handle is passed in as a parameter to the other <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nn-scesvc-iscesvcattachmentdata">ISceSvcAttachmentData</a> methods. When the attachment snap-in extension no longer needs this handle, free it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentdata-closehandle">ISceSvcAttachmentData::CloseHandle</a>.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentdata-initialize
     */
    Initialize(lpServiceName, lpTemplateName, lpSceSvcPersistInfo, pscesvcHandle) {
        lpServiceNameMarshal := lpServiceName is VarRef ? "char*" : "ptr"
        lpTemplateNameMarshal := lpTemplateName is VarRef ? "char*" : "ptr"
        pscesvcHandleMarshal := pscesvcHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, lpServiceNameMarshal, lpServiceName, lpTemplateNameMarshal, lpTemplateName, "ptr", lpSceSvcPersistInfo, pscesvcHandleMarshal, pscesvcHandle, "HRESULT")
        return result
    }

    /**
     * The FreeBuffer method frees memory allocated by the Security Configuration snap-in.
     * @remarks
     * You should call this method to free the data buffer returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentdata-getdata">ISceSvcAttachmentData::GetData</a>.
     * @param {Pointer<Void>} pvData Void pointer to the buffer to be freed.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentdata-freebuffer
     */
    FreeBuffer(pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvDataMarshal, pvData, "HRESULT")
        return result
    }

    /**
     * The CloseHandle method closes a handle opened during a previous call to ISceSvcAttachmentData::Initialize.
     * @remarks
     * You should call this method when your attachment snap-in extension no longer requires the handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentdata-initialize">ISceSvcAttachmentData::Initialize</a>.
     * @param {Pointer<Void>} scesvcHandle The 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/scesvc-handle">SCESVC_HANDLE</a> to close.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentdata-closehandle
     */
    CloseHandle(scesvcHandle) {
        scesvcHandleMarshal := scesvcHandle is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, scesvcHandleMarshal, scesvcHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISceSvcAttachmentData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 5)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 5)
        this.vtbl.FreeBuffer := CallbackCreate(GetMethod(implObj, "FreeBuffer"), flags, 2)
        this.vtbl.CloseHandle := CallbackCreate(GetMethod(implObj, "CloseHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.FreeBuffer)
        CallbackFree(this.vtbl.CloseHandle)
    }
}
