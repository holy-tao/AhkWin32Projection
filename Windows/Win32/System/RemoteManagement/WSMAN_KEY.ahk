#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents a key and value pair within a selector set and is used to identify a particular resource.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_key
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_KEY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the key name.
     * @type {PWSTR}
     */
    key{
        get {
            if(!this.HasProp("__key"))
                this.__key := PWSTR(this.ptr + 0)
            return this.__key
        }
    }

    /**
     * Defines the value associated with <i>key</i>.
     * @type {PWSTR}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := PWSTR(this.ptr + 8)
            return this.__value
        }
    }
}
