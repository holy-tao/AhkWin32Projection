#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\DDCAPS_DX7.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDraw.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectDrawVideo interface queries the Video Renderer filter about DirectDraw surfaces and hardware capabilities.Applications can use this interface to control what DirectDraw features the Video Renderer will take advantage of.
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/nn-amvideo-idirectdrawvideo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawVideo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawVideo
     * @type {Guid}
     */
    static IID => Guid("{36d39eb0-dd75-11ce-bf0e-00aa0055595a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSwitches", "SetSwitches", "GetCaps", "GetEmulatedCaps", "GetSurfaceDesc", "GetFourCCCodes", "SetDirectDraw", "GetDirectDraw", "GetSurfaceType", "SetDefault", "UseScanLine", "CanUseScanLine", "UseOverlayStretch", "CanUseOverlayStretch", "UseWhenFullScreen", "WillUseFullScreen"]

    /**
     * The GetSwitches method retrieves the surface types that the renderer is allowed to use.
     * @returns {Integer} Pointer to a bit mask containing one or more of the following DirectShow DirectDraw Surface (AMDDS) surface types.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AMDDS_NONE</td>
     * <td>No use for DCI/DirectDraw.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_DCIPS</td>
     * <td>Use DCI primary surface.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_PS</td>
     * <td>Use DirectDraw primary surface.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGBOVR</td>
     * <td>RGB overlay surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUVOVR</td>
     * <td>YUV overlay surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGBOFF</td>
     * <td>RGB off-screen surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUVOFF</td>
     * <td>YUV off-screen surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGBFLP</td>
     * <td>RGB flipping surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUVFLP</td>
     * <td>YUV flipping surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_ALL</td>
     * <td>All the previous flags.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_DEFAULT</td>
     * <td>Use all available surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUV</td>
     * <td>(AMDDS_YUVOFF | AMDDS_YUVOVR | AMDDS_YUVFLP).</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGB</td>
     * <td>(AMDDS_RGBOFF | AMDDS_RGBOVR | AMDDS_RGBFLP).</td>
     * </tr>
     * <tr>
     * <td>AMDDS_PRIMARY</td>
     * <td>(AMDDS_DCIPS | AMDDS_PS).</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-getswitches
     */
    GetSwitches() {
        result := ComCall(3, this, "uint*", &pSwitches := 0, "HRESULT")
        return pSwitches
    }

    /**
     * The SetSwitches method sets the surface types that the renderer is allowed to use.
     * @param {Integer} Switches Bit mask containing one or more of the following DirectShow DirectDraw Surface (AMDDS) surface types.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AMDDS_NONE</td>
     * <td>No use for DCI/DirectDraw.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_DCIPS</td>
     * <td>Use DCI primary surface.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_PS</td>
     * <td>Use DirectDraw primary surface.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGBOVR</td>
     * <td>RGB overlay surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUVOVR</td>
     * <td>YUV overlay surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGBOFF</td>
     * <td>RGB off-screen surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUVOFF</td>
     * <td>YUV off-screen surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGBFLP</td>
     * <td>RGB flipping surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUVFLP</td>
     * <td>YUV flipping surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_ALL</td>
     * <td>All the previous flags.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_DEFAULT</td>
     * <td>Use all available surfaces.</td>
     * </tr>
     * <tr>
     * <td>AMDDS_YUV</td>
     * <td>(AMDDS_YUVOFF | AMDDS_YUVOVR | AMDDS_YUVFLP).</td>
     * </tr>
     * <tr>
     * <td>AMDDS_RGB</td>
     * <td>(AMDDS_RGBOFF | AMDDS_RGBOVR | AMDDS_RGBFLP).</td>
     * </tr>
     * <tr>
     * <td>AMDDS_PRIMARY</td>
     * <td>(AMDDS_DCIPS | AMDDS_PS).</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-setswitches
     */
    SetSwitches(Switches) {
        result := ComCall(4, this, "uint", Switches, "HRESULT")
        return result
    }

    /**
     * The GetCaps method retrieves a DirectDraw-defined DDCAPS structure containing the hardware capabilities.
     * @returns {DDCAPS_DX7} Pointer to a DDCAPS structure containing the hardware capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-getcaps
     */
    GetCaps() {
        pCaps := DDCAPS_DX7()
        result := ComCall(5, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * The GetEmulatedCaps method retrieves a DirectDraw-defined DDCAPS structure containing the emulated capabilities.
     * @returns {DDCAPS_DX7} Pointer to a <b>DDCAPS</b> structure containing the emulated capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-getemulatedcaps
     */
    GetEmulatedCaps() {
        pCaps := DDCAPS_DX7()
        result := ComCall(6, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * The GetSurfaceDesc method retrieves a DDSURFACEDESC structure describing the current DirectDraw surface.
     * @param {Pointer<DDSURFACEDESC>} pSurfaceDesc Pointer to a <b>DDSURFACEDESC</b> structure describing the current DirectDraw surface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. If no surface has been allocated, this method will return E_FAIL. If a DCI primary surface is in use, the <b>DDSURFACEDESC</b> structure will not be filled in and the call will return S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-getsurfacedesc
     */
    GetSurfaceDesc(pSurfaceDesc) {
        result := ComCall(7, this, "ptr", pSurfaceDesc, "HRESULT")
        return result
    }

    /**
     * The GetFourCCCodes method retrieves the multimedia format type.
     * @param {Pointer<Integer>} pCount Pointer to the number of FOURCC codes in the <i>pCodes</i> array.
     * @param {Pointer<Integer>} pCodes Pointer to an array of <b>DWORD</b> media tags formerly used for Microsoft multimedia types.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-getfourcccodes
     */
    GetFourCCCodes(pCount, pCodes) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pCodesMarshal := pCodes is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pCountMarshal, pCount, pCodesMarshal, pCodes, "HRESULT")
        return result
    }

    /**
     * The SetDirectDraw method passes the IDirectDraw interface to a loaded driver.
     * @param {IDirectDraw} pDirectDraw Pointer to the <b>IDirectDraw</b> interface to be passed.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-setdirectdraw
     */
    SetDirectDraw(pDirectDraw) {
        result := ComCall(9, this, "ptr", pDirectDraw, "HRESULT")
        return result
    }

    /**
     * The GetDirectDraw method retrieves the IDirectDraw interface.
     * @returns {IDirectDraw} Address of a pointer to the <b>IDirectDraw</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-getdirectdraw
     */
    GetDirectDraw() {
        result := ComCall(10, this, "ptr*", &ppDirectDraw := 0, "HRESULT")
        return IDirectDraw(ppDirectDraw)
    }

    /**
     * The GetSurfaceType method retrieves the actual surface type as a DirectShow DirectDraw Surface (AMDDS) definition.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-getsurfacetype
     */
    GetSurfaceType() {
        result := ComCall(11, this, "uint*", &pSurfaceType := 0, "HRESULT")
        return pSurfaceType
    }

    /**
     * The SetDefault method makes the current property settings the global default.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-setdefault
     */
    SetDefault() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The UseScanLine method determines whether the renderer should check the current scan line when drawing a video.
     * @param {Integer} UseScanLine Long integer value that specifies whether or not to use the scan line information. Set to <b>OATRUE</b> to use scan line information or <b>OAFALSE</b> to ignore it.
     * @returns {HRESULT} Returns E_INVALIDARG if the argument is invalid or S_OK otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-usescanline
     */
    UseScanLine(UseScanLine) {
        result := ComCall(13, this, "int", UseScanLine, "HRESULT")
        return result
    }

    /**
     * The CanUseScanLine method determines whether the renderer will check the current scan line when drawing.
     * @returns {Integer} Pointer to a value indicating whether the renderer will use scan line information. OATRUE indicates the renderer will check the current scan line when drawing; OAFALSE indicates it will not.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-canusescanline
     */
    CanUseScanLine() {
        result := ComCall(14, this, "int*", &UseScanLine := 0, "HRESULT")
        return UseScanLine
    }

    /**
     * The UseOverlayStretch method determines whether the renderer should check overlay stretch limitations.
     * @param {Integer} UseOverlayStretch Value specifying whether the renderer checks overlay stretching. Set to OATRUE for the renderer to check overlay stretching; otherwise, set to OAFALSE.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-useoverlaystretch
     */
    UseOverlayStretch(UseOverlayStretch) {
        result := ComCall(15, this, "int", UseOverlayStretch, "HRESULT")
        return result
    }

    /**
     * The CanUseOverlayStretch method determines whether the renderer will check overlay restrictions.
     * @returns {Integer} Pointer to a value indicating whether the renderer can use overlay restrictions. OATRUE indicates the renderer will check overlay restrictions; OAFALSE indicates it will not.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-canuseoverlaystretch
     */
    CanUseOverlayStretch() {
        result := ComCall(16, this, "int*", &UseOverlayStretch := 0, "HRESULT")
        return UseOverlayStretch
    }

    /**
     * The UseWhenFullScreen method determines whether DirectShow should change display mode when going to full-screen mode.
     * @param {Integer} UseWhenFullScreen Value specifying whether to change the display mode. Set to OATRUE to cause the renderer to use DirectShow in full-screen mode; otherwise, set to OAFALSE.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-usewhenfullscreen
     */
    UseWhenFullScreen(UseWhenFullScreen) {
        result := ComCall(17, this, "int", UseWhenFullScreen, "HRESULT")
        return result
    }

    /**
     * The WillUseFullScreen method determines whether DirectShow will change display mode when going to full-screen mode.
     * @returns {Integer} Pointer to a value indicating whether DirectShow will use DirectX in full-screen mode. OATRUE indicates it will use full-screen mode; OAFALSE indicates it will not.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-idirectdrawvideo-willusefullscreen
     */
    WillUseFullScreen() {
        result := ComCall(18, this, "int*", &UseWhenFullScreen := 0, "HRESULT")
        return UseWhenFullScreen
    }
}
