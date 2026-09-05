#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class GUEST_OS_VENDOR extends Win32Enum {

    /**
     * Native name: GuestOsVendorUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: GuestOsVendorMicrosoft
     * @type {Integer (Int32)}
     */
    static Microsoft => 1

    /**
     * Native name: GuestOsVendorHPE
     * @type {Integer (Int32)}
     */
    static VendorHPE => 2

    /**
     * Native name: GuestOsVendorLANCOM
     * @type {Integer (Int32)}
     */
    static VendorLANCOM => 512
}
