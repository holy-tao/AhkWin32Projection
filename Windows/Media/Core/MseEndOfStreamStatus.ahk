#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status at the end of stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mseendofstreamstatus
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MseEndOfStreamStatus extends Win32Enum{

    /**
     * End of stream was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * End of stream had a network error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 1

    /**
     * End of stream had a decode error.
     * @type {Integer (Int32)}
     */
    static DecodeError => 2

    /**
     * End of stream had an unknown error.
     * @type {Integer (Int32)}
     */
    static UnknownError => 3
}
