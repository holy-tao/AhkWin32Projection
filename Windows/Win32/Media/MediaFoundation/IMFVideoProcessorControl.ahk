#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the Video Processor MFT. (IMFVideoProcessorControl)
 * @remarks
 * This interface controls how the <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> generates output frames.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfvideoprocessorcontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoProcessorControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoProcessorControl
     * @type {Guid}
     */
    static IID => Guid("{a3f675d5-6119-4f7f-a100-1d8b280f0efb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBorderColor", "SetSourceRectangle", "SetDestinationRectangle", "SetMirror", "SetRotation", "SetConstrictionSize"]

    /**
     * Sets the border color.
     * @param {Pointer<MFARGB>} pBorderColor A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color as an ARGB (alpha, red, green, blue) value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideoprocessorcontrol-setbordercolor
     */
    SetBorderColor(pBorderColor) {
        result := ComCall(3, this, "ptr", pBorderColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the source rectangle. (IMFVideoProcessorControl.SetSourceRectangle)
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> for info regarding source and destination rectangles in the <b>Video Processor MFT</b>.
     * @param {Pointer<RECT>} pSrcRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the source rectangle.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideoprocessorcontrol-setsourcerectangle
     */
    SetSourceRectangle(pSrcRect) {
        result := ComCall(4, this, "ptr", pSrcRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the destination rectangle.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> for info regarding source and destination rectangles in the <b>Video Processor MFT</b>.
     * @param {Pointer<RECT>} pDstRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideoprocessorcontrol-setdestinationrectangle
     */
    SetDestinationRectangle(pDstRect) {
        result := ComCall(5, this, "ptr", pDstRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies whether to flip the video image.
     * @param {Integer} eMirror An <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_video_processor_mirror">MF_VIDEO_PROCESSOR_MIRROR</a> value that specifies whether to flip the video image, either horizontally or vertically.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideoprocessorcontrol-setmirror
     */
    SetMirror(eMirror) {
        result := ComCall(6, this, "int", eMirror, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies whether to rotate the video to the correct orientation.
     * @remarks
     * The original orientation of the video is specified by the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-rotation">MF_MT_VIDEO_ROTATION</a> attribute of the input media type.
     * 
     *  If <i>eRotation</i> is <b>ROTATION_NONE</b>, the video processor does not correct the orientation of the output video. If the original video is rotated, and <i>eRotation</i> is <b>ROTATION_NORMAL</b>, the video processor corrects the orientation, so that the output video is not rotated. The video processor letterboxes the output as needed.
     * @param {Integer} eRotation A <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_video_processor_rotation">MF_VIDEO_PROCESSOR_ROTATION</a> value that specifies whether to rotate the image.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideoprocessorcontrol-setrotation
     */
    SetRotation(eRotation) {
        result := ComCall(7, this, "int", eRotation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the amount of downsampling to perform on the output.
     * @param {Pointer<SIZE>} pConstrictionSize The sampling size.
     * 
     * To disable constriction, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideoprocessorcontrol-setconstrictionsize
     */
    SetConstrictionSize(pConstrictionSize) {
        result := ComCall(8, this, "ptr", pConstrictionSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
