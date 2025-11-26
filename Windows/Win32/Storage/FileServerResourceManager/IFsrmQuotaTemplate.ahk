#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmDerivedObjectsResult.ahk
#Include .\IFsrmQuotaBase.ahk

/**
 * Used to configure templates from which new quota objects can be derived.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotatemplate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaTemplate extends IFsrmQuotaBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmQuotaTemplate
     * @type {Guid}
     */
    static IID => Guid("{a2efab31-295e-46bb-b976-e86d58b52e8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

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
     * Retrieves and sets the name of the quota template.
     * @remarks
     * 
     * If you do not specify a name, FSRM generates a unique name that begins with 
     *     "QuotaTemplate".
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplate-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(22, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves and sets the name of the quota template.
     * @remarks
     * 
     * If you do not specify a name, FSRM generates a unique name that begins with 
     *     "QuotaTemplate".
     * 
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplate-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(23, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Copies the property values of the specified template to this template.
     * @param {BSTR} quotaTemplateName The name of the template from which to copy the property values. The string is limited to 4,000 
     *       characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplate-copytemplate
     */
    CopyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(24, this, "ptr", quotaTemplateName, "HRESULT")
        return result
    }

    /**
     * Saves the quota template and then applies any changes to the derived quota objects.
     * @param {Integer} commitOptions The options for saving the template. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions">FsrmCommitOptions</a> enumeration.
     * @param {Integer} applyOptions The options used to choose the derived objects to which the changes are applied. For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmtemplateapplyoptions">FsrmTemplateApplyOptions</a> enumeration.
     * @returns {IFsrmDerivedObjectsResult} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmderivedobjectsresult">IFsrmDerivedObjectsResult</a> interface 
     *       that you use to determine the list of derived objects that were updated and whether the update was 
     *       successful.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotatemplate-commitandupdatederived
     */
    CommitAndUpdateDerived(commitOptions, applyOptions) {
        result := ComCall(25, this, "int", commitOptions, "int", applyOptions, "ptr*", &derivedObjectsResult := 0, "HRESULT")
        return IFsrmDerivedObjectsResult(derivedObjectsResult)
    }
}
