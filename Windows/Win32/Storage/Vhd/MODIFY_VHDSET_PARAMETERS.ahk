#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains VHD Set modification parameters, indicating how the VHD Set should be altered.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-modify_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MODIFY_VHDSET_PARAMETERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A value from the MODIFY_VHDSET_VERSION enumeration that determines that is the discriminant for the union.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _SnapshotPath extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        SnapshotId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {PWSTR}
         */
        SnapshotFilePath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    /**
     * @type {_SnapshotPath}
     */
    SnapshotPath{
        get {
            if(!this.HasProp("__SnapshotPath"))
                this.__SnapshotPath := %this.__Class%._SnapshotPath(8, this)
            return this.__SnapshotPath
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    SnapshotId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    DefaultFilePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
