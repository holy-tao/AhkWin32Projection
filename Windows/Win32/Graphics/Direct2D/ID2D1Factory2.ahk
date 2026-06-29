#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Device1.ahk" { ID2D1Device1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import ".\ID2D1Factory1.ahk" { ID2D1Factory1 }

/**
 * Creates Direct2D resources. (ID2D1Factory2)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nn-d2d1_2-id2d1factory2
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Factory2 extends ID2D1Factory1 {
    /**
     * The interface identifier for ID2D1Factory2
     * @type {Guid}
     */
    static IID := Guid("{94f81a73-9212-4376-9c58-b16a3a0d3992}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Factory2 interfaces
    */
    struct Vtbl extends ID2D1Factory1.Vtbl {
        CreateDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Factory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an ID2D1Device1 object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> device defines a resource domain in which a set of Direct2D objects and Direct2D device contexts can be used together.  Each call to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-d2d1createdevice">CreateDevice</a> returns a unique <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a> object, even if you pass the same <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> multiple times.
     * @param {IDXGIDevice} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> object used when creating  the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a>.
     * @returns {ID2D1Device1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a>**</b>
     * 
     * The requested <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_2/nn-d2d1_2-id2d1device1">ID2D1Device1</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1factory2-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(27, this, "ptr", dxgiDevice, "ptr*", &d2dDevice1 := 0, "HRESULT")
        return ID2D1Device1(d2dDevice1)
    }

    Query(iid) {
        if (ID2D1Factory2.IID.Equals(iid)) {
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
