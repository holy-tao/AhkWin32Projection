#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_HEALTH.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_LUN_PLEX_TYPE.ahk
#Include .\VDS_TRANSITION_STATE.ahk
#Include .\VDS_LUN_PLEX_STATUS.ahk

/**
 * The VDS_LUN_PLEX_PROP structure (vdshwprv.h) defines the properties of a LUN plex object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-getproperties">IVdsLunPlex::GetProperties</a> method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-plex-object">LUN plex object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_lun_plex_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_LUN_PLEX_PROP extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * The GUID of the plex object.
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * The size of the plex, in bytes. The size of the plex can be equal to or greater than that of the LUN to which the plex belongs. The plex cannot be smaller than the LUN.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_lun_plex_type">VDS_LUN_PLEX_TYPE</a> enumeration value that specifies the type of the plex. The type of the plex is not required to match the type of the LUN to which it belongs.
     * @type {VDS_LUN_PLEX_TYPE}
     */
    type {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_lun_plex_status">VDS_LUN_PLEX_STATUS</a> enumeration value that specifies the status of the plex. The status of the plex is not required to match the status of the LUN to which it belongs.
     * @type {VDS_LUN_PLEX_STATUS}
     */
    status {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a>
     * @type {VDS_HEALTH}
     */
    health {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_transition_state">VDS_TRANSITION_STATE</a> enumeration value that specifies the transition state of the plex.  The transition state of the plex is not required to match that of the LUN to which the plex belongs.
     * @type {VDS_TRANSITION_STATE}
     */
    TransitionState {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_lun_plex_flag">VDS_LUN_PLEX_FLAG</a> enumeration values that describe the plex.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The stripe interleave size, in bytes. This member is valid only for plexes of type <b>VDS_LPT_STRIPE</b> (striped) and <b>VDS_LPT_PARITY</b> (striped with parity). For other plex types, this member should be zero.
     * @type {Integer}
     */
    ulStripeSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The rebuild priority of the plex. This value must be greater than or equal to 0 (lowest priority) and less than or equal to 15 (highest priority).
     * @type {Integer}
     */
    sRebuildPriority {
        get => NumGet(this, 48, "short")
        set => NumPut("short", value, this, 48)
    }
}
