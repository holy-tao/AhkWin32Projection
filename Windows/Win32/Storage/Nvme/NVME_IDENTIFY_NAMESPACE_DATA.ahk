#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_LBA_FORMAT.ahk" { NVME_LBA_FORMAT }
#Import ".\NVM_RESERVATION_CAPABILITIES.ahk" { NVM_RESERVATION_CAPABILITIES }

/**
 * Contains values that indicate capabilities and settings that are specific to a particular namespace.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_identify_namespace_data
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFY_NAMESPACE_DATA {
    #StructPack 8


    struct _NSFEAT {
        /**
         * This bitfield backs the following members:
         * - ThinProvisioning
         * - NameSpaceAtomicWriteUnit
         * - DeallocatedOrUnwrittenError
         * - SkipReuseUI
         * - NameSpaceIoOptimization
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        ThinProvisioning {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NameSpaceAtomicWriteUnit {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        DeallocatedOrUnwrittenError {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        SkipReuseUI {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        NameSpaceIoOptimization {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    }

    struct _FLBAS {
        /**
         * This bitfield backs the following members:
         * - LbaFormatIndex
         * - MetadataInExtendedDataLBA
         * - LbaFormatIndexMS
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        LbaFormatIndex {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        MetadataInExtendedDataLBA {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        LbaFormatIndexMS {
            get => (this._bitfield >> 5) & 0x3
            set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
        }
    }

    struct _MC {
        /**
         * This bitfield backs the following members:
         * - MetadataInExtendedDataLBA
         * - MetadataInSeparateBuffer
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        MetadataInExtendedDataLBA {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        MetadataInSeparateBuffer {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    struct _DPC {
        /**
         * This bitfield backs the following members:
         * - ProtectionInfoType1
         * - ProtectionInfoType2
         * - ProtectionInfoType3
         * - InfoAtBeginningOfMetadata
         * - InfoAtEndOfMetadata
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        ProtectionInfoType1 {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ProtectionInfoType2 {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        ProtectionInfoType3 {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        InfoAtBeginningOfMetadata {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        InfoAtEndOfMetadata {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    }

    struct _DPS {
        /**
         * This bitfield backs the following members:
         * - ProtectionInfoTypeEnabled
         * - InfoAtBeginningOfMetadata
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        ProtectionInfoTypeEnabled {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        InfoAtBeginningOfMetadata {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    }

    struct _NMIC {
        /**
         * This bitfield backs the following members:
         * - SharedNameSpace
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        SharedNameSpace {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    struct _FPI {
        /**
         * This bitfield backs the following members:
         * - PercentageRemained
         * - Supported
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        PercentageRemained {
            get => (this._bitfield >> 0) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
        }

        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    struct _DLFEAT {
        /**
         * This bitfield backs the following members:
         * - ReadBehavior
         * - WriteZeroes
         * - GuardFieldWithCRC
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        ReadBehavior {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        WriteZeroes {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        GuardFieldWithCRC {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    }

    struct _NSATTR {
        /**
         * This bitfield backs the following members:
         * - WriteProtected
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        WriteProtected {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    /**
     * Indicates the total size of the namespace in logical blocks.
     * 
     * A namespace of size *n* consists of Logical Block Address (LBA) `0` through `(n - 1)`. The number of logical blocks is based on the formatted LBA size. This field is undefined prior to the namespace being formatted.
     */
    NSZE : Int64

    /**
     * Indicates the maximum number of logical blocks that may be allocated in the namespace at any point in time.
     * 
     * The number of logical blocks is based on the formatted LBA size. This field is undefined prior to the namespace being formatted.
     * 
     * The **NCAP** field is used in the case of thin provisioning and reports a value that is smaller than or equal to the Namespace Size (**NSZE**).
     * 
     * Spare LBAs are not reported as part of this field. A value of `0h` for the Namespace Capacity (**NCAP**) indicates that the namespace ID is an inactive namespace ID. A logical block is allocated when it is written with a Write or Write Uncorrectable command. A logical block may be deallocated using the [Dataset Management](ns-nvme-nvme_command.md#-field-u.datasetmanagement) command.
     */
    NCAP : Int64

    /**
     * Indicates the current number of logical blocks allocated in the namespace.
     * 
     * The value of this field is smaller than or equal to the value of the Namespace Capacity **NCAP** field.
     * 
     * The number of logical blocks is based on the formatted LBA size. When using the NVM command set: A logical block is allocated when it is written with a Write or Write Uncorrectable command. A logical block may be deallocated using the [Dataset Management](ns-nvme-nvme_command.md#-field-u.datasetmanagement) command.
     * 
     * A controller may report a **NUSE** value equal to an **NCAP** value at all times if the product is not targeted for thin provisioning environments.
     */
    NUSE : Int64

    /**
     * A Namespace Features (NSFEAT) structure containing fields that define features of the namespace.
     */
    NSFEAT : NVME_IDENTIFY_NAMESPACE_DATA._NSFEAT

    /**
     * Defines the number of supported LBA data size and metadata size combinations supported by the namespace.
     * 
     * LBA formats are allocated in order (starting with 0) and packed sequentially. This is a 0’s based value. The maximum number of LBA formats that may be indicated as supported is 16.
     * 
     * The supported LBA formats are indicated in  the **LBAF** field (bytes 128 – 191 of this data structure). The metadata may be either transferred as part of the LBA (creating an extended LBA which is a larger LBA size that is exposed to the application) or it may be transferred as a separate contiguous buffer of data. The metadata cannot be split between the LBA and a separate metadata buffer.
     * 
     * It is recommended that software and controllers transition to an LBA size that is 4KB or larger for ECC efficiency at the controller. If providing metadata, it is recommended that at least 8 bytes are provided per logical block to enable use with end-to-end data protection.
     */
    NLBAF : Int8

    /**
     * A Formatted LBA Size (FLBAS) structure containing fields that indicate the LBA data size and metadata size combination that the namespace has been formatted with.
     */
    FLBAS : NVME_IDENTIFY_NAMESPACE_DATA._FLBAS

    /**
     * A Metadata Capabilities (MC) structure containing fields that indicate the capabilities for metadata.
     */
    MC : NVME_IDENTIFY_NAMESPACE_DATA._MC

    /**
     * An End-to-end Data Protection Capabilities (DPC) structure containing fields that indicate the capabilities for the end-to-end data protection feature.
     * 
     * Multiple bits may be set in this field.
     */
    DPC : NVME_IDENTIFY_NAMESPACE_DATA._DPC

    /**
     * A End-to-end Data Protection Type Settings (DPS) structure containing fields that indicate the Type settings for the end-to-end data protection feature.
     * 
     * [NVME_PROTECTION_INFORMATION_TYPES](ne-nvme-nvme_protection_information_types.md)
     */
    DPS : NVME_IDENTIFY_NAMESPACE_DATA._DPS

    /**
     * A Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC) structure containing fields that specify the multi-path I/O and namespace sharing capabilities of the namespace.
     */
    NMIC : NVME_IDENTIFY_NAMESPACE_DATA._NMIC

    /**
     * A Reservation Capabilities (RESCAP) structure containing fields that specify the reservation capabilities of the namespace.
     * 
     * A value of `00h` in this field indicates that reservations are not supported by this namespace.
     */
    RESCAP : NVM_RESERVATION_CAPABILITIES

    /**
     * A Format Progress Indicator (FPI) structure containing fields that indicate the percentage of the namespace that remains to be formatted when a format operation is in progress.
     */
    FPI : NVME_IDENTIFY_NAMESPACE_DATA._FPI

    DLFEAT : NVME_IDENTIFY_NAMESPACE_DATA._DLFEAT

    /**
     * Indicates the namespace specific size of the write operation guaranteed to be written atomically to the NVM during normal operation.
     * 
     * A value of `0h` indicates that the size for this namespace is the same size as that reported in the **AWUN** field of the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure. All other values specify a size in terms of logical blocks using the same encoding as the **AWUN** field.
     */
    NAWUN : UInt16

    /**
     * Indicates the namespace specific size of the write operation guaranteed to be written atomically to the NVM during a power fail or error condition.
     * 
     * A value of `0h` indicates that the size for this namespace is the same size as that reported in the **AWUPF** field of the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure. All other values specify a size in terms of logical blocks using the same encoding as the **AWUPF** field.
     */
    NAWUPF : UInt16

    /**
     * Indicates the namespace specific size of the write operation guaranteed to be written atomically to the NVM for a Compare and Write fused command.
     * 
     * A value of `0h` indicates that the size for this namespace is the same size as that reported in the **ACWU** field of the [Identify Controller](ns-nvme-nvme_identify_controller_data.md) data structure. All other values specify a size in terms of logical blocks using the same encoding as the **ACWU** field.
     */
    NACWU : UInt16

    /**
     * Indicates the atomic boundary size for this namespace for the **NAWUN** value.
     * 
     * This field is specified in logical blocks. Writes to this namespace that cross atomic boundaries are not guaranteed to be atomic to the NVM with respect to other read or write commands.
     * 
     * A value of `0h` indicates that there are no atomic boundaries for normal write operations. All other values specify a size in terms of logical blocks using the same encoding as the **AWUN** field.
     */
    NABSN : UInt16

    /**
     * Indicates the Logical Block Address (LBA) on this namespace where the first atomic boundary starts.
     * 
     * If the **NABSN** and **NABSPF** fields are cleared to `0h`, then the **NABO** field is cleared to 0h. The value of **NABO** should be less than or equal to **NABSN** and **NABSPF**.
     */
    NABO : UInt16

    /**
     * Indicates the atomic boundary size for this namespace specific to the Namespace Atomic Write Unit Power Fail value. 
     * 
     * This field is specified in logical blocks. Writes to this namespace that cross atomic boundaries are not guaranteed to be atomic with respect to other read or write commands and there is no guarantee of data returned on subsequent reads of the associated logical blocks.
     * 
     * A value of `0h` indicates that there are no atomic boundaries for power fail or error conditions. All other values specify a size in terms of logical blocks using the same encoding as the **AWUPF** field.
     */
    NABSPF : UInt16

    /**
     * Indicates the Namespace Optimal IO Boundary (NOIOB).
     */
    NOIOB : UInt16

    /**
     * Indicates the total size of the NVM allocated to this namespace.
     * 
     * The value of this field is in bytes. This field is supported if the Namespace Management and Namespace Attachment commands are supported.
     * 
     * Note: This field may not correspond to the logical block size multiplied by the Namespace Size (**NSZE**) field. Due to thin provisioning or other settings (such as, endurance), this field may be larger or smaller than the **NSZE** reported.
     */
    NVMCAP : Int8[16]

    NPWG : UInt16

    NPWA : UInt16

    NPDG : UInt16

    NPDA : UInt16

    NOWS : UInt16

    MSSRL : UInt16

    MCL : UInt32

    MSRC : Int8

    /**
     * A reserved field.
     */
    Reserved2 : Int8[11]

    ANAGRPID : UInt32

    /**
     * Bytes 192:383A are reserved.
     */
    Reserved3 : Int8[3]

    NSATTR : NVME_IDENTIFY_NAMESPACE_DATA._NSATTR

    /**
     * Indicates the Associated NVM Set Identifier (NVMSETID).
     */
    NVMSETID : UInt16

    /**
     * Indicates the Associated Endurance Group Identifier (ENDGID).
     */
    ENDGID : UInt16

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
     */
    NGUID : Int8[16]

    /**
     * Contains a 64-bit IEEE Extended Unique Identifier (EUI-64) that is globally unique and assigned to the namespace when the namespace is created.
     * 
     * The **EUI64** field remains fixed throughout the life of the namespace and is preserved across namespace and controller operations (such as controller reset and namespace format).
     * 
     * The EUI-64 is a concatenation of a 24-bit or 36-bit company_id value assigned by the IEEE Registration Authority and an extension identifier assigned by the corresponding
     * organization. See the IEEE EUI-64 guidelines for more information.
     * 
     * The controller should specify a globally unique namespace identifier in this field or the **NGUID** field when the namespace is created. If the controller is not able to allocate a globally unique 64-bit identifier then this field will be cleared to `0h`.
     */
    EUI64 : Int8[8]

    /**
     * Contains an array of 16 [NVME_LBA_FORMAT](ns-nvme-nvme_lba_format.md) structures. Each structure in the array specifies an LBA Format and indicates that it is supported by the controller.
     * 
     * The zero-based position of a structure in the array corresponds to the name of the LBA Format, such that LBA Format 0 (LBAF0) is in position 0, LBA Format 1 (LBAF1) is in position 1, and so on, up to LBA Format 15 (LBAF15) in position 15.
     */
    LBAF : NVME_LBA_FORMAT[64]

    /**
     * This range of bytes (384:4095) is allocated for Vendor Specific (VS) usage.
     */
    VS : Int8[3712]

}
