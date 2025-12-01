#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the type of controller or namespace information that will be returned in the Controller or Namespace Structure (CNS) member of the NVME_CDW10_IDENTIFY structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_identify_cns_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_CNS_CODES extends Win32Enum{

    /**
     * Information for a specific namespace will be returned.
     * 
     * The Identify Namespace [NVME_IDENTIFY_NAMESPACE_DATA](../nvme/ns-nvme-nvme_identify_namespace_data.md) structure is returned to the host for the namespace specified in the Namespace Identifier (**NSID**) member of the [NVME_COMMAND](ns-nvme-nvme_command.md) structure, if the namespace is attached to this controller.
     * 
     * If the specified namespace is an inactive namespace ID, then the controller returns a zero filled data structure.
     * 
     * If the controller supports Namespace Management and **NSID** is set to `FFFFFFFFh`, the controller returns an **NVME_IDENTIFY_NAMESPACE_DATA** that specifies capabilities that are common across namespaces.
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_SPECIFIC_NAMESPACE => 0

    /**
     * Information for a controller will be returned to the host in an Identify Controller [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_CONTROLLER => 1

    /**
     * A list of active namespaces will be returned.
     * 
     * A list of up to 1024 active namespace IDs is returned to the host containing active namespaces with a namespace identifier greater than the value specified in the **NSID** member of the **NVME_COMMAND** structure.
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_ACTIVE_NAMESPACES => 2

    /**
     * Information for a descriptor namespace will be returned.
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_DESCRIPTOR_NAMESPACE => 3

    /**
     * An [NVM_SET_LIST](ns-nvme-nvm_set_list.md) will be returned.
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_NVM_SET => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_SPECIFIC_NAMESPACE_IO_COMMAND_SET => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_SPECIFIC_CONTROLLER_IO_COMMAND_SET => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_ACTIVE_NAMESPACE_LIST_IO_COMMAND_SET => 7

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_ALLOCATED_NAMESPACE_LIST => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_ALLOCATED_NAMESPACE => 17

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_CONTROLLER_LIST_OF_NSID => 18

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_CONTROLLER_LIST_OF_NVM_SUBSYSTEM => 19

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_PRIMARY_CONTROLLER_CAPABILITIES => 20

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_SECONDARY_CONTROLLER_LIST => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_NAMESPACE_GRANULARITY_LIST => 22

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_UUID_LIST => 23

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_DOMAIN_LIST => 24

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_ENDURANCE_GROUP_LIST => 25

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_ALLOCATED_NAMSPACE_LIST_IO_COMMAND_SET => 26

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_ALLOCATED_NAMESPACE_IO_COMMAND_SET => 27

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFY_CNS_IO_COMMAND_SET => 28
}
