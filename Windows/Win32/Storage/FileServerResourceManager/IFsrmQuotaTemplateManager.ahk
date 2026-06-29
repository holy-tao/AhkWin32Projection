#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCommittableCollection.ahk" { IFsrmCommittableCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmQuotaTemplate.ahk" { IFsrmQuotaTemplate }
#Import ".\FsrmEnumOptions.ahk" { FsrmEnumOptions }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to manage quota templates.
 * @remarks
 * Note that a new installation of the operating system includes FSRM-defined templates.
 * 
 * To create this object from a script, use the "Fsrm.FsrmQuotaTemplateManager" program 
 *     identifier.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplatemanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmQuotaTemplateManager extends IDispatch {
    /**
     * The interface identifier for IFsrmQuotaTemplateManager
     * @type {Guid}
     */
    static IID := Guid("{4173ac41-172d-4d52-963c-fdc7e415f717}")

    /**
     * The class identifier for FsrmQuotaTemplateManager
     * @type {Guid}
     */
    static CLSID := Guid("{97d3d443-251c-4337-81e7-b32e8f4ee65e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmQuotaTemplateManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateTemplate  : IntPtr
        GetTemplate     : IntPtr
        EnumTemplates   : IntPtr
        ExportTemplates : IntPtr
        ImportTemplates : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmQuotaTemplateManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a quota template object.
     * @returns {IFsrmQuotaTemplate} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplate">IFsrmQuotaTemplate</a> interface to the newly 
     *       create template. To add the template to FSRM, call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmQuotaTemplate::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-createtemplate
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
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-gettemplate
     */
    GetTemplate(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "ptr*", &quotaTemplate := 0, "HRESULT")
        return IFsrmQuotaTemplate(quotaTemplate)
    }

    /**
     * Enumerates the quota templates on the server.
     * @param {FsrmEnumOptions} options Options to use when enumerating the quota templates. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *       that contains a collection of quota templates.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplate">IFsrmQuotaTemplate</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-enumtemplates
     */
    EnumTemplates(options) {
        result := ComCall(9, this, FsrmEnumOptions, options, "ptr*", &quotaTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(quotaTemplates)
    }

    /**
     * Exports the quota templates as an XML string.
     * @remarks
     * Typically, you use this method to save the templates to a file. You can then copy the file to another computer 
     *     and call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-importtemplates">IFsrmQuotaTemplateManager::ImportTemplates</a> 
     *     method to import the templates.
     * @param {Pointer<VARIANT>} quotaTemplateNamesArray A variant that contains the names of the quota templates to export. If 
     *       <b>NULL</b>, the method exports all quotas.
     * @returns {BSTR} The specified templates in XML format.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-exporttemplates
     */
    ExportTemplates(quotaTemplateNamesArray) {
        serializedQuotaTemplates := BSTR.Owned()
        result := ComCall(10, this, VARIANT.Ptr, quotaTemplateNamesArray, BSTR.Ptr, serializedQuotaTemplates, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplatemanager-importtemplates
     */
    ImportTemplates(serializedQuotaTemplates, quotaTemplateNamesArray) {
        serializedQuotaTemplates := serializedQuotaTemplates is String ? BSTR.Alloc(serializedQuotaTemplates).Value : serializedQuotaTemplates

        result := ComCall(11, this, BSTR, serializedQuotaTemplates, VARIANT.Ptr, quotaTemplateNamesArray, "ptr*", &quotaTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(quotaTemplates)
    }

    Query(iid) {
        if (IFsrmQuotaTemplateManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTemplate := CallbackCreate(GetMethod(implObj, "CreateTemplate"), flags, 2)
        this.vtbl.GetTemplate := CallbackCreate(GetMethod(implObj, "GetTemplate"), flags, 3)
        this.vtbl.EnumTemplates := CallbackCreate(GetMethod(implObj, "EnumTemplates"), flags, 3)
        this.vtbl.ExportTemplates := CallbackCreate(GetMethod(implObj, "ExportTemplates"), flags, 3)
        this.vtbl.ImportTemplates := CallbackCreate(GetMethod(implObj, "ImportTemplates"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTemplate)
        CallbackFree(this.vtbl.GetTemplate)
        CallbackFree(this.vtbl.EnumTemplates)
        CallbackFree(this.vtbl.ExportTemplates)
        CallbackFree(this.vtbl.ImportTemplates)
    }
}
