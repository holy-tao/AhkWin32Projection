#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSINTERFACE_STANDARD extends Win32Enum {

    /**
     * Native name: KSINTERFACE_STANDARD_STREAMING
     * @type {Integer (Int32)}
     */
    static STREAMING => 0

    /**
     * Native name: KSINTERFACE_STANDARD_LOOPED_STREAMING
     * @type {Integer (Int32)}
     */
    static LOOPED_STREAMING => 1

    /**
     * Native name: KSINTERFACE_STANDARD_CONTROL
     * @type {Integer (Int32)}
     */
    static CONTROL => 2
}
