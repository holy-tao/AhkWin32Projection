#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains VHD Set modification parameters, indicating how the VHD Set should be altered.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-modify_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MODIFY_VHDSET_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value from the MODIFY_VHDSET_VERSION enumeration that determines that is the discriminant for the union.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
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
    SnapshotFilePath{
        get {
            if(!this.HasProp("__SnapshotFilePath"))
                this.__SnapshotFilePath := PWSTR(this.ptr + 16)
            return this.__SnapshotFilePath
        }
    }

    /**
     * @type {PWSTR}
     */
    DefaultFilePath{
        get {
            if(!this.HasProp("__DefaultFilePath"))
                this.__DefaultFilePath := PWSTR(this.ptr + 8)
            return this.__DefaultFilePath
        }
    }
}
