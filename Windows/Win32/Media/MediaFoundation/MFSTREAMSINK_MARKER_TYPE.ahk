#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines stream marker information for the IMFStreamSink::PlaceMarker method.
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows/desktop/medfound/streaming-audio-renderer">Streaming Audio Renderer</a> receives an <b>MFSTREAMSINK_MARKER_TICK</b> marker, it inserts silence to cover the gap in the data.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfstreamsink_marker_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSTREAMSINK_MARKER_TYPE{

    /**
     * This marker is for the application's use and does not convey any information to the stream sink.
     * @type {Integer (Int32)}
     */
    static MFSTREAMSINK_MARKER_DEFAULT => 0

    /**
     * This marker indicates the end of a segment within a presentation. There might be a gap in the stream until the next segment starts. There is no data associated with this marker.
     * @type {Integer (Int32)}
     */
    static MFSTREAMSINK_MARKER_ENDOFSEGMENT => 1

    /**
     * This marker indicates that there is a gap in the stream. The marker data is a <b>LONGLONG</b> value (VT_I8) that specifies the time for the missing sample. The next sample received after this marker might but will not necessarily have the discontinuity flag: the data might remain continuous after the time gap. This marker corresponds to an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamtick">MEStreamTick</a> event from the stream.
     * @type {Integer (Int32)}
     */
    static MFSTREAMSINK_MARKER_TICK => 2

    /**
     * This marker contains a media event. The marker data is a pointer to the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface (VT_UNKNOWN).
     * @type {Integer (Int32)}
     */
    static MFSTREAMSINK_MARKER_EVENT => 3
}
