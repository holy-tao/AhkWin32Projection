#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TAKE_SNAPSHOT_VHDSET_VERSION.ahk" { TAKE_SNAPSHOT_VHDSET_VERSION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains snapshot parameters, indicating information about the new snapshot to be created.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-take_snapshot_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct TAKE_SNAPSHOT_VHDSET_PARAMETERS {
    #StructPack 4


    struct _Version1 {
        SnapshotId : Guid

    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-take_snapshot_vhdset_version">TAKE_SNAPSHOT_VHDSET_VERSION</a> enumeration that is the discriminant for the union.
     */
    Version : TAKE_SNAPSHOT_VHDSET_VERSION

    Version1 : TAKE_SNAPSHOT_VHDSET_PARAMETERS._Version1

}
