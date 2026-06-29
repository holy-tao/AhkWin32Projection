#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_ISCSI_TARGET_PROP structure (vdshwprv.h) defines the properties of an iSCSI target.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_target_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_TARGET_PROP {
    #StructPack 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the target.
     */
    id : Guid

    /**
     * A null-terminated, human-readable string that is the iSCSI name of the target.
     */
    pwszIscsiName : PWSTR

    /**
     * A null-terminated, human-readable string that is the friendly name of the target. This corresponds to the 
     *      iSCSI alias.
     */
    pwszFriendlyName : PWSTR

    /**
     * If <b>TRUE</b>, a CHAP shared secret is required to login to this target.
     */
    bChapEnabled : BOOL

}
