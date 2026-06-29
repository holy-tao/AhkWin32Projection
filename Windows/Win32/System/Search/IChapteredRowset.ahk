#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IChapteredRowset extends IUnknown {
    /**
     * The interface identifier for IChapteredRowset
     * @type {Guid}
     */
    static IID := Guid("{0c733a93-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChapteredRowset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddRefChapter  : IntPtr
        ReleaseChapter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChapteredRowset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @returns {Integer} 
     */
    AddRefChapter(hChapter) {
        result := ComCall(3, this, "ptr", hChapter, "uint*", &pcRefCount := 0, "HRESULT")
        return pcRefCount
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @returns {Integer} 
     */
    ReleaseChapter(hChapter) {
        result := ComCall(4, this, "ptr", hChapter, "uint*", &pcRefCount := 0, "HRESULT")
        return pcRefCount
    }

    Query(iid) {
        if (IChapteredRowset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRefChapter := CallbackCreate(GetMethod(implObj, "AddRefChapter"), flags, 3)
        this.vtbl.ReleaseChapter := CallbackCreate(GetMethod(implObj, "ReleaseChapter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRefChapter)
        CallbackFree(this.vtbl.ReleaseChapter)
    }
}
