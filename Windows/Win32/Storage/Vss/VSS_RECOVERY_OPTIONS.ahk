#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by a requester to specify how a resynchronization operation is to be performed.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_recovery_options
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_RECOVERY_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * After the resynchronization operation is complete, the signature of each target LUN  should be identical to that of the original LUN that was used to create the shadow copy.
     * @type {Integer (Int32)}
     */
    static VSS_RECOVERY_REVERT_IDENTITY_ALL => 256

    /**
     * Volume safety checks should not be performed.
     * @type {Integer (Int32)}
     */
    static VSS_RECOVERY_NO_VOLUME_CHECK => 512
}
