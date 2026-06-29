#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSample.ahk" { IMFSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaEvent.ahk" { IMFMediaEvent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface for the Microsoft Media Foundation source reader.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-async-callback">MF_SOURCE_READER_ASYNC_CALLBACK</a> attribute to set the callback pointer when you first create the source reader object.
 * 
 * The callback methods can be called from any thread, so an object that implements this interface must be thread-safe.
 * 
 * If you do not specify a callback pointer, the source reader operates synchronously.
 * 
 * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nn-mfreadwrite-imfsourcereadercallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSourceReaderCallback extends IUnknown {
    /**
     * The interface identifier for IMFSourceReaderCallback
     * @type {Guid}
     */
    static IID := Guid("{deec8d99-fa1d-4d82-84c2-2c8969944867}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSourceReaderCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnReadSample : IntPtr
        OnFlush      : IntPtr
        OnEvent      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSourceReaderCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the IMFSourceReader::ReadSample method completes.
     * @remarks
     * The <i>pSample</i> parameter might be <b>NULL</b>. For example, when the source reader reaches the end of a stream, <i>dwStreamFlags</i> contains the <b>MF_SOURCE_READERF_ENDOFSTREAM</b> flag, and <i>pSample</i> is <b>NULL</b>.
     * 
     * 
     * 
     * If there is a gap in the stream, <i>dwStreamFlags</i> contains the <b>MF_SOURCE_READERF_STREAMTICK</b> flag, <i>pSample</i> is <b>NULL</b>, and <i>llTimestamp</i> indicates the time when the gap occurred. 
     * 
     * 
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {HRESULT} hrStatus The status code. If an error occurred while processing the next sample, this parameter contains the error code.
     * @param {Integer} dwStreamIndex The zero-based index of the stream that delivered the sample.
     * @param {Integer} dwStreamFlags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/ne-mfreadwrite-mf_source_reader_flag">MF_SOURCE_READER_FLAG</a> enumeration.
     * @param {Integer} llTimestamp The time stamp of the sample, or the time of the stream event indicated in <i>dwStreamFlags</i>. The time is given in 100-nanosecond units.
     * @param {IMFSample} pSample A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of a media sample. This parameter might be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onreadsample
     */
    OnReadSample(hrStatus, dwStreamIndex, dwStreamFlags, llTimestamp, pSample) {
        result := ComCall(3, this, "int", hrStatus, "uint", dwStreamIndex, "uint", dwStreamFlags, "int64", llTimestamp, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * Called when the IMFSourceReader::Flush method completes.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The index of the stream that was flushed, or <b>MF_SOURCE_READER_ALL_STREAMS</b> if all streams were flushed.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onflush
     */
    OnFlush(dwStreamIndex) {
        result := ComCall(4, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Called when the source reader receives certain events from the media source.
     * @remarks
     * In the current implementation,  the source reader uses this method to forward the following events to the application:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/meconnectend">MEConnectEnd</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/meconnectstart">MEConnectStart</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/meextendedtype">MEExtendedType</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcecharacteristicschanged">MESourceCharacteristicsChanged</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcemetadatachanged">MESourceMetadataChanged</a>
     * </li>
     * </ul>
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex For stream events, the value is the zero-based index of the stream that sent the event. For source events, the value is <b>MF_SOURCE_READER_MEDIASOURCE</b>.
     * @param {IMFMediaEvent} pEvent A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of the event.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onevent
     */
    OnEvent(dwStreamIndex, pEvent) {
        result := ComCall(5, this, "uint", dwStreamIndex, "ptr", pEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSourceReaderCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnReadSample := CallbackCreate(GetMethod(implObj, "OnReadSample"), flags, 6)
        this.vtbl.OnFlush := CallbackCreate(GetMethod(implObj, "OnFlush"), flags, 2)
        this.vtbl.OnEvent := CallbackCreate(GetMethod(implObj, "OnEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnReadSample)
        CallbackFree(this.vtbl.OnFlush)
        CallbackFree(this.vtbl.OnEvent)
    }
}
