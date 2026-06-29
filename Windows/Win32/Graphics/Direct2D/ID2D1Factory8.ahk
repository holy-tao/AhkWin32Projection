#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Device7.ahk" { ID2D1Device7 }
#Import ".\ID2D1Factory7.ahk" { ID2D1Factory7 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Factory8 extends ID2D1Factory7 {
    /**
     * The interface identifier for ID2D1Factory8
     * @type {Guid}
     */
    static IID := Guid("{677c9311-f36d-4b1f-ae86-86d1223ffd3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Factory8 interfaces
    */
    struct Vtbl extends ID2D1Factory7.Vtbl {
        CreateDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Factory8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @returns {ID2D1Device7} 
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(33, this, "ptr", dxgiDevice, "ptr*", &d2dDevice6 := 0, "HRESULT")
        return ID2D1Device7(d2dDevice6)
    }

    Query(iid) {
        if (ID2D1Factory8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDevice := CallbackCreate(GetMethod(implObj, "CreateDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDevice)
    }
}
