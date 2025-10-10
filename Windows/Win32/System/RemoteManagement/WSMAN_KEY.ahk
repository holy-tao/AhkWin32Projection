#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a key and value pair within a selector set and is used to identify a particular resource.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_key
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_KEY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the key name.
     * @type {Pointer<Char>}
     */
    key {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Defines the value associated with <i>key</i>.
     * @type {Pointer<Char>}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
