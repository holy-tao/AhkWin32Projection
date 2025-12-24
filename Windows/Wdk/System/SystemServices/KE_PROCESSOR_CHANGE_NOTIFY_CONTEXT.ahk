#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\PROCESSOR_NUMBER.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NtNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {PROCESSOR_NUMBER}
     */
    ProcNumber{
        get {
            if(!this.HasProp("__ProcNumber"))
                this.__ProcNumber := PROCESSOR_NUMBER(12, this)
            return this.__ProcNumber
        }
    }
}
