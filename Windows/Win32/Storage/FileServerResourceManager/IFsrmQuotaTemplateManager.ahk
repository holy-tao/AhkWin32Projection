#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmQuotaTemplate.ahk
#Include .\IFsrmCommittableCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage quota templates.
 * @remarks
 * 
 * Note that a new installation of the operating system includes FSRM-defined templates.
 * 
 * To create this object from a script, use the "Fsrm.FsrmQuotaTemplateManager" program 
 *     identifier.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotatemplatemanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaTemplateManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmQuotaTemplateManager
     * @type {Guid}
     */
    static IID => Guid("{4173ac41-172d-4d52-963c-fdc7e415f717}")

    /**
     * The class identifier for FsrmQuotaTemplateManager
     * @type {Guid}
     */
    static CLSID => Guid("{97d3d443-251c-4337-81e7-b32e8f4ee65e}")

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
     * @returns {IFsrmQuotaTemplate} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-createtemplate
     */
    CreateTemplate() {
        result := ComCall(7, this, "ptr*", &quotaTemplate := 0, "HRESULT")
        return IFsrmQuotaTemplate(quotaTemplate)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IFsrmQuotaTemplate} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-gettemplate
     */
    GetTemplate(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", &quotaTemplate := 0, "HRESULT")
        return IFsrmQuotaTemplate(quotaTemplate)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-enumtemplates
     */
    EnumTemplates(options) {
        result := ComCall(9, this, "int", options, "ptr*", &quotaTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(quotaTemplates)
    }

    /**
     * Export templates.
     * @param {Pointer<VARIANT>} quotaTemplateNamesArray 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-export
     */
    ExportTemplates(quotaTemplateNamesArray) {
        serializedQuotaTemplates := BSTR()
        result := ComCall(10, this, "ptr", quotaTemplateNamesArray, "ptr", serializedQuotaTemplates, "HRESULT")
        return serializedQuotaTemplates
    }

    /**
     * 
     * @param {BSTR} serializedQuotaTemplates 
     * @param {Pointer<VARIANT>} quotaTemplateNamesArray 
     * @returns {IFsrmCommittableCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-importtemplates
     */
    ImportTemplates(serializedQuotaTemplates, quotaTemplateNamesArray) {
        serializedQuotaTemplates := serializedQuotaTemplates is String ? BSTR.Alloc(serializedQuotaTemplates).Value : serializedQuotaTemplates

        result := ComCall(11, this, "ptr", serializedQuotaTemplates, "ptr", quotaTemplateNamesArray, "ptr*", &quotaTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(quotaTemplates)
    }
}
