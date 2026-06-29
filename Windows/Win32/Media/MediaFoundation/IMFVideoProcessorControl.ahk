#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_VIDEO_PROCESSOR_MIRROR.ahk" { MF_VIDEO_PROCESSOR_MIRROR }
#Import ".\MFARGB.ahk" { MFARGB }
#Import ".\MF_VIDEO_PROCESSOR_ROTATION.ahk" { MF_VIDEO_PROCESSOR_ROTATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Configures the Video Processor MFT. (IMFVideoProcessorControl)
 * @remarks
 * This interface controls how the <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> generates output frames.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfvideoprocessorcontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoProcessorControl extends IUnknown {
    /**
     * The interface identifier for IMFVideoProcessorControl
     * @type {Guid}
     */
    static IID := Guid("{a3f675d5-6119-4f7f-a100-1d8b280f0efb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoProcessorControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBorderColor          : IntPtr
        SetSourceRectangle      : IntPtr
        SetDestinationRectangle : IntPtr
        SetMirror               : IntPtr
        SetRotation             : IntPtr
        SetConstrictionSize     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoProcessorControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the border color.
     * @param {Pointer<MFARGB>} pBorderColor A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color as an ARGB (alpha, red, green, blue) value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setbordercolor
     */
    SetBorderColor(pBorderColor) {
        result := ComCall(3, this, MFARGB.Ptr, pBorderColor, "HRESULT")
        return result
    }

    /**
     * Sets the source rectangle. (IMFVideoProcessorControl.SetSourceRectangle)
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> for info regarding source and destination rectangles in the <b>Video Processor MFT</b>.
     * @param {Pointer<RECT>} pSrcRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the source rectangle.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setsourcerectangle
     */
    SetSourceRectangle(pSrcRect) {
        result := ComCall(4, this, RECT.Ptr, pSrcRect, "HRESULT")
        return result
    }

    /**
     * Sets the destination rectangle.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> for info regarding source and destination rectangles in the <b>Video Processor MFT</b>.
     * @param {Pointer<RECT>} pDstRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setdestinationrectangle
     */
    SetDestinationRectangle(pDstRect) {
        result := ComCall(5, this, RECT.Ptr, pDstRect, "HRESULT")
        return result
    }

    /**
     * Specifies whether to flip the video image.
     * @param {MF_VIDEO_PROCESSOR_MIRROR} eMirror An <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_video_processor_mirror">MF_VIDEO_PROCESSOR_MIRROR</a> value that specifies whether to flip the video image, either horizontally or vertically.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setmirror
     */
    SetMirror(eMirror) {
        result := ComCall(6, this, MF_VIDEO_PROCESSOR_MIRROR, eMirror, "HRESULT")
        return result
    }

    /**
     * Specifies whether to rotate the video to the correct orientation.
     * @remarks
     * The original orientation of the video is specified by the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-rotation">MF_MT_VIDEO_ROTATION</a> attribute of the input media type.
     * 
     *  If <i>eRotation</i> is <b>ROTATION_NONE</b>, the video processor does not correct the orientation of the output video. If the original video is rotated, and <i>eRotation</i> is <b>ROTATION_NORMAL</b>, the video processor corrects the orientation, so that the output video is not rotated. The video processor letterboxes the output as needed.
     * @param {MF_VIDEO_PROCESSOR_ROTATION} eRotation A <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_video_processor_rotation">MF_VIDEO_PROCESSOR_ROTATION</a> value that specifies whether to rotate the image.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setrotation
     */
    SetRotation(eRotation) {
        result := ComCall(7, this, MF_VIDEO_PROCESSOR_ROTATION, eRotation, "HRESULT")
        return result
    }

    /**
     * Specifies the amount of downsampling to perform on the output.
     * @param {Pointer<SIZE>} pConstrictionSize The sampling size.
     * 
     * To disable constriction, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setconstrictionsize
     */
    SetConstrictionSize(pConstrictionSize) {
        result := ComCall(8, this, SIZE.Ptr, pConstrictionSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFVideoProcessorControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBorderColor := CallbackCreate(GetMethod(implObj, "SetBorderColor"), flags, 2)
        this.vtbl.SetSourceRectangle := CallbackCreate(GetMethod(implObj, "SetSourceRectangle"), flags, 2)
        this.vtbl.SetDestinationRectangle := CallbackCreate(GetMethod(implObj, "SetDestinationRectangle"), flags, 2)
        this.vtbl.SetMirror := CallbackCreate(GetMethod(implObj, "SetMirror"), flags, 2)
        this.vtbl.SetRotation := CallbackCreate(GetMethod(implObj, "SetRotation"), flags, 2)
        this.vtbl.SetConstrictionSize := CallbackCreate(GetMethod(implObj, "SetConstrictionSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBorderColor)
        CallbackFree(this.vtbl.SetSourceRectangle)
        CallbackFree(this.vtbl.SetDestinationRectangle)
        CallbackFree(this.vtbl.SetMirror)
        CallbackFree(this.vtbl.SetRotation)
        CallbackFree(this.vtbl.SetConstrictionSize)
    }
}
