#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_HRTF_FILTER_METHOD extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DIRECT_FORM => 0

    /**
     * @type {Integer (Int32)}
     */
    static CASCADE_FORM => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSDS3D_FILTER_METHOD_COUNT => 2
}
