#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the Video Processor MFT.
 * @remarks
 * 
  * This interface controls how the <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> generates output frames.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfvideoprocessorcontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoProcessorControl extends IUnknown{
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
     * 
     * @param {Pointer<MFARGB>} pBorderColor 
     * @returns {HRESULT} 
     */
    SetBorderColor(pBorderColor) {
        result := ComCall(3, this, "ptr", pBorderColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSrcRect 
     * @returns {HRESULT} 
     */
    SetSourceRectangle(pSrcRect) {
        result := ComCall(4, this, "ptr", pSrcRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pDstRect 
     * @returns {HRESULT} 
     */
    SetDestinationRectangle(pDstRect) {
        result := ComCall(5, this, "ptr", pDstRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eMirror 
     * @returns {HRESULT} 
     */
    SetMirror(eMirror) {
        result := ComCall(6, this, "int", eMirror, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eRotation 
     * @returns {HRESULT} 
     */
    SetRotation(eRotation) {
        result := ComCall(7, this, "int", eRotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pConstrictionSize 
     * @returns {HRESULT} 
     */
    SetConstrictionSize(pConstrictionSize) {
        result := ComCall(8, this, "ptr", pConstrictionSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
