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
     * Specifies wether or not the source should be transferred.
     * @returns {BOOL} <b>true</b> if the source should be transferred; otherwise, <b>false</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-shouldtransfersource
     */
    ShouldTransferSource() {
        result := ComCall(3, this, "int*", &pfShouldTransfer := 0, "HRESULT")
        return pfShouldTransfer
    }

    /**
     * Detaches the media source.
     * @param {Pointer<IMFByteStream>} ppByteStream Receives the byte stream.
     * @param {Pointer<IMFMediaSource>} ppMediaSource Receives the media source.
     * @param {Pointer<IMFMediaSourceExtension>} ppMSE Receives the media source extension.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-detachmediasource
     */
    DetachMediaSource(ppByteStream, ppMediaSource, ppMSE) {
        result := ComCall(4, this, "ptr*", ppByteStream, "ptr*", ppMediaSource, "ptr*", ppMSE, "HRESULT")
        return result
    }

    /**
     * Attaches the media source.
     * @param {IMFByteStream} pByteStream Specifies the byte stream.
     * @param {IMFMediaSource} pMediaSource Specifies the media source.
     * @param {IMFMediaSourceExtension} pMSE Specifies the media source extension.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-attachmediasource
     */
    AttachMediaSource(pByteStream, pMediaSource, pMSE) {
        result := ComCall(5, this, "ptr", pByteStream, "ptr", pMediaSource, "ptr", pMSE, "HRESULT")
        return result
    }
}
