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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShouldTransferSource", "DetachMediaSource", "AttachMediaSource"]

    /**
     * 
     * @param {Pointer<BOOL>} pfShouldTransfer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-shouldtransfersource
     */
    ShouldTransferSource(pfShouldTransfer) {
        result := ComCall(3, this, "ptr", pfShouldTransfer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} ppByteStream 
     * @param {Pointer<IMFMediaSource>} ppMediaSource 
     * @param {Pointer<IMFMediaSourceExtension>} ppMSE 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-detachmediasource
     */
    DetachMediaSource(ppByteStream, ppMediaSource, ppMSE) {
        result := ComCall(4, this, "ptr*", ppByteStream, "ptr*", ppMediaSource, "ptr*", ppMSE, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFByteStream} pByteStream 
     * @param {IMFMediaSource} pMediaSource 
     * @param {IMFMediaSourceExtension} pMSE 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-attachmediasource
     */
    AttachMediaSource(pByteStream, pMediaSource, pMSE) {
        result := ComCall(5, this, "ptr", pByteStream, "ptr", pMediaSource, "ptr", pMSE, "HRESULT")
        return result
    }
}
