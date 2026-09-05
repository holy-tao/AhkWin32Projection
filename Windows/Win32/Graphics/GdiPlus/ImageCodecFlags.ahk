#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ImageCodecFlags extends Win32Enum {

    /**
     * Native name: ImageCodecFlagsEncoder
     * @type {Integer (Int32)}
     */
    static Encoder => 1

    /**
     * Native name: ImageCodecFlagsDecoder
     * @type {Integer (Int32)}
     */
    static Decoder => 2

    /**
     * Native name: ImageCodecFlagsSupportBitmap
     * @type {Integer (Int32)}
     */
    static SupportBitmap => 4

    /**
     * Native name: ImageCodecFlagsSupportVector
     * @type {Integer (Int32)}
     */
    static SupportVector => 8

    /**
     * Native name: ImageCodecFlagsSeekableEncode
     * @type {Integer (Int32)}
     */
    static SeekableEncode => 16

    /**
     * Native name: ImageCodecFlagsBlockingDecode
     * @type {Integer (Int32)}
     */
    static BlockingDecode => 32

    /**
     * Native name: ImageCodecFlagsBuiltin
     * @type {Integer (Int32)}
     */
    static Builtin => 65536

    /**
     * Native name: ImageCodecFlagsSystem
     * @type {Integer (Int32)}
     */
    static System => 131072

    /**
     * Native name: ImageCodecFlagsUser
     * @type {Integer (Int32)}
     */
    static User => 262144
}
