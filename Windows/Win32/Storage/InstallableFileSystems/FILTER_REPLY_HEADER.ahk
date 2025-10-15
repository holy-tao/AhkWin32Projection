#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class FILTER_REPLY_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {NTSTATUS}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := NTSTATUS(this.ptr + 0)
            return this.__Status
        }
    }

    /**
     * @type {Integer}
     */
    MessageId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
