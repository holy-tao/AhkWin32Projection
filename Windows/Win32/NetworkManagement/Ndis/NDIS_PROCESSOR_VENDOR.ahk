#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PROCESSOR_VENDOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorVendorUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorVendorGenuinIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorVendorGenuineIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorVendorAuthenticAMD => 2
}
