#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInputPanelWindowHandle extends IUnknown {
    /**
     * The interface identifier for IInputPanelWindowHandle
     * @type {Guid}
     */
    static IID := Guid("{4af81847-fdc4-4fc3-ad0b-422479c1b935}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputPanelWindowHandle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_AttachedEditWindow32 : IntPtr
        put_AttachedEditWindow32 : IntPtr
        get_AttachedEditWindow64 : IntPtr
        put_AttachedEditWindow64 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputPanelWindowHandle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    AttachedEditWindow32 {
        get => this.get_AttachedEditWindow32()
        set => this.put_AttachedEditWindow32(value)
    }

    /**
     * @type {Integer} 
     */
    AttachedEditWindow64 {
        get => this.get_AttachedEditWindow64()
        set => this.put_AttachedEditWindow64(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttachedEditWindow32() {
        result := ComCall(3, this, "int*", &AttachedEditWindow := 0, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow32(AttachedEditWindow) {
        result := ComCall(4, this, "int", AttachedEditWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttachedEditWindow64() {
        result := ComCall(5, this, "int64*", &AttachedEditWindow := 0, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow64(AttachedEditWindow) {
        result := ComCall(6, this, "int64", AttachedEditWindow, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInputPanelWindowHandle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AttachedEditWindow32 := CallbackCreate(GetMethod(implObj, "get_AttachedEditWindow32"), flags, 2)
        this.vtbl.put_AttachedEditWindow32 := CallbackCreate(GetMethod(implObj, "put_AttachedEditWindow32"), flags, 2)
        this.vtbl.get_AttachedEditWindow64 := CallbackCreate(GetMethod(implObj, "get_AttachedEditWindow64"), flags, 2)
        this.vtbl.put_AttachedEditWindow64 := CallbackCreate(GetMethod(implObj, "put_AttachedEditWindow64"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AttachedEditWindow32)
        CallbackFree(this.vtbl.put_AttachedEditWindow32)
        CallbackFree(this.vtbl.get_AttachedEditWindow64)
        CallbackFree(this.vtbl.put_AttachedEditWindow64)
    }
}
