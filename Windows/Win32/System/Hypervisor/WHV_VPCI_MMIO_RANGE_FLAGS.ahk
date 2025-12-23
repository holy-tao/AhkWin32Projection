#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_VPCI_MMIO_RANGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciMmioRangeFlagReadAccess => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciMmioRangeFlagWriteAccess => 2
}
