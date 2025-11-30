#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class EXpsCompressionOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Compression_NotCompressed => 0

    /**
     * @type {Integer (Int32)}
     */
    static Compression_Normal => 1

    /**
     * @type {Integer (Int32)}
     */
    static Compression_Small => 2

    /**
     * @type {Integer (Int32)}
     */
    static Compression_Fast => 3
}
