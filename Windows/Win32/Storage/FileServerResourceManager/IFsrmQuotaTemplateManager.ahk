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
     * Creates a quota template object.
     * @returns {IFsrmQuotaTemplate} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplate">IFsrmQuotaTemplate</a> interface to the newly 
     *       create template. To add the template to FSRM, call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmQuotaTemplate::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-createtemplate
     */
    CreateTemplate() {
        result := ComCall(7, this, "ptr*", &quotaTemplate := 0, "HRESULT")
        return IFsrmQuotaTemplate(quotaTemplate)
    }

    /**
     * Retrieves the specified quota template.
     * @param {BSTR} name The name of the quota template to retrieve. The string is limited to 4,000 characters.
     * @returns {IFsrmQuotaTemplate} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplate">IFsrmQuotaTemplate</a> interface to the retrieved 
     *       template object.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-gettemplate
     */
    GetTemplate(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", &quotaTemplate := 0, "HRESULT")
        return IFsrmQuotaTemplate(quotaTemplate)
    }

    /**
     * Enumerates the quota templates on the server.
     * @param {Integer} options Options to use when enumerating the quota templates. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *       that contains a collection of quota templates.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplate">IFsrmQuotaTemplate</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-enumtemplates
     */
    EnumTemplates(options) {
        result := ComCall(9, this, "int", options, "ptr*", &quotaTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(quotaTemplates)
    }

    /**
     * Exports the quota templates as an XML string.
     * @param {Pointer<VARIANT>} quotaTemplateNamesArray A variant that contains the names of the quota templates to export. If 
     *       <b>NULL</b>, the method exports all quotas.
     * @returns {BSTR} The specified templates in XML format.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-exporttemplates
     */
    ExportTemplates(quotaTemplateNamesArray) {
        serializedQuotaTemplates := BSTR()
        result := ComCall(10, this, "ptr", quotaTemplateNamesArray, "ptr", serializedQuotaTemplates, "HRESULT")
        return serializedQuotaTemplates
    }

    /**
     * Imports the specified quota templates from an XML string.
     * @param {BSTR} serializedQuotaTemplates An XML string that represents one or more quota templates.
     * @param {Pointer<VARIANT>} quotaTemplateNamesArray A variant that contains the names of the templates to import. If <b>NULL</b>, the method 
     *       imports all templates.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *        that contains a collection of quota templates.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplateimported">IFsrmQuotaTemplateImported</a> interface.
     * 
     * To add the templates to FSRM, call the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcommittablecollection-commit">IFsrmCommittableCollection::Commit</a> 
     *        method. To add the templates to FSRM and propagate the changes to objects that were derived from the template, 
     *        call the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-commitandupdatederived">IFsrmFileScreenTemplateImported::CommitAndUpdateDerived</a> 
     *        method on each item in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-importtemplates
     */
    ImportTemplates(serializedQuotaTemplates, quotaTemplateNamesArray) {
        serializedQuotaTemplates := serializedQuotaTemplates is String ? BSTR.Alloc(serializedQuotaTemplates).Value : serializedQuotaTemplates

        result := ComCall(11, this, "ptr", serializedQuotaTemplates, "ptr", quotaTemplateNamesArray, "ptr*", &quotaTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(quotaTemplates)
    }
}
