#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmQuotaManager.ahk

/**
 * Used to manage quotas, extended version.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotamanagerex
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaManagerEx extends IFsrmQuotaManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmQuotaManagerEx
     * @type {Guid}
     */
    static IID => Guid("{4846cb01-d430-494f-abb4-b1054999fb09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsAffectedByQuota"]

    /**
     * 
     * @param {BSTR} path 
     * @param {Integer} options 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanagerex-isaffectedbyquota
     */
    IsAffectedByQuota(path, options) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(19, this, "ptr", path, "int", options, "short*", &affected := 0, "HRESULT")
        return affected
    }
}
