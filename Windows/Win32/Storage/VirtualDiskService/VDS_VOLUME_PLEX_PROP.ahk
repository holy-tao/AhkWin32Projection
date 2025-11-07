#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a volume plex object.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumeplex-getproperties">IVdsVolumePlex::GetProperties</a>method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-plex-object">volume plex object</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_volume_plex_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VOLUME_PLEX_PROP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The GUID of the plex object.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The plex type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_plex_type">VDS_VOLUME_PLEX_TYPE</a>. The type of the plex is not required to match the type of the volume to which the plex belongs.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The status of the plex object enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_plex_status">VDS_VOLUME_PLEX_STATUS</a>. The status of the plex is not required to match the status of the volume to which the plex belongs.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the plex.  The health state of the plex is not required to match the health state of the volume to which the plex belongs.
     * @type {Integer}
     */
    health {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_transition_state">VDS_TRANSITION_STATE</a> enumeration value that specifies the transition state of the plex.
     * @type {Integer}
     */
    TransitionState {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The size of the plex, in bytes. The size of the plex must be greater than or equal to that of the volume to which the plex belongs. The plex cannot be smaller than the volume.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The stripe interleave size, in bytes. This member is valid only for plexes of type <b>VDS_VPT_STRIPE</b> (striped) and <b>VDS_VPT_PARITY</b> (striped with parity). For other plex types, this member should be zero.
     * @type {Integer}
     */
    ulStripeSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of members in the volume plex. A plex member is a collection of concatenated disk extents contained on one more disks.
     * @type {Integer}
     */
    ulNumberOfMembers {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
