#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_CDW11_CREATE_IO_CQ.ahk" { NVME_CDW11_CREATE_IO_CQ }
#Import ".\NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK.ahk" { NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK }
#Import ".\NVME_CDW13_FEATURES.ahk" { NVME_CDW13_FEATURES }
#Import ".\NVME_CDW12_GET_LOG_PAGE.ahk" { NVME_CDW12_GET_LOG_PAGE }
#Import ".\NVME_CDW10_DIRECTIVE_SEND.ahk" { NVME_CDW10_DIRECTIVE_SEND }
#Import ".\NVME_CDW11_SANITIZE.ahk" { NVME_CDW11_SANITIZE }
#Import ".\NVME_CDW15_READ_WRITE.ahk" { NVME_CDW15_READ_WRITE }
#Import ".\NVME_CDW12_FEATURES.ahk" { NVME_CDW12_FEATURES }
#Import ".\NVME_CDW10_FIRMWARE_DOWNLOAD.ahk" { NVME_CDW10_FIRMWARE_DOWNLOAD }
#Import ".\NVME_CDW10_FORMAT_NVM.ahk" { NVME_CDW10_FORMAT_NVM }
#Import ".\NVME_CDW11_DATASET_MANAGEMENT.ahk" { NVME_CDW11_DATASET_MANAGEMENT }
#Import ".\NVME_CDW10_GET_LOG_PAGE_V20.ahk" { NVME_CDW10_GET_LOG_PAGE_V20 }
#Import ".\NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER.ahk" { NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER }
#Import ".\NVME_CDW11_DIRECTIVE_RECEIVE.ahk" { NVME_CDW11_DIRECTIVE_RECEIVE }
#Import ".\NVME_CDW14_IDENTIFY.ahk" { NVME_CDW14_IDENTIFY }
#Import ".\NVME_CDW11_SECURITY_RECEIVE.ahk" { NVME_CDW11_SECURITY_RECEIVE }
#Import ".\NVME_CDW15_ZONE_APPEND.ahk" { NVME_CDW15_ZONE_APPEND }
#Import ".\NVME_CDW14_GET_LOG_PAGE.ahk" { NVME_CDW14_GET_LOG_PAGE }
#Import ".\NVME_CDW12_DIRECTIVE_RECEIVE.ahk" { NVME_CDW12_DIRECTIVE_RECEIVE }
#Import ".\NVME_CDW11_FEATURES.ahk" { NVME_CDW11_FEATURES }
#Import ".\NVME_CDW13_READ_WRITE.ahk" { NVME_CDW13_READ_WRITE }
#Import ".\NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION.ahk" { NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION }
#Import ".\NVME_CDW14_FEATURES.ahk" { NVME_CDW14_FEATURES }
#Import ".\NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE.ahk" { NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE }
#Import ".\NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER.ahk" { NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER }
#Import ".\NVME_CDW10_ZONE_MANAGEMENT_RECEIVE.ahk" { NVME_CDW10_ZONE_MANAGEMENT_RECEIVE }
#Import ".\NVME_CDW11_FEATURE_HOST_IDENTIFIER.ahk" { NVME_CDW11_FEATURE_HOST_IDENTIFIER }
#Import ".\NVME_CDW15_VERIFY_COMMAND.ahk" { NVME_CDW15_VERIFY_COMMAND }
#Import ".\NVME_CDW10_FIRMWARE_ACTIVATE.ahk" { NVME_CDW10_FIRMWARE_ACTIVATE }
#Import ".\NVME_CDW11_RESERVATION_REPORT.ahk" { NVME_CDW11_RESERVATION_REPORT }
#Import ".\NVME_CDW13_ZONE_MANAGEMENT_RECEIVE.ahk" { NVME_CDW13_ZONE_MANAGEMENT_RECEIVE }
#Import ".\NVME_CDW10_GET_FEATURES.ahk" { NVME_CDW10_GET_FEATURES }
#Import ".\NVME_CDW11_FEATURE_LBA_RANGE_TYPE.ahk" { NVME_CDW11_FEATURE_LBA_RANGE_TYPE }
#Import ".\NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG.ahk" { NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG }
#Import ".\NVME_CDW10_SET_FEATURES.ahk" { NVME_CDW10_SET_FEATURES }
#Import ".\NVME_CDW11_FEATURE_SET_HOST_METADATA.ahk" { NVME_CDW11_FEATURE_SET_HOST_METADATA }
#Import ".\NVME_CDW10_CREATE_IO_QUEUE.ahk" { NVME_CDW10_CREATE_IO_QUEUE }
#Import ".\NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES.ahk" { NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES }
#Import ".\NVME_CDW10_ZONE_APPEND.ahk" { NVME_CDW10_ZONE_APPEND }
#Import ".\NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL.ahk" { NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL }
#Import ".\NVME_CDW10_DIRECTIVE_RECEIVE.ahk" { NVME_CDW10_DIRECTIVE_RECEIVE }
#Import ".\NVME_CDW11_FEATURE_ARBITRATION.ahk" { NVME_CDW11_FEATURE_ARBITRATION }
#Import ".\NVME_CDW12_VERIFYCOMMAND.ahk" { NVME_CDW12_VERIFYCOMMAND }
#Import ".\NVME_CDW10_RESERVATION_RELEASE.ahk" { NVME_CDW10_RESERVATION_RELEASE }
#Import ".\NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE.ahk" { NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE }
#Import ".\NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE.ahk" { NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE }
#Import ".\NVME_CDW11_FEATURE_GET_HOST_METADATA.ahk" { NVME_CDW11_FEATURE_GET_HOST_METADATA }
#Import ".\NVME_CDW10_GET_LOG_PAGE_V13.ahk" { NVME_CDW10_GET_LOG_PAGE_V13 }
#Import ".\NVME_COMMAND_DWORD0.ahk" { NVME_COMMAND_DWORD0 }
#Import ".\NVME_CDW11_FIRMWARE_DOWNLOAD.ahk" { NVME_CDW11_FIRMWARE_DOWNLOAD }
#Import ".\NVME_CDW13_GET_LOG_PAGE.ahk" { NVME_CDW13_GET_LOG_PAGE }
#Import ".\NVME_CDW10_IDENTIFY.ahk" { NVME_CDW10_IDENTIFY }
#Import ".\NVME_CDW10_ZONE_MANAGEMENT_SEND.ahk" { NVME_CDW10_ZONE_MANAGEMENT_SEND }
#Import ".\NVME_CDW11_FEATURE_ERROR_RECOVERY.ahk" { NVME_CDW11_FEATURE_ERROR_RECOVERY }
#Import ".\NVME_CDW10_GET_LOG_PAGE.ahk" { NVME_CDW10_GET_LOG_PAGE }
#Import ".\NVME_CDW10_DELETE_IO_QUEUE.ahk" { NVME_CDW10_DELETE_IO_QUEUE }
#Import ".\NVME_CDW11_FEATURE_NUMBER_OF_QUEUES.ahk" { NVME_CDW11_FEATURE_NUMBER_OF_QUEUES }
#Import ".\NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG.ahk" { NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG }
#Import ".\NVME_CDW0_FEATURE_ERROR_INJECTION.ahk" { NVME_CDW0_FEATURE_ERROR_INJECTION }
#Import ".\NVME_CDW10_ABORT.ahk" { NVME_CDW10_ABORT }
#Import ".\NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE.ahk" { NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE }
#Import ".\NVME_CDW13_ZONE_MANAGEMENT_SEND.ahk" { NVME_CDW13_ZONE_MANAGEMENT_SEND }
#Import ".\NVME_CDW10_SANITIZE.ahk" { NVME_CDW10_SANITIZE }
#Import ".\NVME_CDW11_SECURITY_SEND.ahk" { NVME_CDW11_SECURITY_SEND }
#Import ".\NVME_CDW11_FEATURE_POWER_MANAGEMENT.ahk" { NVME_CDW11_FEATURE_POWER_MANAGEMENT }
#Import ".\NVME_CDW11_DIRECTIVE_SEND.ahk" { NVME_CDW11_DIRECTIVE_SEND }
#Import ".\NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER.ahk" { NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER }
#Import ".\NVME_CDW12_DIRECTIVE_SEND.ahk" { NVME_CDW12_DIRECTIVE_SEND }
#Import ".\NVME_CDW12_READ_WRITE.ahk" { NVME_CDW12_READ_WRITE }
#Import ".\NVME_CDW10_RESERVATION_REGISTER.ahk" { NVME_CDW10_RESERVATION_REGISTER }
#Import ".\NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD.ahk" { NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD }
#Import ".\NVME_CDW15_FEATURES.ahk" { NVME_CDW15_FEATURES }
#Import ".\NVME_CDW15_FEATURE_HOST_MEMORY_BUFFER.ahk" { NVME_CDW15_FEATURE_HOST_MEMORY_BUFFER }
#Import ".\NVME_CDW10_DEVICE_SELF_TEST.ahk" { NVME_CDW10_DEVICE_SELF_TEST }
#Import ".\NVME_CDW10_RESERVATION_REPORT.ahk" { NVME_CDW10_RESERVATION_REPORT }
#Import ".\NVME_CDW11_IDENTIFY.ahk" { NVME_CDW11_IDENTIFY }
#Import ".\NVME_CDW10_DATASET_MANAGEMENT.ahk" { NVME_CDW10_DATASET_MANAGEMENT }
#Import ".\NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE.ahk" { NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE }
#Import ".\NVME_CDW12_ZONE_APPEND.ahk" { NVME_CDW12_ZONE_APPEND }
#Import ".\NVME_CDW10_SECURITY_SEND_RECEIVE.ahk" { NVME_CDW10_SECURITY_SEND_RECEIVE }
#Import ".\NVME_CDW14_GET_LOG_PAGE_V20.ahk" { NVME_CDW14_GET_LOG_PAGE_V20 }
#Import ".\NVME_CDW12_FEATURE_HOST_MEMORY_BUFFER.ahk" { NVME_CDW12_FEATURE_HOST_MEMORY_BUFFER }
#Import ".\NVME_CDW11_GET_LOG_PAGE.ahk" { NVME_CDW11_GET_LOG_PAGE }
#Import ".\NVME_CDW11_FEATURE_INTERRUPT_COALESCING.ahk" { NVME_CDW11_FEATURE_INTERRUPT_COALESCING }
#Import ".\NVME_CDW10_DISCOVERY_INFO_MGMT.ahk" { NVME_CDW10_DISCOVERY_INFO_MGMT }
#Import ".\NVME_CDW11_CREATE_IO_SQ.ahk" { NVME_CDW11_CREATE_IO_SQ }
#Import ".\NVME_CDW10_RESERVATION_ACQUIRE.ahk" { NVME_CDW10_RESERVATION_ACQUIRE }
#Import ".\NVME_CDW10_GET_LOG_PAGE_V121.ahk" { NVME_CDW10_GET_LOG_PAGE_V121 }

