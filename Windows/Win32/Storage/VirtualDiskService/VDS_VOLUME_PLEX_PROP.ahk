#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_TRANSITION_STATE.ahk" { VDS_TRANSITION_STATE }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import ".\VDS_VOLUME_PLEX_STATUS.ahk" { VDS_VOLUME_PLEX_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_VOLUME_PLEX_TYPE.ahk" { VDS_VOLUME_PLEX_TYPE }

/**
 * Defines the properties of a volume plex object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumeplex-getproperties">IVdsVolumePlex::GetProperties</a> method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-plex-object">volume plex object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_volume_plex_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_VOLUME_PLEX_PROP {
    #StructPack 8

    /**
     * The GUID of the plex object.
     */
    id : Guid

    /**
     * The plex type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_plex_type">VDS_VOLUME_PLEX_TYPE</a>. The type of the plex is not required to match the type of the volume to which the plex belongs.
     */
    type : VDS_VOLUME_PLEX_TYPE

    /**
     * The status of the plex object enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_plex_status">VDS_VOLUME_PLEX_STATUS</a>. The status of the plex is not required to match the status of the volume to which the plex belongs.
     */
    status : VDS_VOLUME_PLEX_STATUS

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the plex.  The health state of the plex is not required to match the health state of the volume to which the plex belongs.
     */
    health : VDS_HEALTH

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_transition_state">VDS_TRANSITION_STATE</a> enumeration value that specifies the transition state of the plex.
     */
    TransitionState : VDS_TRANSITION_STATE

    /**
     * The size of the plex, in bytes. The size of the plex must be greater than or equal to that of the volume to which the plex belongs. The plex cannot be smaller than the volume.
     */
    ullSize : Int64

    /**
     * The stripe interleave size, in bytes. This member is valid only for plexes of type <b>VDS_VPT_STRIPE</b> (striped) and <b>VDS_VPT_PARITY</b> (striped with parity). For other plex types, this member should be zero.
     */
    ulStripeSize : UInt32

    /**
     * The number of members in the volume plex. A plex member is a collection of concatenated disk extents contained on one more disks.
     */
    ulNumberOfMembers : UInt32

}
