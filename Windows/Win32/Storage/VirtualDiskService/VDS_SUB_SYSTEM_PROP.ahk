#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a subsystem object.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-getproperties">IVdsSubSystem::GetProperties</a> 
  *     method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/subsystem-object">subsystem object</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_sub_system_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SUB_SYSTEM_PROP extends Win32Struct
{
    static sizeof => 48

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
     * The name of the subsystem, typically a brand name and a model name; a zero-terminated, human-readable 
     *       string.
     * @type {Pointer<Char>}
     */
    pwszFriendlyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The subsystem identifier; a zero-terminated, human-readable string.
     * @type {Pointer<Char>}
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_status">VDS_SUB_SYSTEM_STATUS</a> enumeration value that specifies the status of the subsystem object.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the subsystem. The following are the valid values for this member.
     * @type {Integer}
     */
    health {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * The number of buses (or "channels") that the subsystem contains.
     * @type {Integer}
     */
    sNumberOfInternalBuses {
        get => NumGet(this, 40, "short")
        set => NumPut("short", value, this, 40)
    }

    /**
     * The maximum number of slots that each of the buses can include. Each slot can accommodate one drive. The subsystem 
     *       model assumes that each bus has the same maximum number of slots.
     * @type {Integer}
     */
    sMaxNumberOfSlotsEachBus {
        get => NumGet(this, 42, "short")
        set => NumPut("short", value, this, 42)
    }

    /**
     * The maximum number of controllers that the subsystem can contain.
     * @type {Integer}
     */
    sMaxNumberOfControllers {
        get => NumGet(this, 44, "short")
        set => NumPut("short", value, this, 44)
    }

    /**
     * The rebuild priority of the LUNs that belong to the subsystem. This value can range from 0 (lowest priority) through 15 (highest priority).
     * @type {Integer}
     */
    sRebuildPriority {
        get => NumGet(this, 46, "short")
        set => NumPut("short", value, this, 46)
    }
}
