#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorCallingConvention extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_VARARG => 5

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_FIELD => 6

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_LOCAL_SIG => 7

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_PROPERTY => 8

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_UNMGD => 9

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_GENERICINST => 10

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_NATIVEVARARG => 11

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_MAX => 12

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_MASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_HASTHIS => 32

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_EXPLICITTHIS => 64

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_GENERIC => 16
}
