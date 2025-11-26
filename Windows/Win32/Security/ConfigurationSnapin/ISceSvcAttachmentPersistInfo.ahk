#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISceSvcAttachmentPersistInfo interface retrieves any modified configuration or analysis information from an attachment snap-in.
 * @see https://docs.microsoft.com/windows/win32/api//scesvc/nn-scesvc-iscesvcattachmentpersistinfo
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class ISceSvcAttachmentPersistInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceSvcAttachmentPersistInfo
     * @type {Guid}
     */
    static IID => Guid("{6d90e0d0-200d-11d1-affb-00c04fb984f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Save", "IsDirty", "FreeBuffer"]

    /**
     * The Save method causes the snap-in extension to return information about the data that needs to be saved. The caller is responsible for saving the data.
     * @param {Pointer<Integer>} lpTemplateName Pointer to a null-terminated string that contains the security template name to save data to.
     * @param {Pointer<Pointer<Void>>} scesvcHandle Pointer that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/scesvc-handle">SCESVC_HANDLE</a> the attachment snap-in extension is using to communicate with the Security Configuration snap-ins.
     * @param {Pointer<Pointer<Void>>} ppvData Pointer that receives a buffer that contains the data to be saved.
     * @param {Pointer<BOOL>} pbOverwriteAll Pointer to a <b>BOOL</b> that receives a value indicating whether preexisting data should be overwritten.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the method was successful.
     * @see https://docs.microsoft.com/windows/win32/api//scesvc/nf-scesvc-iscesvcattachmentpersistinfo-save
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
     * @see https://docs.microsoft.com/windows/win32/api//scesvc/nf-scesvc-iscesvcattachmentpersistinfo-isdirty
     */
    IsDirty(lpTemplateName) {
        lpTemplateNameMarshal := lpTemplateName is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, lpTemplateNameMarshal, lpTemplateName, "int")
        return result
    }

    /**
     * The FreeBuffer method frees memory allocated by the attachment snap-in extension.
     * @param {Pointer<Void>} pvData Pointer to the buffer to free.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the method was successful.
     * @see https://docs.microsoft.com/windows/win32/api//scesvc/nf-scesvc-iscesvcattachmentpersistinfo-freebuffer
     */
    FreeBuffer(pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvDataMarshal, pvData, "HRESULT")
        return result
    }
}
