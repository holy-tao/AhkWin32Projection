#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VSS_SNAPSHOT_COMPATIBILITY enumeration indicates which volume control or file I/O operations are disabled for the volume that has been shadow copied.
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_snapshot_compatibility
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_SNAPSHOT_COMPATIBILITY{

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
