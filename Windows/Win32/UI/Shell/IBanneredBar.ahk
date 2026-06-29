#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBanneredBar extends IUnknown {
    /**
     * The interface identifier for IBanneredBar
     * @type {Guid}
     */
    static IID := Guid("{596a9a94-013e-11d1-8d34-00a0c90f2719}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBanneredBar interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIconSize : IntPtr
        GetIconSize : IntPtr
        SetBitmap   : IntPtr
        GetBitmap   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBanneredBar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     */
    SetIconSize(iIcon) {
        result := ComCall(3, this, "uint", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIconSize() {
        result := ComCall(4, this, "uint*", &piIcon := 0, "HRESULT")
        return piIcon
    }

    /**
     * 
     * @param {HBITMAP} _hBitmap 
     * @returns {HRESULT} 
     */
    SetBitmap(_hBitmap) {
        result := ComCall(5, this, HBITMAP, _hBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HBITMAP} 
     */
    GetBitmap() {
        phBitmap := HBITMAP.Owned()
        result := ComCall(6, this, HBITMAP.Ptr, phBitmap, "HRESULT")
        return phBitmap
    }

    Query(iid) {
        if (IBanneredBar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIconSize := CallbackCreate(GetMethod(implObj, "SetIconSize"), flags, 2)
        this.vtbl.GetIconSize := CallbackCreate(GetMethod(implObj, "GetIconSize"), flags, 2)
        this.vtbl.SetBitmap := CallbackCreate(GetMethod(implObj, "SetBitmap"), flags, 2)
        this.vtbl.GetBitmap := CallbackCreate(GetMethod(implObj, "GetBitmap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIconSize)
        CallbackFree(this.vtbl.GetIconSize)
        CallbackFree(this.vtbl.SetBitmap)
        CallbackFree(this.vtbl.GetBitmap)
    }
}
