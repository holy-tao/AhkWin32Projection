#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\VMRALPHABITMAP.ahk" { VMRALPHABITMAP }
#Import "..\..\..\System\Ole\IPictureDisp.ahk" { IPictureDisp }
#Import "..\IVMRImageCompositor.ahk" { IVMRImageCompositor }
#Import "..\IVMRMixerBitmap.ahk" { IVMRMixerBitmap }
#Import ".\IMSVidRect.ahk" { IMSVidRect }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SourceSizeList.ahk" { SourceSizeList }
#Import ".\IMSVidOutputDevice.ahk" { IMSVidOutputDevice }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IMSVidVideoRenderer interface represents a video renderer device. The MSVidVideoRenderer object exposes this interface.This interface provides access to the Video Mixing Renderer (VMR) filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRenderer)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidvideorenderer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidVideoRenderer extends IMSVidOutputDevice {
    /**
     * The interface identifier for IMSVidVideoRenderer
     * @type {Guid}
     */
    static IID := Guid("{37b03540-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidVideoRenderer
     * @type {Guid}
     */
    static CLSID := Guid("{37b03543-a4c8-11d2-b634-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidVideoRenderer interfaces
    */
    struct Vtbl extends IMSVidOutputDevice.Vtbl {
        get_CustomCompositorClass   : IntPtr
        put_CustomCompositorClass   : IntPtr
        get__CustomCompositorClass  : IntPtr
        put__CustomCompositorClass  : IntPtr
        get__CustomCompositor       : IntPtr
        put__CustomCompositor       : IntPtr
        get_MixerBitmap             : IntPtr
        get__MixerBitmap            : IntPtr
        put_MixerBitmap             : IntPtr
        put__MixerBitmap            : IntPtr
        get_MixerBitmapPositionRect : IntPtr
        put_MixerBitmapPositionRect : IntPtr
        get_MixerBitmapOpacity      : IntPtr
        put_MixerBitmapOpacity      : IntPtr
        SetupMixerBitmap            : IntPtr
        get_SourceSize              : IntPtr
        put_SourceSize              : IntPtr
        get_OverScan                : IntPtr
        put_OverScan                : IntPtr
        get_AvailableSourceRect     : IntPtr
        get_MaxVidRect              : IntPtr
        get_MinVidRect              : IntPtr
        get_ClippedSourceRect       : IntPtr
        put_ClippedSourceRect       : IntPtr
        get_UsingOverlay            : IntPtr
        put_UsingOverlay            : IntPtr
        Capture                     : IntPtr
        get_FramesPerSecond         : IntPtr
        get_DecimateInput           : IntPtr
        put_DecimateInput           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidVideoRenderer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    CustomCompositorClass {
        get => this.get_CustomCompositorClass()
        set => this.put_CustomCompositorClass(value)
    }

    /**
     * @type {Guid} 
     */
    _CustomCompositorClass {
        get => this.get__CustomCompositorClass()
        set => this.put__CustomCompositorClass(value)
    }

    /**
     * @type {IVMRImageCompositor} 
     */
    _CustomCompositor {
        get => this.get__CustomCompositor()
        set => this.put__CustomCompositor(value)
    }

    /**
     * @type {IPictureDisp} 
     */
    MixerBitmap {
        get => this.get_MixerBitmap()
        set => this.put_MixerBitmap(value)
    }

    /**
     * @type {IVMRMixerBitmap} 
     */
    _MixerBitmap {
        get => this.get__MixerBitmap()
        set => this.put__MixerBitmap(value)
    }

    /**
     * @type {IMSVidRect} 
     */
    MixerBitmapPositionRect {
        get => this.get_MixerBitmapPositionRect()
        set => this.put_MixerBitmapPositionRect(value)
    }

    /**
     * @type {Integer} 
     */
    MixerBitmapOpacity {
        get => this.get_MixerBitmapOpacity()
        set => this.put_MixerBitmapOpacity(value)
    }

    /**
     * @type {SourceSizeList} 
     */
    SourceSize {
        get => this.get_SourceSize()
        set => this.put_SourceSize(value)
    }

    /**
     * @type {Integer} 
     */
    OverScan {
        get => this.get_OverScan()
        set => this.put_OverScan(value)
    }

    /**
     * @type {IMSVidRect} 
     */
    AvailableSourceRect {
        get => this.get_AvailableSourceRect()
    }

    /**
     * @type {IMSVidRect} 
     */
    MaxVidRect {
        get => this.get_MaxVidRect()
    }

    /**
     * @type {IMSVidRect} 
     */
    MinVidRect {
        get => this.get_MinVidRect()
    }

    /**
     * @type {IMSVidRect} 
     */
    ClippedSourceRect {
        get => this.get_ClippedSourceRect()
        set => this.put_ClippedSourceRect(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UsingOverlay {
        get => this.get_UsingOverlay()
        set => this.put_UsingOverlay(value)
    }

    /**
     * @type {Integer} 
     */
    FramesPerSecond {
        get => this.get_FramesPerSecond()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DecimateInput {
        get => this.get_DecimateInput()
        set => this.put_DecimateInput(value)
    }

    /**
     * The get_CustomCompositorClass method retrieves the class identifier (CLSID) of the Video Mixing Renderer's current image compositor, as a BSTR.
     * @remarks
     * This method is provided for Automation clients. C++ applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-get__customcompositorclass">IMSVidVideoRenderer::get__CustomCompositorClass</a> method, which returns a <b>GUID</b> rather than a <b>BSTR</b>.
     * 
     * The caller must free the returned string, using the <b>SysFreeString</b> function.
     * @returns {BSTR} Receives a string representation of the CLSID.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_customcompositorclass
     */
    get_CustomCompositorClass() {
        CompositorCLSID := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, CompositorCLSID, "HRESULT")
        return CompositorCLSID
    }

    /**
     * The put_CustomCompositorClass method specifies the class identifier (CLSID) of a custom image compositor, as a BSTR.
     * @remarks
     * This method is provided for Automation clients. C++ applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-put__customcompositorclass">IMSVidVideoRenderer::put__CustomCompositorClass</a> method, which specifies a <b>GUID</b> rather than a <b>BSTR</b>.
     * @param {BSTR} CompositorCLSID Specifies the CLSID as a string.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_customcompositorclass
     */
    put_CustomCompositorClass(CompositorCLSID) {
        CompositorCLSID := CompositorCLSID is String ? BSTR.Alloc(CompositorCLSID).Value : CompositorCLSID

        result := ComCall(17, this, BSTR, CompositorCLSID, "HRESULT")
        return result
    }

    /**
     * The get__CustomCompositorClass method retrieves the class identifier (CLSID) of the Video Mixing Renderer's current image compositor, as a GUID.
     * @remarks
     * Applications can provide their own compositors to perform custom image compositing. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/using-the-video-mixing-renderer">Using the Video Mixing Renderer</a>.
     * @returns {Guid} Receives the CLSID.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__customcompositorclass
     */
    get__CustomCompositorClass() {
        CompositorCLSID := Guid()
        result := ComCall(18, this, Guid.Ptr, CompositorCLSID, "HRESULT")
        return CompositorCLSID
    }

    /**
     * The put__CustomCompositorClass method specifies the class identifier (CLSID) of a custom image compositor, as a GUID.
     * @remarks
     * Applications can provide their own compositors to perform custom image compositing. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/using-the-video-mixing-renderer">Using the Video Mixing Renderer</a>.
     * @param {Pointer<Guid>} CompositorCLSID Specifies the CLSID of the custom compositor.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put__customcompositorclass
     */
    put__CustomCompositorClass(CompositorCLSID) {
        result := ComCall(19, this, Guid.Ptr, CompositorCLSID, "HRESULT")
        return result
    }

    /**
     * The get__CustomCompositor method retrieves the Video Mixing Renderer's current image compositor.
     * @remarks
     * Applications can provide their own compositors to perform custom image compositing. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/using-the-video-mixing-renderer">Using the Video Mixing Renderer</a>.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagecompositor">IVMRImageCompositor</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IVMRImageCompositor} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagecompositor">IVMRImageCompositor</a> interface pointer .
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__customcompositor
     */
    get__CustomCompositor() {
        result := ComCall(20, this, "ptr*", &Compositor := 0, "HRESULT")
        return IVMRImageCompositor(Compositor)
    }

    /**
     * The put__CustomCompositor method specifies a custom image compositor for the Video Mixing Renderer (VMR) to use.
     * @remarks
     * Applications can provide their own compositors to perform custom image compositing. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/using-the-video-mixing-renderer">Using the Video Mixing Renderer</a>.
     * @param {IVMRImageCompositor} Compositor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagecompositor">IVMRImageCompositor</a> interface of the image compositor.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put__customcompositor
     */
    put__CustomCompositor(Compositor) {
        result := ComCall(21, this, "ptr", Compositor, "HRESULT")
        return result
    }

    /**
     * The get_MixerBitmap method retrieves the static bitmap image, as an IPictureDisp type.
     * @remarks
     * If the static bitmap image is set, the VMR alpha-blends the bitmap onto the video image. For information about the <b>IPictureDisp</b> interface, see the Platform SDK documentation.
     * @returns {IPictureDisp} Receives an <b>IPictureDisp</b> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmap
     */
    get_MixerBitmap() {
        result := ComCall(22, this, "ptr*", &MixerPictureDisp := 0, "HRESULT")
        return IPictureDisp(MixerPictureDisp)
    }

    /**
     * The get__MixerBitmap method retrieves the Video Mixing Renderer's IVMRMixerBitmap interface, which controls how the VMR mixes a static bitmap.
     * @remarks
     * The returned <a href="https://docs.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrmixerbitmap">IVMRMixerBitmap</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IVMRMixerBitmap} Receives an <a href="https://docs.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrmixerbitmap">IVMRMixerBitmap</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__mixerbitmap
     */
    get__MixerBitmap() {
        result := ComCall(23, this, "ptr*", &MixerPicture := 0, "HRESULT")
        return IVMRMixerBitmap(MixerPicture)
    }

    /**
     * The put_MixerBitmap method specifies the static bitmap image, as an IPictureDisp type.
     * @remarks
     * The VMR alpha-blends the static bitmap image onto the video image. For information about the <b>IPictureDisp</b> interface, see the Platform SDK documentation.
     * @param {IPictureDisp} MixerPictureDisp Specifies a pointer to the <b>IPictureDisp</b> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_mixerbitmap
     */
    put_MixerBitmap(MixerPictureDisp) {
        result := ComCall(24, this, "ptr", MixerPictureDisp, "HRESULT")
        return result
    }

    /**
     * The put__MixerBitmap method specifies the static bitmap image.
     * @param {Pointer<VMRALPHABITMAP>} MixerPicture A pointer to a <a href="https://docs.microsoft.com/previous-versions/ms788081(v=vs.85)">VMRALPHABITMAP</a> structure that contains information about the bitmap.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put__mixerbitmap
     */
    put__MixerBitmap(MixerPicture) {
        result := ComCall(25, this, VMRALPHABITMAP.Ptr, MixerPicture, "HRESULT")
        return result
    }

    /**
     * The get_MixerBitmapPositionRect method retrieves the position of the static bitmap image, relative to the video window.
     * @remarks
     * If the static bitmap image is set, the VMR alpha-blends the bitmap onto the video image, using the position rectangle given in <i>pprDest</i>.
     * 
     * The returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IMSVidRect} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmappositionrect
     */
    get_MixerBitmapPositionRect() {
        result := ComCall(26, this, "ptr*", &rDest := 0, "HRESULT")
        return IMSVidRect(rDest)
    }

    /**
     * The put_MixerBitmapPositionRect method specifies the position of the static bitmap image, relative to the video window.
     * @remarks
     * If the static bitmap image is set, the VMR alpha blends the bitmap onto the video image, using the specified position rectangle.
     * @param {IMSVidRect} rDest Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface, specifying the rectangle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_mixerbitmappositionrect
     */
    put_MixerBitmapPositionRect(rDest) {
        result := ComCall(27, this, "ptr", rDest, "HRESULT")
        return result
    }

    /**
     * The get_MixerBitmapOpacity method retrieves the opacity of the static bitmap image.
     * @remarks
     * If the static bitmap image is set, the VMR alpha-blends the bitmap onto the video image, using the opacity given in <i>pOpacity</i>.
     * @returns {Integer} Receives the opacity, expressed as an integer from 0 (transparent) to 100 (opaque).
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmapopacity
     */
    get_MixerBitmapOpacity() {
        result := ComCall(28, this, "int*", &opacity := 0, "HRESULT")
        return opacity
    }

    /**
     * The put_MixerBitmapOpacity method specifies the opacity of the static bitmap image.
     * @remarks
     * If the static bitmap image is set, the VMR alpha blends the bitmap onto the video image, using the specified opacity.
     * @param {Integer} opacity Specifies the opacity as an integer from 0 (transparent) to 100 (opaque).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_mixerbitmapopacity
     */
    put_MixerBitmapOpacity(opacity) {
        result := ComCall(29, this, "int", opacity, "HRESULT")
        return result
    }

    /**
     * The SetupMixerBitmap method configures the Video Mixing Renderer (VMR) to display an alpha-blended bitmap on top of the video.
     * @param {IPictureDisp} MixerPictureDisp Pointer to an <b>IPictureDisp</b> interface that specifies the bitmap.
     * @param {Integer} Opacity Specifies the opacity of the bitmap, as an integer from 0 (transparent) to 100 (opaque).
     * @param {IMSVidRect} rDest Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface that specifies the position of the bitmap, relative to the video window.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-setupmixerbitmap
     */
    SetupMixerBitmap(MixerPictureDisp, Opacity, rDest) {
        result := ComCall(30, this, "ptr", MixerPictureDisp, "int", Opacity, "ptr", rDest, "HRESULT")
        return result
    }

    /**
     * The get_SourceSize method retrieves the type of clipping to apply to the video rectangle, if any.
     * @returns {SourceSizeList} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/segment/ne-segment-sourcesizelist">SourceSizeList</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_sourcesize
     */
    get_SourceSize() {
        result := ComCall(31, this, "int*", &CurrentSize := 0, "HRESULT")
        return CurrentSize
    }

    /**
     * The put_SourceSize method specifies the type of clipping to apply to the video rectangle, if any.
     * @param {SourceSizeList} NewSize Specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/segment/ne-segment-sourcesizelist">SourceSizeList</a> enumeration.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_sourcesize
     */
    put_SourceSize(NewSize) {
        result := ComCall(32, this, SourceSizeList, NewSize, "HRESULT")
        return result
    }

    /**
     * The get_OverScan method retrieves the amount of clipping to perform on all sides of the video frame, in order to cut off random video noise.
     * @remarks
     * If the current clipping mode is <b>sslClipByOverScan</b>, the VMR clips the video image by the amount given in the <i>plPercent</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-put_sourcesize">IMSVidVideoRenderer::put_SourceSize</a>.
     * @returns {Integer} Receives the amount to clip, in hundredths of a percent.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_overscan
     */
    get_OverScan() {
        result := ComCall(33, this, "int*", &plPercent := 0, "HRESULT")
        return plPercent
    }

    /**
     * The put_OverScan method specifies the amount of clipping to perform on all sides of the video frame to cut off random video noise.
     * @remarks
     * If the current clipping mode is <b>sslClipByOverScan</b>, the VMR clips the video image by the specified amount. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-put_sourcesize">IMSVidVideoRenderer::put_SourceSize</a>.
     * @param {Integer} lPercent Specifies the amount to clip, in hundredths of a percent. For example, 175 indicates 1.75%.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_overscan
     */
    put_OverScan(lPercent) {
        result := ComCall(34, this, "int", lPercent, "HRESULT")
        return result
    }

    /**
     * The get_AvailableSourceRect method retrieves the size of the native video.
     * @remarks
     * The returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IMSVidRect} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_availablesourcerect
     */
    get_AvailableSourceRect() {
        result := ComCall(35, this, "ptr*", &pRect := 0, "HRESULT")
        return IMSVidRect(pRect)
    }

    /**
     * The get_MaxVidRect method retrieves the maximum ideal size of the video rectangle.
     * @remarks
     * The maximum ideal image size is the maximum video size that can be displayed without significantly degrading performance or image quality.
     * 
     * The returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IMSVidRect} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_maxvidrect
     */
    get_MaxVidRect() {
        result := ComCall(36, this, "ptr*", &ppVidRect := 0, "HRESULT")
        return IMSVidRect(ppVidRect)
    }

    /**
     * The get_MinVidRect method retrieves the minimum ideal size of the video rectangle.
     * @remarks
     * The minimum ideal image size is the minimum video size that can be displayed without significantly degrading performance or image quality.
     * 
     * The returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IMSVidRect} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_minvidrect
     */
    get_MinVidRect() {
        result := ComCall(37, this, "ptr*", &ppVidRect := 0, "HRESULT")
        return IMSVidRect(ppVidRect)
    }

    /**
     * The get_ClippedSourceRect method retrieves the clipping rectangle on the video source.
     * @remarks
     * If the current clipping mode is <b>sslClipByClipRect</b>, the VMR clips the video image to the video source rectangle, and stretches the clipped image to fill the Video Control's video window. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-put_sourcesize">IMSVidVideoRenderer::put_SourceSize</a>.
     * 
     * The returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IMSVidRect} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_clippedsourcerect
     */
    get_ClippedSourceRect() {
        result := ComCall(38, this, "ptr*", &pRect := 0, "HRESULT")
        return IMSVidRect(pRect)
    }

    /**
     * The put_ClippedSourceRect method specifies the clipping rectangle on the video source.
     * @remarks
     * If the current clipping mode is <b>sslClipByClipRect</b>, the VMR clips the video image to the video source rectangle and stretches this to fill the Video Control's video window. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-put_sourcesize">IMSVidVideoRenderer::put_SourceSize</a>.
     * @param {IMSVidRect} pRect Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface that specifies the rectangle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_clippedsourcerect
     */
    put_ClippedSourceRect(pRect) {
        result := ComCall(39, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * The get_UsingOverlay method queries whether the Video Mixing Renderer (VMR) is using the hardware overlay.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_usingoverlay
     */
    get_UsingOverlay() {
        result := ComCall(40, this, VARIANT_BOOL.Ptr, &UseOverlayVal := 0, "HRESULT")
        return UseOverlayVal
    }

    /**
     * The put_UsingOverlay method specifies whether the Video Mixing Renderer will use the hardware overlay.
     * @param {VARIANT_BOOL} UseOverlayVal 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_usingoverlay
     */
    put_UsingOverlay(UseOverlayVal) {
        result := ComCall(41, this, VARIANT_BOOL, UseOverlayVal, "HRESULT")
        return result
    }

    /**
     * The Capture method captures the video frame that is currently being rendered by the Video Mixing Renderer (VMR).
     * @remarks
     * The returned <b>IPictureDisp</b> interface has an outstanding reference count. The caller must release the interface.
     * 
     * For information about the <b>IPictureDisp</b> interface, see the Microsoft Platform SDK documentation.
     * @returns {IPictureDisp} Receives an <b>IPictureDisp</b> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-capture
     */
    Capture() {
        result := ComCall(42, this, "ptr*", &currentImage := 0, "HRESULT")
        return IPictureDisp(currentImage)
    }

    /**
     * The get_FramesPerSecond method retrieves the current frame rate.
     * @returns {Integer} Receives the frame rate, in frames per second.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_framespersecond
     */
    get_FramesPerSecond() {
        result := ComCall(43, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The get_DecimateInput method queries whether the Video Mixing Renderer (VMR) is currently configured to decimate the video (that is, reduce the native video size) before processing it.
     * @remarks
     * This property should be set to true when the native video stream is HDTV but the system monitor is set to a lower resolution. This prevents the VMR from doing unnecessary work by processing the video at high resolution and then shrinking it.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_decimateinput
     */
    get_DecimateInput() {
        result := ComCall(44, this, VARIANT_BOOL.Ptr, &pDeci := 0, "HRESULT")
        return pDeci
    }

    /**
     * The put_DecimateInput method specifies whether the Video Mixing Renderer (VMR) will decimate the video (that is, reduce the native video size) before processing it.
     * @remarks
     * This property should be set to true when the native video stream is HDTV but the system monitor is set to a lower resolution. This prevents the VMR from doing unnecessary work by processing the video at high resolution and then shrinking it.
     * @param {VARIANT_BOOL} pDeci 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_decimateinput
     */
    put_DecimateInput(pDeci) {
        result := ComCall(45, this, VARIANT_BOOL, pDeci, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidVideoRenderer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CustomCompositorClass := CallbackCreate(GetMethod(implObj, "get_CustomCompositorClass"), flags, 2)
        this.vtbl.put_CustomCompositorClass := CallbackCreate(GetMethod(implObj, "put_CustomCompositorClass"), flags, 2)
        this.vtbl.get__CustomCompositorClass := CallbackCreate(GetMethod(implObj, "get__CustomCompositorClass"), flags, 2)
        this.vtbl.put__CustomCompositorClass := CallbackCreate(GetMethod(implObj, "put__CustomCompositorClass"), flags, 2)
        this.vtbl.get__CustomCompositor := CallbackCreate(GetMethod(implObj, "get__CustomCompositor"), flags, 2)
        this.vtbl.put__CustomCompositor := CallbackCreate(GetMethod(implObj, "put__CustomCompositor"), flags, 2)
        this.vtbl.get_MixerBitmap := CallbackCreate(GetMethod(implObj, "get_MixerBitmap"), flags, 2)
        this.vtbl.get__MixerBitmap := CallbackCreate(GetMethod(implObj, "get__MixerBitmap"), flags, 2)
        this.vtbl.put_MixerBitmap := CallbackCreate(GetMethod(implObj, "put_MixerBitmap"), flags, 2)
        this.vtbl.put__MixerBitmap := CallbackCreate(GetMethod(implObj, "put__MixerBitmap"), flags, 2)
        this.vtbl.get_MixerBitmapPositionRect := CallbackCreate(GetMethod(implObj, "get_MixerBitmapPositionRect"), flags, 2)
        this.vtbl.put_MixerBitmapPositionRect := CallbackCreate(GetMethod(implObj, "put_MixerBitmapPositionRect"), flags, 2)
        this.vtbl.get_MixerBitmapOpacity := CallbackCreate(GetMethod(implObj, "get_MixerBitmapOpacity"), flags, 2)
        this.vtbl.put_MixerBitmapOpacity := CallbackCreate(GetMethod(implObj, "put_MixerBitmapOpacity"), flags, 2)
        this.vtbl.SetupMixerBitmap := CallbackCreate(GetMethod(implObj, "SetupMixerBitmap"), flags, 4)
        this.vtbl.get_SourceSize := CallbackCreate(GetMethod(implObj, "get_SourceSize"), flags, 2)
        this.vtbl.put_SourceSize := CallbackCreate(GetMethod(implObj, "put_SourceSize"), flags, 2)
        this.vtbl.get_OverScan := CallbackCreate(GetMethod(implObj, "get_OverScan"), flags, 2)
        this.vtbl.put_OverScan := CallbackCreate(GetMethod(implObj, "put_OverScan"), flags, 2)
        this.vtbl.get_AvailableSourceRect := CallbackCreate(GetMethod(implObj, "get_AvailableSourceRect"), flags, 2)
        this.vtbl.get_MaxVidRect := CallbackCreate(GetMethod(implObj, "get_MaxVidRect"), flags, 2)
        this.vtbl.get_MinVidRect := CallbackCreate(GetMethod(implObj, "get_MinVidRect"), flags, 2)
        this.vtbl.get_ClippedSourceRect := CallbackCreate(GetMethod(implObj, "get_ClippedSourceRect"), flags, 2)
        this.vtbl.put_ClippedSourceRect := CallbackCreate(GetMethod(implObj, "put_ClippedSourceRect"), flags, 2)
        this.vtbl.get_UsingOverlay := CallbackCreate(GetMethod(implObj, "get_UsingOverlay"), flags, 2)
        this.vtbl.put_UsingOverlay := CallbackCreate(GetMethod(implObj, "put_UsingOverlay"), flags, 2)
        this.vtbl.Capture := CallbackCreate(GetMethod(implObj, "Capture"), flags, 2)
        this.vtbl.get_FramesPerSecond := CallbackCreate(GetMethod(implObj, "get_FramesPerSecond"), flags, 2)
        this.vtbl.get_DecimateInput := CallbackCreate(GetMethod(implObj, "get_DecimateInput"), flags, 2)
        this.vtbl.put_DecimateInput := CallbackCreate(GetMethod(implObj, "put_DecimateInput"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CustomCompositorClass)
        CallbackFree(this.vtbl.put_CustomCompositorClass)
        CallbackFree(this.vtbl.get__CustomCompositorClass)
        CallbackFree(this.vtbl.put__CustomCompositorClass)
        CallbackFree(this.vtbl.get__CustomCompositor)
        CallbackFree(this.vtbl.put__CustomCompositor)
        CallbackFree(this.vtbl.get_MixerBitmap)
        CallbackFree(this.vtbl.get__MixerBitmap)
        CallbackFree(this.vtbl.put_MixerBitmap)
        CallbackFree(this.vtbl.put__MixerBitmap)
        CallbackFree(this.vtbl.get_MixerBitmapPositionRect)
        CallbackFree(this.vtbl.put_MixerBitmapPositionRect)
        CallbackFree(this.vtbl.get_MixerBitmapOpacity)
        CallbackFree(this.vtbl.put_MixerBitmapOpacity)
        CallbackFree(this.vtbl.SetupMixerBitmap)
        CallbackFree(this.vtbl.get_SourceSize)
        CallbackFree(this.vtbl.put_SourceSize)
        CallbackFree(this.vtbl.get_OverScan)
        CallbackFree(this.vtbl.put_OverScan)
        CallbackFree(this.vtbl.get_AvailableSourceRect)
        CallbackFree(this.vtbl.get_MaxVidRect)
        CallbackFree(this.vtbl.get_MinVidRect)
        CallbackFree(this.vtbl.get_ClippedSourceRect)
        CallbackFree(this.vtbl.put_ClippedSourceRect)
        CallbackFree(this.vtbl.get_UsingOverlay)
        CallbackFree(this.vtbl.put_UsingOverlay)
        CallbackFree(this.vtbl.Capture)
        CallbackFree(this.vtbl.get_FramesPerSecond)
        CallbackFree(this.vtbl.get_DecimateInput)
        CallbackFree(this.vtbl.put_DecimateInput)
    }
}
