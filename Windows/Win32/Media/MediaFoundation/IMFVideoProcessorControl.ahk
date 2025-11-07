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
     * 
     * @param {Pointer<MFARGB>} pBorderColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setbordercolor
     */
    SetBorderColor(pBorderColor) {
        result := ComCall(3, this, "ptr", pBorderColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSrcRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setsourcerectangle
     */
    SetSourceRectangle(pSrcRect) {
        result := ComCall(4, this, "ptr", pSrcRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pDstRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setdestinationrectangle
     */
    SetDestinationRectangle(pDstRect) {
        result := ComCall(5, this, "ptr", pDstRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eMirror 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setmirror
     */
    SetMirror(eMirror) {
        result := ComCall(6, this, "int", eMirror, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eRotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setrotation
     */
    SetRotation(eRotation) {
        result := ComCall(7, this, "int", eRotation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pConstrictionSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol-setconstrictionsize
     */
    SetConstrictionSize(pConstrictionSize) {
        result := ComCall(8, this, "ptr", pConstrictionSize, "HRESULT")
        return result
    }
}
