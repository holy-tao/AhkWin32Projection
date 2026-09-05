#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class WAIT_EVENT extends Win32Enum {

    /**
     * Native name: WAIT_OBJECT_0
     * @type {Integer (UInt32)}
     */
    static OBJECT_0 => 0

    /**
     * Native name: WAIT_ABANDONED
     * @type {Integer (UInt32)}
     */
    static ABANDONED => 128

    /**
     * Native name: WAIT_ABANDONED_0
     * @type {Integer (UInt32)}
     */
    static ABANDONED_0 => 128

    /**
     * Native name: WAIT_IO_COMPLETION
     * @type {Integer (UInt32)}
     */
    static IO_COMPLETION => 192

    /**
     * Native name: WAIT_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static TIMEOUT => 258

    /**
     * Native name: WAIT_FAILED
     * @type {Integer (UInt32)}
     */
    static FAILED => 4294967295
}
