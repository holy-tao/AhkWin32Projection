#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UNSUPPORTED_REQUIREMENT.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS_LOG extends Win32Struct
{
    static sizeof => 2064

    static packingSize => 1

    /**
     * @type {Integer}
     */
    UnsupportedCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 2, 14, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<UNSUPPORTED_REQUIREMENT>}
     */
    UnsupportedReqList{
        get {
            if(!this.HasProp("__UnsupportedReqListProxyArray"))
                this.__UnsupportedReqListProxyArray := Win32FixedArray(this.ptr + 16, 253, UNSUPPORTED_REQUIREMENT, "")
            return this.__UnsupportedReqListProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 2040, 14, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 2054, "ushort")
        set => NumPut("ushort", value, this, 2054)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogPageGUID {
        get => NumGet(this, 2056, "ptr")
        set => NumPut("ptr", value, this, 2056)
    }
}
