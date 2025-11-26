#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface for the Microsoft Media Foundation source reader.
 * @remarks
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-async-callback">MF_SOURCE_READER_ASYNC_CALLBACK</a> attribute to set the callback pointer when you first create the source reader object.
 * 
 * The callback methods can be called from any thread, so an object that implements this interface must be thread-safe.
 * 
 * If you do not specify a callback pointer, the source reader operates synchronously.
 * 
 * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsourcereadercallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceReaderCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceReaderCallback
     * @type {Guid}
     */
    static IID => Guid("{deec8d99-fa1d-4d82-84c2-2c8969944867}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnReadSample", "OnFlush", "OnEvent"]

    /**
     * Called when the IMFSourceReader::ReadSample method completes.
     * @param {HRESULT} hrStatus The status code. If an error occurred while processing the next sample, this parameter contains the error code.
     * @param {Integer} dwStreamIndex The zero-based index of the stream that delivered the sample.
     * @param {Integer} dwStreamFlags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/ne-mfreadwrite-mf_source_reader_flag">MF_SOURCE_READER_FLAG</a> enumeration.
     * @param {Integer} llTimestamp The time stamp of the sample, or the time of the stream event indicated in <i>dwStreamFlags</i>. The time is given in 100-nanosecond units.
     * @param {IMFSample} pSample A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of a media sample. This parameter might be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onreadsample
     */
    OnReadSample(hrStatus, dwStreamIndex, dwStreamFlags, llTimestamp, pSample) {
        result := ComCall(3, this, "int", hrStatus, "uint", dwStreamIndex, "uint", dwStreamFlags, "int64", llTimestamp, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * Called when the IMFSourceReader::Flush method completes.
     * @param {Integer} dwStreamIndex The index of the stream that was flushed, or <b>MF_SOURCE_READER_ALL_STREAMS</b> if all streams were flushed.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onflush
     */
    OnFlush(dwStreamIndex) {
        result := ComCall(4, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Called when the source reader receives certain events from the media source.
     * @param {Integer} dwStreamIndex For stream events, the value is the zero-based index of the stream that sent the event. For source events, the value is <b>MF_SOURCE_READER_MEDIASOURCE</b>.
     * @param {IMFMediaEvent} pEvent A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of the event.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onevent
     */
    OnEvent(dwStreamIndex, pEvent) {
        result := ComCall(5, this, "uint", dwStreamIndex, "ptr", pEvent, "HRESULT")
        return result
    }
}
