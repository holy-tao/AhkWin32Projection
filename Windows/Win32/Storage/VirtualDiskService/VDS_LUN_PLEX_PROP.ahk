#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_TRANSITION_STATE.ahk" { VDS_TRANSITION_STATE }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import ".\VDS_LUN_PLEX_STATUS.ahk" { VDS_LUN_PLEX_STATUS }
#Import ".\VDS_LUN_PLEX_TYPE.ahk" { VDS_LUN_PLEX_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_LUN_PLEX_PROP structure (vdshwprv.h) defines the properties of a LUN plex object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-getproperties">IVdsLunPlex::GetProperties</a> method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-plex-object">LUN plex object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_lun_plex_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_LUN_PLEX_PROP {
    #StructPack 8

    /**
     * The GUID of the plex object.
     */
    id : Guid

    /**
     * The size of the plex, in bytes. The size of the plex can be equal to or greater than that of the LUN to which the plex belongs. The plex cannot be smaller than the LUN.
     */
    ullSize : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_lun_plex_type">VDS_LUN_PLEX_TYPE</a> enumeration value that specifies the type of the plex. The type of the plex is not required to match the type of the LUN to which it belongs.
     */
    type : VDS_LUN_PLEX_TYPE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_lun_plex_status">VDS_LUN_PLEX_STATUS</a> enumeration value that specifies the status of the plex. The status of the plex is not required to match the status of the LUN to which it belongs.
     */
    status : VDS_LUN_PLEX_STATUS

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a>
     */
    health : VDS_HEALTH

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_transition_state">VDS_TRANSITION_STATE</a> enumeration value that specifies the transition state of the plex.  The transition state of the plex is not required to match that of the LUN to which the plex belongs.
     */
    TransitionState : VDS_TRANSITION_STATE

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_lun_plex_flag">VDS_LUN_PLEX_FLAG</a> enumeration values that describe the plex.
     */
    ulFlags : UInt32

    /**
     * The stripe interleave size, in bytes. This member is valid only for plexes of type <b>VDS_LPT_STRIPE</b> (striped) and <b>VDS_LPT_PARITY</b> (striped with parity). For other plex types, this member should be zero.
     */
    ulStripeSize : UInt32

    /**
     * The rebuild priority of the plex. This value must be greater than or equal to 0 (lowest priority) and less than or equal to 15 (highest priority).
     */
    sRebuildPriority : Int16

}
