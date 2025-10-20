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
     * 
     * @param {Pointer<BSTR>} CompositorCLSID 
     * @returns {HRESULT} 
     */
    get_CustomCompositorClass(CompositorCLSID) {
        result := ComCall(16, this, "ptr", CompositorCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} CompositorCLSID 
     * @returns {HRESULT} 
     */
    put_CustomCompositorClass(CompositorCLSID) {
        CompositorCLSID := CompositorCLSID is String ? BSTR.Alloc(CompositorCLSID).Value : CompositorCLSID

        result := ComCall(17, this, "ptr", CompositorCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CompositorCLSID 
     * @returns {HRESULT} 
     */
    get__CustomCompositorClass(CompositorCLSID) {
        result := ComCall(18, this, "ptr", CompositorCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CompositorCLSID 
     * @returns {HRESULT} 
     */
    put__CustomCompositorClass(CompositorCLSID) {
        result := ComCall(19, this, "ptr", CompositorCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVMRImageCompositor>} Compositor 
     * @returns {HRESULT} 
     */
    get__CustomCompositor(Compositor) {
        result := ComCall(20, this, "ptr", Compositor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVMRImageCompositor>} Compositor 
     * @returns {HRESULT} 
     */
    put__CustomCompositor(Compositor) {
        result := ComCall(21, this, "ptr", Compositor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MixerPictureDisp 
     * @returns {HRESULT} 
     */
    get_MixerBitmap(MixerPictureDisp) {
        result := ComCall(22, this, "ptr", MixerPictureDisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVMRMixerBitmap>} MixerPicture 
     * @returns {HRESULT} 
     */
    get__MixerBitmap(MixerPicture) {
        result := ComCall(23, this, "ptr", MixerPicture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MixerPictureDisp 
     * @returns {HRESULT} 
     */
    put_MixerBitmap(MixerPictureDisp) {
        result := ComCall(24, this, "ptr", MixerPictureDisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VMRALPHABITMAP>} MixerPicture 
     * @returns {HRESULT} 
     */
    put__MixerBitmap(MixerPicture) {
        result := ComCall(25, this, "ptr", MixerPicture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} rDest 
     * @returns {HRESULT} 
     */
    get_MixerBitmapPositionRect(rDest) {
        result := ComCall(26, this, "ptr", rDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} rDest 
     * @returns {HRESULT} 
     */
    put_MixerBitmapPositionRect(rDest) {
        result := ComCall(27, this, "ptr", rDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} opacity 
     * @returns {HRESULT} 
     */
    get_MixerBitmapOpacity(opacity) {
        result := ComCall(28, this, "int*", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} opacity 
     * @returns {HRESULT} 
     */
    put_MixerBitmapOpacity(opacity) {
        result := ComCall(29, this, "int", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MixerPictureDisp 
     * @param {Integer} Opacity 
     * @param {Pointer<IMSVidRect>} rDest 
     * @returns {HRESULT} 
     */
    SetupMixerBitmap(MixerPictureDisp, Opacity, rDest) {
        result := ComCall(30, this, "ptr", MixerPictureDisp, "int", Opacity, "ptr", rDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentSize 
     * @returns {HRESULT} 
     */
    get_SourceSize(CurrentSize) {
        result := ComCall(31, this, "int*", CurrentSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewSize 
     * @returns {HRESULT} 
     */
    put_SourceSize(NewSize) {
        result := ComCall(32, this, "int", NewSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPercent 
     * @returns {HRESULT} 
     */
    get_OverScan(plPercent) {
        result := ComCall(33, this, "int*", plPercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPercent 
     * @returns {HRESULT} 
     */
    put_OverScan(lPercent) {
        result := ComCall(34, this, "int", lPercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     */
    get_AvailableSourceRect(pRect) {
        result := ComCall(35, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} ppVidRect 
     * @returns {HRESULT} 
     */
    get_MaxVidRect(ppVidRect) {
        result := ComCall(36, this, "ptr", ppVidRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} ppVidRect 
     * @returns {HRESULT} 
     */
    get_MinVidRect(ppVidRect) {
        result := ComCall(37, this, "ptr", ppVidRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     */
    get_ClippedSourceRect(pRect) {
        result := ComCall(38, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     */
    put_ClippedSourceRect(pRect) {
        result := ComCall(39, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} UseOverlayVal 
     * @returns {HRESULT} 
     */
    get_UsingOverlay(UseOverlayVal) {
        result := ComCall(40, this, "ptr", UseOverlayVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseOverlayVal 
     * @returns {HRESULT} 
     */
    put_UsingOverlay(UseOverlayVal) {
        result := ComCall(41, this, "short", UseOverlayVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} currentImage 
     * @returns {HRESULT} 
     */
    Capture(currentImage) {
        result := ComCall(42, this, "ptr", currentImage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_FramesPerSecond(pVal) {
        result := ComCall(43, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pDeci 
     * @returns {HRESULT} 
     */
    get_DecimateInput(pDeci) {
        result := ComCall(44, this, "ptr", pDeci, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} pDeci 
     * @returns {HRESULT} 
     */
    put_DecimateInput(pDeci) {
        result := ComCall(45, this, "short", pDeci, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
