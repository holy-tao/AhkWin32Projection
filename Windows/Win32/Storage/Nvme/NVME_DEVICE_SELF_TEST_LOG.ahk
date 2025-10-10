#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_DEVICE_SELF_TEST_RESULT_DATA.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DEVICE_SELF_TEST_LOG extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CurrentOperation {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CurrentCompletion {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<NVME_DEVICE_SELF_TEST_RESULT_DATA>}
     */
    ResultData{
        get {
            if(!this.HasProp("__ResultDataProxyArray"))
                this.__ResultDataProxyArray := Win32FixedArray(this.ptr + 8, 20, NVME_DEVICE_SELF_TEST_RESULT_DATA, "")
            return this.__ResultDataProxyArray
        }
    }
}
