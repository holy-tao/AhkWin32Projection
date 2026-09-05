#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_PROCESSOR_VENDOR extends Win32Enum {

    /**
     * Native name: NdisProcessorVendorUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: NdisProcessorVendorGenuinIntel
     * @type {Integer (Int32)}
     */
    static GenuinIntel => 1

    /**
     * Native name: NdisProcessorVendorGenuineIntel
     * @type {Integer (Int32)}
     */
    static GenuineIntel => 1

    /**
     * Native name: NdisProcessorVendorAuthenticAMD
     * @type {Integer (Int32)}
     */
    static AuthenticAMD => 2
}
