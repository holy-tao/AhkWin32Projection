#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_COMMAND_DWORD0.ahk
#Include .\NVME_CDW10_IDENTIFY.ahk
#Include .\NVME_CDW11_IDENTIFY.ahk
#Include .\NVME_CDW10_ABORT.ahk
#Include .\NVME_CDW10_GET_FEATURES.ahk
#Include .\NVME_CDW11_FEATURE_NUMBER_OF_QUEUES.ahk
#Include .\NVME_CDW11_FEATURE_INTERRUPT_COALESCING.ahk
#Include .\NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG.ahk
#Include .\NVME_CDW11_FEATURE_LBA_RANGE_TYPE.ahk
#Include .\NVME_CDW11_FEATURE_ARBITRATION.ahk
#Include .\NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE.ahk
#Include .\NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG.ahk
#Include .\NVME_CDW11_FEATURE_POWER_MANAGEMENT.ahk
#Include .\NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION.ahk
#Include .\NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD.ahk
#Include .\NVME_CDW11_FEATURE_ERROR_RECOVERY.ahk
#Include .\NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER.ahk
#Include .\NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL.ahk
#Include .\NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE.ahk
#Include .\NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE.ahk
#Include .\NVME_CDW0_FEATURE_ERROR_INJECTION.ahk
#Include .\NVME_CDW11_FEATURE_GET_HOST_METADATA.ahk
#Include .\NVME_CDW11_FEATURE_SET_HOST_METADATA.ahk
#Include .\NVME_CDW11_FEATURES.ahk
#Include .\NVME_CDW10_SET_FEATURES.ahk
#Include .\NVME_CDW12_FEATURE_HOST_MEMORY_BUFFER.ahk
#Include .\NVME_CDW12_FEATURES.ahk
#Include .\NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER.ahk
#Include .\NVME_CDW13_FEATURES.ahk
#Include .\NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER.ahk
#Include .\NVME_CDW14_FEATURES.ahk
#Include .\NVME_CDW15_FEATURE_HOST_MEMORY_BUFFER.ahk
#Include .\NVME_CDW15_FEATURES.ahk
#Include .\NVME_CDW10_GET_LOG_PAGE.ahk
#Include .\NVME_CDW10_GET_LOG_PAGE_V13.ahk
#Include .\NVME_CDW11_GET_LOG_PAGE.ahk
#Include .\NVME_CDW14_GET_LOG_PAGE.ahk
#Include .\NVME_CDW10_CREATE_IO_QUEUE.ahk
#Include .\NVME_CDW11_CREATE_IO_CQ.ahk
#Include .\NVME_CDW11_CREATE_IO_SQ.ahk
#Include .\NVME_CDW10_DATASET_MANAGEMENT.ahk
#Include .\NVME_CDW11_DATASET_MANAGEMENT.ahk
#Include .\NVME_CDW10_SECURITY_SEND_RECEIVE.ahk
#Include .\NVME_CDW10_FIRMWARE_ACTIVATE.ahk
#Include .\NVME_CDW10_FORMAT_NVM.ahk
#Include .\NVME_CDW11_DIRECTIVE_RECEIVE.ahk
#Include .\NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES.ahk
#Include .\NVME_CDW12_DIRECTIVE_RECEIVE.ahk
#Include .\NVME_CDW11_DIRECTIVE_SEND.ahk
#Include .\NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE.ahk
#Include .\NVME_CDW12_DIRECTIVE_SEND.ahk
#Include .\NVME_CDW10_SANITIZE.ahk
#Include .\NVME_CDW11_SANITIZE.ahk
#Include .\NVME_CDW12_READ_WRITE.ahk
#Include .\NVME_CDW13_READ_WRITE.ahk
#Include .\NVME_CDW15_READ_WRITE.ahk
#Include .\NVME_CDW10_RESERVATION_ACQUIRE.ahk
#Include .\NVME_CDW10_RESERVATION_REGISTER.ahk
#Include .\NVME_CDW10_RESERVATION_RELEASE.ahk
#Include .\NVME_CDW10_RESERVATION_REPORT.ahk
#Include .\NVME_CDW11_RESERVATION_REPORT.ahk
#Include .\NVME_CDW13_ZONE_MANAGEMENT_SEND.ahk
#Include .\NVME_CDW13_ZONE_MANAGEMENT_RECEIVE.ahk
#Include .\NVME_CDW12_ZONE_APPEND.ahk
#Include .\NVME_CDW15_ZONE_APPEND.ahk

