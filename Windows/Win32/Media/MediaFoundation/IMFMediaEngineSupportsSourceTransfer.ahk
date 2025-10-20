#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the media source to be transferred between the media engine and the sharing engine for Play To.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaenginesupportssourcetransfer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineSupportsSourceTransfer extends IUnknown{
    /**
     * The interface identifier for IMFMediaEngineSupportsSourceTransfer
     * @type {Guid}
     */
    static IID => Guid("{a724b056-1b2e-4642-a6f3-db9420c52908}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfShouldTransfer 
     * @returns {HRESULT} 
     */
    ShouldTransferSource(pfShouldTransfer) {
        result := ComCall(3, this, "ptr", pfShouldTransfer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} ppByteStream 
     * @param {Pointer<IMFMediaSource>} ppMediaSource 
     * @param {Pointer<IMFMediaSourceExtension>} ppMSE 
     * @returns {HRESULT} 
     */
    DetachMediaSource(ppByteStream, ppMediaSource, ppMSE) {
        result := ComCall(4, this, "ptr", ppByteStream, "ptr", ppMediaSource, "ptr", ppMSE, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} pByteStream 
     * @param {Pointer<IMFMediaSource>} pMediaSource 
     * @param {Pointer<IMFMediaSourceExtension>} pMSE 
     * @returns {HRESULT} 
     */
    AttachMediaSource(pByteStream, pMediaSource, pMSE) {
        result := ComCall(5, this, "ptr", pByteStream, "ptr", pMediaSource, "ptr", pMSE, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
