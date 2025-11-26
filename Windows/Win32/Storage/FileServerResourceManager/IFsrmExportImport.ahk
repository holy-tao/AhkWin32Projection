#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmCommittableCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to export and import FSRM objects.
 * @remarks
 * 
 * Typically, these methods are used to move objects from one computer to another. These methods differ from the 
 *     import and export methods on the objects (for example, 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupmanager-exportfilegroups">IFsrmFileGroupManager::ExportFileGroups</a>) 
 *     in that they write to and read from a file whereas the object methods write to and read from a string.
 * 
 * The file that the export methods create is written in the context of the user.
 * 
 * To create this object from a script, use the <c>Fsrm.FsrmExportImport</c> 
 *     program identifier.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmexportimport
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmExportImport extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmExportImport
     * @type {Guid}
     */
    static IID => Guid("{efcb0ab1-16c4-4a79-812c-725614c3306b}")

    /**
     * The class identifier for FsrmExportImport
     * @type {Guid}
     */
    static CLSID => Guid("{1482dc37-fae9-4787-9025-8ce4e024ab56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ExportFileGroups", "ImportFileGroups", "ExportFileScreenTemplates", "ImportFileScreenTemplates", "ExportQuotaTemplates", "ImportQuotaTemplates"]

    /**
     * Exports one or more file groups to the specified file.
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
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmexportimport-exportfilegroups
     */
    ExportFileGroups(filePath, fileGroupNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(7, this, "ptr", filePath, "ptr", fileGroupNamesSafeArray, "ptr", remoteHost, "HRESULT")
        return result
    }

    /**
     * Imports one or more file groups from the specified file.
     * @param {BSTR} filePath The full path to the file from which to import the file groups. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} fileGroupNamesSafeArray A variant that contains the names of the file groups to import. Set the variant to empty or <b>NULL</b> to import all file groups.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroupimported">IFsrmFileGroupImported</a> interfaces. To complete the import, you must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileGroupImported::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmexportimport-importfilegroups
     */
    ImportFileGroups(filePath, fileGroupNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(8, this, "ptr", filePath, "ptr", fileGroupNamesSafeArray, "ptr", remoteHost, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }

    /**
     * Exports one or more file screen templates to the specified file.
     * @param {BSTR} filePath The full path to the export file that will contain the file screen templates in XML format. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} templateNamesSafeArray A variant that contains the names of the file screen templates to export. Set the variant to empty or <b>NULL</b> to export all templates.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {HRESULT} This method can return the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmexportimport-exportfilescreentemplates
     */
    ExportFileScreenTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(9, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "HRESULT")
        return result
    }

    /**
     * Imports one or more file screen templates from the specified file.
     * @param {BSTR} filePath The full path to the file from which to import the file screen templates. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} templateNamesSafeArray A variant that contains the names of the file screen templates to import. Set the variant to empty or <b>NULL</b> to import all templates.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplateimported">IFsrmFileScreenTemplateImported</a> interfaces. To complete the import, you must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreenTemplateImported::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmexportimport-importfilescreentemplates
     */
    ImportFileScreenTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(10, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "ptr*", &templates := 0, "HRESULT")
        return IFsrmCommittableCollection(templates)
    }

    /**
     * Exports one or more quota templates to the specified file.
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
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmexportimport-exportquotatemplates
     */
    ExportQuotaTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(11, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "HRESULT")
        return result
    }

    /**
     * Imports one or more quota templates from the specified file.
     * @param {BSTR} filePath The full path to the file from which to import the quota templates. The string is limited to 260 characters.
     * @param {Pointer<VARIANT>} templateNamesSafeArray A variant that contains the names of the quota templates to import. Set the variant to empty or <b>NULL</b> to import all templates.
     * 
     * Set the variant type to both <b>VT_ARRAY</b> and <b>VT_VARIANT</b> and the <b>parray</b> member to the <b>SAFEARRAY</b> of <b>BSTR</b>s.
     * @param {BSTR} remoteHost The name of the remote server. To specify the local server, set to an empty string.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplateimported">IFsrmQuotaTemplateImported</a> interfaces. To complete the import, you must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmQuotaTemplateImported::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmexportimport-importquotatemplates
     */
    ImportQuotaTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(12, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "ptr*", &templates := 0, "HRESULT")
        return IFsrmCommittableCollection(templates)
    }
}
