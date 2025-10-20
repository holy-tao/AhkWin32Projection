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
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<Single>} rows 
     * @param {Pointer<Single>} columns 
     * @returns {HRESULT} 
     */
    SetConvolutionMonoKernel(width, height, rows, columns) {
        result := ComCall(119, this, "uint", width, "uint", height, "float*", rows, "float*", columns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pSrc 
     * @param {Pointer<IDirect3DSurface9>} pDst 
     * @param {Pointer<IDirect3DVertexBuffer9>} pSrcRectDescs 
     * @param {Integer} NumRects 
     * @param {Pointer<IDirect3DVertexBuffer9>} pDstRectDescs 
     * @param {Integer} Operation 
     * @param {Integer} Xoffset 
     * @param {Integer} Yoffset 
     * @returns {HRESULT} 
     */
    ComposeRects(pSrc, pDst, pSrcRectDescs, NumRects, pDstRectDescs, Operation, Xoffset, Yoffset) {
        result := ComCall(120, this, "ptr", pSrc, "ptr", pDst, "ptr", pSrcRectDescs, "uint", NumRects, "ptr", pDstRectDescs, "int", Operation, "int", Xoffset, "int", Yoffset, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    PresentEx(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion, dwFlags) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(121, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPriority 
     * @returns {HRESULT} 
     */
    GetGPUThreadPriority(pPriority) {
        result := ComCall(122, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    SetGPUThreadPriority(Priority) {
        result := ComCall(123, this, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @returns {HRESULT} 
     */
    WaitForVBlank(iSwapChain) {
        result := ComCall(124, this, "uint", iSwapChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DResource9>} pResourceArray 
     * @param {Integer} NumResources 
     * @returns {HRESULT} 
     */
    CheckResourceResidency(pResourceArray, NumResources) {
        result := ComCall(125, this, "ptr", pResourceArray, "uint", NumResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MaxLatency 
     * @returns {HRESULT} 
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(126, this, "uint", MaxLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMaxLatency 
     * @returns {HRESULT} 
     */
    GetMaximumFrameLatency(pMaxLatency) {
        result := ComCall(127, this, "uint*", pMaxLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hDestinationWindow 
     * @returns {HRESULT} 
     */
    CheckDeviceState(hDestinationWindow) {
        hDestinationWindow := hDestinationWindow is Win32Handle ? NumGet(hDestinationWindow, "ptr") : hDestinationWindow

        result := ComCall(128, this, "ptr", hDestinationWindow, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateRenderTargetEx(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, ppSurface, pSharedHandle, Usage) {
        result := ComCall(129, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Lockable, "ptr", ppSurface, "ptr", pSharedHandle, "uint", Usage, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateOffscreenPlainSurfaceEx(Width, Height, Format, Pool, ppSurface, pSharedHandle, Usage) {
        result := ComCall(130, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "ptr", ppSurface, "ptr", pSharedHandle, "uint", Usage, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateDepthStencilSurfaceEx(Width, Height, Format, MultiSample, MultisampleQuality, Discard, ppSurface, pSharedHandle, Usage) {
        result := ComCall(131, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Discard, "ptr", ppSurface, "ptr", pSharedHandle, "uint", Usage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @param {Pointer<D3DDISPLAYMODEEX>} pFullscreenDisplayMode 
     * @returns {HRESULT} 
     */
    ResetEx(pPresentationParameters, pFullscreenDisplayMode) {
        result := ComCall(132, this, "ptr", pPresentationParameters, "ptr", pFullscreenDisplayMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode 
     * @param {Pointer<Int32>} pRotation 
     * @returns {HRESULT} 
     */
    GetDisplayModeEx(iSwapChain, pMode, pRotation) {
        result := ComCall(133, this, "uint", iSwapChain, "ptr", pMode, "int*", pRotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
