#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class EXCEPTION_RECORD32 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ExceptionCode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExceptionFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ExceptionRecord {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ExceptionAddress {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    NumberParameters {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<UInt32>}
     */
    ExceptionInformation{
        get {
            if(!this.HasProp("__ExceptionInformationProxyArray"))
                this.__ExceptionInformationProxyArray := Win32FixedArray(this.ptr + 20, 15, Primitive, "uint")
            return this.__ExceptionInformationProxyArray
        }
    }
}
