#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCommittableCollection.ahk" { IFsrmCommittableCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to export and import FSRM objects.
 * @remarks
 * Typically, these methods are used to move objects from one computer to another. These methods differ from the 
 *     import and export methods on the objects (for example, 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-exportfilegroups">IFsrmFileGroupManager::ExportFileGroups</a>) 
 *     in that they write to and read from a file whereas the object methods write to and read from a string.
 * 
 * The file that the export methods create is written in the context of the user.
 * 
 * To create this object from a script, use the <c>Fsrm.FsrmExportImport</c> 
 *     program identifier.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmexportimport
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmExportImport extends IDispatch {
    /**
     * The interface identifier for IFsrmExportImport
     * @type {Guid}
     */
    static IID := Guid("{efcb0ab1-16c4-4a79-812c-725614c3306b}")

    /**
     * The class identifier for FsrmExportImport
     * @type {Guid}
     */
    static CLSID := Guid("{1482dc37-fae9-4787-9025-8ce4e024ab56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmExportImport interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ExportFileGroups          : IntPtr
        ImportFileGroups          : IntPtr
        ExportFileScreenTemplates : IntPtr
        ImportFileScreenTemplates : IntPtr
        ExportQuotaTemplates      : IntPtr
        ImportQuotaTemplates      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmExportImport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Exports one or more file groups to the specified file.
     * @remarks
     * The file group name is specified when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-createfilegroup">IFsrmFileGroupManager::CreateFileGroup</a> 
     *     method. To enumerate the file groups, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-enumfilegroups">IFsrmFileGroupManager::EnumFileGroups</a> 
     *     method.
     * 
     * You can also use the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-exportfilegroups">IFsrmFileGroupManager::ExportFileGroups</a> 
     *     method to export the templates.
     * @param {BSTR} filePath The full path to the export file that will contain the file groups in XML format. The string is limited to 
     *       260 characters.
     * @param {Pointer<VARIANT>} fileGroupNamesSafeArray A variant that contains the names of the file groups to export. Set the variant to empty or 
     *       <b>NULL</b> to export all file groups.
     * 
     * Set the variant type to both 
     *       <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the 
     *       <b>parray</b> member to the <b>SAFEARRAY</b> of 
     *       <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {HRESULT} This method can return the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-exportfilegroups
     */
    ExportFileGroups(filePath, fileGroupNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(7, this, BSTR, filePath, VARIANT.Ptr, fileGroupNamesSafeArray, BSTR, remoteHost, "HRESULT")
        return result
    }

    /**
     * Imports one or more file groups from the specified file.
     * @remarks
     * You can also use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-importfilegroups">IFsrmFileGroupManager::ImportFileGroups</a> method to import the templates.
     * @param {BSTR} filePath The full path to the file from which to import the file groups. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} fileGroupNamesSafeArray A variant that contains the names of the file groups to import. Set the variant to empty or <b>NULL</b> to import all file groups.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroupimported">IFsrmFileGroupImported</a> interfaces. To complete the import, you must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileGroupImported::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-importfilegroups
     */
    ImportFileGroups(filePath, fileGroupNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(8, this, BSTR, filePath, VARIANT.Ptr, fileGroupNamesSafeArray, BSTR, remoteHost, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }

    /**
     * Exports one or more file screen templates to the specified file.
     * @remarks
     * The file screen template name is specified when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-createtemplate">IFsrmFileScreenTemplateManager::CreateTemplate</a> method. To enumerate the templates, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-enumtemplates">IFsrmFileScreenTemplateManager::EnumTemplates</a> method.
     * 
     * You can also use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-exporttemplates">IFsrmFileScreenTemplateManager::ExportTemplates</a> method to export the templates.
     * @param {BSTR} filePath The full path to the export file that will contain the file screen templates in XML format. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} templateNamesSafeArray A variant that contains the names of the file screen templates to export. Set the variant to empty or <b>NULL</b> to export all templates.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {HRESULT} This method can return the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-exportfilescreentemplates
     */
    ExportFileScreenTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(9, this, BSTR, filePath, VARIANT.Ptr, templateNamesSafeArray, BSTR, remoteHost, "HRESULT")
        return result
    }

    /**
     * Imports one or more file screen templates from the specified file.
     * @remarks
     * You can also use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-importtemplates">IFsrmFileScreenTemplateManager::ImportTemplates</a> method to import the templates.
     * @param {BSTR} filePath The full path to the file from which to import the file screen templates. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} templateNamesSafeArray A variant that contains the names of the file screen templates to import. Set the variant to empty or <b>NULL</b> to import all templates.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplateimported">IFsrmFileScreenTemplateImported</a> interfaces. To complete the import, you must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreenTemplateImported::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-importfilescreentemplates
     */
    ImportFileScreenTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(10, this, BSTR, filePath, VARIANT.Ptr, templateNamesSafeArray, BSTR, remoteHost, "ptr*", &templates := 0, "HRESULT")
        return IFsrmCommittableCollection(templates)
    }

    /**
     * Exports one or more quota templates to the specified file.
     * @remarks
     * The quota template name is specified when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-createtemplate">IFsrmQuotaTemplateManager::CreateTemplate</a> 
     *     method. To enumerate the templates, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-enumtemplates">IFsrmQuotaTemplateManager::EnumTemplates</a> 
     *     method.
     * 
     * You can also use the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-exporttemplates">IFsrmQuotaTemplateManager::ExportTemplates</a> 
     *     method to export the templates.
     * @param {BSTR} filePath The full path to the export file that will contain the quota templates in XML format. The string is limited 
     *       to 260 characters.
     * @param {Pointer<VARIANT>} templateNamesSafeArray A variant that contains the names of the quota templates to export. Set the variant to empty or 
     *        <b>NULL</b> to export all templates.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and 
     *        the <b>parray</b> member to the <b>SAFEARRAY</b> of 
     *        <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {HRESULT} This method can return the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-exportquotatemplates
     */
    ExportQuotaTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(11, this, BSTR, filePath, VARIANT.Ptr, templateNamesSafeArray, BSTR, remoteHost, "HRESULT")
        return result
    }

    /**
     * Imports one or more quota templates from the specified file.
     * @remarks
     * You can also use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-importtemplates">IFsrmQuotaTemplateManager::ImportTemplates</a> method to import the templates.
     * @param {BSTR} filePath The full path to the file from which to import the quota templates. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} templateNamesSafeArray A variant that contains the names of the quota templates to import. Set the variant to empty or <b>NULL</b> to import all templates.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplateimported">IFsrmQuotaTemplateImported</a> interfaces. To complete the import, you must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmQuotaTemplateImported::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-importquotatemplates
     */
    ImportQuotaTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(12, this, BSTR, filePath, VARIANT.Ptr, templateNamesSafeArray, BSTR, remoteHost, "ptr*", &templates := 0, "HRESULT")
        return IFsrmCommittableCollection(templates)
    }

    Query(iid) {
        if (IFsrmExportImport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ExportFileGroups := CallbackCreate(GetMethod(implObj, "ExportFileGroups"), flags, 4)
        this.vtbl.ImportFileGroups := CallbackCreate(GetMethod(implObj, "ImportFileGroups"), flags, 5)
        this.vtbl.ExportFileScreenTemplates := CallbackCreate(GetMethod(implObj, "ExportFileScreenTemplates"), flags, 4)
        this.vtbl.ImportFileScreenTemplates := CallbackCreate(GetMethod(implObj, "ImportFileScreenTemplates"), flags, 5)
        this.vtbl.ExportQuotaTemplates := CallbackCreate(GetMethod(implObj, "ExportQuotaTemplates"), flags, 4)
        this.vtbl.ImportQuotaTemplates := CallbackCreate(GetMethod(implObj, "ImportQuotaTemplates"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ExportFileGroups)
        CallbackFree(this.vtbl.ImportFileGroups)
        CallbackFree(this.vtbl.ExportFileScreenTemplates)
        CallbackFree(this.vtbl.ImportFileScreenTemplates)
        CallbackFree(this.vtbl.ExportQuotaTemplates)
        CallbackFree(this.vtbl.ImportQuotaTemplates)
    }
}
