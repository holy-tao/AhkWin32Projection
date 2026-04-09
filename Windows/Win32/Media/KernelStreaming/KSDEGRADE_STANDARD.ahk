#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSDEGRADE_STANDARD extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSDEGRADE_STANDARD_SAMPLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSDEGRADE_STANDARD_QUALITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSDEGRADE_STANDARD_COMPUTATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSDEGRADE_STANDARD_SKIP => 3
}
