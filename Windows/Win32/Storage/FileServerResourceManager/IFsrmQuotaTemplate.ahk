#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmDerivedObjectsResult.ahk" { IFsrmDerivedObjectsResult }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FsrmCommitOptions.ahk" { FsrmCommitOptions }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmTemplateApplyOptions.ahk" { FsrmTemplateApplyOptions }
#Import ".\IFsrmQuotaBase.ahk" { IFsrmQuotaBase }

/**
 * Used to configure templates from which new quota objects can be derived.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmQuotaTemplate extends IFsrmQuotaBase {
    /**
     * The interface identifier for IFsrmQuotaTemplate
     * @type {Guid}
     */
    static IID := Guid("{a2efab31-295e-46bb-b976-e86d58b52e8b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmQuotaTemplate interfaces
    */
    struct Vtbl extends IFsrmQuotaBase.Vtbl {
        get_Name               : IntPtr
        put_Name               : IntPtr
        CopyTemplate           : IntPtr
        CommitAndUpdateDerived : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmQuotaTemplate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Retrieves and sets the name of the quota template. (Get)
     * @remarks
     * If you do not specify a name, FSRM generates a unique name that begins with 
     *     "QuotaTemplate".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves and sets the name of the quota template. (Put)
     * @remarks
     * If you do not specify a name, FSRM generates a unique name that begins with 
     *     "QuotaTemplate".
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(23, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Copies the property values of the specified template to this template. (IFsrmQuotaTemplate.CopyTemplate)
     * @param {BSTR} quotaTemplateName The name of the template from which to copy the property values. The string is limited to 4,000 
     *       characters.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-copytemplate
     */
    CopyTemplate(quotaTemplateName) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName

        result := ComCall(24, this, BSTR, quotaTemplateName, "HRESULT")
        return result
    }

    /**
     * Saves the quota template and then applies any changes to the derived quota objects.
     * @param {FsrmCommitOptions} commitOptions The options for saving the template. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions">FsrmCommitOptions</a> enumeration.
     * @param {FsrmTemplateApplyOptions} applyOptions The options used to choose the derived objects to which the changes are applied. For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmtemplateapplyoptions">FsrmTemplateApplyOptions</a> enumeration.
     * @returns {IFsrmDerivedObjectsResult} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmderivedobjectsresult">IFsrmDerivedObjectsResult</a> interface 
     *       that you use to determine the list of derived objects that were updated and whether the update was 
     *       successful.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-commitandupdatederived
     */
    CommitAndUpdateDerived(commitOptions, applyOptions) {
        result := ComCall(25, this, FsrmCommitOptions, commitOptions, FsrmTemplateApplyOptions, applyOptions, "ptr*", &derivedObjectsResult := 0, "HRESULT")
        return IFsrmDerivedObjectsResult(derivedObjectsResult)
    }

    Query(iid) {
        if (IFsrmQuotaTemplate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.CopyTemplate := CallbackCreate(GetMethod(implObj, "CopyTemplate"), flags, 2)
        this.vtbl.CommitAndUpdateDerived := CallbackCreate(GetMethod(implObj, "CommitAndUpdateDerived"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.CopyTemplate)
        CallbackFree(this.vtbl.CommitAndUpdateDerived)
    }
}
