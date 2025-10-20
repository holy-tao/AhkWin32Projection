#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIObject.ahk

/**
 * An IDXGIOutput interface represents an adapter output (such as a monitor).
 * @remarks
 * 
  * To see the outputs available, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-enumoutputs">IDXGIAdapter::EnumOutputs</a>. To see the specific output that the swap chain will update, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput">IDXGISwapChain::GetContainingOutput</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgioutput
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput extends IDXGIObject{
    /**
     * The interface identifier for IDXGIOutput
     * @type {Guid}
     */
    static IID => Guid("{ae02eedb-c735-4690-8d52-5a8dc20213aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<DXGI_OUTPUT_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(7, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EnumFormat 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} pNumModes 
     * @param {Pointer<DXGI_MODE_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDisplayModeList(EnumFormat, Flags, pNumModes, pDesc) {
        result := ComCall(8, this, "int", EnumFormat, "uint", Flags, "uint*", pNumModes, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MODE_DESC>} pModeToMatch 
     * @param {Pointer<DXGI_MODE_DESC>} pClosestMatch 
     * @param {Pointer<IUnknown>} pConcernedDevice 
     * @returns {HRESULT} 
     */
    FindClosestMatchingMode(pModeToMatch, pClosestMatch, pConcernedDevice) {
        result := ComCall(9, this, "ptr", pModeToMatch, "ptr", pClosestMatch, "ptr", pConcernedDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForVBlank() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pDevice 
     * @param {BOOL} Exclusive 
     * @returns {HRESULT} 
     */
    TakeOwnership(pDevice, Exclusive) {
        result := ComCall(11, this, "ptr", pDevice, "int", Exclusive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseOwnership() {
        ComCall(12, this)
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_GAMMA_CONTROL_CAPABILITIES>} pGammaCaps 
     * @returns {HRESULT} 
     */
    GetGammaControlCapabilities(pGammaCaps) {
        result := ComCall(13, this, "ptr", pGammaCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_GAMMA_CONTROL>} pArray 
     * @returns {HRESULT} 
     */
    SetGammaControl(pArray) {
        result := ComCall(14, this, "ptr", pArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_GAMMA_CONTROL>} pArray 
     * @returns {HRESULT} 
     */
    GetGammaControl(pArray) {
        result := ComCall(15, this, "ptr", pArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDXGISurface>} pScanoutSurface 
     * @returns {HRESULT} 
     */
    SetDisplaySurface(pScanoutSurface) {
        result := ComCall(16, this, "ptr", pScanoutSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDXGISurface>} pDestination 
     * @returns {HRESULT} 
     */
    GetDisplaySurfaceData(pDestination) {
        result := ComCall(17, this, "ptr", pDestination, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_FRAME_STATISTICS>} pStats 
     * @returns {HRESULT} 
     */
    GetFrameStatistics(pStats) {
        result := ComCall(18, this, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
