#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIOutput3.ahk" { IDXGIOutput3 }
#Import "Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput4 interface exposes a method to check for overlay color space support.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nn-dxgi1_4-idxgioutput4
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIOutput4 extends IDXGIOutput3 {
    /**
     * The interface identifier for IDXGIOutput4
     * @type {Guid}
     */
    static IID := Guid("{dc7dca35-2196-414d-9f53-617884032a60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIOutput4 interfaces
    */
    struct Vtbl extends IDXGIOutput3.Vtbl {
        CheckOverlayColorSpaceSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIOutput4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks for overlay color space support.
     * @param {DXGI_FORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the color format.
     * @param {DXGI_COLOR_SPACE_TYPE} ColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a>-typed value that specifies color space type to check overlay support for.
     * @param {IUnknown} pConcernedDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the Direct3D device interface. <b>CheckOverlayColorSpaceSupport</b> returns only support info about this scan-out device.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives a combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/ne-dxgi1_4-dxgi_overlay_color_space_support_flag">DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for overlay color space support.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgioutput4-checkoverlaycolorspacesupport
     */
    CheckOverlayColorSpaceSupport(Format, ColorSpace, pConcernedDevice) {
        result := ComCall(25, this, DXGI_FORMAT, Format, DXGI_COLOR_SPACE_TYPE, ColorSpace, "ptr", pConcernedDevice, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    Query(iid) {
        if (IDXGIOutput4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckOverlayColorSpaceSupport := CallbackCreate(GetMethod(implObj, "CheckOverlayColorSpaceSupport"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckOverlayColorSpaceSupport)
    }
}
