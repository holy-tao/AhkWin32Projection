#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DELETE_SNAPSHOT_VHDSET_VERSION.ahk

/**
 * Contains snapshot deletion parameters, designating which snapshot to delete from the VHD Set.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-delete_snapshot_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
class DELETE_SNAPSHOT_VHDSET_PARAMETERS extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_version">DELETE_SNAPSHOT_VHDSET_VERSION</a> enumeration that is the discriminant for the union.
     * @type {DELETE_SNAPSHOT_VHDSET_VERSION}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Guid}
         */
        SnapshotId {
            get {
                if(!this.HasProp("__SnapshotId"))
                    this.__SnapshotId := Guid(0, this)
                return this.__SnapshotId
            }
        }
    }

    /**
     * @type {_Version1}
     */
    Version1 {
        get {
            if(!this.HasProp("__Version1"))
                this.__Version1 := DELETE_SNAPSHOT_VHDSET_PARAMETERS._Version1(4, this)
            return this.__Version1
        }
    }
}
