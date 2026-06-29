#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmDerivedObjectsResult.ahk" { IFsrmDerivedObjectsResult }
#Import ".\IFsrmQuotaObject.ahk" { IFsrmQuotaObject }
#Import ".\FsrmCommitOptions.ahk" { FsrmCommitOptions }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmTemplateApplyOptions.ahk" { FsrmTemplateApplyOptions }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Used to automatically add the quota to new and existing subdirectories of the directory on which the automatic quota is applied.
 * @remarks
 * To change the properties of an automatic quota, change the properties of the template from which the automatic 
 *     quota is derived. Then call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplate-commitandupdatederived">IFsrmQuotaTemplate::CommitAndUpdateDerived</a> 
 *     method to update the properties of the automatic quotas and the quotas that derive from the automatic quota.
 * 
 * If any quota under the automatic quota's path was changed to a different template, it will not be changed to 
 *     the automatic quota's new settings until you call the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmautoapplyquota-commitandupdatederived">IFsrmAutoApplyQuota::CommitAndUpdateDerived</a> 
 *     method.
 * 
 * Changes made to the automatic quota are reflected in new quotas only after the automatic quota is 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">committed</a>.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmautoapplyquota
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmAutoApplyQuota extends IFsrmQuotaObject {
    /**
     * The interface identifier for IFsrmAutoApplyQuota
     * @type {Guid}
     */
    static IID := Guid("{f82e5729-6aba-4740-bfc7-c7f58f75fb7b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmAutoApplyQuota interfaces
    */
    struct Vtbl extends IFsrmQuotaObject.Vtbl {
        get_ExcludeFolders     : IntPtr
        put_ExcludeFolders     : IntPtr
        CommitAndUpdateDerived : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmAutoApplyQuota.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ExcludeFolders {
        get => this.get_ExcludeFolders()
        set => this.put_ExcludeFolders(value)
    }

    /**
     * Retrieves or sets an array of immediate subdirectories to exclude from the automatic quota. (Get)
     * @remarks
     * The list can contain the names of existing subdirectories or subdirectories that may exist in the future.
     * 
     * Setting this property overwrites the current list of subdirectories to exclude. To remove all folders, pass an 
     *     empty array.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmautoapplyquota-get_excludefolders
     */
    get_ExcludeFolders() {
        result := ComCall(28, this, "ptr*", &folders := 0, "HRESULT")
        return folders
    }

    /**
     * Retrieves or sets an array of immediate subdirectories to exclude from the automatic quota. (Put)
     * @remarks
     * The list can contain the names of existing subdirectories or subdirectories that may exist in the future.
     * 
     * Setting this property overwrites the current list of subdirectories to exclude. To remove all folders, pass an 
     *     empty array.
     * @param {Pointer<SAFEARRAY>} folders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmautoapplyquota-put_excludefolders
     */
    put_ExcludeFolders(folders) {
        result := ComCall(29, this, SAFEARRAY.Ptr, folders, "HRESULT")
        return result
    }

    /**
     * Saves the quota and then applies any changes to the derived quotas.
     * @remarks
     * In this context, a derived quota is any quota that is  applied to  a subdirectory of the automatic quota 
     *     directory. For example, if you create an automatic quota for <i>c:\folder1</i> and if 
     *     <i>folder1</i> has subdirectories of <i>c:\folder1\subfolder1</i>, 
     *     <i>c:\folder1\subfolder2</i>, and <i>c:\folder1\subfolder3</i>, then a 
     *     quota that exists on <i>subfolder1</i>, <i>subfolder2</i>, or 
     *     <i>subfolder3</i> is considered a derived quota.
     * 
     * You would call this method if you called the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotaobject-applytemplate">ApplyTemplate</a> method to change the source 
     *     template for the automatic quota. Calling the 
     *     <b>CommitAndUpdateDerived</b> method 
     *     would then propagate the new template's settings to the existing quotas under the automatic quota directory.
     * 
     * If you specify the <b>FsrmTemplateApplyOptions_ApplyToDerivedAll</b> option, FSRM will 
     *     create a quota for all immediate subdirectories that do not have a quota applied to them and will update any 
     *     existing quotas using the properties of the automatic quota, whether the quota was created from the automatic 
     *     quota or not. For example, if a quota in one of the subdirectories was originally derived from a template, the 
     *     quota is considered a derived quota and is updated using the automatic quota—the quota is no 
     *     longer considered derived from the template.
     * @param {FsrmCommitOptions} commitOptions The options for saving the quota. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions">FsrmCommitOptions</a> enumeration.
     * @param {FsrmTemplateApplyOptions} applyOptions The options used to choose the derived quotas to which the changes are applied. For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmtemplateapplyoptions">FsrmTemplateApplyOptions</a> enumeration.
     * @returns {IFsrmDerivedObjectsResult} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmderivedobjectsresult">IFsrmDerivedObjectsResult</a> interface 
     *       that you use to determine the list of derived objects that were updated and whether the update was 
     *       successful.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmautoapplyquota-commitandupdatederived
     */
    CommitAndUpdateDerived(commitOptions, applyOptions) {
        result := ComCall(30, this, FsrmCommitOptions, commitOptions, FsrmTemplateApplyOptions, applyOptions, "ptr*", &derivedObjectsResult := 0, "HRESULT")
        return IFsrmDerivedObjectsResult(derivedObjectsResult)
    }

    Query(iid) {
        if (IFsrmAutoApplyQuota.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ExcludeFolders := CallbackCreate(GetMethod(implObj, "get_ExcludeFolders"), flags, 2)
        this.vtbl.put_ExcludeFolders := CallbackCreate(GetMethod(implObj, "put_ExcludeFolders"), flags, 2)
        this.vtbl.CommitAndUpdateDerived := CallbackCreate(GetMethod(implObj, "CommitAndUpdateDerived"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ExcludeFolders)
        CallbackFree(this.vtbl.put_ExcludeFolders)
        CallbackFree(this.vtbl.CommitAndUpdateDerived)
    }
}
