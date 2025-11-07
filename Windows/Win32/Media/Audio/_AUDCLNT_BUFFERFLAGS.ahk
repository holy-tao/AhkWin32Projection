#Requires AutoHotkey v2.0.0 64-bit

/**
 * The _AUDCLNT_BUFFERFLAGS enumeration defines flags that indicate the status of an audio endpoint buffer.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer">IAudioCaptureClient::GetBuffer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudiorenderclient-releasebuffer">IAudioRenderClient::ReleaseBuffer</a> methods use the constants defined in the <b>_AUDCLNT_BUFFERFLAGS</b> enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/ne-audioclient-_audclnt_bufferflags
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class _AUDCLNT_BUFFERFLAGS{

    /**
     * The data in the packet is not correlated with the previous packet's device position; this is possibly due to a stream state transition or timing glitch.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_BUFFERFLAGS_DATA_DISCONTINUITY => 1

    /**
     * Treat all of the data in the packet as silence and ignore the actual data values. For more information about the use of this flag, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a> and <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/capturing-a-stream">Capturing a Stream</a>.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_BUFFERFLAGS_SILENT => 2

    /**
     * The time at which the device's stream position was recorded is uncertain. Thus, the client might be unable to accurately set the time stamp for the current data packet.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_BUFFERFLAGS_TIMESTAMP_ERROR => 4
}
