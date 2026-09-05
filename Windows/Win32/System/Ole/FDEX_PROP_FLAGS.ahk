#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class FDEX_PROP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: fdexPropCanGet
     * @type {Integer (UInt32)}
     */
    static CanGet => 1

    /**
     * Native name: fdexPropCannotGet
     * @type {Integer (UInt32)}
     */
    static CannotGet => 2

    /**
     * Native name: fdexPropCanPut
     * @type {Integer (UInt32)}
     */
    static CanPut => 4

    /**
     * Native name: fdexPropCannotPut
     * @type {Integer (UInt32)}
     */
    static CannotPut => 8

    /**
     * Native name: fdexPropCanPutRef
     * @type {Integer (UInt32)}
     */
    static CanPutRef => 16

    /**
     * Native name: fdexPropCannotPutRef
     * @type {Integer (UInt32)}
     */
    static CannotPutRef => 32

    /**
     * Native name: fdexPropNoSideEffects
     * @type {Integer (UInt32)}
     */
    static NoSideEffects => 64

    /**
     * Native name: fdexPropDynamicType
     * @type {Integer (UInt32)}
     */
    static DynamicType => 128

    /**
     * Native name: fdexPropCanCall
     * @type {Integer (UInt32)}
     */
    static CanCall => 256

    /**
     * Native name: fdexPropCannotCall
     * @type {Integer (UInt32)}
     */
    static CannotCall => 512

    /**
     * Native name: fdexPropCanConstruct
     * @type {Integer (UInt32)}
     */
    static CanConstruct => 1024

    /**
     * Native name: fdexPropCannotConstruct
     * @type {Integer (UInt32)}
     */
    static CannotConstruct => 2048

    /**
     * Native name: fdexPropCanSourceEvents
     * @type {Integer (UInt32)}
     */
    static CanSourceEvents => 4096

    /**
     * Native name: fdexPropCannotSourceEvents
     * @type {Integer (UInt32)}
     */
    static CannotSourceEvents => 8192
}
