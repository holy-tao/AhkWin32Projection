#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class GUEST_OS_VENDOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsVendorUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsVendorMicrosoft => 1

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsVendorHPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsVendorLANCOM => 512
}
