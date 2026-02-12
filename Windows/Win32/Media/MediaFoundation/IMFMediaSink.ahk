#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFStreamSink.ahk
#Include .\IMFPresentationClock.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by media sink objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfmediasink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSink
     * @type {Guid}
     */
    static IID => Guid("{6ef2a660-47c0-4666-b13d-cbb717f2fa2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCharacteristics", "AddStreamSink", "RemoveStreamSink", "GetStreamSinkCount", "GetStreamSinkByIndex", "GetStreamSinkById", "SetPresentationClock", "GetPresentationClock", "Shutdown"]

    /**
     * Gets the characteristics of the media sink.
     * @remarks
     * The characteristics of a media sink are fixed throughout the life time of the sink.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags. The following flags are defined:
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEDIASINK_FIXED_STREAMS"></a><a id="mediasink_fixed_streams"></a><dl>
     * <dt><b><b>MEDIASINK_FIXED_STREAMS</b></b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink has a fixed number of streams. It does not support the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-removestreamsink">IMFMediaSink::RemoveStreamSink</a> methods. This flag is a hint to the application.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEDIASINK_CANNOT_MATCH_CLOCK"></a><a id="mediasink_cannot_match_clock"></a><dl>
     * <dt><b><b>MEDIASINK_CANNOT_MATCH_CLOCK</b></b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink cannot match rates with an external clock.
     * 
     * For best results, this media sink should be used as the time source for the presentation clock. If any other time source is used, the media sink cannot match rates with the clock, with poor results (for example, glitching).
     * 
     * This flag should be used sparingly, because it limits how the pipeline can be configured.
     * 
     * For more information about the presentation clock, see <a href="https://docs.microsoft.com/windows/desktop/medfound/presentation-clock">Presentation Clock</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEDIASINK_RATELESS"></a><a id="mediasink_rateless"></a><dl>
     * <dt><b><b>MEDIASINK_RATELESS</b></b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink is rateless. It consumes samples as quickly as possible, and does not synchronize itself to a presentation clock.
     * 
     * Most archiving sinks are rateless.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEDIASINK_CLOCK_REQUIRED"></a><a id="mediasink_clock_required"></a><dl>
     * <dt><b><b>MEDIASINK_CLOCK_REQUIRED</b></b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink requires a presentation clock. The presentation clock is set by calling the media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-setpresentationclock">IMFMediaSink::SetPresentationClock</a> method.
     * 
     * This flag is obsolete, because all media sinks must support the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-setpresentationclock">SetPresentationClock</a> method, even if the media sink ignores the clock (as in a rateless media sink).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEDIASINK_CAN_PREROLL"></a><a id="mediasink_can_preroll"></a><dl>
     * <dt><b><b>MEDIASINK_CAN_PREROLL</b></b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink can accept preroll samples before the presentation clock starts. The media sink exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasinkpreroll">IMFMediaSinkPreroll</a> interface.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MEDIASINK_REQUIRE_REFERENCE_MEDIATYPE"></a><a id="mediasink_require_reference_mediatype"></a><dl>
     * <dt><b><b>MEDIASINK_REQUIRE_REFERENCE_MEDIATYPE</b></b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first stream sink (index 0) is a reference stream. The reference stream must have a media type before the media types can be set on the other stream sinks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-getcharacteristics
     */
    GetCharacteristics() {
        result := ComCall(3, this, "uint*", &pdwCharacteristics := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCharacteristics
    }

    /**
     * Adds a new stream sink to the media sink.
     * @remarks
     * Not all media sinks support this method. If the media sink does not support this method, the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics">IMFMediaSink::GetCharacteristics</a> method returns the MEDIASINK_FIXED_STREAMS flag.
     * 
     * If <i>pMediaType</i> is <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediatypehandler">IMFMediaTypeHandler</a> interface to set the media type. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-getmediatypehandler">IMFStreamSink::GetMediaTypeHandler</a> to get a pointer to the interface.
     * @param {Integer} dwStreamSinkIdentifier Identifier for the new stream. The value is arbitrary but must be unique.
     * @param {IMFMediaType} pMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface, specifying the media type for the stream. This parameter can be <b>NULL</b>.
     * @returns {IMFStreamSink} Receives a pointer to the new stream sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamsink">IMFStreamSink</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-addstreamsink
     */
    AddStreamSink(dwStreamSinkIdentifier, pMediaType) {
        result := ComCall(4, this, "uint", dwStreamSinkIdentifier, "ptr", pMediaType, "ptr*", &ppStreamSink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFStreamSink(ppStreamSink)
    }

    /**
     * Removes a stream sink from the media sink.
     * @remarks
     * After this method is called, the corresponding stream sink object is no longer valid. The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyindex">IMFMediaSink::GetStreamSinkByIndex</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyid">IMFMediaSink::GetStreamSinkById</a> methods will no longer return that stream sink. You can re-use the stream identifier if you add another stream (by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">AddStreamSink</a>).
     * 
     * Not all media sinks support this method. If the media sink does not support this method, the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics">IMFMediaSink::GetCharacteristics</a> method returns the MEDIASINK_FIXED_STREAMS flag.
     * 
     * In some cases, the media sink supports this method but does not allow every stream sink to be removed. (For example, it might not allow stream 0 to be removed.)
     * @param {Integer} dwStreamSinkIdentifier Identifier of the stream to remove. The stream identifier is defined when you call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> to add the stream sink.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This particular stream sink cannot be removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream number is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink has not been initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_STREAMSINKS_FIXED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This media sink has a fixed set of stream sinks. Stream sinks cannot be removed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-removestreamsink
     */
    RemoveStreamSink(dwStreamSinkIdentifier) {
        result := ComCall(5, this, "uint", dwStreamSinkIdentifier, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the number of stream sinks on this media sink.
     * @returns {Integer} Receives the number of stream sinks.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-getstreamsinkcount
     */
    GetStreamSinkCount() {
        result := ComCall(6, this, "uint*", &pcStreamSinkCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcStreamSinkCount
    }

    /**
     * Gets a stream sink, specified by index.
     * @remarks
     * Enumerating stream sinks is not a thread-safe operation, because stream sinks can be added or removed between calls to this method.
     * @param {Integer} dwIndex Zero-based index of the stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkcount">IMFMediaSink::GetStreamSinkCount</a>.
     * @returns {IMFStreamSink} Receives a pointer to the stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamsink">IMFStreamSink</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyindex
     */
    GetStreamSinkByIndex(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppStreamSink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFStreamSink(ppStreamSink)
    }

    /**
     * Gets a stream sink, specified by stream identifier.
     * @remarks
     * If you add a stream sink by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method, the stream identifier is specified in the <i>dwStreamSinkIdentifier</i> parameter of that method. If the media sink has a fixed set of streams, the media sink assigns the stream identifiers.
     * 
     * To enumerate the streams by index number instead of stream identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyindex">IMFMediaSink::GetStreamSinkByIndex</a>.
     * @param {Integer} dwStreamSinkIdentifier Stream identifier of the stream sink.
     * @returns {IMFStreamSink} Receives a pointer to the stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamsink">IMFStreamSink</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyid
     */
    GetStreamSinkById(dwStreamSinkIdentifier) {
        result := ComCall(8, this, "uint", dwStreamSinkIdentifier, "ptr*", &ppStreamSink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFStreamSink(ppStreamSink)
    }

    /**
     * Sets the presentation clock on the media sink.
     * @remarks
     * During streaming, the media sink attempts to match rates with the presentation clock. Ideally, the media sink presents samples at the correct time according to the presentation clock and does not fall behind. Rateless media sinks are an exception to this rule, as they consume samples as quickly as possible and ignore the clock. If the sink is rateless, the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics">IMFMediaSink::GetCharacteristics</a> method returns the MEDIASINK_RATELESS flag.
     * 
     * The presentation clock must have a time source. Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-settimesource">IMFPresentationClock::SetTimeSource</a> on the presentation clock to set the presentation time source. Some media sinks provide time sources; therefore, the media sink might be the time source for its own presentation clock. Regardless of what object provides the time source, however, the media sink must attempt to match rates with the clock specified in <i>pPresentationClock</i>. If a media sink cannot match rates with an external time source, the media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics">IMFMediaSink::GetCharacteristics</a> method retrieves the MEDIASINK_CANNOT_MATCH_CLOCK flag. In this case, <b>SetPresentationClock</b> will still succeed, but the results will not be optimal. The sink might not render samples quickly enough to match rates with the presentation clock.
     * 
     * If <i>pPresentationClock</i> is non-<b>NULL</b>, the media sink must register for clock state notifications, by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-addclockstatesink">IMFPresentationClock::AddClockStateSink</a> on the presentation clock. If the method is called again with a new presentation clock, or if <i>pPresentationClock</i> is <b>NULL</b>, the media sink must call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-removeclockstatesink">IMFPresentationClock::RemoveClockStateSink</a> to deregister itself from the previous clock.
     * 
     * All media sinks must support this method.
     * @param {IMFPresentationClock} pPresentationClock Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface of the presentation clock, or <b>NULL</b>. If the value is <b>NULL</b>, the media sink stops listening to the presentation clock that was previously set, if any.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_CLOCK_NO_TIME_SOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presentation clock does not have a time source. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-settimesource">SetTimeSource</a> on the presentation clock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-setpresentationclock
     */
    SetPresentationClock(pPresentationClock) {
        result := ComCall(9, this, "ptr", pPresentationClock, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the presentation clock that was set on the media sink.
     * @returns {IMFPresentationClock} Receives a pointer to the presentation clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-getpresentationclock
     */
    GetPresentationClock() {
        result := ComCall(10, this, "ptr*", &ppPresentationClock := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFPresentationClock(ppPresentationClock)
    }

    /**
     * Shuts down the media sink and releases the resources it is using.
     * @remarks
     * If the application creates the media sink, it is responsible for calling <b>Shutdown</b> to avoid memory or resource leaks. In most applications, however, the application creates an activation object for the media sink, and the Media Session uses that object to create the media sink. In that case, the Media Session — not the application — shuts down the media sink. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/activation-objects">Activation Objects</a>.)
     * 
     * After this method returns, all methods on the media sink return MF_E_SHUTDOWN,  except for <b>IUnknown</b> methods and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventgenerator">IMFMediaEventGenerator</a> methods. The sink will not raise any events after this method is called.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink was shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediasink-shutdown
     */
    Shutdown() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
