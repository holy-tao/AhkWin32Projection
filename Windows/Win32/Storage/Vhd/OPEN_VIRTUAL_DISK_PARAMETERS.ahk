#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPEN_VIRTUAL_DISK_VERSION.ahk" { OPEN_VIRTUAL_DISK_VERSION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains virtual disk open request parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-open_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct OPEN_VIRTUAL_DISK_PARAMETERS {
    #StructPack 4


    struct _Version1 {
        RWDepth : UInt32

    }

    struct _Version2 {
        GetInfoOnly : BOOL

        ReadOnly : BOOL

        ResiliencyGuid : Guid

    }

    struct _Version3 {
        GetInfoOnly : BOOL

        ReadOnly : BOOL

        ResiliencyGuid : Guid

        SnapshotId : Guid

    }

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-open_virtual_disk_version">OPEN_VIRTUAL_DISK_VERSION</a> enumeration 
     *       that specifies the version of the 
     *       <b>OPEN_VIRTUAL_DISK_PARAMETERS</b> structure 
     *       being passed to or from the VHD functions.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPEN_VIRTUAL_DISK_VERSION_1"></a><a id="open_virtual_disk_version_1"></a><dl>
     * <dt><b>OPEN_VIRTUAL_DISK_VERSION_1</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>Version1</b> member of this structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPEN_VIRTUAL_DISK_VERSION_2"></a><a id="open_virtual_disk_version_2"></a><dl>
     * <dt><b>OPEN_VIRTUAL_DISK_VERSION_2</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>Version2</b> member of this structure.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Version : OPEN_VIRTUAL_DISK_VERSION

    Version1 : OPEN_VIRTUAL_DISK_PARAMETERS._Version1

    static __New() {
        DefineProp(this.Prototype, 'Version2', { type: OPEN_VIRTUAL_DISK_PARAMETERS._Version2, offset: 4 })
        DefineProp(this.Prototype, 'Version3', { type: OPEN_VIRTUAL_DISK_PARAMETERS._Version3, offset: 4 })
        this.DeleteProp("__New")
    }
}
