#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Factory6.ahk" { ID2D1Factory6 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import ".\ID2D1Device6.ahk" { ID2D1Device6 }

/**
 * Creates Direct2D resources. This interface performs all the same functions as the ID2D1Factory6 interface, plus it enables the creation of ID2D1Device6 objects.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1factory7
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Factory7 extends ID2D1Factory6 {
    /**
     * The interface identifier for ID2D1Factory7
     * @type {Guid}
     */
    static IID := Guid("{bdc2bdd3-b96c-4de6-bdf7-99d4745454de}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Factory7 interfaces
    */
    struct Vtbl extends ID2D1Factory6.Vtbl {
        CreateDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Factory7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new Direct2D device from the given IDXGIDevice. (ID2D1Factory7.CreateDevice)
     * @param {IDXGIDevice} dxgiDevice Type: <b>IDXGIDevice*</b>
     * 
     * The IDXGIDevice from which to create the Direct2D device.
     * @returns {ID2D1Device6} Type: <b>ID2D1Device6**</b>
     * 
     * The created device.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1factory7-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(32, this, "ptr", dxgiDevice, "ptr*", &d2dDevice6 := 0, "HRESULT")
        return ID2D1Device6(d2dDevice6)
    }

    Query(iid) {
        if (ID2D1Factory7.IID.Equals(iid)) {
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
