#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSSTATE_STOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSSTATE_ACQUIRE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSSTATE_PAUSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSSTATE_RUN => 3
}
