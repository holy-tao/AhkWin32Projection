#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_POWER_STATE_DESC.ahk

/**
 * Contains values that indicate controller capabilities, features, command set attributes, and power state descriptors.
 * @remarks
 * The values of the **VID**, **SN**, and **MN** fields may be combined to form a globally unique value that identifies the NVM subsystem.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_identify_controller_data
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_CONTROLLER_DATA extends Win32Struct
{
    static sizeof => 3328

    static packingSize => 8

    /**
     * Contains the company vendor identifier that is assigned by the [Peripheral Component Interconnect - Special Interest Group (PCI-SIG)](https://pcisig.com/).
     * @type {Integer}
     */
    VID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Contains the company vendor identifier that is assigned by the PCI-SIG for the subsystem.
     * @type {Integer}
     */
    SSVID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Contains the serial number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * @type {Array<Byte>}
     */
    SN{
        get {
            if(!this.HasProp("__SNProxyArray"))
                this.__SNProxyArray := Win32FixedArray(this.ptr + 4, 20, Primitive, "char")
            return this.__SNProxyArray
        }
    }

    /**
     * Contains the model number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * @type {Array<Byte>}
     */
    MN{
        get {
            if(!this.HasProp("__MNProxyArray"))
                this.__MNProxyArray := Win32FixedArray(this.ptr + 24, 40, Primitive, "char")
            return this.__MNProxyArray
        }
    }

    /**
     * Contains the currently active firmware revision for the NVM subsystem.
     * 
     * This is the same firmware revision information in the [NVME_FIRMWARE_SLOT_INFO_LOG](ns-nvme-nvme_firmware_slot_info_log.md) that can be retrieved with the Get Log Page command.
     * @type {Array<Byte>}
     */
    FR{
        get {
            if(!this.HasProp("__FRProxyArray"))
                this.__FRProxyArray := Win32FixedArray(this.ptr + 64, 8, Primitive, "char")
            return this.__FRProxyArray
        }
    }

    /**
     * Contains the recommended Arbitration Burst size.
     * @type {Integer}
     */
    RAB {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * Contains the Organization Unique Identifier (OUI) for the controller vendor.
     * 
     * The OUI is a valid IEEE/RAC assigned identifier that can be registered at http://standards.ieee.org/develop/regauth/oui/public.html.
     * @type {Array<Byte>}
     */
    IEEE{
        get {
            if(!this.HasProp("__IEEEProxyArray"))
                this.__IEEEProxyArray := Win32FixedArray(this.ptr + 73, 3, Primitive, "char")
            return this.__IEEEProxyArray
        }
    }

    /**
     * A Controller Multi-Path I/O and Namespace Sharing Capabilities (CMIC) structure that specifies the multi-path I/O and namespace sharing capabilities of the controller and NVM subsystem.
     * @type {Integer}
     */
    CMIC {
        get => NumGet(this, 76, "char")
        set => NumPut("char", value, this, 76)
    }

    /**
     * Indicates the maximum data transfer size between the host and the controller.
     * 
     * The host should not submit a command that exceeds this transfer size. If a command is submitted that exceeds the transfer size, the command is aborted with a status of [NVME_STATUS_INVALID_FIELD_IN_COMMAND](ne-nvme-nvme_status_generic_command_codes.md#field-nvme-status-invalid-field-in-command).
     * 
     * The value of this field is in units of the minimum memory page size specified in the **MPSMIN** field of the [Controller Capabilities](ns-nvme-nvme_controller_capabilities.md) structure, and is reported as a power of two (2^n). A value of `0h` indicates no restrictions on transfer size. The restriction includes metadata if it is interleaved with the logical block data.
     * 
     * If SGL Bit Bucket descriptors are supported, their lengths are included in determining if a command exceeds the Maximum Data Transfer Size for destination data buffers. Their length in a source data buffer is not included for a Maximum Data Transfer Size calculation.
     * @type {Integer}
     */
    MDTS {
        get => NumGet(this, 77, "char")
        set => NumPut("char", value, this, 77)
    }

    /**
     * Contains the NVM subsystem unique controller identifier associated with the controller.
     * @type {Integer}
     */
    CNTLID {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }

    /**
     * Contains the value reported in the Version register, defined in the **VS** field of the [NVME_CONTROLLER_REGISTERS](../nvme/ns-nvme-nvme_controller_registers.md) structure.
     * 
     * Implementations that are compliant with NVMe specification version 1.2 or later, will report a non-zero value in this field.
     * @type {Integer}
     */
    VER {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Indicates the typical latency in microseconds when resuming from Runtime D3 (RTD3).
     * 
     * Implementations that are compliant with NVMe specification version 1.2 or later, will report a non-zero value in this field.
     * @type {Integer}
     */
    RTD3R {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Indicates the typical latency in microseconds to enter Runtime D3 (RTD3).
     * 
     * Implementations that are compliant with NVMe specification version 1.2 or later, will report a non-zero value in this field.
     * @type {Integer}
     */
    RTD3E {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * An Optional Asynchronous Events Supported (OAES) structure containing fields that indicate whether optional asynchronous events are supported by the controller.
     * 
     * A controller should not send optional asynchronous events before they are enabled by host software.
     * @type {Integer}
     */
    OAES {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * A Controller Attributes (CTRATT) structure containing controller attribute information.
     * @type {Integer}
     */
    CTRATT {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    RRLS {
        get => NumGet(this, 100, "ushort")
        set => NumPut("ushort", value, this, 100)
    }

    /**
     * Bits 10:31 of the **OAES** structure are reserved.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 102, 9, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CNTRLTYPE {
        get => NumGet(this, 111, "char")
        set => NumPut("char", value, this, 111)
    }

    /**
     * @type {Array<Byte>}
     */
    FGUID{
        get {
            if(!this.HasProp("__FGUIDProxyArray"))
                this.__FGUIDProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "char")
            return this.__FGUIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CRDT1 {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    CRDT2 {
        get => NumGet(this, 130, "ushort")
        set => NumPut("ushort", value, this, 130)
    }

    /**
     * @type {Integer}
     */
    CRDT3 {
        get => NumGet(this, 132, "ushort")
        set => NumPut("ushort", value, this, 132)
    }

    /**
     * Bits 0:7 of the **OAES** structure are reserved.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 134, 106, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * Reserved for NVMe Management.
     * @type {Array<Byte>}
     */
    ReservedForManagement{
        get {
            if(!this.HasProp("__ReservedForManagementProxyArray"))
                this.__ReservedForManagementProxyArray := Win32FixedArray(this.ptr + 240, 13, Primitive, "char")
            return this.__ReservedForManagementProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NVMSR {
        get => NumGet(this, 253, "char")
        set => NumPut("char", value, this, 253)
    }

    /**
     * @type {Integer}
     */
    VWCI {
        get => NumGet(this, 254, "char")
        set => NumPut("char", value, this, 254)
    }

    /**
     * @type {Integer}
     */
    MEC {
        get => NumGet(this, 255, "char")
        set => NumPut("char", value, this, 255)
    }

    /**
     * An Optional Admin Command Support (OACS) structure containing fields that indicate the optional [Admin Commands](ne-nvme-nvme_admin_commands.md) supported by the controller.
     * @type {Integer}
     */
    OACS {
        get => NumGet(this, 256, "ushort")
        set => NumPut("ushort", value, this, 256)
    }

    /**
     * Indicates the maximum number of concurrently outstanding [Abort](ns-nvme-nvme_cdw10_abort.md) commands supported by the controller.
     * 
     * This is a 0’s based value. Implementations should support a minimum of four outstanding Abort commands simultaneously.
     * @type {Integer}
     */
    ACL {
        get => NumGet(this, 258, "char")
        set => NumPut("char", value, this, 258)
    }

    /**
     * Indicates the maximum number of concurrently outstanding [Asynchronous Event Request](ne-nvme-nvme_async_event_types.md) commands supported by the controller.
     * 
     * This is a 0’s based value. Implementations should support a minimum of four outstanding Asynchronous Event Request commands simultaneously.
     * @type {Integer}
     */
    AERL {
        get => NumGet(this, 259, "char")
        set => NumPut("char", value, this, 259)
    }

    /**
     * A Firmware Updates (FRMW) structure containing fields that indicate capabilities regarding firmware updates.
     * @type {Integer}
     */
    FRMW {
        get => NumGet(this, 260, "char")
        set => NumPut("char", value, this, 260)
    }

    /**
     * A Log Page Attributes (LPA) structure containing fields that indicate optional attributes for log pages that are accessed by using the [Get Log Page](ns-nvme-nvme_cdw10_get_log_page.md) command.
     * @type {Integer}
     */
    LPA {
        get => NumGet(this, 261, "char")
        set => NumPut("char", value, this, 261)
    }

    /**
     * Indicates the number of Error Information log entries that are stored by the controller. This field is a 0’s based value.
     * @type {Integer}
     */
    ELPE {
        get => NumGet(this, 262, "char")
        set => NumPut("char", value, this, 262)
    }

    /**
     * Indicates the number of NVM Express power states supported by the controller. This is a 0’s based value.
     * 
     * Power states are numbered sequentially starting at power state 0. A controller must support at least one power state (for example, power state 0), and may support up to 31 additional power states, for a total of 32.
     * @type {Integer}
     */
    NPSS {
        get => NumGet(this, 263, "char")
        set => NumPut("char", value, this, 263)
    }

    /**
     * An Admin Vendor Specific Command Configuration (AVSCC) structure containing fields that indicate the configuration settings for Admin Vendor Specific command handling.
     * @type {Integer}
     */
    AVSCC {
        get => NumGet(this, 264, "char")
        set => NumPut("char", value, this, 264)
    }

    /**
     * An Autonomous Power State Transition Attributes (APSTA) structure containing fields that indicate the attributes of the [autonomous power state transition feature](ns-nvme-nvme_cdw11_feature_auto_power_state_transition.md).
     * @type {Integer}
     */
    APSTA {
        get => NumGet(this, 265, "char")
        set => NumPut("char", value, this, 265)
    }

    /**
     * Indicates the minimum Composite Temperature field value (reported in the [SMART / Health Information](ns-nvme-nvme_health_info_log.md) log that indicates an overheating condition during which controller operation continues.
     * 
     * Immediate remediation is recommended (for example, additional cooling or workload reduction). The platform should strive to maintain a composite temperature below this value.
     * 
     * A value of `0h` in this field indicates that no warning temperature threshold value is reported by the controller. Implementations compliant to NVMe Spec version 1.2 or later should report a non-zero value in this field. It is recommended that implementations report a value of `0157h` in this field.
     * @type {Integer}
     */
    WCTEMP {
        get => NumGet(this, 266, "ushort")
        set => NumPut("ushort", value, this, 266)
    }

    /**
     * Indicates the minimum Composite Temperature field value (reported in the [SMART / Health Information](ns-nvme-nvme_health_info_log.md log) that indicates a critical overheating condition. For example, a condition that may prevent continued normal operation, possibility of data loss, automatic device shutdown, extreme performance throttling, or permanent damage.
     * 
     * A value of `0h` in this field indicates that no critical temperature threshold value is reported by the controller. Implementations compliant to NVMe Spec version 1.2 or later should report a non-zero value in this field.
     * @type {Integer}
     */
    CCTEMP {
        get => NumGet(this, 268, "ushort")
        set => NumPut("ushort", value, this, 268)
    }

    /**
     * Indicates the maximum time the controller temporarily stops processing commands to activate the firmware image.
     * 
     * This field is valid if the controller supports firmware activation without a reset. The **MFTA** value is specified in 100 millisecond units. A value of `0h` indicates that the maximum time is undefined.
     * @type {Integer}
     */
    MTFA {
        get => NumGet(this, 270, "ushort")
        set => NumPut("ushort", value, this, 270)
    }

    /**
     * Indicates the preferred size that the host should allocate for the [Host Memory Buffer](ns-nvme-nvme_cdw11_feature_host_memory_buffer.md) feature in 4KB units.
     * 
     * This value must be larger than or equal to the Host Memory Buffer Minimum Size (**HMMIN**).
     * 
     * If this field is non-zero, then the Host Memory Buffer feature is supported. When this value is cleared to `0h`, the Host Memory Buffer feature is not supported.
     * @type {Integer}
     */
    HMPRE {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * Indicates the minimum size that the host should allocate for the Host Memory Buffer feature in 4KB units. 
     * 
     * When this value is cleared to `0`, the host is requested to allocate any amount of host memory possible up to the **HMPRE** value.
     * @type {Integer}
     */
    HMMIN {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * Indicates the total NVM capacity, in bytes, of the NVM subsystem.
     * 
     * This field is supported if the Namespace Management and Namespace Attachment commands are supported.
     * @type {Array<Byte>}
     */
    TNVMCAP{
        get {
            if(!this.HasProp("__TNVMCAPProxyArray"))
                this.__TNVMCAPProxyArray := Win32FixedArray(this.ptr + 280, 16, Primitive, "char")
            return this.__TNVMCAPProxyArray
        }
    }

    /**
     * Indicates the unallocated NVM capacity, in bytes, of the NVM subsystem. 
     * 
     * This field is supported if the Namespace Management and Namespace Attachment commands are supported.
     * @type {Array<Byte>}
     */
    UNVMCAP{
        get {
            if(!this.HasProp("__UNVMCAPProxyArray"))
                this.__UNVMCAPProxyArray := Win32FixedArray(this.ptr + 296, 16, Primitive, "char")
            return this.__UNVMCAPProxyArray
        }
    }

    /**
     * A Replay Protected Memory Block Support (RPMBS) structure containing fields that indicate whether the controller supports one or more Replay Protected Memory Blocks (RPMBs) and the associated capabilities.
     * @type {Integer}
     */
    RPMBS {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * Indicates the Extended Device Self-test Time (EDSTT).
     * @type {Integer}
     */
    EDSTT {
        get => NumGet(this, 316, "ushort")
        set => NumPut("ushort", value, this, 316)
    }

    /**
     * Indicates the Device Self-test Options (DSTO).
     * @type {Integer}
     */
    DSTO {
        get => NumGet(this, 318, "char")
        set => NumPut("char", value, this, 318)
    }

    /**
     * Indicates the Firmware Update Granularity (FWUG).
     * @type {Integer}
     */
    FWUG {
        get => NumGet(this, 319, "char")
        set => NumPut("char", value, this, 319)
    }

    /**
     * Indicates the Keep Alive Support (KAS).
     * @type {Integer}
     */
    KAS {
        get => NumGet(this, 320, "ushort")
        set => NumPut("ushort", value, this, 320)
    }

    /**
     * A Host Controlled Thermal Management Attributes (HCTMA) structure.
     * @type {Integer}
     */
    HCTMA {
        get => NumGet(this, 322, "ushort")
        set => NumPut("ushort", value, this, 322)
    }

    /**
     * Minimum Thermal Management Temperature (MNTMT)
     * @type {Integer}
     */
    MNTMT {
        get => NumGet(this, 324, "ushort")
        set => NumPut("ushort", value, this, 324)
    }

    /**
     * Maximum Thermal Management Temperature (MXTMT)
     * @type {Integer}
     */
    MXTMT {
        get => NumGet(this, 326, "ushort")
        set => NumPut("ushort", value, this, 326)
    }

    /**
     * Sanitize Capabilities (SANICAP)
     * @type {Integer}
     */
    SANICAP {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * @type {Integer}
     */
    HMMINDS {
        get => NumGet(this, 332, "uint")
        set => NumPut("uint", value, this, 332)
    }

    /**
     * @type {Integer}
     */
    HMMAXD {
        get => NumGet(this, 336, "ushort")
        set => NumPut("ushort", value, this, 336)
    }

    /**
     * NVM Set Identifier Maximum
     * @type {Integer}
     */
    NSETIDMAX {
        get => NumGet(this, 338, "ushort")
        set => NumPut("ushort", value, this, 338)
    }

    /**
     * @type {Integer}
     */
    ENDGIDMAX {
        get => NumGet(this, 340, "ushort")
        set => NumPut("ushort", value, this, 340)
    }

    /**
     * @type {Integer}
     */
    ANATT {
        get => NumGet(this, 342, "char")
        set => NumPut("char", value, this, 342)
    }

    /**
     * @type {Integer}
     */
    ANACAP {
        get => NumGet(this, 343, "char")
        set => NumPut("char", value, this, 343)
    }

    /**
     * @type {Integer}
     */
    ANAGRPMAX {
        get => NumGet(this, 344, "uint")
        set => NumPut("uint", value, this, 344)
    }

    /**
     * @type {Integer}
     */
    NANAGRPID {
        get => NumGet(this, 348, "uint")
        set => NumPut("uint", value, this, 348)
    }

    /**
     * @type {Integer}
     */
    PELS {
        get => NumGet(this, 352, "uint")
        set => NumPut("uint", value, this, 352)
    }

    /**
     * @type {Integer}
     */
    DomainId {
        get => NumGet(this, 356, "ushort")
        set => NumPut("ushort", value, this, 356)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 358, 10, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MEGCAP{
        get {
            if(!this.HasProp("__MEGCAPProxyArray"))
                this.__MEGCAPProxyArray := Win32FixedArray(this.ptr + 368, 16, Primitive, "char")
            return this.__MEGCAPProxyArray
        }
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 384, 128, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * A Submission Queue Entry Size (SQES) structure containing fields that indicate the required and maximum Submission Queue entry size when using the NVM Command Set.
     * @type {Integer}
     */
    SQES {
        get => NumGet(this, 512, "char")
        set => NumPut("char", value, this, 512)
    }

    /**
     * A Completion Queue Entry Size (CQES) structure containing fields that indicate the required and maximum Completion Queue entry size when using the NVM Command Set.
     * @type {Integer}
     */
    CQES {
        get => NumGet(this, 513, "char")
        set => NumPut("char", value, this, 513)
    }

    /**
     * @type {Integer}
     */
    MAXCMD {
        get => NumGet(this, 514, "ushort")
        set => NumPut("ushort", value, this, 514)
    }

    /**
     * Indicates the number of valid namespaces present for the controller.
     * @type {Integer}
     */
    NN {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * An Optional NVM Command Support (ONCS) structure containing fields that indicate the optional [NVM commands](ne-nvme-nvme_nvm_commands.md) and features supported by the controller.
     * @type {Integer}
     */
    ONCS {
        get => NumGet(this, 520, "ushort")
        set => NumPut("ushort", value, this, 520)
    }

    /**
     * A Fused Operation Support (FUSES) structure containing fields that indicate the fused operations that the controller supports.
     * @type {Integer}
     */
    FUSES {
        get => NumGet(this, 522, "ushort")
        set => NumPut("ushort", value, this, 522)
    }

    /**
     * A Format NVM Attributes (FNA) structure containing fields that indicate attributes for the [Format NVM](ns-nvme-nvme_cdw10_format_nvm.md) command.
     * @type {Integer}
     */
    FNA {
        get => NumGet(this, 524, "char")
        set => NumPut("char", value, this, 524)
    }

    /**
     * A Volatile Write Cache (VWC) structure containing fields that indicate attributes related to the presence of a volatile write cache in the implementation.
     * @type {Integer}
     */
    VWC {
        get => NumGet(this, 525, "char")
        set => NumPut("char", value, this, 525)
    }

    /**
     * Indicates the size of the write operation guaranteed to be written atomically to the NVM across all namespaces with any supported namespace format during normal operation.  This field is specified in logical blocks and is a 0’s based value.
     * 
     * If a specific namespace guarantees a larger size than is reported in this field, then this namespace specific size is reported in the **NAWUN** field of the [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure.
     * 
     * If a write command is submitted with size less than or equal to the **AWUN** value, the host is guaranteed that the write command is atomic to the NVM with respect to other read or write commands. If a write command is submitted with size greater than the **AWUN** value, then there is no guarantee of command atomicity.
     * 
     * The **AWUN** value does not have any applicability to write errors caused by power failure. For more information, see the Atomic Write Unit Power Fail (**AWUPF**) field.
     * 
     * A value of `FFFFh` indicates all commands are atomic as this is the largest command size. Implementations should support a minimum of 128KB, appropriately scaled based on the Logical Block Access (LBA) size.
     * @type {Integer}
     */
    AWUN {
        get => NumGet(this, 526, "ushort")
        set => NumPut("ushort", value, this, 526)
    }

    /**
     * Indicates the size of the write operation guaranteed to be written atomically to the NVM across all namespaces with any supported namespace format during a power fail or error condition. This field is specified in logical blocks and is a 0’s based value. 
     * 
     * If a specific namespace guarantees a larger size than is reported in this field, then this namespace specific size is reported in the **NAWUPF** field in the [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure. The **AWUPF** value must be less than or equal to the **AWUN** value.
     * 
     * If a write command is submitted with size less than or equal to the **AWUPF** value, the host is guaranteed that the write is atomic to the NVM with respect to other read or write commands. If a write command is submitted that is greater than this size, there is no guarantee of command atomicity. If the write size is less than or equal to the **AWUPF** value and the write command fails, then subsequent read commands for the associated logical blocks will return data from the previous successful write command.
     * 
     * If a write command is submitted with size greater than the **AWUPF** value, then there is no guarantee of data returned on subsequent reads of the associated logical blocks.
     * @type {Integer}
     */
    AWUPF {
        get => NumGet(this, 528, "ushort")
        set => NumPut("ushort", value, this, 528)
    }

    /**
     * A NVM Vendor Specific Command Configuration (NVSCC) structure containing fields that indicate the configuration settings for NVM Vendor Specific command handling.
     * @type {Integer}
     */
    NVSCC {
        get => NumGet(this, 530, "char")
        set => NumPut("char", value, this, 530)
    }

    /**
     * @type {Integer}
     */
    NWPC {
        get => NumGet(this, 531, "char")
        set => NumPut("char", value, this, 531)
    }

    /**
     * Indicates the size of the write operation guaranteed to be written atomically to the NVM across all namespaces with any supported namespace format for a Compare and Write fused operation.
     * 
     * If a specific namespace guarantees a larger size than is reported in this field, then this namespace specific size is reported in the **NACWU** field in the [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure.
     * 
     * This field will be supported if the Compare and Write fused command is supported. This field is specified in logical blocks and is a 0’s based value. If a Compare and Write is submitted that requests a transfer size larger than this value, the controller may fail the command with a status of [NVME_STATUS_INVALID_FIELD_IN_COMMAND](ne-nvme-nvme_status_generic_command_codes.md).
     * 
     * If Compare and Write is not a supported fused command, the value of this field will be `0h`.
     * @type {Integer}
     */
    ACWU {
        get => NumGet(this, 532, "ushort")
        set => NumPut("ushort", value, this, 532)
    }

    /**
     * @type {Integer}
     */
    CopyDescFormats {
        get => NumGet(this, 534, "ushort")
        set => NumPut("ushort", value, this, 534)
    }

    /**
     * A SGL Support (SGLS) structure containing fields that specify whether Scatter Gather Lists (SGL) are supported for the NVM Command Set and the supported SGL types.
     * @type {Integer}
     */
    SGLS {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    MNAN {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * @type {Array<Byte>}
     */
    MAXDNA{
        get {
            if(!this.HasProp("__MAXDNAProxyArray"))
                this.__MAXDNAProxyArray := Win32FixedArray(this.ptr + 544, 16, Primitive, "char")
            return this.__MAXDNAProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MAXCNA {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * Bytes 704:2047 are reserved for I/O Command Set Attributes.
     * @type {Array<Byte>}
     */
    Reserved6{
        get {
            if(!this.HasProp("__Reserved6ProxyArray"))
                this.__Reserved6ProxyArray := Win32FixedArray(this.ptr + 564, 204, Primitive, "char")
            return this.__Reserved6ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SUBNQN{
        get {
            if(!this.HasProp("__SUBNQNProxyArray"))
                this.__SUBNQNProxyArray := Win32FixedArray(this.ptr + 768, 256, Primitive, "char")
            return this.__SUBNQNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved7{
        get {
            if(!this.HasProp("__Reserved7ProxyArray"))
                this.__Reserved7ProxyArray := Win32FixedArray(this.ptr + 1024, 768, Primitive, "char")
            return this.__Reserved7ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    IOCCSZ {
        get => NumGet(this, 1792, "uint")
        set => NumPut("uint", value, this, 1792)
    }

    /**
     * @type {Integer}
     */
    IORCSZ {
        get => NumGet(this, 1796, "uint")
        set => NumPut("uint", value, this, 1796)
    }

    /**
     * @type {Integer}
     */
    ICDOFF {
        get => NumGet(this, 1800, "ushort")
        set => NumPut("ushort", value, this, 1800)
    }

    /**
     * @type {Integer}
     */
    FCATT {
        get => NumGet(this, 1802, "char")
        set => NumPut("char", value, this, 1802)
    }

    /**
     * @type {Integer}
     */
    MSDBD {
        get => NumGet(this, 1803, "char")
        set => NumPut("char", value, this, 1803)
    }

    /**
     * @type {Integer}
     */
    OFCS {
        get => NumGet(this, 1804, "ushort")
        set => NumPut("ushort", value, this, 1804)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved8{
        get {
            if(!this.HasProp("__Reserved8ProxyArray"))
                this.__Reserved8ProxyArray := Win32FixedArray(this.ptr + 1806, 242, Primitive, "char")
            return this.__Reserved8ProxyArray
        }
    }

    /**
     * Contains an array of 32 Power State Descriptors. Each member of the array is a 32 bit field that indicates the characteristics of a Power State Descriptor. The format of this field is defined in the [NVME_POWER_STATE_DESC](ns-nvme-nvme_power_state_desc.md) structure.
     * 
     * The zero-based position of a structure in the array corresponds to the name of the Power State Descriptor, such that Power State 0 Descriptor (PSD0) is in position 0, Power State 1 Descriptor (PSD1) is in position 1, and so on, up to Power State 31 Descriptor (PSD31) in position 31.
     * @type {Array<NVME_POWER_STATE_DESC>}
     */
    PDS{
        get {
            if(!this.HasProp("__PDSProxyArray"))
                this.__PDSProxyArray := Win32FixedArray(this.ptr + 2048, 32, NVME_POWER_STATE_DESC, "")
            return this.__PDSProxyArray
        }
    }

    /**
     * Bytes 3072:4095 are allocated for vendor specific usage.
     * @type {Array<Byte>}
     */
    VS{
        get {
            if(!this.HasProp("__VSProxyArray"))
                this.__VSProxyArray := Win32FixedArray(this.ptr + 2304, 1024, Primitive, "char")
            return this.__VSProxyArray
        }
    }
}
