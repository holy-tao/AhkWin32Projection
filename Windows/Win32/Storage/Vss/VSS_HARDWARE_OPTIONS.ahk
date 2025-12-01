#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines shadow copy LUN flags.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_hardware_options
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_HARDWARE_OPTIONS extends Win32Enum{

    /**
     * The shadow copy LUN will be masked from the host.
     * @type {Integer (Int32)}
     */
    static VSS_BREAKEX_FLAG_MASK_LUNS => 1

    /**
     * The shadow copy LUN will be exposed to the host as a read-write volume.
     * @type {Integer (Int32)}
     */
    static VSS_BREAKEX_FLAG_MAKE_READ_WRITE => 2

    /**
     * The disk identifiers of all of the shadow copy LUNs will be reverted to that of the original LUNs. However, if any of the original LUNs are present on the system, the operation will fail and none of the identifiers will be reverted.
     * @type {Integer (Int32)}
     */
    static VSS_BREAKEX_FLAG_REVERT_IDENTITY_ALL => 4

    /**
     * None of the disk identifiers of the shadow copy LUNs will be reverted.
     * @type {Integer (Int32)}
     */
    static VSS_BREAKEX_FLAG_REVERT_IDENTITY_NONE => 8

    /**
     * The shadow copy LUNs will be converted permanently to read-write. This flag is set only as a notification for the provider; no provider action is required. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onlunstatechange">IVssHardwareSnapshotProviderEx::OnLunStateChange</a> method.
     * @type {Integer (Int32)}
     */
    static VSS_ONLUNSTATECHANGE_NOTIFY_READ_WRITE => 256

    /**
     * The shadow copy LUNs will be converted temporarily to read-write and are about to undergo TxF recovery or VSS auto-recovery. This flag is set only as a notification for the provider; no provider action is required. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onlunstatechange">IVssHardwareSnapshotProviderEx::OnLunStateChange</a> method.
     * @type {Integer (Int32)}
     */
    static VSS_ONLUNSTATECHANGE_NOTIFY_LUN_PRE_RECOVERY => 512

    /**
     * The shadow copy LUNs have just undergone TxF recovery or VSS auto-recovery and have been converted back to read-only. This flag is set only as a notification for the provider; no provider action is required. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onlunstatechange">IVssHardwareSnapshotProviderEx::OnLunStateChange</a> method.
     * @type {Integer (Int32)}
     */
    static VSS_ONLUNSTATECHANGE_NOTIFY_LUN_POST_RECOVERY => 1024

    /**
     * The provider must mask shadow copy LUNs from this computer. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/vsprov/nf-vsprov-ivsshardwaresnapshotproviderex-onlunstatechange">IVssHardwareSnapshotProviderEx::OnLunStateChange</a> method.
     * @type {Integer (Int32)}
     */
    static VSS_ONLUNSTATECHANGE_DO_MASK_LUNS => 2048
}
