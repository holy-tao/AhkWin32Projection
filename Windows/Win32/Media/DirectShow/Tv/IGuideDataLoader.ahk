#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGuideData.ahk" { IGuideData }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IGuideDataLoader extends IUnknown {
    /**
     * The interface identifier for IGuideDataLoader
     * @type {Guid}
     */
    static IID := Guid("{4764ff7c-fa95-4525-af4d-d32236db9e38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGuideDataLoader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init      : IntPtr
        Terminate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGuideDataLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IGuideData} pGuideStore 
     * @returns {HRESULT} 
     */
    Init(pGuideStore) {
        result := ComCall(3, this, "ptr", pGuideStore, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Terminate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGuideDataLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 2)
        this.vtbl.Terminate := CallbackCreate(GetMethod(implObj, "Terminate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.Terminate)
    }
}
