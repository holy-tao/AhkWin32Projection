#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSample.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the ability to retrieve IMFSample objects for individual substreams within the output of a multiplexed media source.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmuxstreamsamplemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMuxStreamSampleManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMuxStreamSampleManager
     * @type {Guid}
     */
    static IID => Guid("{74abbc19-b1cc-4e41-bb8b-9d9b86a8f6ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetSample", "GetStreamConfiguration"]

    /**
     * Gets the count of substreams managed by the multiplexed media source.
     * @returns {Integer} The count of substreams managed by the multiplexed media source.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwMuxStreamCount := 0, "HRESULT")
        return pdwMuxStreamCount
    }

    /**
     * Gets the IMFSample associated with the substream with the specified index.
     * @param {Integer} dwMuxStreamIndex The index of the substream for which a sample is retrieved.
     * @returns {IMFSample} The retrieved sample.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getsample
     */
    GetSample(dwMuxStreamIndex) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", &ppSample := 0, "HRESULT")
        return IMFSample(ppSample)
    }

    /**
     * Gets the active stream configuration for the media source, which defines the set of substreams that are included the multiplexed output.
     * @returns {Integer} Gets a  bitmask value where the bits that are on represent the indices of the substreams that are included in the stream configuration.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamconfiguration
     */
    GetStreamConfiguration() {
        result := ComCall(5, this, "uint")
        return result
    }
}
