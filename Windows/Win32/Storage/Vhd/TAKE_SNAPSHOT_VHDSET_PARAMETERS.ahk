#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains snapshot parameters, indicating information about the new snapshot to be created.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-take_snapshot_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class TAKE_SNAPSHOT_VHDSET_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-take_snapshot_vhdset_version">TAKE_SNAPSHOT_VHDSET_VERSION</a> enumeration that is the discriminant for the union.
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
}
