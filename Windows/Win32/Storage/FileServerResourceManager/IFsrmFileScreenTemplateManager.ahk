#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmFileScreenTemplate.ahk
#Include .\IFsrmCommittableCollection.ahk
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
     * Creates a file screen template object.
     * @returns {IFsrmFileScreenTemplate} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate">IFsrmFileScreenTemplate</a> interface to the 
     *       newly create template. To add the template to FSRM, call the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreenTemplate::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-createtemplate
     */
    CreateTemplate() {
        result := ComCall(7, this, "ptr*", &fileScreenTemplate := 0, "HRESULT")
        return IFsrmFileScreenTemplate(fileScreenTemplate)
    }

    /**
     * Retrieves the specified file screen template.
     * @param {BSTR} name The name of the file screen template to retrieve. The name is limited to 4,000 characters.
     * @returns {IFsrmFileScreenTemplate} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate">IFsrmFileScreenTemplate</a> interface to the retrieved template.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-gettemplate
     */
    GetTemplate(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", &fileScreenTemplate := 0, "HRESULT")
        return IFsrmFileScreenTemplate(fileScreenTemplate)
    }

    /**
     * Enumerates the file screen templates on the server.
     * @param {Integer} options The options to use when enumerating the file screen templates. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface that contains a collection of file screen templates.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate">IFsrmFileScreenTemplate</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-enumtemplates
     */
    EnumTemplates(options) {
        result := ComCall(9, this, "int", options, "ptr*", &fileScreenTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreenTemplates)
    }

    /**
     * Exports the templates as an XML string.
     * @param {Pointer<VARIANT>} fileScreenTemplateNamesArray A variant that contains the names of the file screen templates to export. If <b>NULL</b>, the method exports all file screens.
     * @returns {BSTR} The specified templates in XML format.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-exporttemplates
     */
    ExportTemplates(fileScreenTemplateNamesArray) {
        serializedFileScreenTemplates := BSTR()
        result := ComCall(10, this, "ptr", fileScreenTemplateNamesArray, "ptr", serializedFileScreenTemplates, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplatemanager-importtemplates
     */
    ImportTemplates(serializedFileScreenTemplates, fileScreenTemplateNamesArray) {
        serializedFileScreenTemplates := serializedFileScreenTemplates is String ? BSTR.Alloc(serializedFileScreenTemplates).Value : serializedFileScreenTemplates

        result := ComCall(11, this, "ptr", serializedFileScreenTemplates, "ptr", fileScreenTemplateNamesArray, "ptr*", &fileScreenTemplates := 0, "HRESULT")
        return IFsrmCommittableCollection(fileScreenTemplates)
    }
}
