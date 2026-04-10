#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPIN_DATAFLOW extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_DATAFLOW_IN => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_DATAFLOW_OUT => 2
}
