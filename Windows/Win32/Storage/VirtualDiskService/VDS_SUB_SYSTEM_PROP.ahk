#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_SUB_SYSTEM_STATUS.ahk" { VDS_SUB_SYSTEM_STATUS }

/**
 * The VDS_SUB_SYSTEM_PROP structure (vdshwprv.h) defines the properties of a subsystem object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-getproperties">IVdsSubSystem::GetProperties</a> 
 *     method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/subsystem-object">subsystem object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_SUB_SYSTEM_PROP {
    #StructPack 8

    /**
     * The GUID of the subsystem object.
     */
    id : Guid

    /**
     * The name of the subsystem, typically a brand name and a model name; a zero-terminated, human-readable 
     *       string.
     */
    pwszFriendlyName : PWSTR

    /**
     * The subsystem identifier; a zero-terminated, human-readable string.
     */
    pwszIdentification : PWSTR

    /**
     * A bitmask of one or more   
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration values.
     */
    ulFlags : UInt32

    /**
     * The set of stripe sizes supported by a provider for striped volumes and/or LUNs. A stripe size must be a 
     *       power of 2. Each bit in the 32-bit integer represents a size, in bytes. For example, if the <i>n</i>th 
     *       bit is set, then VDS supports stripe size of 2^<i>n</i>. Thus, bits 0 through 31 can specify 
     *       2^0 through 2^31.
     */
    ulStripeSizeFlags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_status">VDS_SUB_SYSTEM_STATUS</a> enumeration value that specifies the status of the subsystem object.
     */
    status : VDS_SUB_SYSTEM_STATUS

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the subsystem. The following are the valid values for this member.
     */
    health : VDS_HEALTH

    /**
     * The number of buses (or "channels") that the subsystem contains.
     */
    sNumberOfInternalBuses : Int16

    /**
     * The maximum number of slots that each of the buses can include. Each slot can accommodate one drive. The subsystem 
     *       model assumes that each bus has the same maximum number of slots.
     */
    sMaxNumberOfSlotsEachBus : Int16

    /**
     * The maximum number of controllers that the subsystem can contain.
     */
    sMaxNumberOfControllers : Int16

    /**
     * The rebuild priority of the LUNs that belong to the subsystem. This value can range from 0 (lowest priority) through 15 (highest priority).
     */
    sRebuildPriority : Int16

}
