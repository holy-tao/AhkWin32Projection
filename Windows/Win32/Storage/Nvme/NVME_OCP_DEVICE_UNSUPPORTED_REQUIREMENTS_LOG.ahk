#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UNSUPPORTED_REQUIREMENT.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS_LOG extends Win32Struct {
    static sizeof => 4096

    static packingSize => 4

    /**
     * @type {Integer}
     */
    UnsupportedCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved0 {
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 2, 14, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {UNSUPPORTED_REQUIREMENT}
     */
    UnsupportedReqList {
        get {
            if(!this.HasProp("__UnsupportedReqListProxyArray"))
                this.__UnsupportedReqListProxyArray := Win32FixedArray(this.ptr + 16, 253, UNSUPPORTED_REQUIREMENT, "")
            return this.__UnsupportedReqListProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 4064, 14, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 4078, "ushort")
        set => NumPut("ushort", value, this, 4078)
    }

    /**
     * @type {Guid}
     */
    LogPageGUID {
        get {
            if(!this.HasProp("__LogPageGUID"))
                this.__LogPageGUID := Guid(4080, this)
            return this.__LogPageGUID
        }
    }
}
