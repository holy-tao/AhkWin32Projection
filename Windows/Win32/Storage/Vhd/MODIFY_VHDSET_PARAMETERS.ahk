#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MODIFY_VHDSET_VERSION.ahk

/**
 * Contains VHD Set modification parameters, indicating how the VHD Set should be altered.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-modify_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
class MODIFY_VHDSET_PARAMETERS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * A value from the MODIFY_VHDSET_VERSION enumeration that determines that is the discriminant for the union.
     * @type {MODIFY_VHDSET_VERSION}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _SnapshotPath extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

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

        /**
         * @type {PWSTR}
         */
        SnapshotFilePath {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    }

    /**
     * @type {_SnapshotPath}
     */
    SnapshotPath {
        get {
            if(!this.HasProp("__SnapshotPath"))
                this.__SnapshotPath := MODIFY_VHDSET_PARAMETERS._SnapshotPath(8, this)
            return this.__SnapshotPath
        }
    }

    /**
     * @type {Guid}
     */
    SnapshotId {
        get {
            if(!this.HasProp("__SnapshotId"))
                this.__SnapshotId := Guid(8, this)
            return this.__SnapshotId
        }
    }

    /**
     * @type {PWSTR}
     */
    DefaultFilePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
