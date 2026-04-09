#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_VPCI_INTERRUPT_TARGET_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciInterruptTargetFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciInterruptTargetFlagMulticast => 1
}
