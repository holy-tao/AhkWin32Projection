#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmDerivedObjectsResult.ahk
#Include .\IFsrmFileScreenBase.ahk

/**
 * Used to configure templates from which new file screens can be derived.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenTemplate extends IFsrmFileScreenBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileScreenTemplate
     * @type {Guid}
     */
    static IID => Guid("{205bebf8-dd93-452a-95a6-32b566b35828}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "CopyTemplate", "CommitAndUpdateDerived"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Retrieves and sets the name of the file screen template. (Get)
     * @remarks
     * If a template with the specified name exists, the template fails with 
     *     <b>FSRM_E_ALREADY_EXISTS</b> when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreen::Commit</a> method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(18, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * Retrieves and sets the name of the file screen template. (Put)
     * @remarks
     * If a template with the specified name exists, the template fails with 
     *     <b>FSRM_E_ALREADY_EXISTS</b> when you call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreen::Commit</a> method.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-put_name
     */
    put_Name(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(19, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Copies the property values of the specified template to this template. (IFsrmFileScreenTemplate.CopyTemplate)
     * @param {BSTR} fileScreenTemplateName The name of another template from which to copy the property values. The name is limited to 4,000 characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-copytemplate
     */
    CopyTemplate(fileScreenTemplateName) {
        if(fileScreenTemplateName is String) {
            pin := BSTR.Alloc(fileScreenTemplateName)
            fileScreenTemplateName := pin.Value
        }

        result := ComCall(20, this, "ptr", fileScreenTemplateName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves the file screen template and then applies any changes to the derived file screen objects.
     * @param {Integer} commitOptions The options for saving the template. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions">FsrmCommitOptions</a> enumeration.
     * @param {Integer} applyOptions The options used to choose the derived objects to which the changes are applied. For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmtemplateapplyoptions">FsrmTemplateApplyOptions</a> enumeration.
     * @returns {IFsrmDerivedObjectsResult} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmderivedobjectsresult">IFsrmDerivedObjectsResult</a> interface 
     *       that you use to determine the list of derived objects that were updated and whether the update was 
     *       successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-commitandupdatederived
     */
    CommitAndUpdateDerived(commitOptions, applyOptions) {
        result := ComCall(21, this, "int", commitOptions, "int", applyOptions, "ptr*", &derivedObjectsResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFsrmDerivedObjectsResult(derivedObjectsResult)
    }
}
