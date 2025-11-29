#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_COMMAND_DWORD0.ahk
#Include .\NVME_CDW10_IDENTIFY.ahk
#Include .\NVME_CDW11_IDENTIFY.ahk
#Include .\NVME_CDW14_IDENTIFY.ahk
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
#Include .\NVME_CDW11_FEATURE_HOST_IDENTIFIER.ahk
#Include .\NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE.ahk
#Include .\NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK.ahk
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
#Include .\NVME_CDW10_GET_LOG_PAGE_V121.ahk
#Include .\NVME_CDW10_GET_LOG_PAGE_V13.ahk
#Include .\NVME_CDW10_GET_LOG_PAGE_V20.ahk
#Include .\NVME_CDW11_GET_LOG_PAGE.ahk
#Include .\NVME_CDW12_GET_LOG_PAGE.ahk
#Include .\NVME_CDW13_GET_LOG_PAGE.ahk
#Include .\NVME_CDW14_GET_LOG_PAGE.ahk
#Include .\NVME_CDW14_GET_LOG_PAGE_V20.ahk
#Include .\NVME_CDW10_CREATE_IO_QUEUE.ahk
#Include .\NVME_CDW11_CREATE_IO_CQ.ahk
#Include .\NVME_CDW11_CREATE_IO_SQ.ahk
#Include .\NVME_CDW10_DELETE_IO_QUEUE.ahk
#Include .\NVME_CDW10_DATASET_MANAGEMENT.ahk
#Include .\NVME_CDW11_DATASET_MANAGEMENT.ahk
#Include .\NVME_CDW10_SECURITY_SEND_RECEIVE.ahk
#Include .\NVME_CDW11_SECURITY_SEND.ahk
#Include .\NVME_CDW11_SECURITY_RECEIVE.ahk
#Include .\NVME_CDW10_FIRMWARE_DOWNLOAD.ahk
#Include .\NVME_CDW11_FIRMWARE_DOWNLOAD.ahk
#Include .\NVME_CDW10_FIRMWARE_ACTIVATE.ahk
#Include .\NVME_CDW10_FORMAT_NVM.ahk
#Include .\NVME_CDW10_DIRECTIVE_RECEIVE.ahk
#Include .\NVME_CDW11_DIRECTIVE_RECEIVE.ahk
#Include .\NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES.ahk
#Include .\NVME_CDW12_DIRECTIVE_RECEIVE.ahk
#Include .\NVME_CDW10_DIRECTIVE_SEND.ahk
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
#Include .\NVME_CDW10_ZONE_MANAGEMENT_SEND.ahk
#Include .\NVME_CDW13_ZONE_MANAGEMENT_SEND.ahk
#Include .\NVME_CDW10_ZONE_MANAGEMENT_RECEIVE.ahk
#Include .\NVME_CDW13_ZONE_MANAGEMENT_RECEIVE.ahk
#Include .\NVME_CDW10_ZONE_APPEND.ahk
#Include .\NVME_CDW12_ZONE_APPEND.ahk
#Include .\NVME_CDW15_ZONE_APPEND.ahk
#Include .\NVME_CDW10_DEVICE_SELF_TEST.ahk
#Include .\NVME_CDW10_DISCOVERY_INFO_MGMT.ahk
#Include .\NVME_CDW12_VERIFYCOMMAND.ahk
#Include .\NVME_CDW15_VERIFY_COMMAND.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 240
        static packingSize => 8

        class _GENERAL extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            CDW10 {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _IDENTIFY extends Win32Struct {
            static sizeof => 48
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_IDENTIFY}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_IDENTIFY(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_IDENTIFY}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_IDENTIFY(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 32, "uint")
                set => NumPut("uint", value, this, 32)
            }
        
            /**
             * @type {NVME_CDW14_IDENTIFY}
             */
            CDW14_V20{
                get {
                    if(!this.HasProp("__CDW14_V20"))
                        this.__CDW14_V20 := NVME_CDW14_IDENTIFY(32, this)
                    return this.__CDW14_V20
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 40, "uint")
                set => NumPut("uint", value, this, 40)
            }
        
        }
    
        class _ABORT extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_ABORT}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_ABORT(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _GETFEATURES extends Win32Struct {
            static sizeof => 192
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_GET_FEATURES}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_GET_FEATURES(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_FEATURES}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_FEATURES(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 176, "uint")
                set => NumPut("uint", value, this, 176)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 180, "uint")
                set => NumPut("uint", value, this, 180)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 184, "uint")
                set => NumPut("uint", value, this, 184)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 188, "uint")
                set => NumPut("uint", value, this, 188)
            }
        
        }
    
        class _SETFEATURES extends Win32Struct {
            static sizeof => 240
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_SET_FEATURES}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_SET_FEATURES(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_FEATURES}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_FEATURES(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {NVME_CDW12_FEATURES}
             */
            CDW12{
                get {
                    if(!this.HasProp("__CDW12"))
                        this.__CDW12 := NVME_CDW12_FEATURES(176, this)
                    return this.__CDW12
                }
            }
        
            /**
             * @type {NVME_CDW13_FEATURES}
             */
            CDW13{
                get {
                    if(!this.HasProp("__CDW13"))
                        this.__CDW13 := NVME_CDW13_FEATURES(192, this)
                    return this.__CDW13
                }
            }
        
            /**
             * @type {NVME_CDW14_FEATURES}
             */
            CDW14{
                get {
                    if(!this.HasProp("__CDW14"))
                        this.__CDW14 := NVME_CDW14_FEATURES(208, this)
                    return this.__CDW14
                }
            }
        
            /**
             * @type {NVME_CDW15_FEATURES}
             */
            CDW15{
                get {
                    if(!this.HasProp("__CDW15"))
                        this.__CDW15 := NVME_CDW15_FEATURES(224, this)
                    return this.__CDW15
                }
            }
        
        }
    
        class _GETLOGPAGE extends Win32Struct {
            static sizeof => 48
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_GET_LOG_PAGE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_GET_LOG_PAGE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW10_GET_LOG_PAGE_V121}
             */
            CDW10_V121{
                get {
                    if(!this.HasProp("__CDW10_V121"))
                        this.__CDW10_V121 := NVME_CDW10_GET_LOG_PAGE_V121(0, this)
                    return this.__CDW10_V121
                }
            }
        
            /**
             * @type {NVME_CDW10_GET_LOG_PAGE_V13}
             */
            CDW10_V13{
                get {
                    if(!this.HasProp("__CDW10_V13"))
                        this.__CDW10_V13 := NVME_CDW10_GET_LOG_PAGE_V13(0, this)
                    return this.__CDW10_V13
                }
            }
        
            /**
             * @type {NVME_CDW10_GET_LOG_PAGE_V20}
             */
            CDW10_V20{
                get {
                    if(!this.HasProp("__CDW10_V20"))
                        this.__CDW10_V20 := NVME_CDW10_GET_LOG_PAGE_V20(0, this)
                    return this.__CDW10_V20
                }
            }
        
            /**
             * @type {NVME_CDW11_GET_LOG_PAGE}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_GET_LOG_PAGE(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {NVME_CDW12_GET_LOG_PAGE}
             */
            CDW12{
                get {
                    if(!this.HasProp("__CDW12"))
                        this.__CDW12 := NVME_CDW12_GET_LOG_PAGE(16, this)
                    return this.__CDW12
                }
            }
        
            /**
             * @type {NVME_CDW13_GET_LOG_PAGE}
             */
            CDW13{
                get {
                    if(!this.HasProp("__CDW13"))
                        this.__CDW13 := NVME_CDW13_GET_LOG_PAGE(24, this)
                    return this.__CDW13
                }
            }
        
            /**
             * @type {NVME_CDW14_GET_LOG_PAGE}
             */
            CDW14{
                get {
                    if(!this.HasProp("__CDW14"))
                        this.__CDW14 := NVME_CDW14_GET_LOG_PAGE(32, this)
                    return this.__CDW14
                }
            }
        
            /**
             * @type {NVME_CDW14_GET_LOG_PAGE_V20}
             */
            CDW14_V20{
                get {
                    if(!this.HasProp("__CDW14_V20"))
                        this.__CDW14_V20 := NVME_CDW14_GET_LOG_PAGE_V20(32, this)
                    return this.__CDW14_V20
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 40, "uint")
                set => NumPut("uint", value, this, 40)
            }
        
        }
    
        class _CREATEIOCQ extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_CREATE_IO_QUEUE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_CREATE_IO_QUEUE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_CREATE_IO_CQ}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_CREATE_IO_CQ(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _CREATEIOSQ extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_CREATE_IO_QUEUE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_CREATE_IO_QUEUE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_CREATE_IO_SQ}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_CREATE_IO_SQ(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _DELETEIOQUEUE extends Win32Struct {
            static sizeof => 8
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_DELETE_IO_QUEUE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_DELETE_IO_QUEUE(0, this)
                    return this.__CDW10
                }
            }
        
        }
    
        class _DATASETMANAGEMENT extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_DATASET_MANAGEMENT}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_DATASET_MANAGEMENT(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_DATASET_MANAGEMENT}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_DATASET_MANAGEMENT(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _SECURITYSEND extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_SECURITY_SEND_RECEIVE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_SECURITY_SEND_RECEIVE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_SECURITY_SEND}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_SECURITY_SEND(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _SECURITYRECEIVE extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_SECURITY_SEND_RECEIVE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_SECURITY_SEND_RECEIVE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_SECURITY_RECEIVE}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_SECURITY_RECEIVE(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _FIRMWAREDOWNLOAD extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {NVME_CDW10_FIRMWARE_DOWNLOAD}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_FIRMWARE_DOWNLOAD(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_FIRMWARE_DOWNLOAD}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_FIRMWARE_DOWNLOAD(4, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _FIRMWAREACTIVATE extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_FIRMWARE_ACTIVATE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_FIRMWARE_ACTIVATE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _FORMATNVM extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_FORMAT_NVM}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_FORMAT_NVM(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _DIRECTIVERECEIVE extends Win32Struct {
            static sizeof => 48
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_DIRECTIVE_RECEIVE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_DIRECTIVE_RECEIVE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_DIRECTIVE_RECEIVE}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_DIRECTIVE_RECEIVE(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {NVME_CDW12_DIRECTIVE_RECEIVE}
             */
            CDW12{
                get {
                    if(!this.HasProp("__CDW12"))
                        this.__CDW12 := NVME_CDW12_DIRECTIVE_RECEIVE(16, this)
                    return this.__CDW12
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 32, "uint")
                set => NumPut("uint", value, this, 32)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 36, "uint")
                set => NumPut("uint", value, this, 36)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 40, "uint")
                set => NumPut("uint", value, this, 40)
            }
        
        }
    
        class _DIRECTIVESEND extends Win32Struct {
            static sizeof => 48
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_DIRECTIVE_SEND}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_DIRECTIVE_SEND(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_DIRECTIVE_SEND}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_DIRECTIVE_SEND(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {NVME_CDW12_DIRECTIVE_SEND}
             */
            CDW12{
                get {
                    if(!this.HasProp("__CDW12"))
                        this.__CDW12 := NVME_CDW12_DIRECTIVE_SEND(16, this)
                    return this.__CDW12
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 32, "uint")
                set => NumPut("uint", value, this, 32)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 36, "uint")
                set => NumPut("uint", value, this, 36)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 40, "uint")
                set => NumPut("uint", value, this, 40)
            }
        
        }
    
        class _SANITIZE extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_SANITIZE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_SANITIZE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_SANITIZE}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_SANITIZE(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _READWRITE extends Win32Struct {
            static sizeof => 40
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            LBALOW {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            LBAHIGH {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {NVME_CDW12_READ_WRITE}
             */
            CDW12{
                get {
                    if(!this.HasProp("__CDW12"))
                        this.__CDW12 := NVME_CDW12_READ_WRITE(8, this)
                    return this.__CDW12
                }
            }
        
            /**
             * @type {NVME_CDW13_READ_WRITE}
             */
            CDW13{
                get {
                    if(!this.HasProp("__CDW13"))
                        this.__CDW13 := NVME_CDW13_READ_WRITE(16, this)
                    return this.__CDW13
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {NVME_CDW15_READ_WRITE}
             */
            CDW15{
                get {
                    if(!this.HasProp("__CDW15"))
                        this.__CDW15 := NVME_CDW15_READ_WRITE(32, this)
                    return this.__CDW15
                }
            }
        
        }
    
        class _RESERVATIONACQUIRE extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_RESERVATION_ACQUIRE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_RESERVATION_ACQUIRE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _RESERVATIONREGISTER extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_RESERVATION_REGISTER}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_RESERVATION_REGISTER(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _RESERVATIONRELEASE extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_RESERVATION_RELEASE}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_RESERVATION_RELEASE(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _RESERVATIONREPORT extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_RESERVATION_REPORT}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_RESERVATION_REPORT(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {NVME_CDW11_RESERVATION_REPORT}
             */
            CDW11{
                get {
                    if(!this.HasProp("__CDW11"))
                        this.__CDW11 := NVME_CDW11_RESERVATION_REPORT(8, this)
                    return this.__CDW11
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _ZONEMANAGEMENTSEND extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_ZONE_MANAGEMENT_SEND}
             */
            CDW1011{
                get {
                    if(!this.HasProp("__CDW1011"))
                        this.__CDW1011 := NVME_CDW10_ZONE_MANAGEMENT_SEND(0, this)
                    return this.__CDW1011
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {NVME_CDW13_ZONE_MANAGEMENT_SEND}
             */
            CDW13{
                get {
                    if(!this.HasProp("__CDW13"))
                        this.__CDW13 := NVME_CDW13_ZONE_MANAGEMENT_SEND(16, this)
                    return this.__CDW13
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _ZONEMANAGEMENTRECEIVE extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_ZONE_MANAGEMENT_RECEIVE}
             */
            CDW1011{
                get {
                    if(!this.HasProp("__CDW1011"))
                        this.__CDW1011 := NVME_CDW10_ZONE_MANAGEMENT_RECEIVE(0, this)
                    return this.__CDW1011
                }
            }
        
            /**
             * @type {Integer}
             */
            DWORDCOUNT {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {NVME_CDW13_ZONE_MANAGEMENT_RECEIVE}
             */
            CDW13{
                get {
                    if(!this.HasProp("__CDW13"))
                        this.__CDW13 := NVME_CDW13_ZONE_MANAGEMENT_RECEIVE(16, this)
                    return this.__CDW13
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _ZONEAPPEND extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_ZONE_APPEND}
             */
            CDW1011{
                get {
                    if(!this.HasProp("__CDW1011"))
                        this.__CDW1011 := NVME_CDW10_ZONE_APPEND(0, this)
                    return this.__CDW1011
                }
            }
        
            /**
             * @type {NVME_CDW12_ZONE_APPEND}
             */
            CDW12{
                get {
                    if(!this.HasProp("__CDW12"))
                        this.__CDW12 := NVME_CDW12_ZONE_APPEND(8, this)
                    return this.__CDW12
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            ILBRT {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {NVME_CDW15_ZONE_APPEND}
             */
            CDW15{
                get {
                    if(!this.HasProp("__CDW15"))
                        this.__CDW15 := NVME_CDW15_ZONE_APPEND(24, this)
                    return this.__CDW15
                }
            }
        
        }
    
        class _DEVICESELFTEST extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_DEVICE_SELF_TEST}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_DEVICE_SELF_TEST(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _DISCOVERYINFOMGMT extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {NVME_CDW10_DISCOVERY_INFO_MGMT}
             */
            CDW10{
                get {
                    if(!this.HasProp("__CDW10"))
                        this.__CDW10 := NVME_CDW10_DISCOVERY_INFO_MGMT(0, this)
                    return this.__CDW10
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW11 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _VENDORSPECIFIC extends Win32Struct {
            static sizeof => 24
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            NDT {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            NDM {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            CDW12 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            CDW14 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            CDW15 {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
        }
    
        class _VERIFYCOMMAND extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            LBALOW {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            LBAHIGH {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {NVME_CDW12_VERIFYCOMMAND}
             */
            CDW12{
                get {
                    if(!this.HasProp("__CDW12"))
                        this.__CDW12 := NVME_CDW12_VERIFYCOMMAND(8, this)
                    return this.__CDW12
                }
            }
        
            /**
             * @type {Integer}
             */
            CDW13 {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            EILBRT {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {NVME_CDW15_VERIFY_COMMAND}
             */
            CDW15{
                get {
                    if(!this.HasProp("__CDW15"))
                        this.__CDW15 := NVME_CDW15_VERIFY_COMMAND(24, this)
                    return this.__CDW15
                }
            }
        
        }
    
        /**
         * @type {_GENERAL}
         */
        GENERAL{
            get {
                if(!this.HasProp("__GENERAL"))
                    this.__GENERAL := %this.__Class%._GENERAL(0, this)
                return this.__GENERAL
            }
        }
    
        /**
         * @type {_IDENTIFY}
         */
        IDENTIFY{
            get {
                if(!this.HasProp("__IDENTIFY"))
                    this.__IDENTIFY := %this.__Class%._IDENTIFY(0, this)
                return this.__IDENTIFY
            }
        }
    
        /**
         * @type {_ABORT}
         */
        ABORT{
            get {
                if(!this.HasProp("__ABORT"))
                    this.__ABORT := %this.__Class%._ABORT(0, this)
                return this.__ABORT
            }
        }
    
        /**
         * @type {_GETFEATURES}
         */
        GETFEATURES{
            get {
                if(!this.HasProp("__GETFEATURES"))
                    this.__GETFEATURES := %this.__Class%._GETFEATURES(0, this)
                return this.__GETFEATURES
            }
        }
    
        /**
         * @type {_SETFEATURES}
         */
        SETFEATURES{
            get {
                if(!this.HasProp("__SETFEATURES"))
                    this.__SETFEATURES := %this.__Class%._SETFEATURES(0, this)
                return this.__SETFEATURES
            }
        }
    
        /**
         * @type {_GETLOGPAGE}
         */
        GETLOGPAGE{
            get {
                if(!this.HasProp("__GETLOGPAGE"))
                    this.__GETLOGPAGE := %this.__Class%._GETLOGPAGE(0, this)
                return this.__GETLOGPAGE
            }
        }
    
        /**
         * @type {_CREATEIOCQ}
         */
        CREATEIOCQ{
            get {
                if(!this.HasProp("__CREATEIOCQ"))
                    this.__CREATEIOCQ := %this.__Class%._CREATEIOCQ(0, this)
                return this.__CREATEIOCQ
            }
        }
    
        /**
         * @type {_CREATEIOSQ}
         */
        CREATEIOSQ{
            get {
                if(!this.HasProp("__CREATEIOSQ"))
                    this.__CREATEIOSQ := %this.__Class%._CREATEIOSQ(0, this)
                return this.__CREATEIOSQ
            }
        }
    
        /**
         * @type {_DELETEIOQUEUE}
         */
        DELETEIOQUEUE{
            get {
                if(!this.HasProp("__DELETEIOQUEUE"))
                    this.__DELETEIOQUEUE := %this.__Class%._DELETEIOQUEUE(0, this)
                return this.__DELETEIOQUEUE
            }
        }
    
        /**
         * @type {_DATASETMANAGEMENT}
         */
        DATASETMANAGEMENT{
            get {
                if(!this.HasProp("__DATASETMANAGEMENT"))
                    this.__DATASETMANAGEMENT := %this.__Class%._DATASETMANAGEMENT(0, this)
                return this.__DATASETMANAGEMENT
            }
        }
    
        /**
         * @type {_SECURITYSEND}
         */
        SECURITYSEND{
            get {
                if(!this.HasProp("__SECURITYSEND"))
                    this.__SECURITYSEND := %this.__Class%._SECURITYSEND(0, this)
                return this.__SECURITYSEND
            }
        }
    
        /**
         * @type {_SECURITYRECEIVE}
         */
        SECURITYRECEIVE{
            get {
                if(!this.HasProp("__SECURITYRECEIVE"))
                    this.__SECURITYRECEIVE := %this.__Class%._SECURITYRECEIVE(0, this)
                return this.__SECURITYRECEIVE
            }
        }
    
        /**
         * @type {_FIRMWAREDOWNLOAD}
         */
        FIRMWAREDOWNLOAD{
            get {
                if(!this.HasProp("__FIRMWAREDOWNLOAD"))
                    this.__FIRMWAREDOWNLOAD := %this.__Class%._FIRMWAREDOWNLOAD(0, this)
                return this.__FIRMWAREDOWNLOAD
            }
        }
    
        /**
         * @type {_FIRMWAREACTIVATE}
         */
        FIRMWAREACTIVATE{
            get {
                if(!this.HasProp("__FIRMWAREACTIVATE"))
                    this.__FIRMWAREACTIVATE := %this.__Class%._FIRMWAREACTIVATE(0, this)
                return this.__FIRMWAREACTIVATE
            }
        }
    
        /**
         * @type {_FORMATNVM}
         */
        FORMATNVM{
            get {
                if(!this.HasProp("__FORMATNVM"))
                    this.__FORMATNVM := %this.__Class%._FORMATNVM(0, this)
                return this.__FORMATNVM
            }
        }
    
        /**
         * @type {_DIRECTIVERECEIVE}
         */
        DIRECTIVERECEIVE{
            get {
                if(!this.HasProp("__DIRECTIVERECEIVE"))
                    this.__DIRECTIVERECEIVE := %this.__Class%._DIRECTIVERECEIVE(0, this)
                return this.__DIRECTIVERECEIVE
            }
        }
    
        /**
         * @type {_DIRECTIVESEND}
         */
        DIRECTIVESEND{
            get {
                if(!this.HasProp("__DIRECTIVESEND"))
                    this.__DIRECTIVESEND := %this.__Class%._DIRECTIVESEND(0, this)
                return this.__DIRECTIVESEND
            }
        }
    
        /**
         * @type {_SANITIZE}
         */
        SANITIZE{
            get {
                if(!this.HasProp("__SANITIZE"))
                    this.__SANITIZE := %this.__Class%._SANITIZE(0, this)
                return this.__SANITIZE
            }
        }
    
        /**
         * @type {_READWRITE}
         */
        READWRITE{
            get {
                if(!this.HasProp("__READWRITE"))
                    this.__READWRITE := %this.__Class%._READWRITE(0, this)
                return this.__READWRITE
            }
        }
    
        /**
         * @type {_RESERVATIONACQUIRE}
         */
        RESERVATIONACQUIRE{
            get {
                if(!this.HasProp("__RESERVATIONACQUIRE"))
                    this.__RESERVATIONACQUIRE := %this.__Class%._RESERVATIONACQUIRE(0, this)
                return this.__RESERVATIONACQUIRE
            }
        }
    
        /**
         * @type {_RESERVATIONREGISTER}
         */
        RESERVATIONREGISTER{
            get {
                if(!this.HasProp("__RESERVATIONREGISTER"))
                    this.__RESERVATIONREGISTER := %this.__Class%._RESERVATIONREGISTER(0, this)
                return this.__RESERVATIONREGISTER
            }
        }
    
        /**
         * @type {_RESERVATIONRELEASE}
         */
        RESERVATIONRELEASE{
            get {
                if(!this.HasProp("__RESERVATIONRELEASE"))
                    this.__RESERVATIONRELEASE := %this.__Class%._RESERVATIONRELEASE(0, this)
                return this.__RESERVATIONRELEASE
            }
        }
    
        /**
         * @type {_RESERVATIONREPORT}
         */
        RESERVATIONREPORT{
            get {
                if(!this.HasProp("__RESERVATIONREPORT"))
                    this.__RESERVATIONREPORT := %this.__Class%._RESERVATIONREPORT(0, this)
                return this.__RESERVATIONREPORT
            }
        }
    
        /**
         * @type {_ZONEMANAGEMENTSEND}
         */
        ZONEMANAGEMENTSEND{
            get {
                if(!this.HasProp("__ZONEMANAGEMENTSEND"))
                    this.__ZONEMANAGEMENTSEND := %this.__Class%._ZONEMANAGEMENTSEND(0, this)
                return this.__ZONEMANAGEMENTSEND
            }
        }
    
        /**
         * @type {_ZONEMANAGEMENTRECEIVE}
         */
        ZONEMANAGEMENTRECEIVE{
            get {
                if(!this.HasProp("__ZONEMANAGEMENTRECEIVE"))
                    this.__ZONEMANAGEMENTRECEIVE := %this.__Class%._ZONEMANAGEMENTRECEIVE(0, this)
                return this.__ZONEMANAGEMENTRECEIVE
            }
        }
    
        /**
         * @type {_ZONEAPPEND}
         */
        ZONEAPPEND{
            get {
                if(!this.HasProp("__ZONEAPPEND"))
                    this.__ZONEAPPEND := %this.__Class%._ZONEAPPEND(0, this)
                return this.__ZONEAPPEND
            }
        }
    
        /**
         * @type {_DEVICESELFTEST}
         */
        DEVICESELFTEST{
            get {
                if(!this.HasProp("__DEVICESELFTEST"))
                    this.__DEVICESELFTEST := %this.__Class%._DEVICESELFTEST(0, this)
                return this.__DEVICESELFTEST
            }
        }
    
        /**
         * @type {_DISCOVERYINFOMGMT}
         */
        DISCOVERYINFOMGMT{
            get {
                if(!this.HasProp("__DISCOVERYINFOMGMT"))
                    this.__DISCOVERYINFOMGMT := %this.__Class%._DISCOVERYINFOMGMT(0, this)
                return this.__DISCOVERYINFOMGMT
            }
        }
    
        /**
         * @type {_VENDORSPECIFIC}
         */
        VENDORSPECIFIC{
            get {
                if(!this.HasProp("__VENDORSPECIFIC"))
                    this.__VENDORSPECIFIC := %this.__Class%._VENDORSPECIFIC(0, this)
                return this.__VENDORSPECIFIC
            }
        }
    
        /**
         * @type {_VERIFYCOMMAND}
         */
        VERIFYCOMMAND{
            get {
                if(!this.HasProp("__VERIFYCOMMAND"))
                    this.__VERIFYCOMMAND := %this.__Class%._VERIFYCOMMAND(0, this)
                return this.__VERIFYCOMMAND
            }
        }
    
    }

    /**
     * @type {NVME_COMMAND_DWORD0}
     */
    CDW0{
        get {
            if(!this.HasProp("__CDW0"))
                this.__CDW0 := NVME_COMMAND_DWORD0(0, this)
            return this.__CDW0
        }
    }

    /**
     * @type {Integer}
     */
    NSID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 12, 2, Primitive, "uint")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MPTR {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    PRP1 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    PRP2 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<UInt64>}
     */
    SGL1{
        get {
            if(!this.HasProp("__SGL1ProxyArray"))
                this.__SGL1ProxyArray := Win32FixedArray(this.ptr + 32, 2, Primitive, "uint")
            return this.__SGL1ProxyArray
        }
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(48, this)
            return this.__u
        }
    }
}
