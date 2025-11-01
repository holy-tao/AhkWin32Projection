#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to manage quotas.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotamanager
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
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} variables 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-get_actionvariables
     */
    get_ActionVariables(variables) {
        result := ComCall(7, this, "ptr*", variables, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} descriptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-get_actionvariabledescriptions
     */
    get_ActionVariableDescriptions(descriptions) {
        result := ComCall(8, this, "ptr*", descriptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IFsrmQuota>} quota 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-createquota
     */
    CreateQuota(path, quota) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(9, this, "ptr", path, "ptr*", quota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} quotaTemplateName 
     * @param {BSTR} path 
     * @param {Pointer<IFsrmAutoApplyQuota>} quota 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-createautoapplyquota
     */
    CreateAutoApplyQuota(quotaTemplateName, path, quota) {
        quotaTemplateName := quotaTemplateName is String ? BSTR.Alloc(quotaTemplateName).Value : quotaTemplateName
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(10, this, "ptr", quotaTemplateName, "ptr", path, "ptr*", quota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IFsrmQuota>} quota 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-getquota
     */
    GetQuota(path, quota) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(11, this, "ptr", path, "ptr*", quota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IFsrmAutoApplyQuota>} quota 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-getautoapplyquota
     */
    GetAutoApplyQuota(path, quota) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(12, this, "ptr", path, "ptr*", quota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IFsrmQuota>} quota 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-getrestrictivequota
     */
    GetRestrictiveQuota(path, quota) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(13, this, "ptr", path, "ptr*", quota, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCommittableCollection>} quotas 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumquotas
     */
    EnumQuotas(path, options, quotas) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(14, this, "ptr", path, "int", options, "ptr*", quotas, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCommittableCollection>} quotas 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumautoapplyquotas
     */
    EnumAutoApplyQuotas(path, options, quotas) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(15, this, "ptr", path, "int", options, "ptr*", quotas, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} options 
     * @param {Pointer<IFsrmCommittableCollection>} quotas 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-enumeffectivequotas
     */
    EnumEffectiveQuotas(path, options, quotas) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(16, this, "ptr", path, "int", options, "ptr*", quotas, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-scan
     */
    Scan(strPath) {
        strPath := strPath is String ? BSTR.Alloc(strPath).Value : strPath

        result := ComCall(17, this, "ptr", strPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCommittableCollection>} collection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanager-createquotacollection
     */
    CreateQuotaCollection(collection) {
        result := ComCall(18, this, "ptr*", collection, "HRESULT")
        return result
    }
}
