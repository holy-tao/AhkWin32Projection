#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmQuotaManager.ahk" { IFsrmQuotaManager }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\FsrmEnumOptions.ahk" { FsrmEnumOptions }

/**
 * Used to manage quotas, extended version.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmquotamanagerex
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmQuotaManagerEx extends IFsrmQuotaManager {
    /**
     * The interface identifier for IFsrmQuotaManagerEx
     * @type {Guid}
     */
    static IID := Guid("{4846cb01-d430-494f-abb4-b1054999fb09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmQuotaManagerEx interfaces
    */
    struct Vtbl extends IFsrmQuotaManager.Vtbl {
        IsAffectedByQuota : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmQuotaManagerEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a value that determines whether a specified path is subject to a quota.
     * @param {BSTR} _path The local directory path to determine whether a quota applies.
     * @param {FsrmEnumOptions} options The options to use when checking for a quota. For possible values, see the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the path referred to by the 
     *      <i>path</i> parameter is subject to a quota, otherwise it is 
     *      <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotamanagerex-isaffectedbyquota
     */
    IsAffectedByQuota(_path, options) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(19, this, BSTR, _path, FsrmEnumOptions, options, VARIANT_BOOL.Ptr, &affected := 0, "HRESULT")
        return affected
    }

    Query(iid) {
        if (IFsrmQuotaManagerEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsAffectedByQuota := CallbackCreate(GetMethod(implObj, "IsAffectedByQuota"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsAffectedByQuota)
    }
}
