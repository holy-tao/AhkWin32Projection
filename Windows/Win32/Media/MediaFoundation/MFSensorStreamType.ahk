#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether a stream associated with an IMFSensorDevice is an input or an output stream.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensorstreamtype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSensorStreamType{

    /**
     * The sensor stream type is unknown.
     * @type {Integer (Int32)}
     */
    static MFSensorStreamType_Unknown => 0

    /**
     * The sensor stream is an input stream.
     * @type {Integer (Int32)}
     */
    static MFSensorStreamType_Input => 1

    /**
     * The sensor stream is an output stream.
     * @type {Integer (Int32)}
     */
    static MFSensorStreamType_Output => 2
}
