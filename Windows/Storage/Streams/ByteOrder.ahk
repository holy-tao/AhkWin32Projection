#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the byte order of a stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.byteorder
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class ByteOrder extends Win32Enum{

    /**
     * The least significant byte (lowest address) is stored first.
     * @type {Integer (Int32)}
     */
    static LittleEndian => 0

    /**
     * The most significant byte (highest address) is stored first.
     * @type {Integer (Int32)}
     */
    static BigEndian => 1
}
