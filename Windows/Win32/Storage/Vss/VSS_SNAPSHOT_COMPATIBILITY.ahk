#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VSS_SNAPSHOT_COMPATIBILITY enumeration indicates which volume control or file I/O operations are disabled for the volume that has been shadow copied.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_snapshot_compatibility
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_SNAPSHOT_COMPATIBILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The provider managing the shadow copies for a specified volume does not support defragmentation operations 
     *       on that volume.
     * @type {Integer (Int32)}
     */
    static VSS_SC_DISABLE_DEFRAG => 1

    /**
     * The provider managing the shadow copies for a specified volume does not support content index operations on 
     *       that volume.
     * @type {Integer (Int32)}
     */
    static VSS_SC_DISABLE_CONTENTINDEX => 2
}
