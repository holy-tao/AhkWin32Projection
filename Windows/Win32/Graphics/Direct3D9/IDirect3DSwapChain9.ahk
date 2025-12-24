#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DSurface9.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DSwapChain9 interface to manipulate a swap chain.
 * @remarks
 * 
 * There is always at least one swap chain for each device, known as the implicit swap chain. However, an additional swap chain for rendering multiple views from the same device can be created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">IDirect3DDevice9::CreateAdditionalSwapChain</a> method.
 * 
 * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * 
 * The LPDIRECT3DSWAPCHAIN9 and PDIRECT3DSWAPCHAIN9 types are defined as pointers to the <b>IDirect3DSwapChain9</b> interface. 
 *     
 * 
 * 
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3DSwapChain9 *LPDIRECT3DSWAPCHAIN9, *PDIRECT3DSWAPCHAIN9;
 * 
 * ```
 * 
 * 
 * Note the application should ensure that its associated device window is visible when its swapchain(s) is in fullscreen mode. Invisible windows cannot receive user mode events and invisible fullscreen windows will interfere with other windowed mode applications' presentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dswapchain9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DSwapChain9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DSwapChain9
     * @type {Guid}
     */
    static IID => Guid("{794950f2-adfc-458a-905e-10a10b0b503b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Present", "GetFrontBufferData", "GetBackBuffer", "GetRasterStatus", "GetDisplayMode", "GetDevice", "GetPresentParameters"]

    /**
     * Presents the contents of the next buffer in the sequence of back buffers owned by the swap chain.
     * @param {Pointer<RECT>} pSourceRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to the source rectangle (see <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>). Use <b>NULL</b> to present the entire surface. This value must be <b>NULL</b> unless the swap chain was created with D3DSWAPEFFECT_COPY. If the rectangle exceeds the source surface, the rectangle is clipped to the source surface.
     * @param {Pointer<RECT>} pDestRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to the destination rectangle in client coordinates (see <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>). This value must be <b>NULL</b> unless the swap chain was created with D3DSWAPEFFECT_COPY. Use <b>NULL</b> to fill the entire client area. If the rectangle exceeds the destination client area, the rectangle is clipped to the destination client area.
     * @param {HWND} hDestWindowOverride Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Destination window whose client area is taken as the target for this presentation. If this value is <b>NULL</b>, the runtime uses the <b>hDeviceWindow</b> member of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> for the presentation.
     * @param {Pointer<RGNDATA>} pDirtyRegion Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a>*</b>
     * 
     * This value must be <b>NULL</b> unless the swap chain was created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dswapeffect">D3DSWAPEFFECT_COPY</a>. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/flipping-surfaces">Flipping Surfaces (Direct3D 9)</a>.
     *     
     *  If this value is non-<b>NULL</b>, the contained region is expressed in back buffer coordinates. The rectangles within the region are the minimal set of pixels that need to be updated. This method takes these rectangles into account when optimizing the presentation by copying only the pixels within the region, or some suitably expanded set of rectangles. This is an aid to optimization only, and the application should not rely on the region being copied exactly. The implementation may choose to copy the whole source rectangle.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Allows the application to request that the method return immediately when the driver reports that it cannot schedule a presentation. Valid values are 0, or any combination of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_DONOTWAIT</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_LINEAR_CONTENT</a>.
     *     
     * 
     * 
     * <ul>
     * <li>If dwFlags = 0, this method behaves as it did prior to Direct3D 9. Present will spin until the hardware is free, without returning an error.</li>
     * <li>If dwFlags = <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_DONOTWAIT</a>, and the hardware is busy processing or waiting for a vertical sync interval, the method will return D3DERR_WASSTILLDRAWING.</li>
     * <li>If dwFlags = <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_LINEAR_CONTENT</a>, gamma correction is performed from linear space to sRGB for windowed swap chains. This flag will take effect only when the driver exposes <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcaps3">D3DCAPS3_LINEAR_TO_SRGB_PRESENTATION</a> (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/gamma">Gamma (Direct3D 9)</a>). Appliations should specify this flag if the backbuffer format is 16-bit floating point in order to match windowed mode present to fullscreen gamma behavior.</li>
     * </ul>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_DEVICELOST, D3DERR_DRIVERINTERNALERROR, D3DERR_INVALIDCALL, D3DERR_OUTOFVIDEOMEMORY, E_OUTOFMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dswapchain9-present
     */
    Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion, dwFlags) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(3, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Generates a copy of the swapchain's front buffer and places that copy in a system memory buffer provided by the application.
     * @param {IDirect3DSurface9} pDestSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface that will receive a copy of the swapchain's front buffer. The data is returned in successive rows with no intervening space, starting from the vertically highest row to the lowest.  For windowed mode, the size of the destination surface should be the size of the desktop. For full screen mode, the size of the destination surface should be the screen size.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  If BackBuffer exceeds or equals the total number of back buffers, the function fails and returns D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dswapchain9-getfrontbufferdata
     */
    GetFrontBufferData(pDestSurface) {
        result := ComCall(4, this, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * Retrieves a back buffer from the swap chain of the device.
     * @param {Integer} iBackBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the back buffer object to return. Back buffers are numbered from 0 to the total number of back buffers - 1. A value of 0 returns the first back buffer, not the front buffer. The front buffer is not accessible through this method. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dswapchain9-getfrontbufferdata">IDirect3DSwapChain9::GetFrontBufferData</a> to retrieve a copy of the front buffer.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbackbuffer-type">D3DBACKBUFFER_TYPE</a></b>
     * 
     * Stereo view is not supported in Direct3D 9, so the only valid value for this parameter is D3DBACKBUFFER_TYPE_MONO.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned back buffer surface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dswapchain9-getbackbuffer
     */
    GetBackBuffer(iBackBuffer, Type) {
        result := ComCall(5, this, "uint", iBackBuffer, "int", Type, "ptr*", &ppBackBuffer := 0, "HRESULT")
        return IDirect3DSurface9(ppBackBuffer)
    }

    /**
     * Returns information describing the raster of the monitor on which the swap chain is presented.
     * @param {Pointer<D3DRASTER_STATUS>} pRasterStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3draster-status">D3DRASTER_STATUS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3draster-status">D3DRASTER_STATUS</a> structure filled with information about the position or other status of the raster on the monitor driven by this adapter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if pRasterStatus is invalid or if the device does not support reading the current scan line. To determine if the device supports reading the scan line, check for the D3DCAPS_READ_SCANLINE flag in the Caps member of <a href="/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dswapchain9-getrasterstatus
     */
    GetRasterStatus(pRasterStatus) {
        result := ComCall(6, this, "ptr", pRasterStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves the display mode's spatial resolution, color resolution, and refresh frequency.
     * @param {Pointer<D3DDISPLAYMODE>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a> structure containing data about the display mode of the adapter. As opposed to the display mode of the device, which may not be active if the device does not own full-screen mode.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dswapchain9-getdisplaymode
     */
    GetDisplayMode(pMode) {
        result := ComCall(7, this, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the device associated with the swap chain.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface to fill with the device pointer, if the query succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dswapchain9-getdevice
     */
    GetDevice() {
        result := ComCall(8, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * Retrieves the presentation parameters associated with a swap chain.
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>*</b>
     * 
     * Pointer to the presentation parameters. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dswapchain9-getpresentparameters
     */
    GetPresentParameters(pPresentationParameters) {
        result := ComCall(9, this, "ptr", pPresentationParameters, "HRESULT")
        return result
    }
}
