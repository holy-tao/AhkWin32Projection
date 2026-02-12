#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the read options for an input stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inputstreamoptions
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class InputStreamOptions extends Win32BitflagEnum{

    /**
     * No options are specified.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The asynchronous read operation completes when one or more bytes is available.
     * @type {Integer (UInt32)}
     */
    static Partial => 1

    /**
     * The asynchronous read operation may optionally read ahead and prefetch additional bytes.
     * @type {Integer (UInt32)}
     */
    static ReadAhead => 2
}
