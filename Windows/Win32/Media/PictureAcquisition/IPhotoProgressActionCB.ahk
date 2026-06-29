#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IPhotoProgressActionCB extends IUnknown {
    /**
     * The interface identifier for IPhotoProgressActionCB
     * @type {Guid}
     */
    static IID := Guid("{00f242d0-b206-4e7d-b4c1-4755bcbb9c9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhotoProgressActionCB interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoAction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhotoProgressActionCB.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @returns {HRESULT} 
     */
    DoAction(hWndParent) {
        result := ComCall(3, this, HWND, hWndParent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPhotoProgressActionCB.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoAction := CallbackCreate(GetMethod(implObj, "DoAction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoAction)
    }
}
