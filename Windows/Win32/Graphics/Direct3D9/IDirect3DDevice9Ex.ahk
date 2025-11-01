#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9.ahk

/**
 * Applications use the methods of the IDirect3DDevice9Ex interface to render primitives, create resources, work with system-level variables, adjust gamma ramp levels, work with palettes, and create shaders.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3ddevice9ex
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
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<Float>} rows 
     * @param {Pointer<Float>} columns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-setconvolutionmonokernel
     */
    SetConvolutionMonoKernel(width, height, rows, columns) {
        result := ComCall(119, this, "uint", width, "uint", height, "float*", rows, "float*", columns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pSrc 
     * @param {IDirect3DSurface9} pDst 
     * @param {IDirect3DVertexBuffer9} pSrcRectDescs 
     * @param {Integer} NumRects 
     * @param {IDirect3DVertexBuffer9} pDstRectDescs 
     * @param {Integer} Operation 
     * @param {Integer} Xoffset 
     * @param {Integer} Yoffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-composerects
     */
    ComposeRects(pSrc, pDst, pSrcRectDescs, NumRects, pDstRectDescs, Operation, Xoffset, Yoffset) {
        result := ComCall(120, this, "ptr", pSrc, "ptr", pDst, "ptr", pSrcRectDescs, "uint", NumRects, "ptr", pDstRectDescs, "int", Operation, "int", Xoffset, "int", Yoffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestRect 
     * @param {HWND} hDestWindowOverride 
     * @param {Pointer<RGNDATA>} pDirtyRegion 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-presentex
     */
    PresentEx(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion, dwFlags) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(121, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-getgputhreadpriority
     */
    GetGPUThreadPriority(pPriority) {
        result := ComCall(122, this, "int*", pPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-setgputhreadpriority
     */
    SetGPUThreadPriority(Priority) {
        result := ComCall(123, this, "int", Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-waitforvblank
     */
    WaitForVBlank(iSwapChain) {
        result := ComCall(124, this, "uint", iSwapChain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DResource9>} pResourceArray 
     * @param {Integer} NumResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-checkresourceresidency
     */
    CheckResourceResidency(pResourceArray, NumResources) {
        result := ComCall(125, this, "ptr*", pResourceArray, "uint", NumResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MaxLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-setmaximumframelatency
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(126, this, "uint", MaxLatency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMaxLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-getmaximumframelatency
     */
    GetMaximumFrameLatency(pMaxLatency) {
        result := ComCall(127, this, "uint*", pMaxLatency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hDestinationWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-checkdevicestate
     */
    CheckDeviceState(hDestinationWindow) {
        hDestinationWindow := hDestinationWindow is Win32Handle ? NumGet(hDestinationWindow, "ptr") : hDestinationWindow

        result := ComCall(128, this, "ptr", hDestinationWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} MultiSample 
     * @param {Integer} MultisampleQuality 
     * @param {BOOL} Lockable 
     * @param {Pointer<IDirect3DSurface9>} ppSurface 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @param {Integer} Usage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-createrendertargetex
     */
    CreateRenderTargetEx(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, ppSurface, pSharedHandle, Usage) {
        result := ComCall(129, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Lockable, "ptr*", ppSurface, "ptr", pSharedHandle, "uint", Usage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Pointer<IDirect3DSurface9>} ppSurface 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @param {Integer} Usage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-createoffscreenplainsurfaceex
     */
    CreateOffscreenPlainSurfaceEx(Width, Height, Format, Pool, ppSurface, pSharedHandle, Usage) {
        result := ComCall(130, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "ptr*", ppSurface, "ptr", pSharedHandle, "uint", Usage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} MultiSample 
     * @param {Integer} MultisampleQuality 
     * @param {BOOL} Discard 
     * @param {Pointer<IDirect3DSurface9>} ppSurface 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @param {Integer} Usage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-createdepthstencilsurfaceex
     */
    CreateDepthStencilSurfaceEx(Width, Height, Format, MultiSample, MultisampleQuality, Discard, ppSurface, pSharedHandle, Usage) {
        result := ComCall(131, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Discard, "ptr*", ppSurface, "ptr", pSharedHandle, "uint", Usage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @param {Pointer<D3DDISPLAYMODEEX>} pFullscreenDisplayMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-resetex
     */
    ResetEx(pPresentationParameters, pFullscreenDisplayMode) {
        result := ComCall(132, this, "ptr", pPresentationParameters, "ptr", pFullscreenDisplayMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode 
     * @param {Pointer<Integer>} pRotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9ex-getdisplaymodeex
     */
    GetDisplayModeEx(iSwapChain, pMode, pRotation) {
        result := ComCall(133, this, "uint", iSwapChain, "ptr", pMode, "int*", pRotation, "HRESULT")
        return result
    }
}
