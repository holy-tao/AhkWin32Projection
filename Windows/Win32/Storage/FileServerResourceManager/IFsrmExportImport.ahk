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
     * 
     * @param {BSTR} filePath 
     * @param {Pointer<VARIANT>} fileGroupNamesSafeArray 
     * @param {BSTR} remoteHost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-exportfilegroups
     */
    ExportFileGroups(filePath, fileGroupNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(7, this, "ptr", filePath, "ptr", fileGroupNamesSafeArray, "ptr", remoteHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {Pointer<VARIANT>} fileGroupNamesSafeArray 
     * @param {BSTR} remoteHost 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-importfilegroups
     */
    ImportFileGroups(filePath, fileGroupNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(8, this, "ptr", filePath, "ptr", fileGroupNamesSafeArray, "ptr", remoteHost, "ptr*", &fileGroups := 0, "HRESULT")
        return IFsrmCommittableCollection(fileGroups)
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {Pointer<VARIANT>} templateNamesSafeArray 
     * @param {BSTR} remoteHost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-exportfilescreentemplates
     */
    ExportFileScreenTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(9, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {Pointer<VARIANT>} templateNamesSafeArray 
     * @param {BSTR} remoteHost 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-importfilescreentemplates
     */
    ImportFileScreenTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(10, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "ptr*", &templates := 0, "HRESULT")
        return IFsrmCommittableCollection(templates)
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {Pointer<VARIANT>} templateNamesSafeArray 
     * @param {BSTR} remoteHost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-exportquotatemplates
     */
    ExportQuotaTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(11, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {Pointer<VARIANT>} templateNamesSafeArray 
     * @param {BSTR} remoteHost 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmexportimport-importquotatemplates
     */
    ImportQuotaTemplates(filePath, templateNamesSafeArray, remoteHost) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        remoteHost := remoteHost is String ? BSTR.Alloc(remoteHost).Value : remoteHost

        result := ComCall(12, this, "ptr", filePath, "ptr", templateNamesSafeArray, "ptr", remoteHost, "ptr*", &templates := 0, "HRESULT")
        return IFsrmCommittableCollection(templates)
    }
}
