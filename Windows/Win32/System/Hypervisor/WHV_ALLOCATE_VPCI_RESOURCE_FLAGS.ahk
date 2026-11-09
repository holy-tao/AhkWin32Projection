#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_ALLOCATE_VPCI_RESOURCE_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static WHvAllocateVpciResourceFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvAllocateVpciResourceFlagAllowDirectP2P => 1
}
