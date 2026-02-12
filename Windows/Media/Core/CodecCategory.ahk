#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the category of a codec.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.codeccategory
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class CodecCategory extends Win32Enum{

    /**
     * The codec is an encoder.
     * @type {Integer (Int32)}
     */
    static Encoder => 0

    /**
     * The codec is a decoder.
     * @type {Integer (Int32)}
     */
    static Decoder => 1
}
