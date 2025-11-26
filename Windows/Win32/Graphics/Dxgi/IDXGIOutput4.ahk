#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutput3.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput4 interface exposes a method to check for overlay color space support.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nn-dxgi1_4-idxgioutput4
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput4 extends IDXGIOutput3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput4
     * @type {Guid}
     */
    static IID => Guid("{dc7dca35-2196-414d-9f53-617884032a60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckOverlayColorSpaceSupport"]

    /**
     * Checks for overlay color space support.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the color format.
     * @param {Integer} ColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a>-typed value that specifies color space type to check overlay support for.
     * @param {IUnknown} pConcernedDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the Direct3D device interface. <b>CheckOverlayColorSpaceSupport</b> returns only support info about this scan-out device.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives a combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/ne-dxgi1_4-dxgi_overlay_color_space_support_flag">DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for overlay color space support.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgioutput4-checkoverlaycolorspacesupport
     */
    CheckOverlayColorSpaceSupport(Format, ColorSpace, pConcernedDevice) {
        result := ComCall(25, this, "int", Format, "int", ColorSpace, "ptr", pConcernedDevice, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }
}
