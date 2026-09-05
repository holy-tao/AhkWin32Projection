#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSRESET extends Win32Enum {

    /**
     * Native name: KSRESET_BEGIN
     * @type {Integer (Int32)}
     */
    static BEGIN => 0

    /**
     * Native name: KSRESET_END
     * @type {Integer (Int32)}
     */
    static END => 1
}
