#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSMETHOD_STREAMIO extends Win32Enum {

    /**
     * Native name: KSMETHOD_STREAMIO_READ
     * @type {Integer (Int32)}
     */
    static READ => 0

    /**
     * Native name: KSMETHOD_STREAMIO_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 1
}
