#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\APPLY_SNAPSHOT_VHDSET_VERSION.ahk

/**
 * Contains snapshot parameters, indicating information about the new snapshot to be applied.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-apply_snapshot_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
class APPLY_SNAPSHOT_VHDSET_PARAMETERS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-apply_snapshot_vhdset_version">APPLY_SNAPSHOT_VHDSET_VERSION</a> 
     *      enumeration that specifies the version of the 
     *      <b>APPLY_SNAPSHOT_VHDSET_PARAMETERS</b> structure being passed to or from the VHD functions.
     * @type {APPLY_SNAPSHOT_VHDSET_VERSION}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        SnapshotId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        LeafSnapshotId {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    /**
     * @type {_Version1}
     */
    Version1 {
        get {
            if(!this.HasProp("__Version1"))
                this.__Version1 := APPLY_SNAPSHOT_VHDSET_PARAMETERS._Version1(8, this)
            return this.__Version1
        }
    }
}
