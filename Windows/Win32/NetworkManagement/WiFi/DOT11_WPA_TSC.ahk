#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\DOT11_IV48_COUNTER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WPA_TSC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dot11OffloadType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {HANDLE}
     */
    hOffload{
        get {
            if(!this.HasProp("__hOffload"))
                this.__hOffload := HANDLE(this.ptr + 8)
            return this.__hOffload
        }
    }

    /**
     * @type {DOT11_IV48_COUNTER}
     */
    dot11IV48Counter{
        get {
            if(!this.HasProp("__dot11IV48Counter"))
                this.__dot11IV48Counter := DOT11_IV48_COUNTER(this.ptr + 16)
            return this.__dot11IV48Counter
        }
    }
}
