#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSDEGRADE_STANDARD extends Win32Enum {

    /**
     * Native name: KSDEGRADE_STANDARD_SAMPLE
     * @type {Integer (Int32)}
     */
    static SAMPLE => 0

    /**
     * Native name: KSDEGRADE_STANDARD_QUALITY
     * @type {Integer (Int32)}
     */
    static QUALITY => 1

    /**
     * Native name: KSDEGRADE_STANDARD_COMPUTATION
     * @type {Integer (Int32)}
     */
    static COMPUTATION => 2

    /**
     * Native name: KSDEGRADE_STANDARD_SKIP
     * @type {Integer (Int32)}
     */
    static SKIP => 3
}
