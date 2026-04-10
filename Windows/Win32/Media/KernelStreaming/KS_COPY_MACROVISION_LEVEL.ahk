#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_COPY_MACROVISION_LEVEL extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KS_MACROVISION_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MACROVISION_LEVEL1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MACROVISION_LEVEL2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MACROVISION_LEVEL3 => 3
}
