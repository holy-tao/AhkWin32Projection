#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_PROPERTY_TYPE enumeration (msclus.h) defines the property types that are supported by a cluster property list.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_property_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_PROPERTY_TYPE extends Win32Enum{

    /**
     * The property type is unknown.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_UNKNOWN => -1

    /**
     * Designates the data value as the last entry in a property or value list.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_ENDMARK => 0

    /**
     * Describes a data value in a property list. For example, in the property list passed to a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-functions">control code function</a> for a property validation 
     *       operation, <b>CLUSPROP_TYPE_LIST_VALUE</b> is the required type to be included with each 
     *       property value.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_LIST_VALUE => 1

    /**
     * Describes resource class information. A resource class value is described with a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_resource_class">CLUSPROP_RESOURCE_CLASS</a> 
     *        structure. Resource classes are returned when an application calls 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> or 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypecontrol">ClusterResourceTypeControl</a> with one of 
     *        the following control codes:
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-class-info">CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-required-dependencies">CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES</a>
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_RESCLASS => 2

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_RESERVED1 => 3

    /**
     * Describes a data value used as a name, such as a property name. A name value is represented by a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368382(v=vs.85)">CLUSPROP_PROPERTY_NAME</a> 
     *       structure.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_NAME => 4

    /**
     * Describes a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/physical-disks-signature">Signature</a> property for 
     *       a disk resource. A signature value is represented by a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368374(v=vs.85)">CLUSPROP_DISK_SIGNATURE</a> structure.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_SIGNATURE => 5

    /**
     * Describes an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-address">Address</a> 
     *       property for an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> resource. A SCSI 
     *       address value is represented by a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_scsi_address">CLUSPROP_SCSI_ADDRESS</a> 
     *       structure.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_SCSI_ADDRESS => 6

    /**
     * Describes the number value of a disk resource. A disk number value is represented by a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_dword">CLUSPROP_DISK_NUMBER</a> 
     *       structure.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_DISK_NUMBER => 7

    /**
     * Describes a collection of information about a disk resource, such as its device name and volume label. 
     *       Partition data is represented by a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info">CLUSPROP_PARTITION_INFO</a> 
     *       structure.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_PARTITION_INFO => 8

    /**
     * Describes <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> set information.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_FTSET_INFO => 9

    /**
     * Describes the serial number of a disk resource.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_DISK_SERIALNUMBER => 10

    /**
     * Describes the <b>GUID</b> of a disk resource.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_DISK_GUID => 11

    /**
     * Describes the total size of a disk in bytes.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_DISK_SIZE => 12

    /**
     * Describes a collection of information about a disk resource, such as its device name and volume label. 
     *       Partition data is represented by a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info_ex">CLUSPROP_PARTITION_INFO_EX</a> 
     *       structure.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_PARTITION_INFO_EX => 13

    /**
     * Describes a collection of information about a disk resource, such as its device name and volume label. 
     *       Partition data is represented by a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info_ex2">CLUSPROP_PARTITION_INFO_EX2</a>  
     *       structure.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available until Windows Server 2016 .
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_PARTITION_INFO_EX2 => 14

    /**
     * Describes descriptor data for a storage class resource.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available until Windows Server 2016 .
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_STORAGE_DEVICE_ID_DESCRIPTOR => 15

    /**
     * Describes the beginning of the range for users to define their own types. Associate this type with 
     *       user-defined private properties.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_TYPE_USER => 32768
}
