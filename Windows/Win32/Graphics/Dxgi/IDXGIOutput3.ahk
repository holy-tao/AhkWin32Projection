#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDXGIOutput2.ahk" { IDXGIOutput2 }

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput3 interface exposes a method to check for overlay support.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgioutput3
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIOutput3 extends IDXGIOutput2 {
    /**
     * The interface identifier for IDXGIOutput3
     * @type {Guid}
     */
    static IID := Guid("{8a6bb301-7e7e-41f4-a8e0-5b32f7f99b18}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIOutput3 interfaces
    */
    struct Vtbl extends IDXGIOutput2.Vtbl {
        CheckOverlaySupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIOutput3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks for overlay support.
     * @param {DXGI_FORMAT} EnumFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the color format.
     * @param {IUnknown} pConcernedDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the Direct3D device interface. <b>CheckOverlaySupport</b> returns only support info about this scan-out device.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives a combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ne-dxgi1_3-dxgi_overlay_support_flag">DXGI_OVERLAY_SUPPORT_FLAG</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for overlay support.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgioutput3-checkoverlaysupport
     */
    CheckOverlaySupport(EnumFormat, pConcernedDevice) {
        result := ComCall(24, this, DXGI_FORMAT, EnumFormat, "ptr", pConcernedDevice, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    Query(iid) {
        if (IDXGIOutput3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckOverlaySupport := CallbackCreate(GetMethod(implObj, "CheckOverlaySupport"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckOverlaySupport)
    }
}
