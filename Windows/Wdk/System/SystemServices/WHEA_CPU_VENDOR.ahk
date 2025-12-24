#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_CPU_VENDOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaCpuVendorOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaCpuVendorIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaCpuVendorAmd => 2
}
