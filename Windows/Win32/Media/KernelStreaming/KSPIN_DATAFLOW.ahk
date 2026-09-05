#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPIN_DATAFLOW extends Win32Enum {

    /**
     * Native name: KSPIN_DATAFLOW_IN
     * @type {Integer (Int32)}
     */
    static IN => 1

    /**
     * Native name: KSPIN_DATAFLOW_OUT
     * @type {Integer (Int32)}
     */
    static OUT => 2
}
