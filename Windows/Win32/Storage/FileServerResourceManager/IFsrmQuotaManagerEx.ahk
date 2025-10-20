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
     * 
     * @param {BSTR} path 
     * @param {Integer} options 
     * @param {Pointer<VARIANT_BOOL>} affected 
     * @returns {HRESULT} 
     */
    IsAffectedByQuota(path, options, affected) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(19, this, "ptr", path, "int", options, "ptr", affected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
