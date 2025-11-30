#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class HEAP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_NO_SERIALIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_GROWABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_GENERATE_EXCEPTIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_ZERO_MEMORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_REALLOC_IN_PLACE_ONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_TAIL_CHECKING_ENABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_FREE_CHECKING_ENABLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_DISABLE_COALESCE_ON_FREE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_ALIGN_16 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_ENABLE_TRACING => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_ENABLE_EXECUTE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_MAXIMUM_TAG => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_PSEUDO_TAG_FLAG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_TAG_SHIFT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_SEGMENT_HEAP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_HARDENED => 512
}
