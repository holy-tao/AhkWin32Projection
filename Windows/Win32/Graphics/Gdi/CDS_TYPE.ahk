#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class CDS_TYPE extends Win32BitflagEnum {

    /**
     * Native name: CDS_FULLSCREEN
     * @type {Integer (UInt32)}
     */
    static FULLSCREEN => 4

    /**
     * Native name: CDS_GLOBAL
     * @type {Integer (UInt32)}
     */
    static GLOBAL => 8

    /**
     * Native name: CDS_NORESET
     * @type {Integer (UInt32)}
     */
    static NORESET => 268435456

    /**
     * Native name: CDS_RESET
     * @type {Integer (UInt32)}
     */
    static RESET => 1073741824

    /**
     * Native name: CDS_SET_PRIMARY
     * @type {Integer (UInt32)}
     */
    static SET_PRIMARY => 16

    /**
     * Native name: CDS_TEST
     * @type {Integer (UInt32)}
     */
    static TEST => 2

    /**
     * Native name: CDS_UPDATEREGISTRY
     * @type {Integer (UInt32)}
     */
    static UPDATEREGISTRY => 1

    /**
     * Native name: CDS_VIDEOPARAMETERS
     * @type {Integer (UInt32)}
     */
    static VIDEOPARAMETERS => 32

    /**
     * Native name: CDS_ENABLE_UNSAFE_MODES
     * @type {Integer (UInt32)}
     */
    static ENABLE_UNSAFE_MODES => 256

    /**
     * Native name: CDS_DISABLE_UNSAFE_MODES
     * @type {Integer (UInt32)}
     */
    static DISABLE_UNSAFE_MODES => 512

    /**
     * Native name: CDS_RESET_EX
     * @type {Integer (UInt32)}
     */
    static RESET_EX => 536870912
}
