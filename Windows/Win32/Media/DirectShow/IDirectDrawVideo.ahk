#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\DDCAPS_DX7.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDraw.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectDrawVideo interface queries the Video Renderer filter about DirectDraw surfaces and hardware capabilities.Applications can use this interface to control what DirectDraw features the Video Renderer will take advantage of.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/nn-amvideo-idirectdrawvideo
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
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getswitches
     */
    GetSwitches() {
        result := ComCall(3, this, "uint*", &pSwitches := 0, "HRESULT")
        return pSwitches
    }

    /**
     * The SetSwitches method sets the surface types that the renderer is allowed to use.
     * @remarks
     * This method must be called before the Video Renderer is connected.
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
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-setswitches
     */
    SetSwitches(Switches) {
        result := ComCall(4, this, "uint", Switches, "HRESULT")
        return result
    }

    /**
     * The GetCaps method retrieves a DirectDraw-defined DDCAPS structure containing the hardware capabilities.
     * @remarks
     * If the renderer has not loaded DirectDraw, this method returns E_FAIL.
     * @returns {DDCAPS_DX7} Pointer to a DDCAPS structure containing the hardware capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getcaps
     */
    GetCaps() {
        pCaps := DDCAPS_DX7()
        result := ComCall(5, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * The GetEmulatedCaps method retrieves a DirectDraw-defined DDCAPS structure containing the emulated capabilities.
     * @returns {DDCAPS_DX7} Pointer to a <b>DDCAPS</b> structure containing the emulated capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getemulatedcaps
     */
    GetEmulatedCaps() {
        pCaps := DDCAPS_DX7()
        result := ComCall(6, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * The GetSurfaceDesc method retrieves a DDSURFACEDESC structure describing the current DirectDraw surface.
     * @remarks
     * Surfaces are allocated only when the renderer is paused. After the renderer has been paused, it cannot release the surfaces when stopped.
     * @param {Pointer<DDSURFACEDESC>} pSurfaceDesc Pointer to a <b>DDSURFACEDESC</b> structure describing the current DirectDraw surface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. If no surface has been allocated, this method will return E_FAIL. If a DCI primary surface is in use, the <b>DDSURFACEDESC</b> structure will not be filled in and the call will return S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getsurfacedesc
     */
    GetSurfaceDesc(pSurfaceDesc) {
        result := ComCall(7, this, "ptr", pSurfaceDesc, "HRESULT")
        return result
    }

    /**
     * The GetFourCCCodes method retrieves the multimedia format type.
     * @remarks
     * In the original Windows multimedia APIs, media types were tagged with 32-bit values created from four 8-bit characters and were known as <i>FOURCC</i> codes. Because FOURCC codes are unique, a one-to-one mapping has been made possible by allocating a range of 4 billion GUIDs representing FOURCCs.
     * 
     * This method retrieves the FOURCC codes that the current display driver can support. The number available is obtained by calling the method with a valid <i>pCount</i> pointer, but with <i>pCodes</i> set to <b>NULL</b>. In this case, the <i>pCount</i> variable will be filled in with the number of FOURCC codes available. An application can then allocate enough <b>DWORD</b> values for this many FOURCC codes and call the method again with the array pointer in <i>pCodes</i>.
     * @param {Pointer<Integer>} pCount Pointer to the number of FOURCC codes in the <i>pCodes</i> array.
     * @param {Pointer<Integer>} pCodes Pointer to an array of <b>DWORD</b> media tags formerly used for Microsoft multimedia types.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getfourcccodes
     */
    GetFourCCCodes(pCount, pCodes) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pCodesMarshal := pCodes is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pCountMarshal, pCount, pCodesMarshal, pCodes, "HRESULT")
        return result
    }

    /**
     * The SetDirectDraw method passes the IDirectDraw interface to a loaded driver.
     * @remarks
     * To have the renderer release a DirectDraw interface previously passed in through <c>SetDirectDraw</code>, an application can call <code>SetDirectDraw</code> and pass in <b>NULL</b>. However, the renderer will continue using that DirectDraw interface until it is disconnected. Therefore, calling <code>SetDirectDraw</c> with a <b>NULL</b> parameter does not make the renderer stop using it immediately.
     * 
     * This method was created because only one instance of <b>IDirectDraw</b> could be loaded per process in versions of DirectDraw prior to DirectX 7.0. If you are using DirectX 7.0 or later, you never need to call this method. If an application wanted to load <b>IDirectDraw</b> but allow the Video Renderer to also allocate surfaces, the application could open <b>IDirectDraw</b> itself and then pass the interface to the loaded driver through <c>IDirectDrawVideo::SetDirectDraw</c>. Alternatively, the application could let the renderer load DirectDraw and then obtain a reference-incremented interface to it through <a href="https://docs.microsoft.com/windows/desktop/api/amvideo/nf-amvideo-idirectdrawvideo-getdirectdraw">IDirectDrawVideo::GetDirectDraw</a>. Because DirectShow ships with the most recently shipped version of DirectDraw, however, this method is not required unless the application wants to change display modes itself and pass in a DirectDraw object, which the renderer can then use to allocate surfaces.
     * @param {IDirectDraw} pDirectDraw Pointer to the <b>IDirectDraw</b> interface to be passed.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-setdirectdraw
     */
    SetDirectDraw(pDirectDraw) {
        result := ComCall(9, this, "ptr", pDirectDraw, "HRESULT")
        return result
    }

    /**
     * The GetDirectDraw method retrieves the IDirectDraw interface.
     * @remarks
     * If an application wants to load DirectDraw but allow the renderer to also allocate surfaces, it can let the renderer load DirectDraw and then obtain a reference-incremented interface to it through this method. The interface returned should be released by the application when it is finished with it.
     * @returns {IDirectDraw} Address of a pointer to the <b>IDirectDraw</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getdirectdraw
     */
    GetDirectDraw() {
        result := ComCall(10, this, "ptr*", &ppDirectDraw := 0, "HRESULT")
        return IDirectDraw(ppDirectDraw)
    }

    /**
     * The GetSurfaceType method retrieves the actual surface type as a DirectShow DirectDraw Surface (AMDDS) definition.
     * @remarks
     * It is not always easy to discover which kind of surface is being used by looking at a <b>DDSURFACEDESC</b> structure. Therefore, an application can call <c>GetSurfaceType</c> to retrieve the surface type. The field will be filled in with one bit setting selected from the preceding list of AMDDS definitions.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-getsurfacetype
     */
    GetSurfaceType() {
        result := ComCall(11, this, "uint*", &pSurfaceType := 0, "HRESULT")
        return pSurfaceType
    }

    /**
     * The SetDefault method makes the current property settings the global default.
     * @remarks
     * All properties set through <b>IDirectDrawVideo</b> are specific to that particular instance. Call this method to make properties set on this instance of <b>IDirectDrawVideo</b> the global default of all DirectShow instances of this interface. After it is called, the current property settings will persist between the subsequent starting of other DirectShow filter graphs and between any computer restarts.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-setdefault
     */
    SetDefault() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The UseScanLine method determines whether the renderer should check the current scan line when drawing a video.
     * @remarks
     * If you blit an image to the video memory while the monitor's scan line is scanning over a visible portion of the screen, the complete image will be a composite of the old and new images. This composite is known as a torn video image. You can avoid torn images by waiting until the previous image is complete before blitting the new image. Some video cards can retrieve the scan line's current position; if this information is available, you can have DirectShow try to reduce tearing by waiting until the scan line is off-screen before blitting the new image. Note that checking the scan line location increases load on the processor and can reduce the amount of video frames delivered to the screen. If scan line information is available, DirectShow uses it by default. Set <i>UseScanLine</i> to OAFALSE if you want to save processing time at the expense of minor image degradation.
     * @param {Integer} UseScanLine Long integer value that specifies whether or not to use the scan line information. Set to <b>OATRUE</b> to use scan line information or <b>OAFALSE</b> to ignore it.
     * @returns {HRESULT} Returns E_INVALIDARG if the argument is invalid or S_OK otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-usescanline
     */
    UseScanLine(UseScanLine) {
        result := ComCall(13, this, "int", UseScanLine, "HRESULT")
        return result
    }

    /**
     * The CanUseScanLine method determines whether the renderer will check the current scan line when drawing.
     * @remarks
     * For a description of the use of scan line detection in the DirectShow video renderer, see <a href="https://docs.microsoft.com/windows/desktop/api/amvideo/nf-amvideo-idirectdrawvideo-usescanline">IDirectDrawVideo::UseScanLine</a>.
     * @returns {Integer} Pointer to a value indicating whether the renderer will use scan line information. OATRUE indicates the renderer will check the current scan line when drawing; OAFALSE indicates it will not.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-canusescanline
     */
    CanUseScanLine() {
        result := ComCall(14, this, "int*", &UseScanLine := 0, "HRESULT")
        return UseScanLine
    }

    /**
     * The UseOverlayStretch method determines whether the renderer should check overlay stretch limitations.
     * @remarks
     * Some display cards provide the use of overlay surfaces through DirectDraw. An overlay surface is a block of video memory whose contents are overlaid onto the display during the monitor's vertical refresh. DirectShow uses all available overlay surfaces where possible because they typically offer higher-quality video and very fast performance. On some display cards set to relatively high bit depths, the overlay must be displayed on the screen larger than its real size (to accommodate certain display hardware bandwidth limitations). If the overlay is not displayed large enough, certain undesirable effects can be seen on the display (sometimes described as a "fleeting shimmering" effect).
     * 
     * If <i>UseOverlayStretch</i> is set to OATRUE (on, the default), DirectShow will ensure the overlay is adequately stretched before displaying it. If it is set to OAFALSE (off), DirectShow will not check that the overlay is adequately stretched, and the user is likely to experience artifacts on the screen (although it will also guarantee that the overlay will be used if possible).
     * @param {Integer} UseOverlayStretch Value specifying whether the renderer checks overlay stretching. Set to OATRUE for the renderer to check overlay stretching; otherwise, set to OAFALSE.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-useoverlaystretch
     */
    UseOverlayStretch(UseOverlayStretch) {
        result := ComCall(15, this, "int", UseOverlayStretch, "HRESULT")
        return result
    }

    /**
     * The CanUseOverlayStretch method determines whether the renderer will check overlay restrictions.
     * @remarks
     * For a description of overlay stretching, see <a href="https://docs.microsoft.com/windows/desktop/api/amvideo/nf-amvideo-idirectdrawvideo-useoverlaystretch">IDirectDrawVideo::UseOverlayStretch</a>.
     * @returns {Integer} Pointer to a value indicating whether the renderer can use overlay restrictions. OATRUE indicates the renderer will check overlay restrictions; OAFALSE indicates it will not.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-canuseoverlaystretch
     */
    CanUseOverlayStretch() {
        result := ComCall(16, this, "int*", &UseOverlayStretch := 0, "HRESULT")
        return UseOverlayStretch
    }

    /**
     * The UseWhenFullScreen method determines whether DirectShow should change display mode when going to full-screen mode.
     * @remarks
     * When asked to go to full-screen mode, DirectShow has a number of choices. The first choice is to determine if any filters in the graph can support full-screen playback directly; if one can, it will be asked to do so.
     * 
     * The second choice is to automatically add a special full-screen renderer to the filter graph that uses DirectDraw mode-changing services to play back the video. By changing display modes, the video effectively fills more (but not necessarily all) of the display. So, for example, if the current mode is 1024 x 768 pixels, a video might look relatively small, but when displayed in a 320 x 240 display mode it might look very presentable.
     * 
     * The third and final choice is to simply take any renderer supporting the <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ivideowindow">IVideoWindow</a> interface and have its window stretched full-screen. This will typically offer lower performance than the second option (swapping in a full-screen DirectDraw-enabled renderer). If the <i>UseWhenFullScreen</i> parameter is set to On (OATRUE), the window will always be stretched full-screen for full-screen playback; if set to Off (the default), the filter graph manager is free to swap in the DirectDraw-enabled full-screen renderer.
     * @param {Integer} UseWhenFullScreen Value specifying whether to change the display mode. Set to OATRUE to cause the renderer to use DirectShow in full-screen mode; otherwise, set to OAFALSE.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-usewhenfullscreen
     */
    UseWhenFullScreen(UseWhenFullScreen) {
        result := ComCall(17, this, "int", UseWhenFullScreen, "HRESULT")
        return result
    }

    /**
     * The WillUseFullScreen method determines whether DirectShow will change display mode when going to full-screen mode.
     * @remarks
     * For a description of this feature, see <a href="https://docs.microsoft.com/previous-versions/ms785118(v=vs.85)">IDirectDrawVideo::UseWhenFullScreen</a>.
     * @returns {Integer} Pointer to a value indicating whether DirectShow will use DirectX in full-screen mode. OATRUE indicates it will use full-screen mode; OAFALSE indicates it will not.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-idirectdrawvideo-willusefullscreen
     */
    WillUseFullScreen() {
        result := ComCall(18, this, "int*", &UseWhenFullScreen := 0, "HRESULT")
        return UseWhenFullScreen
    }
}
