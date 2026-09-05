#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class EXpsCompressionOptions extends Win32Enum {

    /**
     * Native name: Compression_NotCompressed
     * @type {Integer (Int32)}
     */
    static NotCompressed => 0

    /**
     * Native name: Compression_Normal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: Compression_Small
     * @type {Integer (Int32)}
     */
    static Small => 2

    /**
     * Native name: Compression_Fast
     * @type {Integer (Int32)}
     */
    static Fast => 3
}
