#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DResource9.ahk
#Include .\IDirect3DSurface9.ahk
#Include .\IDirect3DDevice9.ahk

/**
 * Applications use the methods of the IDirect3DDevice9Ex interface to render primitives, create resources, work with system-level variables, adjust gamma ramp levels, work with palettes, and create shaders.
 * @remarks
 * The <b>IDirect3DDevice9Ex</b> interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9ex-createdeviceex">IDirect3D9Ex::CreateDeviceEx</a>.
 * 
 * The LPDIRECT3DDEVICE9EX and PDIRECT3DDEVICE9EX types are defined as pointers to the IDirect3DDevice9Ex interface:
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3DDevice9Ex *LPDIRECT3DDEVICE9EX, *PDIRECT3DDEVICE9EX;
 * 
 * ```
 * 
 * 
 * 
 * 
 * <h3><a id="Creating_a_Device"></a><a id="creating_a_device"></a><a id="CREATING_A_DEVICE"></a>Creating a Device</h3>
 * Follow these two steps to initialize a Direct3D device:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-direct3dcreate9ex">Direct3DCreate9Ex</a> to create the Direct3D object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9ex-createdeviceex">CreateDeviceEx</a> to create the Direct3D device.</li>
 * </ol>
 * Here is an example:
 * 
 * 
 * 
 * ```
 * 
 * IDirect3D9Ex *pDirect3DEx;
 * LPDIRECT3DDEVICE9EX pDeviceEx;
 * DWORD behaviorFlags = D3DCREATE_HARDWARE_VERTEXPROCESSING;
 * 
 * Direct3DCreate9Ex(D3D_SDK_VERSION, &pDirect3DEx);
 * pDirect3DEx->CreateDeviceEx(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, hWnd, behaviorFlags, &d3dpp, NULL, &pDeviceEx);
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3ddevice9ex
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DDevice9Ex extends IDirect3DDevice9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DDevice9Ex
     * @type {Guid}
     */
    static IID => Guid("{b18b10ce-2649-405a-870f-95f777d4313a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 119

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetConvolutionMonoKernel", "ComposeRects", "PresentEx", "GetGPUThreadPriority", "SetGPUThreadPriority", "WaitForVBlank", "CheckResourceResidency", "SetMaximumFrameLatency", "GetMaximumFrameLatency", "CheckDeviceState", "CreateRenderTargetEx", "CreateOffscreenPlainSurfaceEx", "CreateDepthStencilSurfaceEx", "ResetEx", "GetDisplayModeEx"]

    /**
     * Prepare the texture sampler for monochrome convolution filtering on a single-color texture.
     * @remarks
     * This method is designed to filter a single color texture. A monochrome convolution filter is a 2D box filter with all of the weights set to 1.0;  the filter kernel resolution ranges from 1 x 1 to 7 x 7. When monochrome texture filtering is set to a texture sampler and texture sampling is performed at location, then Direct3D performs convolution. 
     * 
     * Restrictions include:
     * 
     * <ul>
     * <li>The filter specified by this method is recorded in state blocks as a part of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dstateblocktype">D3DSBT_PIXELSTATE</a>.</li>
     * <li>The only texture address mode supported is: <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dptfiltercaps">D3DPTADDRESSCAPS_BORDER</a>; the border color is always 0.</li>
     * <li>This method is not supported for mipmaps.</li>
     * <li>Using a non-monochrome texture with convolution filtering will generate a driver error.</li>
     * </ul>
     * @param {Integer} width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width of the filter kernel; ranging from 1 - <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dconvolutionmono">D3DCONVOLUTIONMONO_MAXWIDTH</a>. The default value is 1.
     * @param {Integer} height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height of the filter kernel; ranging from 1 - <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dconvolutionmono">D3DCONVOLUTIONMONO_MAXHEIGHT</a>. The default value is 1.
     * @param {Pointer<Float>} rows Type: <b>float*</b>
     * 
     * An array of weights, one weight for each kernel sub-element in the width. This parameter must be <b>NULL</b>, which will set the weights equal to the default value.
     * @param {Pointer<Float>} _columns 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-setconvolutionmonokernel
     */
    SetConvolutionMonoKernel(width, height, rows, _columns) {
        rowsMarshal := rows is VarRef ? "float*" : "ptr"
        _columnsMarshal := _columns is VarRef ? "float*" : "ptr"

        result := ComCall(119, this, "uint", width, "uint", height, rowsMarshal, rows, _columnsMarshal, _columns, "HRESULT")
        return result
    }

    /**
     * Copy a text string to one surface using an alphabet of glyphs on another surface. Composition is done by the GPU using bitwise operations.
     * @remarks
     * Glyphs from a one-bit source surface are put together into another one-bit texture surface with this method. The destination surface can then be used as the source for a normal texturing operation that will filter and scale the strings of text onto some other non-monochrome surface.
     * 
     * This method has several constraints (which are similar to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">StretchRect</a>):
     * 
     * <ul>
     * <li>Surfaces cannot be locked.</li>
     * <li>The source and destination surfaces cannot be the same surface.</li>
     * <li>The source and destination surfaces must be created with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_A1</a> format.</li>
     * <li>The source surface and both vertex buffers must be created with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL_DEFAULT</a> flag.</li>
     * <li>The destination surface must be created with either the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL_DEFAULT</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL_SYSTEMMEM</a> flags.</li>
     * <li>The source rectangles must be within the source surface.</li>
     * </ul>
     * The method is not recorded in state blocks.
     * @param {IDirect3DSurface9} pSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * A pointer to a source surface (prepared by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>) that supplies the alphabet glyphs. This surface must be created with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_TEXTAPI</a> flag.
     * @param {IDirect3DSurface9} pDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * A pointer to the destination surface (prepared by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>) that receives the glyph data. The surface must be part of a texture.
     * @param {IDirect3DVertexBuffer9} pSrcRectDescs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>*</b>
     * 
     * A pointer to a vertex buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>) containing rectangles (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcomposerectdesc">D3DCOMPOSERECTDESC</a>) that enclose the desired glyphs in the source surface.
     * @param {Integer} NumRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of rectangles or glyphs that are used in the operation. The number applies to both the source and destination surfaces. The range is 0 to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcomposerects-maxnumrects">D3DCOMPOSERECTS_MAXNUMRECTS</a>.
     * @param {IDirect3DVertexBuffer9} pDstRectDescs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>*</b>
     * 
     * A pointer to a vertex buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>) containing rectangles (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcomposerectdestination">D3DCOMPOSERECTDESTINATION</a>) that describe the destination to which the indicated glyph from the source surface will be copied.
     * @param {Integer} Operation Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcomposerectsop">D3DCOMPOSERECTSOP</a></b>
     * 
     * Specifies how to combine the source and destination surfaces. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcomposerectsop">D3DCOMPOSERECTSOP</a>.
     * @param {Integer} Xoffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value added to the <i>x</i> coordinates of all destination rectangles. This value can be negative, which may cause the glyph to be rejected or clipped if the result is beyond the bounds of the surface.
     * @param {Integer} Yoffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value added to the <i>y</i> coordinates of all destination rectangles. This value can be negative, which may cause the glyph to be rejected or clipped if the result is beyond the bounds of the surface.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-composerects
     */
    ComposeRects(pSrc, pDst, pSrcRectDescs, NumRects, pDstRectDescs, Operation, Xoffset, Yoffset) {
        result := ComCall(120, this, "ptr", pSrc, "ptr", pDst, "ptr", pSrcRectDescs, "uint", NumRects, "ptr", pDstRectDescs, "int", Operation, "int", Xoffset, "int", Yoffset, "HRESULT")
        return result
    }

    /**
     * Swap the swapchain's next buffer with the front buffer.
     * @remarks
     * Similar to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">IDirect3DDevice9::Present</a> Method, PresentEx adds a dwflags parameter.
     * 
     * When the swapchain is created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dswapeffect">D3DSWAPEFFECT_FLIPEX</a> flag, <b>pSourceRect</b>, <b>pDestRect</b> and <b>pDirtyRegion</b> values must be set to <b>NULL</b>.
     * @param {Pointer<RECT>} pSourceRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure indicating region on the source surface to copy in window client coordinates. Only applies when the swapchain was created with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dswapeffect">D3DSWAPEFFECT_COPY</a> flag. If <b>NULL</b>, the entire source surface is presented. If the rectangle exceeds the source surface, it is clipped to the source surface.
     * @param {Pointer<RECT>} pDestRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure indicating the target region on the destination surface in window client coordinates. Only applies when the swapchain was created with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dswapeffect">D3DSWAPEFFECT_COPY</a> flag. If <b>NULL</b>, the entire client area is filled. If the rectangle exceeds the destination client area, it is clipped to the destination client area.
     * @param {HWND} hDestWindowOverride Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Pointer to a destination window whose client area is taken as the target for this presentation. If this value is <b>NULL</b>, the runtime uses the <b>hDeviceWindow</b> member of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> for the presentation.
     * 
     * <div class="alert"><b>Note</b>  If you create a swap chain with D3DSWAPEFFECT_FLIPEX, you must pass <b>NULL</b> to <i>hDestWindowOverride</i></div>
     * <div> </div>
     * @param {Pointer<RGNDATA>} pDirtyRegion Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure indicating the smallest set of pixels that need to be transferred. This value must be <b>NULL</b> unless the swapchain was created with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dswapeffect">D3DSWAPEFFECT_COPY</a> flag. For more information about swapchains, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/flipping-surfaces">Flipping Surfaces (Direct3D 9)</a>.
     * 
     * If this value is non-<b>NULL</b>, the contained region is expressed in back buffer coordinates. The method takes these rectangles into account when optimizing the presentation by copying only the pixels within the region, or some suitably expanded set of rectangles. This is an aid to optimization only, and the application should not rely on the region being copied exactly. The implementation can choose to copy the whole source rectangle.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Allows the application to request that the method return immediately when the driver reports that it cannot schedule a presentation. Valid values are 0, or any combination of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT</a> flags.
     * 
     * 
     * 
     * <ul>
     * <li>If dwFlags = 0, this method behaves as it did prior to Direct3D 9. Present will spin until the hardware is free, without returning an error.</li>
     * <li>If dwFlags = <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_DONOTFLIP</a> the display driver is called with the front buffer as both the source and target surface. The driver responds by scheduling a frame synch, but not changing the displayed surface. This flag is only available in full-screen mode or when using D3DSWAPEFFECT_FLIPEX in windowed mode.</li>
     * <li>If dwFlags = <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_DONOTWAIT</a>, and the hardware is busy processing or waiting for a vertical sync interval, the method will return D3DERR_WASSTILLDRAWING.</li>
     * <li>If dwFlags = <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_FORCEIMMEDIATE</a>, D3DPRESENT_INTERVAL_IMMEDIATE is enforced on this Present call. This flag can only be specified when using D3DSWAPEFFECT_FLIPEX. This behavior is the same for windowed and full-screen modes.</li>
     * <li>If dwFlags = <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent">D3DPRESENT_LINEAR_CONTENT</a>, gamma correction is performed from linear space to sRGB for windowed swap chains. This flag will take effect only when the driver exposes <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcaps3">D3DCAPS3_LINEAR_TO_SRGB_PRESENTATION</a> (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/gamma">Gamma (Direct3D 9)</a>).</li>
     * </ul>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: S_OK, D3DERR_DEVICELOST, D3DERR_DEVICEHUNG, D3DERR_DEVICEREMOVED, or D3DERR_OUTOFVIDEOMEMORY (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>). See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">Lost Device Behavior Changes</a> for more information about lost, hung, and removed devices.
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 9Ex:
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dswapeffect">D3DSWAPEFFECT_FLIPEX</a> is only available in Direct3D9Ex running on Windows 7 (or more current operating system).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-presentex
     */
    PresentEx(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion, dwFlags) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(121, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Get the priority of the GPU thread.
     * @remarks
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-setgputhreadpriority">IDirect3DDevice9Ex::SetGPUThreadPriority</a> to set the priority of a thread.
     * 
     * This method will retrieve the priority of the thread stored with the Direct3D device even if it was created with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE_PUREDEVICE</a> flag.
     * @param {Pointer<Integer>} pPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a>*</b>
     * 
     * Current GPU priority. Valid values range from -7 to 7.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK or D3DERR_DEVICEREMOVED (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-getgputhreadpriority
     */
    GetGPUThreadPriority(pPriority) {
        pPriorityMarshal := pPriority is VarRef ? "int*" : "ptr"

        result := ComCall(122, this, pPriorityMarshal, pPriority, "HRESULT")
        return result
    }

    /**
     * Set the priority on the GPU thread.
     * @remarks
     * GPU thread priority is not reset when a device is lost. The effects of calls to this method are not recorded in state blocks.
     * @param {Integer} _Priority 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK, D3DERR_INVALIDCALL, or D3DERR_DEVICEREMOVED (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-setgputhreadpriority
     */
    SetGPUThreadPriority(_Priority) {
        result := ComCall(123, this, "int", _Priority, "HRESULT")
        return result
    }

    /**
     * Suspend execution of the calling thread until the next vertical blank signal.
     * @remarks
     * This method allows applications to efficiently throttle their frame rate to that of the monitor associated with the device. Following a vertical blank, the amount of time it takes for the thread to wake up is typically very short.
     * 
     * In some scenarios the hardware may stop generating vertical blank signals when nothing is being displayed on the monitor. In this case, the method will wait approximately 100ms and return with D3D_OK.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Swap chain index. This is an optional, zero-based index used to specify a swap chain on a multihead card.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method will always return D3D_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-waitforvblank
     */
    WaitForVBlank(iSwapChain) {
        result := ComCall(124, this, "uint", iSwapChain, "HRESULT")
        return result
    }

    /**
     * Checks an array of resources to determine if it is likely that they will cause a large stall at Draw time because the system must make the resources GPU-accessible.
     * @remarks
     * This API is no more than a reasonable guess at residency, since resources may have been demoted by the time the application uses them.
     * 
     * The expected usage pattern is as follows. If the application determines that a set of resources are not resident, then the application will substitute a lower-LOD version of the resource and continue with rendering. The video memory manager API, offers a feature to allow the application to express that it would like these lower-LOD resources to be made more likely to stay resident in GPU-accessible memory. It is the app's responsibility to create, fill and destroy these lower-LOD versions, if it so chooses.
     * 
     * The application also needs to begin promotion of the higher-LOD versions when the residency check indicates that the resource is not resident in GPU-accessible memory. Since a per-process lock exists in kernel mode, a performant implementation will spawn a separate process whose sole job is to promote resources. The application communicates resource identity between the two process by means of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">Sharing Resources</a> shared surfaces API and promotes them by means of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dresource9-setpriority">SetPriority</a>.
     * @param {Integer} NumResources Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a></b>
     * 
     * A value indicating the number of resources passed into the <i>pResourceArray</i> parameter up to a maximum of 65535.
     * @returns {IDirect3DResource9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dresource9">IDirect3DResource9</a>**</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dresource9">IDirect3DResource9</a> pointers that indicate the resources to check.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-checkresourceresidency
     */
    CheckResourceResidency(NumResources) {
        result := ComCall(125, this, "ptr*", &pResourceArray := 0, "uint", NumResources, "HRESULT")
        return IDirect3DResource9(pResourceArray)
    }

    /**
     * Set the number of frames that the system is allowed to queue for rendering.
     * @remarks
     * Frame latency is the number of frames that are allowed to be stored in a queue, before submission for rendering. Latency is often used to control how the CPU chooses between responding to user input and frames that are in the render queue.
     * 
     * It is often beneficial for applications that have no user input (for example, video playback) to queue more than 3 frames of data.
     * @param {Integer} MaxLatency Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The maximum number of back buffer frames that a driver can queue. The value is typically 3, but can range from 1 to 20. A value of 0 will reset latency to the default. For multi-head devices, <i>MaxLatency</i> is specified per-head.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK or D3DERR_DEVICEREMOVED (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-setmaximumframelatency
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(126, this, "uint", MaxLatency, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of frames of data that the system is allowed to queue.
     * @remarks
     * Frame latency is the number of frames that are allowed to be stored in a queue, before submission for rendering. Latency is often used to control how the CPU chooses between responding to user input and frames that are in the render queue.
     * 
     * It is often beneficial for applications that have no user input (for example, video playback) to queue more than 3 frames of data.
     * @param {Pointer<Integer>} pMaxLatency Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Returns the number of frames that can be queued for render. The value is typically 3, but can range from 1 to 20.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK, D3DERR_DEVICELOST, D3DERR_DEVICEREMOVED, D3DERR_DRIVERINTERNALERROR, D3DERR_INVALIDCALL, or D3DERR_OUTOFVIDEOMEMORY (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-getmaximumframelatency
     */
    GetMaximumFrameLatency(pMaxLatency) {
        pMaxLatencyMarshal := pMaxLatency is VarRef ? "uint*" : "ptr"

        result := ComCall(127, this, pMaxLatencyMarshal, pMaxLatency, "HRESULT")
        return result
    }

    /**
     * Reports the current cooperative-level status of the Direct3D device for a windowed or full-screen application. (IDirect3DDevice9Ex.CheckDeviceState)
     * @remarks
     * This method replaces <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-testcooperativelevel">IDirect3DDevice9::TestCooperativeLevel</a>, which always returns S_OK in Direct3D 9Ex applications.
     * 
     * We recommend not to call <b>CheckDeviceState</b> every frame. Instead, call <b>CheckDeviceState</b> only if the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-presentex">IDirect3DDevice9Ex::PresentEx</a> method returns a failure code.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">Lost Device Behavior Changes</a> for more information about lost, hung, and removed devices.
     * @param {HWND} hDestinationWindow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The destination window handle to check for occlusion. When this parameter is <b>NULL</b>, S_PRESENT_OCCLUDED is returned when another device has fullscreen ownership. When the window handle is not <b>NULL</b>, window's client area is checked for occlusion. A window is occluded if any part of it is obscured by another application.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK, D3DERR_DEVICELOST, D3DERR_DEVICEHUNG, D3DERR_DEVICEREMOVED, or D3DERR_OUTOFVIDEOMEMORY (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>), or S_PRESENT_MODE_CHANGED, or S_PRESENT_OCCLUDED (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/device-state-return-codes">S_PRESENT</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-checkdevicestate
     */
    CheckDeviceState(hDestinationWindow) {
        hDestinationWindow := hDestinationWindow is Win32Handle ? NumGet(hDestinationWindow, "ptr") : hDestinationWindow

        result := ComCall(128, this, "ptr", hDestinationWindow, "HRESULT")
        return result
    }

    /**
     * Creates a render-target surface. (IDirect3DDevice9Ex.CreateRenderTargetEx)
     * @remarks
     * Render-target surfaces are placed in the D3DPOOL_DEFAULT memory class.
     * 
     * The creation of lockable, multisampled render targets is not supported.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the render-target surface, in pixels.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the render-target surface, in pixels.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the render target.
     * @param {Integer} MultiSample Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a> enumerated type, which describes the multisampling buffer type. This parameter specifies the antialiasing type for this render target. When this surface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setrendertarget">IDirect3DDevice9::SetRenderTarget</a>, its multisample type must be the same as that of the depth-stencil set by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface">IDirect3DDevice9::SetDepthStencilSurface</a>.
     * @param {Integer} MultisampleQuality Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Quality level. The valid range is between zero and one less than the level returned by pQualityLevels used by  <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype">IDirect3D9::CheckDeviceMultiSampleType</a>. Passing a larger value returns the error, D3DERR_INVALIDCALL. The MultisampleQuality values of paired render targets, depth stencil surfaces, and the multisample type must all match.
     * @param {BOOL} Lockable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Render targets are not lockable unless the application specifies <b>TRUE</b> for Lockable.
     * 
     * Note that lockable render targets reduce performance on some graphics hardware. The readback performance (moving data from video memory to system memory) depends on the type of hardware used (AGP vs. PCI Express) and is usually far lower than upload performance (moving data from system to video memory). If you need read access to render targets, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertargetdata">GetRenderTargetData</a> instead of lockable render targets.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants which can be OR'd together. Value of 0 indicates no usage.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-createrendertargetex
     */
    CreateRenderTargetEx(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, pSharedHandle, Usage) {
        result := ComCall(129, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Lockable, "ptr*", &ppSurface := 0, "ptr", pSharedHandle, "uint", Usage, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * Create an off-screen surface. (IDirect3DDevice9Ex.CreateOffscreenPlainSurfaceEx)
     * @remarks
     * D3DPOOL_SCRATCH will return a surface that has identical characteristics to a surface created by the DirectX 8.x method CreateImageSurface.
     * 
     * D3DPOOL_DEFAULT is the appropriate pool for use with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">IDirect3DDevice9::StretchRect</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-colorfill">IDirect3DDevice9::ColorFill</a>.
     * 
     * D3DPOOL_MANAGED is not allowed when creating an offscreen plain surface. For more information about memory pools, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a>.
     * 
     * Off-screen plain surfaces are always lockable, regardless of their pool types.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the surface.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the surface.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Format of the surface. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>.
     * @param {Integer} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Surface pool type. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a>.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants which can be OR'd together. Value of 0 indicates no usage.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>  interface created.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-createoffscreenplainsurfaceex
     */
    CreateOffscreenPlainSurfaceEx(Width, Height, Format, Pool, pSharedHandle, Usage) {
        result := ComCall(130, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "ptr*", &ppSurface := 0, "ptr", pSharedHandle, "uint", Usage, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * Creates a depth-stencil surface.
     * @remarks
     * The memory class of the depth-stencil buffer is always D3DPOOL_DEFAULT.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the depth-stencil surface, in pixels.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the depth-stencil surface, in pixels.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the depth-stencil surface. This value must be one of the enumerated depth-stencil formats for this device.
     * @param {Integer} MultiSample Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a> enumerated type, describing the multisampling buffer type. This value must be one of the allowed multisample types. When this surface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface">IDirect3DDevice9::SetDepthStencilSurface</a>, its multisample type must be the same as that of the render target set by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setrendertarget">IDirect3DDevice9::SetRenderTarget</a>.
     * @param {Integer} MultisampleQuality Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Quality level. The valid range is between zero and one less than the level returned by pQualityLevels used by  <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype">IDirect3D9::CheckDeviceMultiSampleType</a>. Passing a larger value returns the error D3DERR_INVALIDCALL. The MultisampleQuality values of paired render targets, depth stencil surfaces, and the MultiSample type must all match.
     * @param {BOOL} Discard Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Set this flag to <b>TRUE</b> to enable z-buffer discarding, and <b>FALSE</b> otherwise.				
     * If this flag is set, the contents of the depth stencil buffer will be invalid after calling either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">IDirect3DDevice9::Present</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface">IDirect3DDevice9::SetDepthStencilSurface</a> with a different depth surface.
     * 
     * This flag has the same behavior as the constant,  D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL, in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresentflag">D3DPRESENTFLAG</a>.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants which can be OR'd together. Value of 0 indicates no usage.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the created depth-stencil surface resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-createdepthstencilsurfaceex
     */
    CreateDepthStencilSurfaceEx(Width, Height, Format, MultiSample, MultisampleQuality, Discard, pSharedHandle, Usage) {
        result := ComCall(131, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Discard, "ptr*", &ppSurface := 0, "ptr", pSharedHandle, "uint", Usage, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * Resets the type, size, and format of the swap chain with all other surfaces persistent.
     * @remarks
     * If a call to <b>IDirect3DDevice9Ex::ResetEx</b> fails, the device will be placed in the lost state (as indicated by a return value of D3DERR_DEVICELOST from a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-checkdevicestate">IDirect3DDevice9Ex::CheckDeviceState</a>). Refer to <b>IDirect3DDevice9Ex::CheckDeviceState</b> and <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">Lost Device Behavior Changes</a> for further information concerning the use of <b>IDirect3DDevice9Ex::ResetEx</b> in the context of lost devices.
     * 
     * Unlike previous versions of DirectX, calling <b>IDirect3DDevice9Ex::ResetEx</b> does not cause surfaces, textures or state information to be lost.
     * 
     * Pixel shaders and vertex shaders survive <b>IDirect3DDevice9Ex::ResetEx</b> calls for Direct3D 9. They do not need to be re-created explicitly by the application.
     * 
     * There are two different types of swap chains: full-screen or windowed. If the new swap chain is full-screen, the adapter will be placed in the display mode that matches the new size.
     * 
     * Applications can expect messages to be sent to them during this call (for example, before this call is returned); applications should take precautions not to call into Direct3D at this time.
     * 
     * A call to <b>IDirect3DDevice9Ex::ResetEx</b> will fail if called on a different thread than that used to create the device being reset.
     * 
     * D3DFMT_UNKNOWN can be specified for the windowed mode back buffer format when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9ex-createdeviceex">IDirect3D9Ex::CreateDeviceEx</a>, <b>IDirect3DDevice9Ex::ResetEx</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">IDirect3DDevice9::CreateAdditionalSwapChain</a>. This means the application does not have to query the current desktop format before calling <b>IDirect3D9Ex::CreateDeviceEx</b> for windowed mode. For full-screen mode, the back buffer format must be specified. Setting BackBufferCount equal to zero (BackBufferCount = 0) results in one back buffer.
     * 
     * When trying to reset more than one display adapter in a group, set pPresentationParameters to point to an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structures, one for each display in the adapter group.
     * 
     * If a multihead device was created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE_ADAPTERGROUP_DEVICE</a>, <b>IDirect3DDevice9Ex::ResetEx</b> requires an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structures wherein each structure must specify a full-screen display. To switch back to windowed mode, the application must destroy the device and re-create a non-multihead device in windowed mode.
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structure, describing the new presentation parameters. This value cannot be <b>NULL</b>. 
     *     
     * 
     * 
     * When switching to full-screen mode, Direct3D will try to find a desktop format that matches the back buffer format, so that back buffer and front buffer formats will be identical (to eliminate the need for color conversion).
     * 
     * When this method returns:
     * 
     * <ul>
     * <li>BackBufferCount, BackBufferWidth, and BackBufferHeight are set to zero.</li>
     * <li>BackBufferFormat is set to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> for windowed mode only; a full-screen mode must specify a format.</li>
     * </ul>
     * @param {Pointer<D3DDISPLAYMODEEX>} pFullscreenDisplayMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a> structure that describes the properties of the desired display mode. This value must be provided for fullscreen applications, but can be <b>NULL</b> for windowed applications.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * The method can return: D3D_OK, D3DERR_DEVICELOST or D3DERR_DEVICEHUNG (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * 
     * 
     * 
     * If this method returns D3DERR_DEVICELOST or D3DERR_DEVICEHUNG then the application can only call <b>IDirect3DDevice9Ex::ResetEx</b>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-checkdevicestate">IDirect3DDevice9Ex::CheckDeviceState</a> or release the interface pointer; any other API call will cause an exception.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-resetex
     */
    ResetEx(pPresentationParameters, pFullscreenDisplayMode) {
        result := ComCall(132, this, "ptr", pPresentationParameters, "ptr", pFullscreenDisplayMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the display mode's spatial resolution, color resolution, refresh frequency, and rotation settings. (IDirect3DDevice9Ex.GetDisplayModeEx)
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a> structure containing data about the display mode of the adapter. As opposed to the display mode of the device, which may not be active if the device does not own full-screen mode. Can be set to <b>NULL</b>.
     * @param {Pointer<Integer>} pRotation Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a> indicating the type of screen rotation the application will do. The value returned through this pointer is important when the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresentflag">D3DPRESENTFLAG_NOAUTOROTATE</a> flag is used; otherwise, it can be set to <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-getdisplaymodeex
     */
    GetDisplayModeEx(iSwapChain, pMode, pRotation) {
        pRotationMarshal := pRotation is VarRef ? "int*" : "ptr"

        result := ComCall(133, this, "uint", iSwapChain, "ptr", pMode, pRotationMarshal, pRotation, "HRESULT")
        return result
    }
}
