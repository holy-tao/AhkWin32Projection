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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetDisplayModeList", "FindClosestMatchingMode", "WaitForVBlank", "TakeOwnership", "ReleaseOwnership", "GetGammaControlCapabilities", "SetGammaControl", "GetGammaControl", "SetDisplaySurface", "GetDisplaySurfaceData", "GetFrameStatistics"]

    /**
     * 
     * @param {Pointer<DXGI_OUTPUT_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(7, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EnumFormat 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} pNumModes 
     * @param {Pointer<DXGI_MODE_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdisplaymodelist
     */
    GetDisplayModeList(EnumFormat, Flags, pNumModes, pDesc) {
        pNumModesMarshal := pNumModes is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "int", EnumFormat, "uint", Flags, pNumModesMarshal, pNumModes, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MODE_DESC>} pModeToMatch 
     * @param {Pointer<DXGI_MODE_DESC>} pClosestMatch 
     * @param {IUnknown} pConcernedDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-findclosestmatchingmode
     */
    FindClosestMatchingMode(pModeToMatch, pClosestMatch, pConcernedDevice) {
        result := ComCall(9, this, "ptr", pModeToMatch, "ptr", pClosestMatch, "ptr", pConcernedDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-waitforvblank
     */
    WaitForVBlank() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {BOOL} Exclusive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-takeownership
     */
    TakeOwnership(pDevice, Exclusive) {
        result := ComCall(11, this, "ptr", pDevice, "int", Exclusive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-releaseownership
     */
    ReleaseOwnership() {
        ComCall(12, this)
    }

    /**
     * 
     * @param {Pointer<DXGI_GAMMA_CONTROL_CAPABILITIES>} pGammaCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getgammacontrolcapabilities
     */
    GetGammaControlCapabilities(pGammaCaps) {
        result := ComCall(13, this, "ptr", pGammaCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_GAMMA_CONTROL>} pArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-setgammacontrol
     */
    SetGammaControl(pArray) {
        result := ComCall(14, this, "ptr", pArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_GAMMA_CONTROL>} pArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getgammacontrol
     */
    GetGammaControl(pArray) {
        result := ComCall(15, this, "ptr", pArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDXGISurface} pScanoutSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-setdisplaysurface
     */
    SetDisplaySurface(pScanoutSurface) {
        result := ComCall(16, this, "ptr", pScanoutSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDXGISurface} pDestination 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata
     */
    GetDisplaySurfaceData(pDestination) {
        result := ComCall(17, this, "ptr", pDestination, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_FRAME_STATISTICS>} pStats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getframestatistics
     */
    GetFrameStatistics(pStats) {
        result := ComCall(18, this, "ptr", pStats, "HRESULT")
        return result
    }
}
