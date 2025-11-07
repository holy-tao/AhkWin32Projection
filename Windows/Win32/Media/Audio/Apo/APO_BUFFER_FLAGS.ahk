#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the buffer validation flags for the APO_CONNECTION_PROPERTY structure associated with each APO connection.
 * @remarks
 * 
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioapotypes/ne-audioapotypes-apo_buffer_flags
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_BUFFER_FLAGS{

    /**
     * There is no valid data in  the connection
 *     buffer. The buffer pointer is valid and the buffer is capable of holding the amount of valid audio data specified in the <a href="https://docs.microsoft.com/windows/desktop/api/audioapotypes/ns-audioapotypes-apo_connection_property">APO_CONNECTION_PROPERTY</a> structure.
 *     While processing audio data, the audio engine marks every connection as BUFFER_INVALID before calling <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudiooutputendpointrt-getoutputdatapointer">IAudioOutputEndpoint::GetOutputDataPointer</a> or
 *     <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-getinputdatapointer">IAudioInputEndpointRT::GetInputDataPointer</a>.
     * @type {Integer (Int32)}
     */
    static BUFFER_INVALID => 0

    /**
     * The connection buffer contains valid data. This is the operational state of the connection buffer. The APO sets this flag after it
 *     starts writing valid data into the buffer.
 * Capture endpoints should set this flag in the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-getinputdatapointer">GetInputDataPointer</a> method upon successful completion of the call.
     * @type {Integer (Int32)}
     */
    static BUFFER_VALID => 1

    /**
     * The connection buffer must be treated as if it contains silence.
 *     If the endpoint receives an input connection buffer that is identified as BUFFER_SILENT, then the endpoint can assume the data represents silence. When capturing, the endpoint can also set this flag, if necessary for a capture buffer.
     * @type {Integer (Int32)}
     */
    static BUFFER_SILENT => 2
}
