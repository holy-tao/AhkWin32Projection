#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage file screen templates.
 * @remarks
 * 
  * Note that a new installation of the operating system includes FSRM-defined templates.
  * 
  * To create this object from a script, use the "Fsrm.FsrmFileScreenTemplateManager" program 
  *     identifier.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplatemanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenTemplateManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileScreenTemplateManager
     * @type {Guid}
     */
    static IID => Guid("{cfe36cba-1949-4e74-a14f-f1d580ceaf13}")

    /**
     * The class identifier for FsrmFileScreenTemplateManager
     * @type {Guid}
     */
    static CLSID => Guid("{243111df-e474-46aa-a054-eaa33edc292a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTemplate", "GetTemplate", "EnumTemplates", "ExportTemplates", "ImportTemplates"]

    /**
     * 
     * @param {Pointer<IFsrmFileScreenTemplate>} fileScreenTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-createtemplate
     */
    CreateTemplate(fileScreenTemplate) {
        result := ComCall(7, this, "ptr*", fileScreenTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmFileScreenTemplate>} fileScreenTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-gettemplate
     */
    GetTemplate(name, fileScreenTemplate) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", fileScreenTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCommittableCollection>} fileScreenTemplates 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-enumtemplates
     */
    EnumTemplates(options, fileScreenTemplates) {
        result := ComCall(9, this, "int", options, "ptr*", fileScreenTemplates, "HRESULT")
        return result
    }

    /**
     * Export templates.
     * @param {Pointer<VARIANT>} fileScreenTemplateNamesArray 
     * @param {Pointer<BSTR>} serializedFileScreenTemplates 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-export
     */
    ExportTemplates(fileScreenTemplateNamesArray, serializedFileScreenTemplates) {
        result := ComCall(10, this, "ptr", fileScreenTemplateNamesArray, "ptr", serializedFileScreenTemplates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serializedFileScreenTemplates 
     * @param {Pointer<VARIANT>} fileScreenTemplateNamesArray 
     * @param {Pointer<IFsrmCommittableCollection>} fileScreenTemplates 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-importtemplates
     */
    ImportTemplates(serializedFileScreenTemplates, fileScreenTemplateNamesArray, fileScreenTemplates) {
        serializedFileScreenTemplates := serializedFileScreenTemplates is String ? BSTR.Alloc(serializedFileScreenTemplates).Value : serializedFileScreenTemplates

        result := ComCall(11, this, "ptr", serializedFileScreenTemplates, "ptr", fileScreenTemplateNamesArray, "ptr*", fileScreenTemplates, "HRESULT")
        return result
    }
}