/**
 * Contains the parameters for all commands in the Admin Command and NVM Command sets.
 * @remarks
 * The Admin Command Set defines the commands that may be submitted to the Admin Submission Queue.
 * 
 * For all Admin commands, DWord 14 and DWord 15 are I/O Command Set specific.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_COMMAND {
    #StructPack 8


    struct _u {

        struct _GENERAL {
            CDW10 : UInt32

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _IDENTIFY {
            CDW10 : NVME_CDW10_IDENTIFY

            CDW11 : NVME_CDW11_IDENTIFY

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

            static __New() {
                DefineProp(this.Prototype, 'CDW14_V20', { type: NVME_CDW14_IDENTIFY, offset: 28 })
                this.DeleteProp("__New")
            }
        }

        struct _ABORT {
            CDW10 : NVME_CDW10_ABORT

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _GETFEATURES {
            CDW10 : NVME_CDW10_GET_FEATURES

            CDW11 : NVME_CDW11_FEATURES

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _SETFEATURES {
            CDW10 : NVME_CDW10_SET_FEATURES

            CDW11 : NVME_CDW11_FEATURES

            CDW12 : NVME_CDW12_FEATURES

            CDW13 : NVME_CDW13_FEATURES

            CDW14 : NVME_CDW14_FEATURES

            CDW15 : NVME_CDW15_FEATURES

        }

        struct _GETLOGPAGE {
            CDW10 : NVME_CDW10_GET_LOG_PAGE

            CDW11 : NVME_CDW11_GET_LOG_PAGE

            CDW12 : NVME_CDW12_GET_LOG_PAGE

            CDW13 : NVME_CDW13_GET_LOG_PAGE

            CDW14 : NVME_CDW14_GET_LOG_PAGE

            CDW15 : UInt32

            static __New() {
                DefineProp(this.Prototype, 'CDW10_V121', { type: NVME_CDW10_GET_LOG_PAGE_V121, offset: 0 })
                DefineProp(this.Prototype, 'CDW10_V13', { type: NVME_CDW10_GET_LOG_PAGE_V13, offset: 0 })
                DefineProp(this.Prototype, 'CDW10_V20', { type: NVME_CDW10_GET_LOG_PAGE_V20, offset: 0 })
                DefineProp(this.Prototype, 'CDW14_V20', { type: NVME_CDW14_GET_LOG_PAGE_V20, offset: 32 })
                this.DeleteProp("__New")
            }
        }

        struct _CREATEIOCQ {
            CDW10 : NVME_CDW10_CREATE_IO_QUEUE

            CDW11 : NVME_CDW11_CREATE_IO_CQ

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _CREATEIOSQ {
            CDW10 : NVME_CDW10_CREATE_IO_QUEUE

            CDW11 : NVME_CDW11_CREATE_IO_SQ

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _DELETEIOQUEUE {
            CDW10 : NVME_CDW10_DELETE_IO_QUEUE

        }

        struct _DATASETMANAGEMENT {
            CDW10 : NVME_CDW10_DATASET_MANAGEMENT

            CDW11 : NVME_CDW11_DATASET_MANAGEMENT

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _SECURITYSEND {
            CDW10 : NVME_CDW10_SECURITY_SEND_RECEIVE

            CDW11 : NVME_CDW11_SECURITY_SEND

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _SECURITYRECEIVE {
            CDW10 : NVME_CDW10_SECURITY_SEND_RECEIVE

            CDW11 : NVME_CDW11_SECURITY_RECEIVE

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _FIRMWAREDOWNLOAD {
            CDW10 : NVME_CDW10_FIRMWARE_DOWNLOAD

            CDW11 : NVME_CDW11_FIRMWARE_DOWNLOAD

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _FIRMWAREACTIVATE {
            CDW10 : NVME_CDW10_FIRMWARE_ACTIVATE

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _FORMATNVM {
            CDW10 : NVME_CDW10_FORMAT_NVM

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _DIRECTIVERECEIVE {
            CDW10 : NVME_CDW10_DIRECTIVE_RECEIVE

            CDW11 : NVME_CDW11_DIRECTIVE_RECEIVE

            CDW12 : NVME_CDW12_DIRECTIVE_RECEIVE

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _DIRECTIVESEND {
            CDW10 : NVME_CDW10_DIRECTIVE_SEND

            CDW11 : NVME_CDW11_DIRECTIVE_SEND

            CDW12 : NVME_CDW12_DIRECTIVE_SEND

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _SANITIZE {
            CDW10 : NVME_CDW10_SANITIZE

            CDW11 : NVME_CDW11_SANITIZE

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _READWRITE {
            LBALOW : UInt32

            LBAHIGH : UInt32

            CDW12 : NVME_CDW12_READ_WRITE

            CDW13 : NVME_CDW13_READ_WRITE

            CDW14 : UInt32

            CDW15 : NVME_CDW15_READ_WRITE

        }

        struct _RESERVATIONACQUIRE {
            CDW10 : NVME_CDW10_RESERVATION_ACQUIRE

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _RESERVATIONREGISTER {
            CDW10 : NVME_CDW10_RESERVATION_REGISTER

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _RESERVATIONRELEASE {
            CDW10 : NVME_CDW10_RESERVATION_RELEASE

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _RESERVATIONREPORT {
            CDW10 : NVME_CDW10_RESERVATION_REPORT

            CDW11 : NVME_CDW11_RESERVATION_REPORT

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _ZONEMANAGEMENTSEND {
            CDW1011 : NVME_CDW10_ZONE_MANAGEMENT_SEND

            CDW12 : UInt32

            CDW13 : NVME_CDW13_ZONE_MANAGEMENT_SEND

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _ZONEMANAGEMENTRECEIVE {
            CDW1011 : NVME_CDW10_ZONE_MANAGEMENT_RECEIVE

            DWORDCOUNT : UInt32

            CDW13 : NVME_CDW13_ZONE_MANAGEMENT_RECEIVE

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _ZONEAPPEND {
            CDW1011 : NVME_CDW10_ZONE_APPEND

            CDW12 : NVME_CDW12_ZONE_APPEND

            CDW13 : UInt32

            ILBRT : UInt32

            CDW15 : NVME_CDW15_ZONE_APPEND

        }

        struct _DEVICESELFTEST {
            CDW10 : NVME_CDW10_DEVICE_SELF_TEST

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _DISCOVERYINFOMGMT {
            CDW10 : NVME_CDW10_DISCOVERY_INFO_MGMT

            CDW11 : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _VENDORSPECIFIC {
            NDT : UInt32

            NDM : UInt32

            CDW12 : UInt32

            CDW13 : UInt32

            CDW14 : UInt32

            CDW15 : UInt32

        }

        struct _VERIFYCOMMAND {
            LBALOW : UInt32

            LBAHIGH : UInt32

            CDW12 : NVME_CDW12_VERIFYCOMMAND

            CDW13 : UInt32

            EILBRT : UInt32

            CDW15 : NVME_CDW15_VERIFY_COMMAND

        }

        GENERAL : NVME_COMMAND._u._GENERAL

        static __New() {
            DefineProp(this.Prototype, 'IDENTIFY', { type: NVME_COMMAND._u._IDENTIFY, offset: 0 })
            DefineProp(this.Prototype, 'ABORT', { type: NVME_COMMAND._u._ABORT, offset: 0 })
            DefineProp(this.Prototype, 'GETFEATURES', { type: NVME_COMMAND._u._GETFEATURES, offset: 0 })
            DefineProp(this.Prototype, 'SETFEATURES', { type: NVME_COMMAND._u._SETFEATURES, offset: 0 })
            DefineProp(this.Prototype, 'GETLOGPAGE', { type: NVME_COMMAND._u._GETLOGPAGE, offset: 0 })
            DefineProp(this.Prototype, 'CREATEIOCQ', { type: NVME_COMMAND._u._CREATEIOCQ, offset: 0 })
            DefineProp(this.Prototype, 'CREATEIOSQ', { type: NVME_COMMAND._u._CREATEIOSQ, offset: 0 })
            DefineProp(this.Prototype, 'DELETEIOQUEUE', { type: NVME_COMMAND._u._DELETEIOQUEUE, offset: 0 })
            DefineProp(this.Prototype, 'DATASETMANAGEMENT', { type: NVME_COMMAND._u._DATASETMANAGEMENT, offset: 0 })
            DefineProp(this.Prototype, 'SECURITYSEND', { type: NVME_COMMAND._u._SECURITYSEND, offset: 0 })
            DefineProp(this.Prototype, 'SECURITYRECEIVE', { type: NVME_COMMAND._u._SECURITYRECEIVE, offset: 0 })
            DefineProp(this.Prototype, 'FIRMWAREDOWNLOAD', { type: NVME_COMMAND._u._FIRMWAREDOWNLOAD, offset: 0 })
            DefineProp(this.Prototype, 'FIRMWAREACTIVATE', { type: NVME_COMMAND._u._FIRMWAREACTIVATE, offset: 0 })
            DefineProp(this.Prototype, 'FORMATNVM', { type: NVME_COMMAND._u._FORMATNVM, offset: 0 })
            DefineProp(this.Prototype, 'DIRECTIVERECEIVE', { type: NVME_COMMAND._u._DIRECTIVERECEIVE, offset: 0 })
            DefineProp(this.Prototype, 'DIRECTIVESEND', { type: NVME_COMMAND._u._DIRECTIVESEND, offset: 0 })
            DefineProp(this.Prototype, 'SANITIZE', { type: NVME_COMMAND._u._SANITIZE, offset: 0 })
            DefineProp(this.Prototype, 'READWRITE', { type: NVME_COMMAND._u._READWRITE, offset: 0 })
            DefineProp(this.Prototype, 'RESERVATIONACQUIRE', { type: NVME_COMMAND._u._RESERVATIONACQUIRE, offset: 0 })
            DefineProp(this.Prototype, 'RESERVATIONREGISTER', { type: NVME_COMMAND._u._RESERVATIONREGISTER, offset: 0 })
            DefineProp(this.Prototype, 'RESERVATIONRELEASE', { type: NVME_COMMAND._u._RESERVATIONRELEASE, offset: 0 })
            DefineProp(this.Prototype, 'RESERVATIONREPORT', { type: NVME_COMMAND._u._RESERVATIONREPORT, offset: 0 })
            DefineProp(this.Prototype, 'ZONEMANAGEMENTSEND', { type: NVME_COMMAND._u._ZONEMANAGEMENTSEND, offset: 0 })
            DefineProp(this.Prototype, 'ZONEMANAGEMENTRECEIVE', { type: NVME_COMMAND._u._ZONEMANAGEMENTRECEIVE, offset: 0 })
            DefineProp(this.Prototype, 'ZONEAPPEND', { type: NVME_COMMAND._u._ZONEAPPEND, offset: 0 })
            DefineProp(this.Prototype, 'DEVICESELFTEST', { type: NVME_COMMAND._u._DEVICESELFTEST, offset: 0 })
            DefineProp(this.Prototype, 'DISCOVERYINFOMGMT', { type: NVME_COMMAND._u._DISCOVERYINFOMGMT, offset: 0 })
            DefineProp(this.Prototype, 'VENDORSPECIFIC', { type: NVME_COMMAND._u._VENDORSPECIFIC, offset: 0 })
            DefineProp(this.Prototype, 'VERIFYCOMMAND', { type: NVME_COMMAND._u._VERIFYCOMMAND, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A [NVME_COMMAND_DWORD0](ns-nvme-nvme_command_dword0.md) structure containing parameters that are common for all Admin and NVM commands.
     */
    CDW0 : NVME_COMMAND_DWORD0

    /**
     * The namespace ID that this command applies to.
     * 
     * If the namespace ID is not used for the command, then this field should cleared to `0h`. If a command is applied to all namespaces accessible by this controller, then this field should be set to `FFFFFFFFh`.
     * 
     * Unless otherwise noted, specifying an inactive namespace ID in a command that uses the namespace ID will cause the controller to abort the command with the status [NVME_STATUS_INVALID_FIELD_IN_COMMAND](ne-nvme-nvme_status_generic_command_codes.md#-field-nvme-status-invalid-field-in-command). Specifying an invalid namespace ID in a command that uses the namespace ID will cause the controller to abort the command with the status [NVME_STATUS_INVALID_NAMESPACE_OR_FORMAT](ne-nvme-nvme_status_generic_command_codes.md#-field-nvme-status-invalid-namespace-or-format).
     */
    NSID : UInt32

    Reserved0 : UInt32[2]

    /**
     * The address of a contiguous physical buffer of metadata.
     * 
     * This field is only used if metadata is not interleaved with the logical block data, as specified in the **MS** field of the [NVME_CDW10_FORMAT_NVM](ns-nvme-nvme_cdw10_format_nvm.md) command structure. This field is Dword aligned.
     */
    MPTR : Int64

    PRP1 : Int64

    PRP2 : Int64

    /**
     * A union of all the command structures.
     */
    u : NVME_COMMAND._u

    static __New() {
        DefineProp(this.Prototype, 'SGL1', { type: Int64[2], offset: 32 })
        this.DeleteProp("__New")
    }
}
