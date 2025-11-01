#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to build or parse a property list or, a value list.
 * @remarks
 * 
  * The <b>CLUSPROP_BUFFER_HELPER</b> structure is useful 
  *      in working with property and value lists. Applications can use a generic 
  *      <b>CLUSPROP_BUFFER_HELPER</b> pointer to advance by 
  *      offsets through the entries of a property list or value list, retrieving or setting values without having to cast 
  *      to the appropriate data type.
  * 
  * An alternate structure, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a>, 
  *      can also be used to work with multiple properties.
  * 
  * Use caution when referencing large integer values in <b>DWORD</b>-aligned structures 
  *      such as value lists, property lists, and 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/parameter-blocks">parameter blocks</a>. For Windows Server for Itanium-based 
  *      systems, a naturally-aligned large integer value always begins on an address ending in 0 or 8h. 
  *      <b>DWORD</b> alignment can cause large values to begin on unaligned boundaries (addresses 
  *      ending in 4h or C), which will cause an alignment fault when the data is read or written. You can avoid alignment 
  *      faults by handling the high and low parts of large values separately, or by using local variables, which are 
  *      guaranteed to be naturally aligned.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_buffer_helper
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_BUFFER_HELPER extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * Pointer to a buffer containing an array of bytes.
     * @type {Pointer<Integer>}
     */
    pb {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a buffer containing an array of <b>WORD</b> values.
     * @type {Pointer<Integer>}
     */
    pw {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a buffer containing an array of <b>DWORD</b> values.
     * @type {Pointer<Integer>}
     */
    pdw {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a buffer containing an array of signed <b>long</b> values.
     * @type {Pointer<Integer>}
     */
    pl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a buffer containing a <b>NULL</b>-terminated Unicode string value.
     * @type {PWSTR}
     */
    psz {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_list">CLUSPROP_LIST</a> structure describing the 
     *        beginning of a property list.
     * @type {Pointer<CLUSPROP_LIST>}
     */
    pList {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_syntax">CLUSPROP_SYNTAX</a> structure describing 
     *        the format and type of a value.
     * @type {Pointer<CLUSPROP_SYNTAX>}
     */
    pSyntax {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368382(v=vs.85)">CLUSPROP_PROPERTY_NAME</a> 
     *        structure containing a property name value.
     * @type {Pointer<CLUSPROP_SZ>}
     */
    pName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_value">CLUSPROP_VALUE</a> structure describing the 
     *        format, type, and length of a data value.
     * @type {Pointer<CLUSPROP_VALUE>}
     */
    pValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_binary">CLUSPROP_BINARY</a> structure containing a 
     *        binary data value.
     * @type {Pointer<CLUSPROP_BINARY>}
     */
    pBinaryValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_word">CLUSPROP_WORD</a> structure containing a 
     *        numeric value.
     * @type {Pointer<CLUSPROP_WORD>}
     */
    pWordValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368375(v=vs.85)">CLUSPROP_DWORD</a> structure containing a 
     *        numeric value.
     * @type {Pointer<CLUSPROP_DWORD>}
     */
    pDwordValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_long">CLUSPROP_LONG</a> structure containing a 
     *        signed long value.
     * @type {Pointer<CLUSPROP_LONG>}
     */
    pLongValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_ularge_integer">CLUSPROP_ULARGE_INTEGER</a> 
     *        structure containing an unsigned large integer value.
     * @type {Pointer<CLUSPROP_ULARGE_INTEGER>}
     */
    pULargeIntegerValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_large_integer">CLUSPROP_LARGE_INTEGER</a> 
     *        structure containing a large integer value.
     * @type {Pointer<CLUSPROP_LARGE_INTEGER>}
     */
    pLargeIntegerValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368390(v=vs.85)">CLUSPROP_SZ</a> structure containing a 
     *        <b>NULL</b>-terminated Unicode string value.
     * @type {Pointer<CLUSPROP_SZ>}
     */
    pStringValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_sz">CLUSPROP_MULTI_SZ</a> structure 
     *        containing multiple null-terminated Unicode string values.
     * @type {Pointer<CLUSPROP_SZ>}
     */
    pMultiSzValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_security_descriptor">CLUSPROP_SECURITY_DESCRIPTOR</a> structure 
     *        containing a security descriptor.
     * @type {Pointer<CLUSPROP_SECURITY_DESCRIPTOR>}
     */
    pSecurityDescriptor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_resource_class">CLUSPROP_RESOURCE_CLASS</a> 
     *        structure containing a resource class value.
     * @type {Pointer<CLUSPROP_RESOURCE_CLASS>}
     */
    pResourceClassValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_resource_class_info">CLUSPROP_RESOURCE_CLASS_INFO</a> structure 
     *        containing a resource class information value.
     * @type {Pointer<CLUSPROP_RESOURCE_CLASS_INFO>}
     */
    pResourceClassInfoValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368374(v=vs.85)">CLUSPROP_DISK_SIGNATURE</a> 
     *        structure containing a disk signature value.
     * @type {Pointer<CLUSPROP_DWORD>}
     */
    pDiskSignatureValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_scsi_address">CLUSPROP_SCSI_ADDRESS</a> 
     *        structure containing an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/s-gly">SCSI</a> 
     *        address value.
     * @type {Pointer<CLUSPROP_SCSI_ADDRESS>}
     */
    pScsiAddressValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_dword">CLUSPROP_DISK_NUMBER</a> structure 
     *        containing a disk number value.
     * @type {Pointer<CLUSPROP_DWORD>}
     */
    pDiskNumberValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info">CLUSPROP_PARTITION_INFO</a> 
     *        structure containing a partition information value.
     * @type {Pointer<CLUSPROP_PARTITION_INFO>}
     */
    pPartitionInfoValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_required_dependency">CLUSPROP_REQUIRED_DEPENDENCY</a> structure 
     *        containing a resource dependency value.
     * @type {Pointer<CLUSPROP_REQUIRED_DEPENDENCY>}
     */
    pRequiredDependencyValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info_ex">CLUSPROP_PARTITION_INFO_EX</a> structure 
     *        containing a partition information value.
     * @type {Pointer<CLUSPROP_PARTITION_INFO_EX>}
     */
    pPartitionInfoValueEx {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info_ex2">CLUSPROP_PARTITION_INFO_EX2</a> structure 
     *        that contains a partition information value.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This member is not available before Windows Server 2016.
     * @type {Pointer<CLUSPROP_PARTITION_INFO_EX2>}
     */
    pPartitionInfoValueEx2 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_filetime">CLUSPROP_FILETIME</a> structure 
     *        containing a date/time value.
     * @type {Pointer<CLUSPROP_FILETIME>}
     */
    pFileTimeValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
