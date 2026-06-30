#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_HEALTH.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_LUN_TYPE.ahk
#Include .\VDS_LUN_STATUS.ahk
#Include .\VDS_TRANSITION_STATE.ahk

/**
 * The VDS_LUN_PROP structure (vdshwprv.h) defines the properties of a LUN object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method returns 
 *     this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_lun_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_LUN_PROP extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * The GUID of the LUN object.
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
     * The size of the LUN, in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The name of the LUN; a zero-terminated, human-readable string.
     * @type {PWSTR}
     */
    pwszFriendlyName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The unique LUN identifier; a zero-terminated, human-readable string.
     * @type {PWSTR}
     */
    pwszIdentification {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A list specifying the computers on the network to be granted access the LUN; a semicolon-delimited, 
     *       NULL-terminated, human-readable string. 
     * 
     * If the value is "*", all computers on the network are to be granted 
     *       access to the LUN. If the value is "", no computers are to be granted access to the LUN.
     * 
     * <div class="alert"><b>Note</b>  In practice, if the value is "*", most hardware providers only grant the ports and initiators on the local computer access to the LUN.</div>
     * <div> </div>
     * If "*" or "" is specified, no other value can be specified.
     * 
     * For Fibre Channel networks and serial attached SCSI (SAS) networks, each entry is a 64-bit World-Wide Name (WWN) of each port to which the LUN is unmasked, 
     *        formatted as a hexadecimal string (16 characters long), most significant byte first. For 
     *        example, a WWN address of 01:23:45:67:89:AB:CD:EF is represented as "0123456789ABCDEF". For more information, see the T10 specifications for <a href="https://t10.org/drafts.htm#FibreChannel">Fibre Channel</a> and <a href="https://t10.org/drafts.htm#SCSI3_SAS">SAS</a>.
     * 
     * For iSCSI networks, each entry is an iSCSI qualified name (IQN) of each initiator to which the LUN is unmasked. A LUN unmasked 
     *        to a particular initiator is considered to be associated with that initiator.
     * 
     * <div class="alert"><b>Note</b>  The unmasking list can contain the same WWN or IQN more than once. Duplicates are ignored.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    pwszUnmaskingList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The LUN flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The LUN type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a>.
     * @type {VDS_LUN_TYPE}
     */
    type {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * The status of the LUN object enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_status">VDS_LUN_STATUS</a>.
     * @type {VDS_LUN_STATUS}
     */
    status {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the LUN. The following are the valid values for this member.
     * @type {VDS_HEALTH}
     */
    health {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * The transition state of the LUN enumerated by
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_transition_state">VDS_TRANSITION_STATE</a>.
     * @type {VDS_TRANSITION_STATE}
     */
    TransitionState {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * The rebuild priority of the LUN object. A value between 0 (lowest priority) and 15 (highest priority).
     * @type {Integer}
     */
    sRebuildPriority {
        get => NumGet(this, 68, "short")
        set => NumPut("short", value, this, 68)
    }
}
