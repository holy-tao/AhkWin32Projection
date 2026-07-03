#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IFsrmFileGroup.ahk" { IFsrmFileGroup }

/**
 * Used to configure imported file group objects.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nn-fsrmscreen-ifsrmfilegroupimported
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileGroupImported extends IFsrmFileGroup {
    /**
     * The interface identifier for IFsrmFileGroupImported
     * @type {Guid}
     */
    static IID := Guid("{ad55f10b-5f11-4be7-94ef-d9ee2e470ded}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileGroupImported interfaces
    */
    struct Vtbl extends IFsrmFileGroup.Vtbl {
        get_OverwriteOnCommit : IntPtr
        put_OverwriteOnCommit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileGroupImported.Vtbl()
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
     * Retrieves or sets a value that determines whether a file group is overwritten if it exists. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupimported-get_overwriteoncommit
     */
    get_OverwriteOnCommit() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &overwrite := 0, "HRESULT")
        return overwrite
    }

    /**
     * Retrieves or sets a value that determines whether a file group is overwritten if it exists. (Put)
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupimported-put_overwriteoncommit
     */
    put_OverwriteOnCommit(overwrite) {
        result := ComCall(19, this, VARIANT_BOOL, overwrite, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmFileGroupImported.IID.Equals(iid)) {
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
