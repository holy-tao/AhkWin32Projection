#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a version for an item or a change unit.
 * @remarks
 * 
 * A change that is made directly to a replica, such as a change that is made by a local application, will not have a version for the change in the synchronization metadata. A version that is created for such a change must contain the following elements:
 * 
 * <ul>
 * <li>The replica key of the local replica. This will typically be zero.</li>
 * <li>The current value of the tick count of the local replica.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ns-winsync-sync_version
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_VERSION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The replica key that is associated with the version.
     * @type {Integer}
     */
    dwLastUpdatingReplicaKey {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The tick count that is associated with the version.
     * @type {Integer}
     */
    ullTickCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
