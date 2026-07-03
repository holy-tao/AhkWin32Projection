#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct AsyncIUnknown extends IUnknown {
    /**
     * The interface identifier for AsyncIUnknown
     * @type {Guid}
     */
    static IID := Guid("{000e0000-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIUnknown
     * @type {Guid}
     */
    static CLSID := Guid("{000e0000-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIUnknown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_QueryInterface  : IntPtr
        Finish_QueryInterface : IntPtr
        Begin_AddRef          : IntPtr
        Finish_AddRef         : IntPtr
        Begin_Release         : IntPtr
        Finish_Release        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIUnknown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    Begin_QueryInterface(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    Finish_QueryInterface() {
        result := ComCall(4, this, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_AddRef() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_AddRef() {
        result := ComCall(6, this, UInt32)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_Release() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_Release() {
        result := ComCall(8, this, UInt32)
        return result
    }

    Query(iid) {
        if (AsyncIUnknown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_QueryInterface := CallbackCreate(GetMethod(implObj, "Begin_QueryInterface"), flags, 2)
        this.vtbl.Finish_QueryInterface := CallbackCreate(GetMethod(implObj, "Finish_QueryInterface"), flags, 2)
        this.vtbl.Begin_AddRef := CallbackCreate(GetMethod(implObj, "Begin_AddRef"), flags, 1)
        this.vtbl.Finish_AddRef := CallbackCreate(GetMethod(implObj, "Finish_AddRef"), flags, 1)
        this.vtbl.Begin_Release := CallbackCreate(GetMethod(implObj, "Begin_Release"), flags, 1)
        this.vtbl.Finish_Release := CallbackCreate(GetMethod(implObj, "Finish_Release"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_QueryInterface)
        CallbackFree(this.vtbl.Finish_QueryInterface)
        CallbackFree(this.vtbl.Begin_AddRef)
        CallbackFree(this.vtbl.Finish_AddRef)
        CallbackFree(this.vtbl.Begin_Release)
        CallbackFree(this.vtbl.Finish_Release)
    }
}
