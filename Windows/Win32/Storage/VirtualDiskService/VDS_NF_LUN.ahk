#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A new LUN has been created.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_lun_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_LUN extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_LUN_ARRIVE => 108

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_LUN_DEPART => 109

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_LUN_MODIFY => 110
}
