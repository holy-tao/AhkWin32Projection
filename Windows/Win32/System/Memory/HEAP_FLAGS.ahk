#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class HEAP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: HEAP_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: HEAP_NO_SERIALIZE
     * @type {Integer (UInt32)}
     */
    static NO_SERIALIZE => 1

    /**
     * Native name: HEAP_GROWABLE
     * @type {Integer (UInt32)}
     */
    static GROWABLE => 2

    /**
     * Native name: HEAP_GENERATE_EXCEPTIONS
     * @type {Integer (UInt32)}
     */
    static GENERATE_EXCEPTIONS => 4

    /**
     * Native name: HEAP_ZERO_MEMORY
     * @type {Integer (UInt32)}
     */
    static ZERO_MEMORY => 8

    /**
     * Native name: HEAP_REALLOC_IN_PLACE_ONLY
     * @type {Integer (UInt32)}
     */
    static REALLOC_IN_PLACE_ONLY => 16

    /**
     * Native name: HEAP_TAIL_CHECKING_ENABLED
     * @type {Integer (UInt32)}
     */
    static TAIL_CHECKING_ENABLED => 32

    /**
     * Native name: HEAP_FREE_CHECKING_ENABLED
     * @type {Integer (UInt32)}
     */
    static FREE_CHECKING_ENABLED => 64

    /**
     * Native name: HEAP_DISABLE_COALESCE_ON_FREE
     * @type {Integer (UInt32)}
     */
    static DISABLE_COALESCE_ON_FREE => 128

    /**
     * Native name: HEAP_CREATE_ALIGN_16
     * @type {Integer (UInt32)}
     */
    static CREATE_ALIGN_16 => 65536

    /**
     * Native name: HEAP_CREATE_ENABLE_TRACING
     * @type {Integer (UInt32)}
     */
    static CREATE_ENABLE_TRACING => 131072

    /**
     * Native name: HEAP_CREATE_ENABLE_EXECUTE
     * @type {Integer (UInt32)}
     */
    static CREATE_ENABLE_EXECUTE => 262144

    /**
     * Native name: HEAP_MAXIMUM_TAG
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_TAG => 4095

    /**
     * Native name: HEAP_PSEUDO_TAG_FLAG
     * @type {Integer (UInt32)}
     */
    static PSEUDO_TAG_FLAG => 32768

    /**
     * Native name: HEAP_TAG_SHIFT
     * @type {Integer (UInt32)}
     */
    static TAG_SHIFT => 18

    /**
     * Native name: HEAP_CREATE_SEGMENT_HEAP
     * @type {Integer (UInt32)}
     */
    static CREATE_SEGMENT_HEAP => 256

    /**
     * Native name: HEAP_CREATE_HARDENED
     * @type {Integer (UInt32)}
     */
    static CREATE_HARDENED => 512
}
