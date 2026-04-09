#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSMETHOD_STREAMIO extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_STREAMIO_READ => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_STREAMIO_WRITE => 1
}
