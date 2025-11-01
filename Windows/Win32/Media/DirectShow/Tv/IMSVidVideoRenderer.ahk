#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} CompositorCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_customcompositorclass
     */
    get_CustomCompositorClass(CompositorCLSID) {
        result := ComCall(16, this, "ptr", CompositorCLSID, "HRESULT")
        return result
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
     * @param {Pointer<Guid>} CompositorCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__customcompositorclass
     */
    get__CustomCompositorClass(CompositorCLSID) {
        result := ComCall(18, this, "ptr", CompositorCLSID, "HRESULT")
        return result
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
     * @param {Pointer<IVMRImageCompositor>} Compositor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__customcompositor
     */
    get__CustomCompositor(Compositor) {
        result := ComCall(20, this, "ptr*", Compositor, "HRESULT")
        return result
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
     * @param {Pointer<IPictureDisp>} MixerPictureDisp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmap
     */
    get_MixerBitmap(MixerPictureDisp) {
        result := ComCall(22, this, "ptr*", MixerPictureDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVMRMixerBitmap>} MixerPicture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get__mixerbitmap
     */
    get__MixerBitmap(MixerPicture) {
        result := ComCall(23, this, "ptr*", MixerPicture, "HRESULT")
        return result
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
     * @param {Pointer<IMSVidRect>} rDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmappositionrect
     */
    get_MixerBitmapPositionRect(rDest) {
        result := ComCall(26, this, "ptr*", rDest, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} opacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_mixerbitmapopacity
     */
    get_MixerBitmapOpacity(opacity) {
        result := ComCall(28, this, "int*", opacity, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} CurrentSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_sourcesize
     */
    get_SourceSize(CurrentSize) {
        result := ComCall(31, this, "int*", CurrentSize, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plPercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_overscan
     */
    get_OverScan(plPercent) {
        result := ComCall(33, this, "int*", plPercent, "HRESULT")
        return result
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
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_availablesourcerect
     */
    get_AvailableSourceRect(pRect) {
        result := ComCall(35, this, "ptr*", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} ppVidRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_maxvidrect
     */
    get_MaxVidRect(ppVidRect) {
        result := ComCall(36, this, "ptr*", ppVidRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} ppVidRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_minvidrect
     */
    get_MinVidRect(ppVidRect) {
        result := ComCall(37, this, "ptr*", ppVidRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_clippedsourcerect
     */
    get_ClippedSourceRect(pRect) {
        result := ComCall(38, this, "ptr*", pRect, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} UseOverlayVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_usingoverlay
     */
    get_UsingOverlay(UseOverlayVal) {
        result := ComCall(40, this, "ptr", UseOverlayVal, "HRESULT")
        return result
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
     * @param {Pointer<IPictureDisp>} currentImage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-capture
     */
    Capture(currentImage) {
        result := ComCall(42, this, "ptr*", currentImage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_framespersecond
     */
    get_FramesPerSecond(pVal) {
        result := ComCall(43, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pDeci 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer-get_decimateinput
     */
    get_DecimateInput(pDeci) {
        result := ComCall(44, this, "ptr", pDeci, "HRESULT")
        return result
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
