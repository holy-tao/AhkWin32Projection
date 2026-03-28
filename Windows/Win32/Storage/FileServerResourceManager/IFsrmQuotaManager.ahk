#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmQuota.ahk
#Include .\IFsrmAutoApplyQuota.ahk
#Include .\IFsrmCommittableCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage quotas.
 * @remarks
 * A directory quota restricts the size of a specific directory to a configurable quota limit. In addition to 
 *     the limit, a directory quota may be configured with one or more directory quota thresholds which define a set of 
 *     actions that are initiated when the quota usage reaches the threshold value.
 * 
 * You can create a quota, an automatic quota, or a quota template. A quota applies to a specific directory. The 
 *     automatic quota applies to the specified directory and automatically creates quotas for new and existing 
 *     subdirectories of the specified directory. The quota template is used to modify properties in bulk by applying 
 *     the changes to quotas that derive from the quota template.
 * 
 * Note that if the directory is renamed, the quota applies to the renamed directory. If the directory is 
 *     deleted, the quota is deleted.
 * 
 * To create this object from a script, use the program identifier, 
 *     "Fsrm.FsrmQuotaManager".
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmquotamanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmQuotaManager
     * @type {Guid}
     */
    static IID => Guid("{8bb68c7d-19d8-4ffb-809e-be4fc1734014}")

    /**
     * The class identifier for FsrmQuotaManager
     * @type {Guid}
     */
    static CLSID => Guid("{90dcab7f-347c-4bfc-b543-540326305fbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActionVariables", "get_ActionVariableDescriptions", "CreateQuota", "CreateAutoApplyQuota", "GetQuota", "GetAutoApplyQuota", "GetRestrictiveQuota", "EnumQuotas", "EnumAutoApplyQuotas", "EnumEffectiveQuotas", "Scan", "CreateQuotaCollection"]

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ActionVariables {
        get => this.get_ActionVariables()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ActionVariableDescriptions {
        get => this.get_ActionVariableDescriptions()
    }

    /**
     * Retrieves a list of macros that you can specify in action property values. (IFsrmQuotaManagerEx.get_ActionVariables)
     * @remarks
     * FSRM parses the action property for the macros and substitutes the macro string with the values that are 
     *     specific to the event and computer on which the action occurred. For example, the following shows how you can 
     *     format the message text for email: 
     *     "User [<i>Source Io Owner</i>] has reached the quota limit for quota on [<i>Quota Path</i>] on server [<i>Server</i>]. The quota limit is [<i>Quota Limit MB</i>] MB and the current usage is [<i>Quota Used MB</i>] MB ([<i>Quota Used Percent</i>]% of limit)."
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-get_actionvariables
     */
    get_ActionVariables() {
        result := ComCall(7, this, "ptr*", &variables := 0, "HRESULT")
        return variables
    }

    /**
     * Retrieves the descriptions for the macros contained in the IFsrmQuotaManager::ActionVariables property.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-get_actionvariabledescriptions
     */
    get_ActionVariableDescriptions() {
        result := ComCall(8, this, "ptr*", &descriptions := 0, "HRESULT")
        return descriptions
    }

    /**
     * Creates a quota for the specified directory.
     * @remarks
     * The quota applies to the directory and all its subdirectories (recursively). Quotas specified on directories 
     *     higher in the directory tree further restrict the quota specified on this directory.
     * 
     * If the quota specifies the <b>FsrmQuotaFlags_Enforce</b>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-get_quotaflags">quota flag</a>, the file IO is blocked when the quota 
     *     is exceeded, but there are no actions taken, such as a command being run or a report generated. To perform actions 
     *     when the quota is exceeded, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-addthreshold">create a threshold</a> 
     *     and specify an action to run. To perform the action when the quota is exceeded, set the threshold to 
     *     100 (percent).
     * @param {BSTR} _path 
     * @returns {IFsrmQuota} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquota">IFsrmQuota</a> interface to the newly created quota 
     *       object. Use this interface to define the quota. To add the quota to FSRM, call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmQuota::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-createquota
     */
    CreateQuota(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(9, this, "ptr", _path, "ptr*", &quota := 0, "HRESULT")
        return IFsrmQuota(quota)
    }

    /**
     * Creates an automatic quota for the specified directory.
     * @remarks
     * When you save the automatic quota, FSRM creates quotas for all existing subdirectories under the specified 
     *     directory that do not already contain a quota. When a new subdirectory is created under the specified directory, 
     *     FSRM uses the properties of the automatic quota to create a quota for the new subdirectory.
     * 
     * If you are creating both the automatic quota and the subdirectories at the same time, you should first 
     *     create the subdirectories and then create the automatic quota because it provides better performance.
     * @param {BSTR} quotaTemplateName The name of a template from which to derive the quota; automatic quotas must derive from a template. The 
     *       string is limited to 4,000 characters.
     * @param {BSTR} _path 
     * @returns {IFsrmAutoApplyQuota} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmautoapplyquota">IFsrmAutoApplyQuota</a> interface to the newly 
     *       created quota object. The specified template is used to initialize the quota. Use this interface to change the 
     *       quota and to exclude specific subdirectories from the quota. To add the quota to FSRM, call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmAutoApplyQuota::Commit</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-createautoapplyquota
     */
    CreateAutoApplyQuota(quotaTemplateName, _path) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(10, this, "ptr", quotaTemplateName, "ptr", _path, "ptr*", &quota := 0, "HRESULT")
        return IFsrmAutoApplyQuota(quota)
    }

    /**
     * Retrieves the quota for the specified directory.
     * @param {BSTR} _path 
     * @returns {IFsrmQuota} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquota">IFsrmQuota</a> interface to the quota object.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-getquota
     */
    GetQuota(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(11, this, "ptr", _path, "ptr*", &quota := 0, "HRESULT")
        return IFsrmQuota(quota)
    }

    /**
     * Retrieves the automatic quota for the specified directory.
     * @param {BSTR} _path 
     * @returns {IFsrmAutoApplyQuota} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmautoapplyquota">IFsrmAutoApplyQuota</a> interface to the quota 
     *       object.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-getautoapplyquota
     */
    GetAutoApplyQuota(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(12, this, "ptr", _path, "ptr*", &quota := 0, "HRESULT")
        return IFsrmAutoApplyQuota(quota)
    }

    /**
     * Retrieves the most restrictive quota for the specified path.
     * @remarks
     * The most restrictive quota is the one with the lowest quota limit. If a quota higher in the directory tree 
     *     has a lower limit than the quota associated with the specified path, the former quota is returned. If two quotas 
     *     have the same limit, the quota that is higher in the directory tree is returned.
     * @param {BSTR} _path 
     * @returns {IFsrmQuota} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquota">IFsrmQuota</a> interface to  the quota object.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-getrestrictivequota
     */
    GetRestrictiveQuota(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(13, this, "ptr", _path, "ptr*", &quota := 0, "HRESULT")
        return IFsrmQuota(quota)
    }

    /**
     * Enumerates the quotas for the specified directory and any quotas associated with its subdirectories (recursively).
     * @remarks
     * To enumerate quotas that apply automatically to the path's subdirectories, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumautoapplyquotas">IFsrmQuotaManager::EnumAutoApplyQuotas</a> 
     *     method.
     * @param {BSTR} _path 
     * @param {Integer} options Options to use when enumerating the quotas. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *        that contains a collection of the quotas.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquota">IFsrmQuota</a> interface.
     * 
     * The collection is empty if the path does not contain quotas.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumquotas
     */
    EnumQuotas(_path, options) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(14, this, "ptr", _path, "int", options, "ptr*", &quotas := 0, "HRESULT")
        return IFsrmCommittableCollection(quotas)
    }

    /**
     * Enumerates the automatic quotas that are associated with the specified directory.
     * @remarks
     * To enumerate quotas that do not automatically apply to the path's subdirectories, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumquotas">IFsrmQuotaManager::EnumQuotas</a> 
     *     method.
     * @param {BSTR} _path 
     * @param {Integer} options Options to use when enumerating the quotas. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *        that contains a collection of the automatic quotas.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmautoapplyquota">IFsrmAutoApplyQuota</a> interface.
     * 
     * The collection is empty if the path does not contain quotas.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumautoapplyquotas
     */
    EnumAutoApplyQuotas(_path, options) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(15, this, "ptr", _path, "int", options, "ptr*", &quotas := 0, "HRESULT")
        return IFsrmCommittableCollection(quotas)
    }

    /**
     * Enumerates all the quotas that affect the specified path.
     * @remarks
     * Does not enumerate automatic quotas. To enumerate automatic quotas, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumautoapplyquotas">IFsrmQuotaManager::EnumAutoApplyQuotas</a> 
     *     method.
     * 
     * To enumerate all quotas, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumquotas">IFsrmQuotaManager::EnumQuotas</a> method.
     * @param {BSTR} _path 
     * @param {Integer} options Options to use when enumerating the quotas. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *        that contains a collection of the quotas configured at or above the specified path.
     * 
     * Each item of the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nn-fsrmquota-ifsrmquota">IFsrmQuota</a> interface.
     * 
     * The collection is empty if the path does not contain quotas.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumeffectivequotas
     */
    EnumEffectiveQuotas(_path, options) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(16, this, "ptr", _path, "int", options, "ptr*", &quotas := 0, "HRESULT")
        return IFsrmCommittableCollection(quotas)
    }

    /**
     * Starts a quota scan on the specified path.
     * @remarks
     * Although quota usage is monitored on an ongoing basis, there may be some instances in which the quota usage 
     *     may be out of sync with the actual usage, in which case you can call this method to refresh the quota usage. For 
     *     example, if an administrator disables a quota (to investigate or troubleshoot an issue) and later enables it, then 
     *     this method should be called to perform a manual scan.
     * @param {BSTR} strPath The local directory path to scan.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-scan
     */
    Scan(strPath) {
        strPath := strPath is String ? BSTR.Alloc(strPath).Value : strPath

        result := ComCall(17, this, "ptr", strPath, "HRESULT")
        return result
    }

    /**
     * Creates an empty collection to which you can add quotas.
     * @remarks
     * Using the collection to add more than one quota provides better performance than adding individual quotas. 
     *     After adding the quotas to the collection, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmcommittablecollection-commit">IFsrmCommittableCollection::Commit</a> 
     *     method.
     * @returns {IFsrmCommittableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcommittablecollection">IFsrmCommittableCollection</a> interface 
     *       to the newly created collection. To add an object to the collection, call the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmmutablecollection-add">IFsrmMutableCollection::Add</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-createquotacollection
     */
    CreateQuotaCollection() {
        result := ComCall(18, this, "ptr*", &collection := 0, "HRESULT")
        return IFsrmCommittableCollection(collection)
    }
}
