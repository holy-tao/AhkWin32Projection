#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MODIFY_VHDSET_VERSION.ahk" { MODIFY_VHDSET_VERSION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains VHD Set modification parameters, indicating how the VHD Set should be altered.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-modify_vhdset_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct MODIFY_VHDSET_PARAMETERS {
    #StructPack 8


    struct _SnapshotPath {
        SnapshotId : Guid

        SnapshotFilePath : PWSTR

    }

    /**
     * A value from the MODIFY_VHDSET_VERSION enumeration that determines that is the discriminant for the union.
     */
    Version : MODIFY_VHDSET_VERSION

    SnapshotPath : MODIFY_VHDSET_PARAMETERS._SnapshotPath

    static __New() {
        DefineProp(this.Prototype, 'SnapshotId', { type: Guid, offset: 8 })
        DefineProp(this.Prototype, 'DefaultFilePath', { type: PWSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
