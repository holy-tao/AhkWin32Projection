#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides additional functionality on the sink writer for dynamically changing the media type and encoder configuration.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer">Sink Writer</a> implements this interface in Windows 8.1. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsinkwriterencoderconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSinkWriterEncoderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSinkWriterEncoderConfig
     * @type {Guid}
     */
    static IID => Guid("{17c3779e-3cde-4ede-8c60-3899f5f53ad6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTargetMediaType", "PlaceEncodingParameters"]

    /**
     * Dynamically changes the target media type that Sink Writer is encoding to.
     * @param {Integer} dwStreamIndex Specifies the stream index.
     * @param {IMFMediaType} pTargetMediaType The new media format to encode to.
     * @param {IMFAttributes} pEncodingParameters The new set of encoding parameters to configure the encoder with.
     *     If not specified, previously provided parameters will be used.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriterencoderconfig-settargetmediatype
     */
    SetTargetMediaType(dwStreamIndex, pTargetMediaType, pEncodingParameters) {
        result := ComCall(3, this, "uint", dwStreamIndex, "ptr", pTargetMediaType, "ptr", pEncodingParameters, "HRESULT")
        return result
    }

    /**
     * Dynamically updates the encoder configuration with a collection of new encoder settings.
     * @param {Integer} dwStreamIndex Specifies the stream index.
     * @param {IMFAttributes} pEncodingParameters A set of encoding parameters to configure the encoder with.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriterencoderconfig-placeencodingparameters
     */
    PlaceEncodingParameters(dwStreamIndex, pEncodingParameters) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ptr", pEncodingParameters, "HRESULT")
        return result
    }
}
