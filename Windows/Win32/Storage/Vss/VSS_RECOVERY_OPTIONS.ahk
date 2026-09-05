#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by a requester to specify how a resynchronization operation is to be performed.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_recovery_options
 * @namespace Windows.Win32.Storage.Vss
 */
class VSS_RECOVERY_OPTIONS extends Win32Enum {

    /**
     * After the resynchronization operation is complete, the signature of each target LUN  should be identical to that of the original LUN that was used to create the shadow copy.
     * Native name: VSS_RECOVERY_REVERT_IDENTITY_ALL
     * @type {Integer (Int32)}
     */
    static REVERT_IDENTITY_ALL => 256

    /**
     * Volume safety checks should not be performed.
     * Native name: VSS_RECOVERY_NO_VOLUME_CHECK
     * @type {Integer (Int32)}
     */
    static NO_VOLUME_CHECK => 512
}
