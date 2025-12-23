#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageCodecFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsEncoder => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsDecoder => 2

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSupportBitmap => 4

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSupportVector => 8

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSeekableEncode => 16

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsBlockingDecode => 32

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsBuiltin => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSystem => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsUser => 262144
}
