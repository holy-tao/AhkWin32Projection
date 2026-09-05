#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_COPY_MACROVISION_LEVEL extends Win32Enum {

    /**
     * Native name: KS_MACROVISION_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Native name: KS_MACROVISION_LEVEL1
     * @type {Integer (Int32)}
     */
    static LEVEL1 => 1

    /**
     * Native name: KS_MACROVISION_LEVEL2
     * @type {Integer (Int32)}
     */
    static LEVEL2 => 2

    /**
     * Native name: KS_MACROVISION_LEVEL3
     * @type {Integer (Int32)}
     */
    static LEVEL3 => 3
}