/**
 * Contains the parameters for all commands in the Admin Command and NVM Command sets.
 * @remarks
 * The Admin Command Set defines the commands that may be submitted to the Admin Submission Queue.
  * 
  * For all Admin commands, DWord 14 and DWord 15 are I/O Command Set specific.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A [NVME_COMMAND_DWORD0](ns-nvme-nvme_command_dword0.md) structure containing parameters that are common for all Admin and NVM commands.
     * @type {NVME_COMMAND_DWORD0}
     */
    CDW0{
        get {
            if(!this.HasProp("__CDW0"))
                this.__CDW0 := NVME_COMMAND_DWORD0(this.ptr + 0)
            return this.__CDW0
        }
    }

    /**
     * The namespace ID that this command applies to.
     * 
     * If the namespace ID is not used for the command, then this field should cleared to `0h`. If a command is applied to all namespaces accessible by this controller, then this field should be set to `FFFFFFFFh`.
     * 
     * Unless otherwise noted, specifying an inactive namespace ID in a command that uses the namespace ID will cause the controller to abort the command with the status [NVME_STATUS_INVALID_FIELD_IN_COMMAND](ne-nvme-nvme_status_generic_command_codes.md#-field-nvme-status-invalid-field-in-command). Specifying an invalid namespace ID in a command that uses the namespace ID will cause the controller to abort the command with the status [NVME_STATUS_INVALID_NAMESPACE_OR_FORMAT](ne-nvme-nvme_status_generic_command_codes.md#-field-nvme-status-invalid-namespace-or-format).
     * @type {Integer}
     */
    NSID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Array<UInt32>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "uint")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * The address of a contiguous physical buffer of metadata.
     * 
     * This field is only used if metadata is not interleaved with the logical block data, as specified in the **MS** field of the [NVME_CDW10_FORMAT_NVM](ns-nvme-nvme_cdw10_format_nvm.md) command structure. This field is Dword aligned.
     * @type {Integer}
     */
    MPTR {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A [NVME_PRP_ENTRY](ns-nvme-nvme_prp_entry.md) structure that contains the first PRP entry for the command or a PRP List pointer depending on the command.
     * @type {Integer}
     */
    PRP1 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * This field is reserved if the data transfer does not cross a memory page boundary. Otherwise, it contains a [NVME_PRP_ENTRY](ns-nvme-nvme_prp_entry.md) structure that:
     * 
     * 1. Specifies the Page Base Address of the second memory page if the data transfer crosses exactly one memory page boundary. For example, in one of the following situations:
     * 
     *    - The command data transfer length is equal in size to one memory page and the offset portion of the Page Base Address and Offset (**PBAO**) field of **PRP1** is non-zero.
     *    - The Offset portion of the **PBAO** field of **PRP1** is equal to zero and the command data transfer length is greater than one memory page and less than or equal to two memory pages in size.
     * 
     * 2. Is a PRP List pointer if the data transfer crosses more than one memory page boundary. For example, in one of the following situations:
     * 
     *    - The command data transfer length is greater than or equal to two memory pages in size but the offset portion of the **PBAO** field of **PRP1** is non-zero.
     *    - The command data transfer length is equal in size to more than two memory pages and the Offset portion of the **PBAO** field of **PRP1** is equal to zero.
     * @type {Integer}
     */
    PRP2 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CDW10 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    CDW11 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    CDW12 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW13 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW14 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW15 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {NVME_CDW11_IDENTIFY}
     */
    CDW111{
        get {
            if(!this.HasProp("__CDW111"))
                this.__CDW111 := NVME_CDW11_IDENTIFY(this.ptr + 56)
            return this.__CDW111
        }
    }

    /**
     * @type {Integer}
     */
    CDW121 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW131 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW141 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    CDW151 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    CDW1112 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW1212 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW1312 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW1412 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW1512 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {NVME_CDW11_FEATURES}
     */
    CDW11123{
        get {
            if(!this.HasProp("__CDW11123"))
                this.__CDW11123 := NVME_CDW11_FEATURES(this.ptr + 56)
            return this.__CDW11123
        }
    }

    /**
     * @type {Integer}
     */
    CDW12123 {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    CDW13123 {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * @type {Integer}
     */
    CDW14123 {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    CDW15123 {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * @type {NVME_CDW11_FEATURES}
     */
    CDW111234{
        get {
            if(!this.HasProp("__CDW111234"))
                this.__CDW111234 := NVME_CDW11_FEATURES(this.ptr + 56)
            return this.__CDW111234
        }
    }

    /**
     * @type {NVME_CDW12_FEATURES}
     */
    CDW121234{
        get {
            if(!this.HasProp("__CDW121234"))
                this.__CDW121234 := NVME_CDW12_FEATURES(this.ptr + 224)
            return this.__CDW121234
        }
    }

    /**
     * @type {NVME_CDW13_FEATURES}
     */
    CDW131234{
        get {
            if(!this.HasProp("__CDW131234"))
                this.__CDW131234 := NVME_CDW13_FEATURES(this.ptr + 240)
            return this.__CDW131234
        }
    }

    /**
     * @type {NVME_CDW14_FEATURES}
     */
    CDW141234{
        get {
            if(!this.HasProp("__CDW141234"))
                this.__CDW141234 := NVME_CDW14_FEATURES(this.ptr + 256)
            return this.__CDW141234
        }
    }

    /**
     * @type {NVME_CDW15_FEATURES}
     */
    CDW151234{
        get {
            if(!this.HasProp("__CDW151234"))
                this.__CDW151234 := NVME_CDW15_FEATURES(this.ptr + 272)
            return this.__CDW151234
        }
    }

    /**
     * @type {NVME_CDW10_GET_LOG_PAGE_V13}
     */
    CDW10_V13{
        get {
            if(!this.HasProp("__CDW10_V13"))
                this.__CDW10_V13 := NVME_CDW10_GET_LOG_PAGE_V13(this.ptr + 48)
            return this.__CDW10_V13
        }
    }

    /**
     * @type {NVME_CDW11_GET_LOG_PAGE}
     */
    CDW1112345{
        get {
            if(!this.HasProp("__CDW1112345"))
                this.__CDW1112345 := NVME_CDW11_GET_LOG_PAGE(this.ptr + 56)
            return this.__CDW1112345
        }
    }

    /**
     * @type {Integer}
     */
    CDW1212345 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW1312345 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {NVME_CDW14_GET_LOG_PAGE}
     */
    CDW1412345{
        get {
            if(!this.HasProp("__CDW1412345"))
                this.__CDW1412345 := NVME_CDW14_GET_LOG_PAGE(this.ptr + 72)
            return this.__CDW1412345
        }
    }

    /**
     * @type {Integer}
     */
    CDW1512345 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {NVME_CDW11_CREATE_IO_CQ}
     */
    CDW11123456{
        get {
            if(!this.HasProp("__CDW11123456"))
                this.__CDW11123456 := NVME_CDW11_CREATE_IO_CQ(this.ptr + 56)
            return this.__CDW11123456
        }
    }

    /**
     * @type {Integer}
     */
    CDW12123456 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW13123456 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW14123456 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW15123456 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {NVME_CDW11_CREATE_IO_SQ}
     */
    CDW111234567{
        get {
            if(!this.HasProp("__CDW111234567"))
                this.__CDW111234567 := NVME_CDW11_CREATE_IO_SQ(this.ptr + 56)
            return this.__CDW111234567
        }
    }

    /**
     * @type {Integer}
     */
    CDW121234567 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW131234567 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW141234567 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW151234567 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {NVME_CDW11_DATASET_MANAGEMENT}
     */
    CDW1112345678{
        get {
            if(!this.HasProp("__CDW1112345678"))
                this.__CDW1112345678 := NVME_CDW11_DATASET_MANAGEMENT(this.ptr + 56)
            return this.__CDW1112345678
        }
    }

    /**
     * @type {Integer}
     */
    CDW1212345678 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW1312345678 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW1412345678 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW1512345678 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    CDW11123456789 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW12123456789 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW13123456789 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW14123456789 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW15123456789 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW1112345678910 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW1212345678910 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW1312345678910 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW1412345678910 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW1512345678910 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW111234567891011 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW121234567891011 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW131234567891011 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW141234567891011 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW151234567891011 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW11123456789101112 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW12123456789101112 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW13123456789101112 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW14123456789101112 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW15123456789101112 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {NVME_CDW11_DIRECTIVE_RECEIVE}
     */
    CDW1112345678910111213{
        get {
            if(!this.HasProp("__CDW1112345678910111213"))
                this.__CDW1112345678910111213 := NVME_CDW11_DIRECTIVE_RECEIVE(this.ptr + 56)
            return this.__CDW1112345678910111213
        }
    }

    /**
     * @type {NVME_CDW12_DIRECTIVE_RECEIVE}
     */
    CDW1212345678910111213{
        get {
            if(!this.HasProp("__CDW1212345678910111213"))
                this.__CDW1212345678910111213 := NVME_CDW12_DIRECTIVE_RECEIVE(this.ptr + 64)
            return this.__CDW1212345678910111213
        }
    }

    /**
     * @type {Integer}
     */
    CDW1312345678910111213 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    CDW1412345678910111213 {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    CDW1512345678910111213 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {NVME_CDW11_DIRECTIVE_SEND}
     */
    CDW111234567891011121314{
        get {
            if(!this.HasProp("__CDW111234567891011121314"))
                this.__CDW111234567891011121314 := NVME_CDW11_DIRECTIVE_SEND(this.ptr + 56)
            return this.__CDW111234567891011121314
        }
    }

    /**
     * @type {NVME_CDW12_DIRECTIVE_SEND}
     */
    CDW121234567891011121314{
        get {
            if(!this.HasProp("__CDW121234567891011121314"))
                this.__CDW121234567891011121314 := NVME_CDW12_DIRECTIVE_SEND(this.ptr + 64)
            return this.__CDW121234567891011121314
        }
    }

    /**
     * @type {Integer}
     */
    CDW131234567891011121314 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    CDW141234567891011121314 {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    CDW151234567891011121314 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {NVME_CDW11_SANITIZE}
     */
    CDW11123456789101112131415{
        get {
            if(!this.HasProp("__CDW11123456789101112131415"))
                this.__CDW11123456789101112131415 := NVME_CDW11_SANITIZE(this.ptr + 56)
            return this.__CDW11123456789101112131415
        }
    }

    /**
     * @type {Integer}
     */
    CDW12123456789101112131415 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW13123456789101112131415 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW14123456789101112131415 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW15123456789101112131415 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    LBALOW {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    LBAHIGH {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {NVME_CDW13_READ_WRITE}
     */
    CDW1312345678910111213141516{
        get {
            if(!this.HasProp("__CDW1312345678910111213141516"))
                this.__CDW1312345678910111213141516 := NVME_CDW13_READ_WRITE(this.ptr + 64)
            return this.__CDW1312345678910111213141516
        }
    }

    /**
     * @type {Integer}
     */
    CDW1412345678910111213141516 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {NVME_CDW15_READ_WRITE}
     */
    CDW1512345678910111213141516{
        get {
            if(!this.HasProp("__CDW1512345678910111213141516"))
                this.__CDW1512345678910111213141516 := NVME_CDW15_READ_WRITE(this.ptr + 80)
            return this.__CDW1512345678910111213141516
        }
    }

    /**
     * @type {Integer}
     */
    CDW1112345678910111213141516 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW1212345678910111213141516 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW131234567891011121314151617 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW141234567891011121314151617 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW151234567891011121314151617 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW111234567891011121314151617 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW121234567891011121314151617 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW13123456789101112131415161718 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW14123456789101112131415161718 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW15123456789101112131415161718 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW11123456789101112131415161718 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CDW12123456789101112131415161718 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    CDW1312345678910111213141516171819 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW1412345678910111213141516171819 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW1512345678910111213141516171819 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {NVME_CDW11_RESERVATION_REPORT}
     */
    CDW1112345678910111213141516171819{
        get {
            if(!this.HasProp("__CDW1112345678910111213141516171819"))
                this.__CDW1112345678910111213141516171819 := NVME_CDW11_RESERVATION_REPORT(this.ptr + 56)
            return this.__CDW1112345678910111213141516171819
        }
    }

    /**
     * @type {Integer}
     */
    CDW1212345678910111213141516171819 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CDW131234567891011121314151617181920 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CDW141234567891011121314151617181920 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW151234567891011121314151617181920 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    CDW1011 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {NVME_CDW13_ZONE_MANAGEMENT_SEND}
     */
    CDW13123456789101112131415161718192021{
        get {
            if(!this.HasProp("__CDW13123456789101112131415161718192021"))
                this.__CDW13123456789101112131415161718192021 := NVME_CDW13_ZONE_MANAGEMENT_SEND(this.ptr + 64)
            return this.__CDW13123456789101112131415161718192021
        }
    }

    /**
     * @type {Integer}
     */
    CDW14123456789101112131415161718192021 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW15123456789101112131415161718192021 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    DWORDCOUNT {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {NVME_CDW13_ZONE_MANAGEMENT_RECEIVE}
     */
    CDW1312345678910111213141516171819202122{
        get {
            if(!this.HasProp("__CDW1312345678910111213141516171819202122"))
                this.__CDW1312345678910111213141516171819202122 := NVME_CDW13_ZONE_MANAGEMENT_RECEIVE(this.ptr + 64)
            return this.__CDW1312345678910111213141516171819202122
        }
    }

    /**
     * @type {Integer}
     */
    CDW1412345678910111213141516171819202122 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CDW1512345678910111213141516171819202122 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    CDW131234567891011121314151617181920212223 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ILBRT {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {NVME_CDW15_ZONE_APPEND}
     */
    CDW151234567891011121314151617181920212223{
        get {
            if(!this.HasProp("__CDW151234567891011121314151617181920212223"))
                this.__CDW151234567891011121314151617181920212223 := NVME_CDW15_ZONE_APPEND(this.ptr + 72)
            return this.__CDW151234567891011121314151617181920212223
        }
    }
}
