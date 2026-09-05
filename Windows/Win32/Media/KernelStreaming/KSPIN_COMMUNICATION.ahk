#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPIN_COMMUNICATION extends Win32Enum {

    /**
     * Native name: KSPIN_COMMUNICATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: KSPIN_COMMUNICATION_SINK
     * @type {Integer (Int32)}
     */
    static SINK => 1

    /**
     * Native name: KSPIN_COMMUNICATION_SOURCE
     * @type {Integer (Int32)}
     */
    static SOURCE => 2

    /**
     * Native name: KSPIN_COMMUNICATION_BOTH
     * @type {Integer (Int32)}
     */
    static BOTH => 3

    /**
     * Native name: KSPIN_COMMUNICATION_BRIDGE
     * @type {Integer (Int32)}
     */
    static BRIDGE => 4
}
