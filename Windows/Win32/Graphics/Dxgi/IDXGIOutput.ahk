#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_OUTPUT_DESC.ahk
#Include Common\DXGI_MODE_DESC.ahk
#Include Common\DXGI_GAMMA_CONTROL_CAPABILITIES.ahk
#Include Common\DXGI_GAMMA_CONTROL.ahk
#Include .\DXGI_FRAME_STATISTICS.ahk
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
     * @returns {DXGI_OUTPUT_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdesc
     */
    GetDesc() {
        pDesc := DXGI_OUTPUT_DESC()
        result := ComCall(7, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} EnumFormat 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} pNumModes 
     * @returns {DXGI_MODE_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdisplaymodelist
     */
    GetDisplayModeList(EnumFormat, Flags, pNumModes) {
        pNumModesMarshal := pNumModes is VarRef ? "uint*" : "ptr"

        pDesc := DXGI_MODE_DESC()
        result := ComCall(8, this, "int", EnumFormat, "uint", Flags, pNumModesMarshal, pNumModes, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Pointer<DXGI_MODE_DESC>} pModeToMatch 
     * @param {IUnknown} pConcernedDevice 
     * @returns {DXGI_MODE_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-findclosestmatchingmode
     */
    FindClosestMatchingMode(pModeToMatch, pConcernedDevice) {
        pClosestMatch := DXGI_MODE_DESC()
        result := ComCall(9, this, "ptr", pModeToMatch, "ptr", pClosestMatch, "ptr", pConcernedDevice, "HRESULT")
        return pClosestMatch
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
     * @returns {DXGI_GAMMA_CONTROL_CAPABILITIES} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getgammacontrolcapabilities
     */
    GetGammaControlCapabilities() {
        pGammaCaps := DXGI_GAMMA_CONTROL_CAPABILITIES()
        result := ComCall(13, this, "ptr", pGammaCaps, "HRESULT")
        return pGammaCaps
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
     * @returns {DXGI_GAMMA_CONTROL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getgammacontrol
     */
    GetGammaControl() {
        pArray := DXGI_GAMMA_CONTROL()
        result := ComCall(15, this, "ptr", pArray, "HRESULT")
        return pArray
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
     * @returns {DXGI_FRAME_STATISTICS} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getframestatistics
     */
    GetFrameStatistics() {
        pStats := DXGI_FRAME_STATISTICS()
        result := ComCall(18, this, "ptr", pStats, "HRESULT")
        return pStats
    }
}
