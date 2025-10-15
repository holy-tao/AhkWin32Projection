#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class EXCEPTION_RECORD32 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * @type {NTSTATUS}
     */
    ExceptionCode{
        get {
            if(!this.HasProp("__ExceptionCode"))
                this.__ExceptionCode := NTSTATUS(this.ptr + 0)
            return this.__ExceptionCode
        }
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
