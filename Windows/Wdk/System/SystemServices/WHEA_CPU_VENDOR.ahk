#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_CPU_VENDOR extends Win32Enum {

    /**
     * Native name: WheaCpuVendorOther
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Native name: WheaCpuVendorIntel
     * @type {Integer (Int32)}
     */
    static Intel => 1

    /**
     * Native name: WheaCpuVendorAmd
     * @type {Integer (Int32)}
     */
    static Amd => 2
}
