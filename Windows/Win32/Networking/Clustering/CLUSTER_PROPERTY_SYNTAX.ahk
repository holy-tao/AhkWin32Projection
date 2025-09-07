#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CLUSTER_PROPERTY_SYNTAX enumeration (msclus.h) provides the possible values for the syntax structures in a property list.
 * @remarks
 * The upper 2 bytes of a <b>CLUSTER_PROPERTY_SYNTAX</b> 
  *      must be a valid <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_property_type">CLUSTER_PROPERTY_TYPE</a>. The lower 2 
  *      bytes of a <b>CLUSTER_PROPERTY_SYNTAX</b> must be a 
  *      valid <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_property_format">CLUSTER_PROPERTY_FORMAT</a>.
  * 
  * The client must not specify a syntax value of 
  *      <b>CLUSPROP_SYNTAX_LIST_VALUE_EXPANDED_SZ</b> when adding a property value to a 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a> structure. When constructing a 
  *      property list structure to return to the client, the server 
  *      must return two values for a property's value that is of syntax 
  *      <b>CLUSPROP_SYNTAX_LIST_VALUE_EXPAND_SZ</b>: the first value is of syntax 
  *      <b>CLUSPROP_SYNTAX_LIST_VALUE_EXPAND_SZ</b>, containing the property value, as it is stored 
  *      on the server, and the second is of syntax <b>CLUSPROP_SYNTAX_LIST_VALUE_EXPANDED_SZ</b> 
  *      which is the same property value where each embedded environment variable has been replaced by its value, as 
  *      stored on the server.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_property_syntax
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_PROPERTY_SYNTAX{

    /**
     * Marks the end of a value list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_ENDMARK => 0

    /**
     * Describes a property name, such as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources-name">Name</a> 
 *        property for resources and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes-nodename">NodeName</a> property for 
 *        nodes. A property name is represented by a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368382(v=vs.85)">CLUSPROP_PROPERTY_NAME</a> structure.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_NAME => 262147

    /**
     * Describes a resource class value. A resource class value is represented by a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_resource_class">CLUSPROP_RESOURCE_CLASS</a> structure.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_RESCLASS => 131074

    /**
     * Describes a null-terminated Unicode string value in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_SZ => 65539

    /**
     * Describes a null-terminated Unicode string value with unexpanded references to environment variables in a 
 *        property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_EXPAND_SZ => 65540

    /**
     * Describes a <b>DWORD</b> value in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_DWORD => 65538

    /**
     * Describes a binary value in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_BINARY => 65537

    /**
     * Describes an array of null-terminated Unicode string values in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_MULTI_SZ => 65541

    /**
     * Describes a signed <b>long</b> value in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_LONG => 65543

    /**
     * Describes a null-terminated Unicode string value with expanded references to environment variables in a 
 *        property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_EXPANDED_SZ => 65544

    /**
     * Describes a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> in 
 *        <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> format 
 *        in a property list. For more information about self-relative security descriptors, see 
 *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/absolute-and-self-relative-security-descriptors">Absolute and Self-Relative Security Descriptors</a>.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_SECURITY_DESCRIPTOR => 65545

    /**
     * Describes a signed large integer value in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_LARGE_INTEGER => 65546

    /**
     * Describes an unsigned large integer value in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_ULARGE_INTEGER => 65542

    /**
     * Describes a <b>WORD</b> value in a property list.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_WORD => 65547

    /**
     * Describes a property list.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported until Windows Server 2016.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_PROPERTY_LIST => 65550

    /**
     * Describes a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> value in a property list.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This enumeration value is not supported until Windows Server 2016.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_LIST_VALUE_FILETIME => 65548

    /**
     * Describes a master boot record (MBR) disk signature value represented by a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368374(v=vs.85)">CLUSPROP_DISK_SIGNATURE</a> structure.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_DISK_SIGNATURE => 327682

    /**
     * Describes the address for an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> resource. IP 
 *        Address resources store this address in their 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-address">Address</a> private property. A SCSI address value 
 *        is represented by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_scsi_address">CLUSPROP_SCSI_ADDRESS</a> 
 *        structure.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_SCSI_ADDRESS => 393218

    /**
     * Describes a disk number value represented by a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_dword">CLUSPROP_DISK_NUMBER</a> structure.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_DISK_NUMBER => 458754

    /**
     * Describes a collection of information about a Physical Disk resource, such as its device name and volume 
 *        label. Partition information is represented by a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info">CLUSPROP_PARTITION_INFO</a> structure.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_PARTITION_INFO => 524289

    /**
     * Describes <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> set information.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_FTSET_INFO => 589825

    /**
     * Describes a null-terminated Unicode string value containing  a serial number of a disk resource.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_DISK_SERIALNUMBER => 655363

    /**
     * Describes a null-terminated Unicode string value containing  the <b>GUID</b> of a 
 *        <b>GUID</b> partitioning table (GPT) disk resource.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_DISK_GUID => 720899

    /**
     * Describes a unsigned large integer value containing the total size of a disk in bytes.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_DISK_SIZE => 786438

    /**
     * Describes a collection of information about a Physical Disk resource, such as its device name and volume 
 *        label. Partition information is represented by a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info_ex">CLUSPROP_PARTITION_INFO_EX</a> structure.
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_PARTITION_INFO_EX => 851969

    /**
     * Describes a collection of information about a Physical Disk resource, such as its device name and volume 
 *        label. The partition information is represented by a 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info_ex2">CLUSPROP_PARTITION_INFO_EX2</a> structure.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available until Windows Server 2016 .
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_PARTITION_INFO_EX2 => 917505

    /**
     * Describes descriptor data for a storage class resource.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available until Windows Server 2016 .
     * @type {Integer (UInt32)}
     */
    static CLUSPROP_SYNTAX_STORAGE_DEVICE_ID_DESCRIPTOR => 983041
}
