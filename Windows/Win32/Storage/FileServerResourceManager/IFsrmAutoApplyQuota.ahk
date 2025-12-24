#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmDerivedObjectsResult.ahk
#Include .\IFsrmQuotaObject.ahk

/**
 * Used to automatically add the quota to new and existing subdirectories of the directory on which the automatic quota is applied.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmautoapplyquota
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmAutoApplyQuota extends IFsrmQuotaObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmAutoApplyQuota
     * @type {Guid}
     */
    static IID => Guid("{f82e5729-6aba-4740-bfc7-c7f58f75fb7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExcludeFolders", "put_ExcludeFolders", "CommitAndUpdateDerived"]

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ExcludeFolders {
        get => this.get_ExcludeFolders()
        set => this.put_ExcludeFolders(value)
    }

    /**
     * Retrieves or sets an array of immediate subdirectories to exclude from the automatic quota.
     * @remarks
     * 
     * The list can contain the names of existing subdirectories or subdirectories that may exist in the future.
     * 
     * Setting this property overwrites the current list of subdirectories to exclude. To remove all folders, pass an 
     *     empty array.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmautoapplyquota-get_excludefolders
     */
    get_ExcludeFolders() {
        result := ComCall(28, this, "ptr*", &folders := 0, "HRESULT")
        return folders
    }

    /**
     * Retrieves or sets an array of immediate subdirectories to exclude from the automatic quota.
     * @remarks
     * 
     * The list can contain the names of existing subdirectories or subdirectories that may exist in the future.
     * 
     * Setting this property overwrites the current list of subdirectories to exclude. To remove all folders, pass an 
     *     empty array.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} folders 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmautoapplyquota-put_excludefolders
     */
    put_ExcludeFolders(folders) {
        result := ComCall(29, this, "ptr", folders, "HRESULT")
        return result
    }

    /**
     * Saves the quota and then applies any changes to the derived quotas.
     * @param {Integer} commitOptions The options for saving the quota. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions">FsrmCommitOptions</a> enumeration.
     * @param {Integer} applyOptions The options used to choose the derived quotas to which the changes are applied. For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmtemplateapplyoptions">FsrmTemplateApplyOptions</a> enumeration.
     * @returns {IFsrmDerivedObjectsResult} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmderivedobjectsresult">IFsrmDerivedObjectsResult</a> interface 
     *       that you use to determine the list of derived objects that were updated and whether the update was 
     *       successful.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmautoapplyquota-commitandupdatederived
     */
    CommitAndUpdateDerived(commitOptions, applyOptions) {
        result := ComCall(30, this, "int", commitOptions, "int", applyOptions, "ptr*", &derivedObjectsResult := 0, "HRESULT")
        return IFsrmDerivedObjectsResult(derivedObjectsResult)
    }
}
