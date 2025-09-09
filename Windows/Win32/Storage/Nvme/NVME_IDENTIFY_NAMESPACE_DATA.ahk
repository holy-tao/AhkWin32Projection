#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVM_RESERVATION_CAPABILITIES.ahk
#Include .\NVME_LBA_FORMAT.ahk

/**
 * Contains values that indicate capabilities and settings that are specific to a particular namespace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_identify_namespace_data
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_NAMESPACE_DATA extends Win32Struct
{
    static sizeof => 4168

    static packingSize => 8

    /**
     * Indicates the total size of the namespace in logical blocks.
     * 
     * A namespace of size *n* consists of Logical Block Address (LBA) `0` through `(n - 1)`. The number of logical blocks is based on the formatted LBA size. This field is undefined prior to the namespace being formatted.
     * @type {Integer}
     */
    NSZE {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the maximum number of logical blocks that may be allocated in the namespace at any point in time.
     * 
     * The number of logical blocks is based on the formatted LBA size. This field is undefined prior to the namespace being formatted.
     * 
     * The **NCAP** field is used in the case of thin provisioning and reports a value that is smaller than or equal to the Namespace Size (**NSZE**).
     * 
     * Spare LBAs are not reported as part of this field. A value of `0h` for the Namespace Capacity (**NCAP**) indicates that the namespace ID is an inactive namespace ID. A logical block is allocated when it is written with a Write or Write Uncorrectable command. A logical block may be deallocated using the [Dataset Management](ns-nvme-nvme_command.md#-field-u.datasetmanagement) command.
     * @type {Integer}
     */
    NCAP {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Indicates the current number of logical blocks allocated in the namespace.
     * 
     * The value of this field is smaller than or equal to the value of the Namespace Capacity **NCAP** field.
     * 
     * The number of logical blocks is based on the formatted LBA size. When using the NVM command set: A logical block is allocated when it is written with a Write or Write Uncorrectable command. A logical block may be deallocated using the [Dataset Management](ns-nvme-nvme_command.md#-field-u.datasetmanagement) command.
     * 
     * A controller may report a **NUSE** value equal to an **NCAP** value at all times if the product is not targeted for thin provisioning environments.
     * @type {Integer}
     */
    NUSE {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A Namespace Features (NSFEAT) structure containing fields that define features of the namespace.
     * @type {Integer}
     */
    NSFEAT {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * Defines the number of supported LBA data size and metadata size combinations supported by the namespace.
     * 
     * LBA formats are allocated in order (starting with 0) and packed sequentially. This is a 0’s based value. The maximum number of LBA formats that may be indicated as supported is 16.
     * 
     * The supported LBA formats are indicated in  the **LBAF** field (bytes 128 – 191 of this data structure). The metadata may be either transferred as part of the LBA (creating an extended LBA which is a larger LBA size that is exposed to the application) or it may be transferred as a separate contiguous buffer of data. The metadata cannot be split between the LBA and a separate metadata buffer.
     * 
     * It is recommended that software and controllers transition to an LBA size that is 4KB or larger for ECC efficiency at the controller. If providing metadata, it is recommended that at least 8 bytes are provided per logical block to enable use with end-to-end data protection.
     * @type {Integer}
     */
    NLBAF {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * A Formatted LBA Size (FLBAS) structure containing fields that indicate the LBA data size and metadata size combination that the namespace has been formatted with.
     * @type {Integer}
     */
    FLBAS {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * A Metadata Capabilities (MC) structure containing fields that indicate the capabilities for metadata.
     * @type {Integer}
     */
    MC {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * An End-to-end Data Protection Capabilities (DPC) structure containing fields that indicate the capabilities for the end-to-end data protection feature.
     * 
     * Multiple bits may be set in this field.
     * @type {Integer}
     */
    DPC {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * A End-to-end Data Protection Type Settings (DPS) structure containing fields that indicate the Type settings for the end-to-end data protection feature.
     * 
     * [NVME_PROTECTION_INFORMATION_TYPES](ne-nvme-nvme_protection_information_types.md)
     * @type {Integer}
     */
    DPS {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * A Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC) structure containing fields that specify the multi-path I/O and namespace sharing capabilities of the namespace.
     * @type {Integer}
     */
    NMIC {
        get => NumGet(this, 30, "char")
        set => NumPut("char", value, this, 30)
    }

    /**
     * A Reservation Capabilities (RESCAP) structure containing fields that specify the reservation capabilities of the namespace.
     * 
     * A value of `00h` in this field indicates that reservations are not supported by this namespace.
     * @type {NVM_RESERVATION_CAPABILITIES}
     */
    RESCAP{
        get {
            if(!this.HasProp("__RESCAP"))
                this.__RESCAP := NVM_RESERVATION_CAPABILITIES(this.ptr + 32)
            return this.__RESCAP
        }
    }

    /**
     * A Format Progress Indicator (FPI) structure containing fields that indicate the percentage of the namespace that remains to be formatted when a format operation is in progress.
     * @type {Integer}
     */
    FPI {
        get => NumGet(this, 34, "char")
        set => NumPut("char", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    DLFEAT {
        get => NumGet(this, 35, "char")
        set => NumPut("char", value, this, 35)
    }

    /**
     * Indicates the namespace specific size of the write operation guaranteed to be written atomically to the NVM during normal operation.
     * 
     * A value of `0h` indicates that the size for this namespace is the same size as that reported in the **AWUN** field of the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure. All other values specify a size in terms of logical blocks using the same encoding as the **AWUN** field.
     * @type {Integer}
     */
    NAWUN {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * Indicates the namespace specific size of the write operation guaranteed to be written atomically to the NVM during a power fail or error condition.
     * 
     * A value of `0h` indicates that the size for this namespace is the same size as that reported in the **AWUPF** field of the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure. All other values specify a size in terms of logical blocks using the same encoding as the **AWUPF** field.
     * @type {Integer}
     */
    NAWUPF {
        get => NumGet(this, 38, "ushort")
        set => NumPut("ushort", value, this, 38)
    }

    /**
     * Indicates the namespace specific size of the write operation guaranteed to be written atomically to the NVM for a Compare and Write fused command.
     * 
     * A value of `0h` indicates that the size for this namespace is the same size as that reported in the **ACWU** field of the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure. All other values specify a size in terms of logical blocks using the same encoding as the **ACWU** field.
     * @type {Integer}
     */
    NACWU {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * Indicates the atomic boundary size for this namespace for the **NAWUN** value.
     * 
     * This field is specified in logical blocks. Writes to this namespace that cross atomic boundaries are not guaranteed to be atomic to the NVM with respect to other read or write commands.
     * 
     * A value of `0h` indicates that there are no atomic boundaries for normal write operations. All other values specify a size in terms of logical blocks using the same encoding as the **AWUN** field.
     * @type {Integer}
     */
    NABSN {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * Indicates the Logical Block Address (LBA) on this namespace where the first atomic boundary starts.
     * 
     * If the **NABSN** and **NABSPF** fields are cleared to `0h`, then the **NABO** field is cleared to 0h. The value of **NABO** should be less than or equal to **NABSN** and **NABSPF**.
     * @type {Integer}
     */
    NABO {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * Indicates the atomic boundary size for this namespace specific to the Namespace Atomic Write Unit Power Fail value. 
     * 
     * This field is specified in logical blocks. Writes to this namespace that cross atomic boundaries are not guaranteed to be atomic with respect to other read or write commands and there is no guarantee of data returned on subsequent reads of the associated logical blocks.
     * 
     * A value of `0h` indicates that there are no atomic boundaries for power fail or error conditions. All other values specify a size in terms of logical blocks using the same encoding as the **AWUPF** field.
     * @type {Integer}
     */
    NABSPF {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * Indicates the Namespace Optimal IO Boundary (NOIOB).
     * @type {Integer}
     */
    NOIOB {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * Indicates the total size of the NVM allocated to this namespace.
     * 
     * The value of this field is in bytes. This field is supported if the Namespace Management and Namespace Attachment commands are supported.
     * 
     * Note: This field may not correspond to the logical block size multiplied by the Namespace Size (**NSZE**) field. Due to thin provisioning or other settings (such as, endurance), this field may be larger or smaller than the **NSZE** reported.
     * @type {Array<Byte>}
     */
    NVMCAP{
        get {
            if(!this.HasProp("__NVMCAPProxyArray"))
                this.__NVMCAPProxyArray := Win32FixedArray(this.ptr + 50, 16, Primitive, "char")
            return this.__NVMCAPProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NPWG {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * @type {Integer}
     */
    NPWA {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    NPDG {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * @type {Integer}
     */
    NPDA {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    NOWS {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }

    /**
     * @type {Integer}
     */
    MSSRL {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    MCL {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    MSRC {
        get => NumGet(this, 84, "char")
        set => NumPut("char", value, this, 84)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 85, 11, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ANAGRPID {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Bytes 192:383A are reserved.
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 100, 3, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NSATTR {
        get => NumGet(this, 103, "char")
        set => NumPut("char", value, this, 103)
    }

    /**
     * Indicates the Associated NVM Set Identifier (NVMSETID).
     * @type {Integer}
     */
    NVMSETID {
        get => NumGet(this, 104, "ushort")
        set => NumPut("ushort", value, this, 104)
    }

    /**
     * Indicates the Associated Endurance Group Identifier (ENDGID).
     * @type {Integer}
     */
    ENDGID {
        get => NumGet(this, 106, "ushort")
        set => NumPut("ushort", value, this, 106)
    }

    /**
     * Contains a 128-bit value that is globally unique and assigned to the namespace when the namespace is created.
     * 
     * The Namespace Globally Unique Identifier (**NGUID**) field remains fixed throughout the life of the namespace and is preserved across namespace and controller operations (such as controller reset and namespace format).
     * 
     * This field uses the EUI-64 based 16-byte designator format.
     * 
     * - Bytes 114:112 contain the 24-bit company_id value assigned by the IEEE Registration Authority.
     * - Bytes 119:115 contain an extension identifer assigned by the corresponding organization.
     * - Bytes 111:104 contain the vendor specific extension identifier assigned by the corresponding organization.
     * 
     * See the IEEE EUI-64 guidelines for more information. The controller should specify a globally unique namespace identifier in this field or the **EUI64** field when the namespace is created.
     * @type {Array<Byte>}
     */
    NGUID{
        get {
            if(!this.HasProp("__NGUIDProxyArray"))
                this.__NGUIDProxyArray := Win32FixedArray(this.ptr + 108, 16, Primitive, "char")
            return this.__NGUIDProxyArray
        }
    }

    /**
     * Contains a 64-bit IEEE Extended Unique Identifier (EUI-64) that is globally unique and assigned to the namespace when the namespace is created.
     * 
     * The **EUI64** field remains fixed throughout the life of the namespace and is preserved across namespace and controller operations (such as controller reset and namespace format).
     * 
     * The EUI-64 is a concatenation of a 24-bit or 36-bit company_id value assigned by the IEEE Registration Authority and an extension identifier assigned by the corresponding
     * organization. See the IEEE EUI-64 guidelines for more information.
     * 
     * The controller should specify a globally unique namespace identifier in this field or the **NGUID** field when the namespace is created. If the controller is not able to allocate a globally unique 64-bit identifier then this field will be cleared to `0h`.
     * @type {Array<Byte>}
     */
    EUI64{
        get {
            if(!this.HasProp("__EUI64ProxyArray"))
                this.__EUI64ProxyArray := Win32FixedArray(this.ptr + 124, 8, Primitive, "char")
            return this.__EUI64ProxyArray
        }
    }

    /**
     * Contains an array of 16 [NVME_LBA_FORMAT](ns-nvme-nvme_lba_format.md) structures. Each structure in the array specifies an LBA Format and indicates that it is supported by the controller.
     * 
     * The zero-based position of a structure in the array corresponds to the name of the LBA Format, such that LBA Format 0 (LBAF0) is in position 0, LBA Format 1 (LBAF1) is in position 1, and so on, up to LBA Format 15 (LBAF15) in position 15.
     * @type {Array<NVME_LBA_FORMAT>}
     */
    LBAF{
        get {
            if(!this.HasProp("__LBAFProxyArray"))
                this.__LBAFProxyArray := Win32FixedArray(this.ptr + 136, 16, NVME_LBA_FORMAT, "")
            return this.__LBAFProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 264, 192, Primitive, "char")
            return this.__Reserved4ProxyArray
        }
    }

    /**
     * This range of bytes (384:4095) is allocated for Vendor Specific (VS) usage.
     * @type {Array<Byte>}
     */
    VS{
        get {
            if(!this.HasProp("__VSProxyArray"))
                this.__VSProxyArray := Win32FixedArray(this.ptr + 456, 3712, Primitive, "char")
            return this.__VSProxyArray
        }
    }
}
