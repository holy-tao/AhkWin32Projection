#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class VBS_BASIC_ENCLAVE_EXCEPTION_AMD64 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ExceptionCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberParameters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UIntPtr>}
     */
    ExceptionInformation{
        get {
            if(!this.HasProp("__ExceptionInformationProxyArray"))
                this.__ExceptionInformationProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ptr")
            return this.__ExceptionInformationProxyArray
        }
    }

    /**
     * @type {Pointer}
     */
    ExceptionRAX {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    ExceptionRCX {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    ExceptionRIP {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    ExceptionRFLAGS {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    ExceptionRSP {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
