#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IDocWrap extends IUnknown {
    /**
     * The interface identifier for IDocWrap
     * @type {Guid}
     */
    static IID := Guid("{dcd285fe-0be0-43bd-99c9-aaaec513c555}")

    /**
     * The class identifier for DocWrap
     * @type {Guid}
     */
    static CLSID := Guid("{bf426f7e-7a5e-44d6-830c-a390ea9462a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocWrap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDoc        : IntPtr
        GetWrappedDoc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocWrap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    SetDoc(riid, punk) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetWrappedDoc(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (IDocWrap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDoc := CallbackCreate(GetMethod(implObj, "SetDoc"), flags, 3)
        this.vtbl.GetWrappedDoc := CallbackCreate(GetMethod(implObj, "GetWrappedDoc"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDoc)
        CallbackFree(this.vtbl.GetWrappedDoc)
    }
}
