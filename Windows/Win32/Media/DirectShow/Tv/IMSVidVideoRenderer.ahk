#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IVMRImageCompositor.ahk
#Include ..\..\..\System\Ole\IPictureDisp.ahk
#Include ..\IVMRMixerBitmap.ahk
#Include .\IMSVidRect.ahk
#Include .\IMSVidOutputDevice.ahk

/**
 * The IMSVidVideoRenderer interface represents a video renderer device. The MSVidVideoRenderer object exposes this interface.This interface provides access to the Video Mixing Renderer (VMR) filter.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRenderer)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidvideorenderer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVideoRenderer extends IMSVidOutputDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVideoRenderer
     * @type {Guid}
     */
    static IID => Guid("{37b03540-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidVideoRenderer
     * @type {Guid}
     */
    static CLSID => Guid("{37b03543-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CustomCompositorClass", "put_CustomCompositorClass", "get__CustomCompositorClass", "put__CustomCompositorClass", "get__CustomCompositor", "put__CustomCompositor", "get_MixerBitmap", "get__MixerBitmap", "put_MixerBitmap", "put__MixerBitmap", "get_MixerBitmapPositionRect", "put_MixerBitmapPositionRect", "get_MixerBitmapOpacity", "put_MixerBitmapOpacity", "SetupMixerBitmap", "get_SourceSize", "put_SourceSize", "get_OverScan", "put_OverScan", "get_AvailableSourceRect", "get_MaxVidRect", "get_MinVidRect", "get_ClippedSourceRect", "put_ClippedSourceRect", "get_UsingOverlay", "put_UsingOverlay", "Capture", "get_FramesPerSecond", "get_DecimateInput", "put_DecimateInput"]

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
     * @type {Integer} 
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_customcompositorclass
     */
    get_CustomCompositorClass() {
        CompositorCLSID := BSTR()
        result := ComCall(16, this, "ptr", CompositorCLSID, "HRESULT")
        return CompositorCLSID
    }

    /**
     * 
     * @param {BSTR} CompositorCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_customcompositorclass
     */
    put_CustomCompositorClass(CompositorCLSID) {
        CompositorCLSID := CompositorCLSID is String ? BSTR.Alloc(CompositorCLSID).Value : CompositorCLSID

        result := ComCall(17, this, "ptr", CompositorCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__customcompositorclass
     */
    get__CustomCompositorClass() {
        CompositorCLSID := Guid()
        result := ComCall(18, this, "ptr", CompositorCLSID, "HRESULT")
        return CompositorCLSID
    }

    /**
     * 
     * @param {Pointer<Guid>} CompositorCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put__customcompositorclass
     */
    put__CustomCompositorClass(CompositorCLSID) {
        result := ComCall(19, this, "ptr", CompositorCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IVMRImageCompositor} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__customcompositor
     */
    get__CustomCompositor() {
        result := ComCall(20, this, "ptr*", &Compositor := 0, "HRESULT")
        return IVMRImageCompositor(Compositor)
    }

    /**
     * 
     * @param {IVMRImageCompositor} Compositor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put__customcompositor
     */
    put__CustomCompositor(Compositor) {
        result := ComCall(21, this, "ptr", Compositor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPictureDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmap
     */
    get_MixerBitmap() {
        result := ComCall(22, this, "ptr*", &MixerPictureDisp := 0, "HRESULT")
        return IPictureDisp(MixerPictureDisp)
    }

    /**
     * 
     * @returns {IVMRMixerBitmap} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__mixerbitmap
     */
    get__MixerBitmap() {
        result := ComCall(23, this, "ptr*", &MixerPicture := 0, "HRESULT")
        return IVMRMixerBitmap(MixerPicture)
    }

    /**
     * 
     * @param {IPictureDisp} MixerPictureDisp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_mixerbitmap
     */
    put_MixerBitmap(MixerPictureDisp) {
        result := ComCall(24, this, "ptr", MixerPictureDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMRALPHABITMAP>} MixerPicture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put__mixerbitmap
     */
    put__MixerBitmap(MixerPicture) {
        result := ComCall(25, this, "ptr", MixerPicture, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSVidRect} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmappositionrect
     */
    get_MixerBitmapPositionRect() {
        result := ComCall(26, this, "ptr*", &rDest := 0, "HRESULT")
        return IMSVidRect(rDest)
    }

    /**
     * 
     * @param {IMSVidRect} rDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_mixerbitmappositionrect
     */
    put_MixerBitmapPositionRect(rDest) {
        result := ComCall(27, this, "ptr", rDest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmapopacity
     */
    get_MixerBitmapOpacity() {
        result := ComCall(28, this, "int*", &opacity := 0, "HRESULT")
        return opacity
    }

    /**
     * 
     * @param {Integer} opacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_mixerbitmapopacity
     */
    put_MixerBitmapOpacity(opacity) {
        result := ComCall(29, this, "int", opacity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MixerPictureDisp 
     * @param {Integer} Opacity 
     * @param {IMSVidRect} rDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-setupmixerbitmap
     */
    SetupMixerBitmap(MixerPictureDisp, Opacity, rDest) {
        result := ComCall(30, this, "ptr", MixerPictureDisp, "int", Opacity, "ptr", rDest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_sourcesize
     */
    get_SourceSize() {
        result := ComCall(31, this, "int*", &CurrentSize := 0, "HRESULT")
        return CurrentSize
    }

    /**
     * 
     * @param {Integer} NewSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_sourcesize
     */
    put_SourceSize(NewSize) {
        result := ComCall(32, this, "int", NewSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_overscan
     */
    get_OverScan() {
        result := ComCall(33, this, "int*", &plPercent := 0, "HRESULT")
        return plPercent
    }

    /**
     * 
     * @param {Integer} lPercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_overscan
     */
    put_OverScan(lPercent) {
        result := ComCall(34, this, "int", lPercent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSVidRect} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_availablesourcerect
     */
    get_AvailableSourceRect() {
        result := ComCall(35, this, "ptr*", &pRect := 0, "HRESULT")
        return IMSVidRect(pRect)
    }

    /**
     * 
     * @returns {IMSVidRect} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_maxvidrect
     */
    get_MaxVidRect() {
        result := ComCall(36, this, "ptr*", &ppVidRect := 0, "HRESULT")
        return IMSVidRect(ppVidRect)
    }

    /**
     * 
     * @returns {IMSVidRect} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_minvidrect
     */
    get_MinVidRect() {
        result := ComCall(37, this, "ptr*", &ppVidRect := 0, "HRESULT")
        return IMSVidRect(ppVidRect)
    }

    /**
     * 
     * @returns {IMSVidRect} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_clippedsourcerect
     */
    get_ClippedSourceRect() {
        result := ComCall(38, this, "ptr*", &pRect := 0, "HRESULT")
        return IMSVidRect(pRect)
    }

    /**
     * 
     * @param {IMSVidRect} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_clippedsourcerect
     */
    put_ClippedSourceRect(pRect) {
        result := ComCall(39, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_usingoverlay
     */
    get_UsingOverlay() {
        result := ComCall(40, this, "short*", &UseOverlayVal := 0, "HRESULT")
        return UseOverlayVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseOverlayVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_usingoverlay
     */
    put_UsingOverlay(UseOverlayVal) {
        result := ComCall(41, this, "short", UseOverlayVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPictureDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-capture
     */
    Capture() {
        result := ComCall(42, this, "ptr*", &currentImage := 0, "HRESULT")
        return IPictureDisp(currentImage)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_framespersecond
     */
    get_FramesPerSecond() {
        result := ComCall(43, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_decimateinput
     */
    get_DecimateInput() {
        result := ComCall(44, this, "short*", &pDeci := 0, "HRESULT")
        return pDeci
    }

    /**
     * 
     * @param {VARIANT_BOOL} pDeci 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-put_decimateinput
     */
    put_DecimateInput(pDeci) {
        result := ComCall(45, this, "short", pDeci, "HRESULT")
        return result
    }
}
