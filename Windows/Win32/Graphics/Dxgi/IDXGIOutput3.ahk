#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutput2.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput3 interface exposes a method to check for overlay support.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nn-dxgi1_3-idxgioutput3
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput3 extends IDXGIOutput2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput3
     * @type {Guid}
     */
    static IID => Guid("{8a6bb301-7e7e-41f4-a8e0-5b32f7f99b18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckOverlaySupport"]

    /**
     * Checks for overlay support.
     * @param {Integer} EnumFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the color format.
     * @param {IUnknown} pConcernedDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the Direct3D device interface. <b>CheckOverlaySupport</b> returns only support info about this scan-out device.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives a combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ne-dxgi1_3-dxgi_overlay_support_flag">DXGI_OVERLAY_SUPPORT_FLAG</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for overlay support.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgioutput3-checkoverlaysupport
     */
    CheckOverlaySupport(EnumFormat, pConcernedDevice) {
        result := ComCall(24, this, "int", EnumFormat, "ptr", pConcernedDevice, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }
}
