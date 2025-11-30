#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_EXCEPTION_PORT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    ExceptionPortHandle{
        get {
            if(!this.HasProp("__ExceptionPortHandle"))
                this.__ExceptionPortHandle := HANDLE(0, this)
            return this.__ExceptionPortHandle
        }
    }

    /**
     * @type {Integer}
     */
    StateFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
