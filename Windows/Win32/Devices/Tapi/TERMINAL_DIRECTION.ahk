#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The TERMINAL_DIRECTION enumeration is used to describe the direction of the media stream with respect to the local computer or the directional capabilities of a terminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-terminal_direction
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TERMINAL_DIRECTION extends Win32Enum{

    /**
     * The stream is captured on the local computer, and the data is sent out to the remote end of the connection. When applied to a terminal, this means it can originate a stream.
     * @type {Integer (Int32)}
     */
    static TD_CAPTURE => 0

    /**
     * The stream is arriving from the remote end of the connection. When applied to a terminal, this means it can render a stream.
     * @type {Integer (Int32)}
     */
    static TD_RENDER => 1

    /**
     * The terminal can handle either capture or render streams.
     * @type {Integer (Int32)}
     */
    static TD_BIDIRECTIONAL => 2

    /**
     * Different tracks on the multi-track terminal may travel in different directions. For example, one track may specify <b>TD_RENDER</b> and another may specify <b>TD_CAPTURE</b>.
     * @type {Integer (Int32)}
     */
    static TD_MULTITRACK_MIXED => 3

    /**
     * The terminal direction is unknown or not initialized.
     * @type {Integer (Int32)}
     */
    static TD_NONE => 4
}
