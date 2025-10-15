#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CONTROLLER_CAPABILITIES.ahk
#Include .\NVME_VERSION.ahk
#Include .\NVME_CONTROLLER_CONFIGURATION.ahk
#Include .\NVME_CONTROLLER_STATUS.ahk
#Include .\NVME_NVM_SUBSYSTEM_RESET.ahk
#Include .\NVME_ADMIN_QUEUE_ATTRIBUTES.ahk
#Include .\NVME_ADMIN_SUBMISSION_QUEUE_BASE_ADDRESS.ahk
#Include .\NVME_ADMIN_COMPLETION_QUEUE_BASE_ADDRESS.ahk
#Include .\NVME_CONTROLLER_MEMORY_BUFFER_LOCATION.ahk
#Include .\NVME_CONTROLLER_MEMORY_BUFFER_SIZE.ahk
#Include .\NVME_NVM_SUBSYSTEM_SHUTDOWN.ahk
#Include .\NVME_CONTROLLER_READY_TIMEOUTS.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CONTROLLER_REGISTERS extends Win32Struct
{
    static sizeof => 4160

    static packingSize => 8

    /**
     * @type {NVME_CONTROLLER_CAPABILITIES}
     */
    CAP{
        get {
            if(!this.HasProp("__CAP"))
                this.__CAP := NVME_CONTROLLER_CAPABILITIES(this.ptr + 0)
            return this.__CAP
        }
    }

    /**
     * @type {NVME_VERSION}
     */
    VS{
        get {
            if(!this.HasProp("__VS"))
                this.__VS := NVME_VERSION(this.ptr + 16)
            return this.__VS
        }
    }

    /**
     * @type {Integer}
     */
    INTMS {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    INTMC {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {NVME_CONTROLLER_CONFIGURATION}
     */
    CC{
        get {
            if(!this.HasProp("__CC"))
                this.__CC := NVME_CONTROLLER_CONFIGURATION(this.ptr + 32)
            return this.__CC
        }
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {NVME_CONTROLLER_STATUS}
     */
    CSTS{
        get {
            if(!this.HasProp("__CSTS"))
                this.__CSTS := NVME_CONTROLLER_STATUS(this.ptr + 48)
            return this.__CSTS
        }
    }

    /**
     * @type {NVME_NVM_SUBSYSTEM_RESET}
     */
    NSSR{
        get {
            if(!this.HasProp("__NSSR"))
                this.__NSSR := NVME_NVM_SUBSYSTEM_RESET(this.ptr + 56)
            return this.__NSSR
        }
    }

    /**
     * @type {NVME_ADMIN_QUEUE_ATTRIBUTES}
     */
    AQA{
        get {
            if(!this.HasProp("__AQA"))
                this.__AQA := NVME_ADMIN_QUEUE_ATTRIBUTES(this.ptr + 64)
            return this.__AQA
        }
    }

    /**
     * @type {NVME_ADMIN_SUBMISSION_QUEUE_BASE_ADDRESS}
     */
    ASQ{
        get {
            if(!this.HasProp("__ASQ"))
                this.__ASQ := NVME_ADMIN_SUBMISSION_QUEUE_BASE_ADDRESS(this.ptr + 72)
            return this.__ASQ
        }
    }

    /**
     * @type {NVME_ADMIN_COMPLETION_QUEUE_BASE_ADDRESS}
     */
    ACQ{
        get {
            if(!this.HasProp("__ACQ"))
                this.__ACQ := NVME_ADMIN_COMPLETION_QUEUE_BASE_ADDRESS(this.ptr + 88)
            return this.__ACQ
        }
    }

    /**
     * @type {NVME_CONTROLLER_MEMORY_BUFFER_LOCATION}
     */
    CMBLOC{
        get {
            if(!this.HasProp("__CMBLOC"))
                this.__CMBLOC := NVME_CONTROLLER_MEMORY_BUFFER_LOCATION(this.ptr + 104)
            return this.__CMBLOC
        }
    }

    /**
     * @type {NVME_CONTROLLER_MEMORY_BUFFER_SIZE}
     */
    CMBSZ{
        get {
            if(!this.HasProp("__CMBSZ"))
                this.__CMBSZ := NVME_CONTROLLER_MEMORY_BUFFER_SIZE(this.ptr + 112)
            return this.__CMBSZ
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 120, 9, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {NVME_NVM_SUBSYSTEM_SHUTDOWN}
     */
    NSSD{
        get {
            if(!this.HasProp("__NSSD"))
                this.__NSSD := NVME_NVM_SUBSYSTEM_SHUTDOWN(this.ptr + 156)
            return this.__NSSD
        }
    }

    /**
     * @type {NVME_CONTROLLER_READY_TIMEOUTS}
     */
    CRTO{
        get {
            if(!this.HasProp("__CRTO"))
                this.__CRTO := NVME_CONTROLLER_READY_TIMEOUTS(this.ptr + 160)
            return this.__CRTO
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 168, 933, Primitive, "uint")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 3900, 64, Primitive, "uint")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    Doorbells{
        get {
            if(!this.HasProp("__DoorbellsProxyArray"))
                this.__DoorbellsProxyArray := Win32FixedArray(this.ptr + 4156, 1, Primitive, "uint")
            return this.__DoorbellsProxyArray
        }
    }
}
