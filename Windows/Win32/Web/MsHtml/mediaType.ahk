#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class mediaType extends Win32Enum {

    /**
     * Native name: mediaTypeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: mediaTypeAll
     * @type {Integer (Int32)}
     */
    static All => 511

    /**
     * Native name: mediaTypeAural
     * @type {Integer (Int32)}
     */
    static Aural => 1

    /**
     * Native name: mediaTypeBraille
     * @type {Integer (Int32)}
     */
    static Braille => 2

    /**
     * Native name: mediaTypeEmbossed
     * @type {Integer (Int32)}
     */
    static Embossed => 4

    /**
     * Native name: mediaTypeHandheld
     * @type {Integer (Int32)}
     */
    static Handheld => 8

    /**
     * Native name: mediaTypePrint
     * @type {Integer (Int32)}
     */
    static Print => 16

    /**
     * Native name: mediaTypeProjection
     * @type {Integer (Int32)}
     */
    static Projection => 32

    /**
     * Native name: mediaTypeScreen
     * @type {Integer (Int32)}
     */
    static Screen => 64

    /**
     * Native name: mediaTypeTty
     * @type {Integer (Int32)}
     */
    static Tty => 128

    /**
     * Native name: mediaTypeTv
     * @type {Integer (Int32)}
     */
    static Tv => 256

    /**
     * Native name: mediaType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
