#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is obsolete and should not be used. Manages reconstructed video frames.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmvideodecoderreconbuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMVideoDecoderReconBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMVideoDecoderReconBuffer
     * @type {Guid}
     */
    static IID => Guid("{45bda2ac-88e2-4923-98ba-3949080711a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetReconstructedVideoFrameSize", "GetReconstructedVideoFrame", "SetReconstructedVideoFrame"]

    /**
     * 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderreconbuffer-getreconstructedvideoframesize
     */
    GetReconstructedVideoFrameSize(pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaBuffer} pBuf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderreconbuffer-getreconstructedvideoframe
     */
    GetReconstructedVideoFrame(pBuf) {
        result := ComCall(4, this, "ptr", pBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaBuffer} pBuf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderreconbuffer-setreconstructedvideoframe
     */
    SetReconstructedVideoFrame(pBuf) {
        result := ComCall(5, this, "ptr", pBuf, "HRESULT")
        return result
    }
}
