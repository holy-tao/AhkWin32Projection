#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class HTHREAD_NETWORK_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    ThreadContext{
        get {
            if(!this.HasProp("__ThreadContext"))
                this.__ThreadContext := HANDLE(this.ptr + 8)
            return this.__ThreadContext
        }
    }
}
