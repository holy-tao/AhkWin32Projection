#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class AUDIOLOOPBACK_TAPPOINT_TYPE extends Win32Enum {

    /**
     * Native name: AUDIOLOOPBACK_TAPPOINT_PREVOLUMEMUTE
     * @type {Integer (Int32)}
     */
    static PREVOLUMEMUTE => 0

    /**
     * Native name: AUDIOLOOPBACK_TAPPOINT_POSTVOLUMEMUTE
     * @type {Integer (Int32)}
     */
    static POSTVOLUMEMUTE => 1
}
