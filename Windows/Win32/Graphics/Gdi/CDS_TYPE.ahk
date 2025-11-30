#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class CDS_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_FULLSCREEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_GLOBAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_NORESET => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_RESET => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_SET_PRIMARY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_TEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_UPDATEREGISTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_VIDEOPARAMETERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_ENABLE_UNSAFE_MODES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_DISABLE_UNSAFE_MODES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CDS_RESET_EX => 536870912
}
