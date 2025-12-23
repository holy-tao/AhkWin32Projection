#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class FDEX_PROP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanGet => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotGet => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanPut => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotPut => 8

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanPutRef => 16

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotPutRef => 32

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropNoSideEffects => 64

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropDynamicType => 128

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanCall => 256

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotCall => 512

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanConstruct => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotConstruct => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanSourceEvents => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotSourceEvents => 8192
}
