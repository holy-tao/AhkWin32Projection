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
     * 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetReconstructedVideoFrameSize(pdwSize) {
        result := ComCall(3, this, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaBuffer>} pBuf 
     * @returns {HRESULT} 
     */
    GetReconstructedVideoFrame(pBuf) {
        result := ComCall(4, this, "ptr", pBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaBuffer>} pBuf 
     * @returns {HRESULT} 
     */
    SetReconstructedVideoFrame(pBuf) {
        result := ComCall(5, this, "ptr", pBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
