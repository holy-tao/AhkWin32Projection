#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISceSvcAttachmentPersistInfo interface retrieves any modified configuration or analysis information from an attachment snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/nn-scesvc-iscesvcattachmentpersistinfo
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct ISceSvcAttachmentPersistInfo extends IUnknown {
    /**
     * The interface identifier for ISceSvcAttachmentPersistInfo
     * @type {Guid}
     */
    static IID := Guid("{6d90e0d0-200d-11d1-affb-00c04fb984f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISceSvcAttachmentPersistInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Save       : IntPtr
        IsDirty    : IntPtr
        FreeBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISceSvcAttachmentPersistInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Save method causes the snap-in extension to return information about the data that needs to be saved. The caller is responsible for saving the data.
     * @remarks
     * The caller should free the buffer set in <i>ppvData</i> by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-freebuffer">ISceSvcAttachmentPersistInfo::FreeBuffer</a>.
     * @param {Pointer<Integer>} lpTemplateName Pointer to a null-terminated string that contains the security template name to save data to.
     * @param {Pointer<Pointer<Void>>} scesvcHandle Pointer that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/scesvc-handle">SCESVC_HANDLE</a> the attachment snap-in extension is using to communicate with the Security Configuration snap-ins.
     * @param {Pointer<Pointer<Void>>} ppvData Pointer that receives a buffer that contains the data to be saved.
     * @param {Pointer<BOOL>} pbOverwriteAll Pointer to a <b>BOOL</b> that receives a value indicating whether preexisting data should be overwritten.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-save
     */
    Save(lpTemplateName, scesvcHandle, ppvData, pbOverwriteAll) {
        lpTemplateNameMarshal := lpTemplateName is VarRef ? "char*" : "ptr"
        scesvcHandleMarshal := scesvcHandle is VarRef ? "ptr*" : "ptr"
        ppvDataMarshal := ppvData is VarRef ? "ptr*" : "ptr"
        pbOverwriteAllMarshal := pbOverwriteAll is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lpTemplateNameMarshal, lpTemplateName, scesvcHandleMarshal, scesvcHandle, ppvDataMarshal, ppvData, pbOverwriteAllMarshal, pbOverwriteAll, "HRESULT")
        return result
    }

    /**
     * The IsDirty method returns a value indicating whether data in the attachment snap-in has been modified since it was last saved.
     * @param {Pointer<Integer>} lpTemplateName Pointer to a null-terminated string that contains a security template name. Multiple security templates can be modified so that each service extension can be expanded under multiple templates.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-isdirty
     */
    IsDirty(lpTemplateName) {
        lpTemplateNameMarshal := lpTemplateName is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, lpTemplateNameMarshal, lpTemplateName, Int32)
        return result
    }

    /**
     * The FreeBuffer method frees memory allocated by the attachment snap-in extension.
     * @remarks
     * You should call this method to free the data buffer returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-save">ISceSvcAttachmentPersistInfo::Save</a>.
     * @param {Pointer<Void>} pvData Pointer to the buffer to free.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-freebuffer
     */
    FreeBuffer(pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvDataMarshal, pvData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISceSvcAttachmentPersistInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 5)
        this.vtbl.IsDirty := CallbackCreate(GetMethod(implObj, "IsDirty"), flags, 2)
        this.vtbl.FreeBuffer := CallbackCreate(GetMethod(implObj, "FreeBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.IsDirty)
        CallbackFree(this.vtbl.FreeBuffer)
    }
}
