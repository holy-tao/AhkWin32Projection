#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IFsrmQuotaTemplate.ahk" { IFsrmQuotaTemplate }

/**
 * Used to modify and save imported quota templates.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nn-fsrmquota-ifsrmquotatemplateimported
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmQuotaTemplateImported extends IFsrmQuotaTemplate {
    /**
     * The interface identifier for IFsrmQuotaTemplateImported
     * @type {Guid}
     */
    static IID := Guid("{9a2bf113-a329-44cc-809a-5c00fce8da40}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmQuotaTemplateImported interfaces
    */
    struct Vtbl extends IFsrmQuotaTemplate.Vtbl {
        get_OverwriteOnCommit : IntPtr
        put_OverwriteOnCommit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmQuotaTemplateImported.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    OverwriteOnCommit {
        get => this.get_OverwriteOnCommit()
        set => this.put_OverwriteOnCommit(value)
    }

    /**
     * Retrieves or sets a value that determines whether a quota template is overwritten if it exists when the template is imported. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplateimported-get_overwriteoncommit
     */
    get_OverwriteOnCommit() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &overwrite := 0, "HRESULT")
        return overwrite
    }

    /**
     * Retrieves or sets a value that determines whether a quota template is overwritten if it exists when the template is imported. (Put)
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplateimported-put_overwriteoncommit
     */
    put_OverwriteOnCommit(overwrite) {
        result := ComCall(27, this, VARIANT_BOOL, overwrite, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmQuotaTemplateImported.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_OverwriteOnCommit := CallbackCreate(GetMethod(implObj, "get_OverwriteOnCommit"), flags, 2)
        this.vtbl.put_OverwriteOnCommit := CallbackCreate(GetMethod(implObj, "put_OverwriteOnCommit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_OverwriteOnCommit)
        CallbackFree(this.vtbl.put_OverwriteOnCommit)
    }
}
