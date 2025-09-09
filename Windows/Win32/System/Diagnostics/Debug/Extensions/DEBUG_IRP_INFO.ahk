#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\DEBUG_IRP_STACK_INFO.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_IRP_INFO extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IrpAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IoStatus {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StackCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    CurrentLocation {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MdlAddress {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Thread {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CancelRoutine {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {DEBUG_IRP_STACK_INFO}
     */
    CurrentStack{
        get {
            if(!this.HasProp("__CurrentStack"))
                this.__CurrentStack := DEBUG_IRP_STACK_INFO(this.ptr + 56)
            return this.__CurrentStack
        }
    }

    /**
     * @type {Array<DEBUG_IRP_STACK_INFO>}
     */
    Stack{
        get {
            if(!this.HasProp("__StackProxyArray"))
                this.__StackProxyArray := Win32FixedArray(this.ptr + 96, 10, DEBUG_IRP_STACK_INFO, "")
            return this.__StackProxyArray
        }
    }
}
