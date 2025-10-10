#Requires AutoHotkey v2.0.0 64-bit

/**
 * The KSJACK_SINK_CONNECTIONTYPE enumeration defines constants that specify the type of connection. These values are used in the KSJACK_SINK_INFORMATION structure that stores information about an audio jack sink.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/ne-devicetopology-ksjack_sink_connectiontype
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSJACK_SINK_CONNECTIONTYPE{

    /**
     * High-Definition Multimedia Interface (HDMI) connection.
     * @type {Integer (Int32)}
     */
    static KSJACK_SINK_CONNECTIONTYPE_HDMI => 0

    /**
     * Display port.
     * @type {Integer (Int32)}
     */
    static KSJACK_SINK_CONNECTIONTYPE_DISPLAYPORT => 1
}
