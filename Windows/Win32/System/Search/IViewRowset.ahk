#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IViewRowset extends IUnknown {
    /**
     * The interface identifier for IViewRowset
     * @type {Guid}
     */
    static IID := Guid("{0c733a97-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewRowset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSpecification : IntPtr
        OpenViewRowset   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewRowset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetSpecification(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    OpenViewRowset(pUnkOuter, riid) {
        result := ComCall(4, this, "ptr", pUnkOuter, Guid.Ptr, riid, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }

    Query(iid) {
        if (IViewRowset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSpecification := CallbackCreate(GetMethod(implObj, "GetSpecification"), flags, 3)
        this.vtbl.OpenViewRowset := CallbackCreate(GetMethod(implObj, "OpenViewRowset"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSpecification)
        CallbackFree(this.vtbl.OpenViewRowset)
    }
}
