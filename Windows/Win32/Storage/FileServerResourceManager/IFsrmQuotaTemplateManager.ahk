#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IFsrmQuotaTemplate>} quotaTemplate 
     * @returns {HRESULT} 
     */
    CreateTemplate(quotaTemplate) {
        result := ComCall(7, this, "ptr", quotaTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmQuotaTemplate>} quotaTemplate 
     * @returns {HRESULT} 
     */
    GetTemplate(name, quotaTemplate) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr", quotaTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCommittableCollection>} quotaTemplates 
     * @returns {HRESULT} 
     */
    EnumTemplates(options, quotaTemplates) {
        result := ComCall(9, this, "int", options, "ptr", quotaTemplates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Export templates.
     * @param {Pointer<VARIANT>} quotaTemplateNamesArray 
     * @param {Pointer<BSTR>} serializedQuotaTemplates 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-export
     */
    ExportTemplates(quotaTemplateNamesArray, serializedQuotaTemplates) {
        result := ComCall(10, this, "ptr", quotaTemplateNamesArray, "ptr", serializedQuotaTemplates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} serializedQuotaTemplates 
     * @param {Pointer<VARIANT>} quotaTemplateNamesArray 
     * @param {Pointer<IFsrmCommittableCollection>} quotaTemplates 
     * @returns {HRESULT} 
     */
    ImportTemplates(serializedQuotaTemplates, quotaTemplateNamesArray, quotaTemplates) {
        serializedQuotaTemplates := serializedQuotaTemplates is String ? BSTR.Alloc(serializedQuotaTemplates).Value : serializedQuotaTemplates

        result := ComCall(11, this, "ptr", serializedQuotaTemplates, "ptr", quotaTemplateNamesArray, "ptr", quotaTemplates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
