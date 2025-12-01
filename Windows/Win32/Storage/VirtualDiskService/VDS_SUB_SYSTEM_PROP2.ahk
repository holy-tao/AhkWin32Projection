#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_SUB_SYSTEM_PROP2 structure (vdshwprv.h) defines the properties of a subsystem object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-getproperties2">IVdsSubSystem2::GetProperties2</a> 
 *     method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/subsystem-object">subsystem object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SUB_SYSTEM_PROP2 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The GUID of the subsystem object.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a <b>NULL</b>-terminated wide-character string containing the name of the subsystem, typically a brand name and a model name.
     * @type {PWSTR}
     */
    pwszFriendlyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <b>NULL</b>-terminated wide-character string containing a combination of the  disk array's serial number and the subsystem identifier.
     * @type {PWSTR}
     */
    pwszIdentification {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A bitmask of one or more   
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration values.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The set of stripe sizes supported by a provider for striped volumes and/or LUNs. A stripe size must be a 
     *       power of 2. Each bit in the 32-bit integer represents a size, in bytes. For example, if the <i>n</i>th 
     *       bit is set, then VDS supports stripe size of 2^<i>n</i>. Thus, bits 0 through 31 can specify 
     *       2^0 through 2^31.
     * @type {Integer}
     */
    ulStripeSizeFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A bitmask of  <a href="https://docs.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_sub_system_supported_raid_type_flag">VDS_SUB_SYSTEM_SUPPORTED_RAID_TYPE_FLAG</a> enumeration values specifying the RAID levels that the subsystem supports.  The default value for this member is zero. A value of zero means that no RAID levels are supported.
     * @type {Integer}
     */
    ulSupportedRaidTypeFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_status">VDS_SUB_SYSTEM_STATUS</a> enumeration value that specifies the status of the subsystem object.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the subsystem. The following are the valid values for this member.
     * @type {Integer}
     */
    health {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The number of buses (or "channels") that the subsystem contains.
     * @type {Integer}
     */
    sNumberOfInternalBuses {
        get => NumGet(this, 44, "short")
        set => NumPut("short", value, this, 44)
    }

    /**
     * The maximum number of slots that each of the buses can include. Each slot can accommodate one drive. The subsystem 
     *       model assumes that each bus has the same maximum number of slots.
     * @type {Integer}
     */
    sMaxNumberOfSlotsEachBus {
        get => NumGet(this, 46, "short")
        set => NumPut("short", value, this, 46)
    }

    /**
     * The maximum number of controllers that the subsystem can contain.
     * @type {Integer}
     */
    sMaxNumberOfControllers {
        get => NumGet(this, 48, "short")
        set => NumPut("short", value, this, 48)
    }

    /**
     * The rebuild priority of the LUNs that belong to the subsystem. This value can range from 0 (lowest priority) through 15 (highest priority).
     * @type {Integer}
     */
    sRebuildPriority {
        get => NumGet(this, 50, "short")
        set => NumPut("short", value, this, 50)
    }

    /**
     * The number of enclosures in the subsystem. The default value for this member is zero. A value of zero indicates that this property is not available for this subsystem.
     * @type {Integer}
     */
    ulNumberOfEnclosures {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
