#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains snapshot deletion parameters, designating which snapshot to delete from the VHD Set.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-delete_snapshot_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class DELETE_SNAPSHOT_VHDSET_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-delete_snapshot_vhdset_version">DELETE_SNAPSHOT_VHDSET_VERSION</a> enumeration that is the discriminant for the union.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        SnapshotId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {_Version1}
     */
    Version1{
        get {
            if(!this.HasProp("__Version1"))
                this.__Version1 := %this.__Class%._Version1(8, this)
            return this.__Version1
        }
    }
}
