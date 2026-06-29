#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Factory5.ahk" { ID2D1Factory5 }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import ".\ID2D1Device5.ahk" { ID2D1Device5 }

/**
 * Creates Direct2D resources. This interface also enables the creation of ID2D1Device5 objects.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1factory6
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Factory6 extends ID2D1Factory5 {
    /**
     * The interface identifier for ID2D1Factory6
     * @type {Guid}
     */
    static IID := Guid("{f9976f46-f642-44c1-97ca-da32ea2a2635}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Factory6 interfaces
    */
    struct Vtbl extends ID2D1Factory5.Vtbl {
        CreateDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Factory6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new Direct2D device from the given IDXGIDevice. (ID2D1Factory6.CreateDevice)
     * @param {IDXGIDevice} dxgiDevice Type: <b>IDXGIDevice*</b>
     * 
     * The IDXGIDevice to create the Direct2D device from.
     * @returns {ID2D1Device5} Type: <b>ID2D1Device5**</b>
     * 
     * The created device.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1factory6-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(31, this, "ptr", dxgiDevice, "ptr*", &d2dDevice5 := 0, "HRESULT")
        return ID2D1Device5(d2dDevice5)
    }

    Query(iid) {
        if (ID2D1Factory6.IID.Equals(iid)) {
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
