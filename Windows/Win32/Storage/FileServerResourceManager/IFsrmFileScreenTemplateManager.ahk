#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCommittableCollection.ahk" { IFsrmCommittableCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmFileScreenTemplate.ahk" { IFsrmFileScreenTemplate }
#Import ".\FsrmEnumOptions.ahk" { FsrmEnumOptions }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to manage file screen templates.
 * @remarks
 * Note that a new installation of the operating system includes FSRM-defined templates.
 * 
 * To create this object from a script, use the "Fsrm.FsrmFileScreenTemplateManager" program 
 *     identifier.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplatemanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileScreenTemplateManager extends IDispatch {
    /**
     * The interface identifier for IFsrmFileScreenTemplateManager
     * @type {Guid}
     */
    static IID := Guid("{cfe36cba-1949-4e74-a14f-f1d580ceaf13}")

    /**
     * The class identifier for FsrmFileScreenTemplateManager
     * @type {Guid}
     */
    static CLSID := Guid("{243111df-e474-46aa-a054-eaa33edc292a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileScreenTemplateManager interfaces
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
            this.vtbl := IFsrmFileScreenTemplateManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a file screen template object.
     * @returns {IFsrmFileScreenTemplate} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate">IFsrmFileScreenTemplate</a> interface to the 
     *       newly create template. To add the template to FSRM, call the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreenTemplate::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-createtemplate
     */
    CreateTemplate() {
        result := ComCall(7, this, "ptr*", &fileScreenTemplate := 0, "HRESULT")
        return IFsrmFileScreenTemplate(fileScreenTemplate)
    }

    /**
     * Retrieves the specified file screen template.
     * @param {BSTR} name The name of the file screen template to retrieve. The name is limited to 4,000 characters.
     * @returns {IFsrmFileScreenTemplate} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate">IFsrmFileScreenTemplate</a> interface to the retrieved template.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-gettemplate
     */
    GetTemplate(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "ptr*", &fileScreenTemplate := 0, "HRESULT")
        return IFsrmFileScreenTemplate(fileScreenTemplate)
    }

    /**
     * Enumerates the file screen templates on the server.
     * @param {FsrmEnumOptions} options The options to use when enumerating the file screen templates. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of file screen templates.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate">IFsrmFileScreenTemplate</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-enumtemplates
     */
    EnumTemplates(options) {
        result := ComCall(9, this, FsrmEnumOptions, options, "ptr*", &fileScreenTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreenTemplates)
    }

    /**
     * Exports the templates as an XML string.
     * @remarks
     * Typically, you use this method to save the templates to a file. You can then copy the file to another computer and call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-importtemplates">IFsrmFileScreenTemplateManager::ImportTemplates</a> method to import the templates.
     * @param {Pointer<VARIANT>} fileScreenTemplateNamesArray A variant that contains the names of the file screen templates to export. If <b>NULL</b>, the method exports all file screens.
     * @returns {BSTR} The specified templates in XML format.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-exporttemplates
     */
    ExportTemplates(fileScreenTemplateNamesArray) {
        serializedFileScreenTemplates := BSTR.Owned()
        result := ComCall(10, this, VARIANT.Ptr, fileScreenTemplateNamesArray, BSTR.Ptr, serializedFileScreenTemplates, "HRESULT")
        return serializedFileScreenTemplates
    }

    /**
     * Imports the specified file screen templates from an XML string.
     * @param {BSTR} serializedFileScreenTemplates An XML string that represents one or more file screen templates.
     * @param {Pointer<VARIANT>} fileScreenTemplateNamesArray A <b>VARIANT</b> that contains a <b>SAFEARRAY</b> of the names of the templates to import. If <b>NULL</b>, the method imports all templates.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of file screen templates.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplateimported">IFsrmFileScreenTemplateImported</a> interface.
     * 
     * To add the templates to FSRM, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcommittablecollection-commit">IFsrmCommittableCollection::Commit</a> method. To add the templates to FSRM and propagate the changes to objects that were derived from the template, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-commitandupdatederived">IFsrmFileScreenTemplateImported::CommitAndUpdateDerived</a> method on each item in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-importtemplates
     */
    ImportTemplates(serializedFileScreenTemplates, fileScreenTemplateNamesArray) {
        serializedFileScreenTemplates := serializedFileScreenTemplates is String ? BSTR.Alloc(serializedFileScreenTemplates).Value : serializedFileScreenTemplates

        result := ComCall(11, this, BSTR, serializedFileScreenTemplates, VARIANT.Ptr, fileScreenTemplateNamesArray, "ptr*", &fileScreenTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreenTemplates)
    }

    Query(iid) {
        if (IFsrmFileScreenTemplateManager.IID.Equals(iid)) {
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
