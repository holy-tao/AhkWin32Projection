#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_VPCI_DEVICE_REGISTER_SPACE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciConfigSpace => -1

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciBar0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciBar1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciBar2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciBar3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciBar4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciBar5 => 5
}
