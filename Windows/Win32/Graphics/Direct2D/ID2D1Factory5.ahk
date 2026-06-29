#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Device4.ahk" { ID2D1Device4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Factory4.ahk" { ID2D1Factory4 }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }

/**
 * Creates Direct2D resources. This interface also enables the creation of ID2D1Device4 objects.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1factory5
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Factory5 extends ID2D1Factory4 {
    /**
     * The interface identifier for ID2D1Factory5
     * @type {Guid}
     */
    static IID := Guid("{c4349994-838e-4b0f-8cab-44997d9eeacc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Factory5 interfaces
    */
    struct Vtbl extends ID2D1Factory4.Vtbl {
        CreateDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Factory5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an ID2D1Device4 object.
     * @param {IDXGIDevice} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The IDXGIDevice object used when creating the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1device4">ID2D1Device4</a>.
     * @returns {ID2D1Device4} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1device4">ID2D1Device4</a>**</b>
     * 
     * The requested <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1device4">ID2D1Device4</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1factory5-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(30, this, "ptr", dxgiDevice, "ptr*", &d2dDevice4 := 0, "HRESULT")
        return ID2D1Device4(d2dDevice4)
    }

    Query(iid) {
        if (ID2D1Factory5.IID.Equals(iid)) {
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
