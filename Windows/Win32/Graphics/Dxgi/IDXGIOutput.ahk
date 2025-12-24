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
     * Get a description of the output.
     * @returns {DXGI_OUTPUT_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_output_desc">DXGI_OUTPUT_DESC</a>*</b>
     * 
     * A pointer to the output description (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_output_desc">DXGI_OUTPUT_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-getdesc
     */
    GetDesc() {
        pDesc := DXGI_OUTPUT_DESC()
        result := ComCall(7, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets the display modes that match the requested format and other input options.
     * @param {Integer} EnumFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The color format (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>).
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Options for modes to include (see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-enum-modes">DXGI_ENUM_MODES</a>).
     *             DXGI_ENUM_MODES_SCALING needs to be specified to expose the display modes that require scaling.  Centered modes, requiring no 
     *             scaling and corresponding directly to the display output, are enumerated by default.
     * @param {Pointer<Integer>} pNumModes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Set <i>pDesc</i> to <b>NULL</b> so that <i>pNumModes</i> returns the number of display modes that match the format and the options.
     *         Otherwise, <i>pNumModes</i> returns the number of display modes returned in <i>pDesc</i>.
     * @returns {DXGI_MODE_DESC} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a>*</b>
     * 
     * A pointer to a list of display modes (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a>); set to <b>NULL</b> to get the number of display modes.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-getdisplaymodelist
     */
    GetDisplayModeList(EnumFormat, Flags, pNumModes) {
        pNumModesMarshal := pNumModes is VarRef ? "uint*" : "ptr"

        pDesc := DXGI_MODE_DESC()
        result := ComCall(8, this, "int", EnumFormat, "uint", Flags, pNumModesMarshal, pNumModes, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Finds the display mode that most closely matches the requested display mode.
     * @param {Pointer<DXGI_MODE_DESC>} pModeToMatch Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a>*</b>
     * 
     * The desired display mode (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a>). Members of <b>DXGI_MODE_DESC</b> can be unspecified indicating no preference for 
     *         that member.  A value of 0 for <b>Width</b> or <b>Height</b> indicates the value is unspecified.  If either <b>Width</b> or 
     *         <b>Height</b> are 0, both must be 0.  A numerator and denominator of 0 in <b>RefreshRate</b> indicate it is unspecified. Other members 
     *         of <b>DXGI_MODE_DESC</b> have enumeration values indicating the member is unspecified.  If <i>pConcernedDevice</i> is <b>NULL</b>, <b>Format</b>cannot be DXGI_FORMAT_UNKNOWN.
     * @param {IUnknown} pConcernedDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the Direct3D device interface. If this parameter is <b>NULL</b>, only modes whose format matches that of <i>pModeToMatch</i> will 
     *         be returned; otherwise, only those formats that are supported for scan-out by the device are returned. For info about the formats that are supported for scan-out by the device at each feature level:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-1-formats">DXGI Format  Support for Direct3D Feature Level 12.1 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-0-formats">DXGI Format  Support for Direct3D Feature Level 12.0 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-1-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.1 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-0-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.0 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/ff471324(v=vs.85)">Hardware Support for Direct3D 10Level9 Formats</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-1-hardware">Hardware Support for Direct3D 10.1 Formats</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-0-hardware">Hardware Support for Direct3D 10 Formats</a>
     * </li>
     * </ul>
     * @returns {DXGI_MODE_DESC} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a>*</b>
     * 
     * The mode that most closely matches <i>pModeToMatch</i>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-findclosestmatchingmode
     */
    FindClosestMatchingMode(pModeToMatch, pConcernedDevice) {
        pClosestMatch := DXGI_MODE_DESC()
        result := ComCall(9, this, "ptr", pModeToMatch, "ptr", pClosestMatch, "ptr", pConcernedDevice, "HRESULT")
        return pClosestMatch
    }

    /**
     * Halt a thread until the next vertical blank occurs.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-waitforvblank
     */
    WaitForVBlank() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Takes ownership of an output.
     * @param {IUnknown} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a device (such as an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>).
     * @param {BOOL} Exclusive Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Set to <b>TRUE</b> to enable other threads or applications to take ownership of the device; otherwise, set to <b>FALSE</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-takeownership
     */
    TakeOwnership(pDevice, Exclusive) {
        result := ComCall(11, this, "ptr", pDevice, "int", Exclusive, "HRESULT")
        return result
    }

    /**
     * Releases ownership of the output.
     * @remarks
     * 
     * If you are not using a swap chain, get access to an output by calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-takeownership">IDXGIOutput::TakeOwnership</a> and release it when you are finished by calling <b>IDXGIOutput::ReleaseOwnership</b>. An application that uses a swap chain will typically not call either of these methods.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-releaseownership
     */
    ReleaseOwnership() {
        ComCall(12, this)
    }

    /**
     * Gets a description of the gamma-control capabilities.
     * @returns {DXGI_GAMMA_CONTROL_CAPABILITIES} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173062(v=vs.85)">DXGI_GAMMA_CONTROL_CAPABILITIES</a>*</b>
     * 
     * A pointer to a  description of the gamma-control capabilities (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173062(v=vs.85)">DXGI_GAMMA_CONTROL_CAPABILITIES</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-getgammacontrolcapabilities
     */
    GetGammaControlCapabilities() {
        pGammaCaps := DXGI_GAMMA_CONTROL_CAPABILITIES()
        result := ComCall(13, this, "ptr", pGammaCaps, "HRESULT")
        return pGammaCaps
    }

    /**
     * Sets the gamma controls.
     * @param {Pointer<DXGI_GAMMA_CONTROL>} pArray Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173061(v=vs.85)">DXGI_GAMMA_CONTROL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173061(v=vs.85)">DXGI_GAMMA_CONTROL</a> structure that describes the gamma curve to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-setgammacontrol
     */
    SetGammaControl(pArray) {
        result := ComCall(14, this, "ptr", pArray, "HRESULT")
        return result
    }

    /**
     * Gets the gamma control settings.
     * @returns {DXGI_GAMMA_CONTROL} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173061(v=vs.85)">DXGI_GAMMA_CONTROL</a>*</b>
     * 
     * An array of gamma control settings (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173061(v=vs.85)">DXGI_GAMMA_CONTROL</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-getgammacontrol
     */
    GetGammaControl() {
        pArray := DXGI_GAMMA_CONTROL()
        result := ComCall(15, this, "ptr", pArray, "HRESULT")
        return pArray
    }

    /**
     * Changes the display mode.
     * @param {IDXGISurface} pScanoutSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>*</b>
     * 
     * A pointer to a surface (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>) used for rendering an image to the screen. The surface must have been created as a back buffer (DXGI_USAGE_BACKBUFFER).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-setdisplaysurface
     */
    SetDisplaySurface(pScanoutSurface) {
        result := ComCall(16, this, "ptr", pScanoutSurface, "HRESULT")
        return result
    }

    /**
     * Gets a copy of the current display surface.
     * @param {IDXGISurface} pDestination Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>*</b>
     * 
     * A pointer to a destination surface (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata
     */
    GetDisplaySurfaceData(pDestination) {
        result := ComCall(17, this, "ptr", pDestination, "HRESULT")
        return result
    }

    /**
     * Gets statistics about recently rendered frames.
     * @returns {DXGI_FRAME_STATISTICS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_frame_statistics">DXGI_FRAME_STATISTICS</a>*</b>
     * 
     * A pointer to frame statistics (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_frame_statistics">DXGI_FRAME_STATISTICS</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgioutput-getframestatistics
     */
    GetFrameStatistics() {
        pStats := DXGI_FRAME_STATISTICS()
        result := ComCall(18, this, "ptr", pStats, "HRESULT")
        return pStats
    }
}
