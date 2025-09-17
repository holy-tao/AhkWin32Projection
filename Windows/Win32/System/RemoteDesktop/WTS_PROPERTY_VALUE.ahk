#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a property value to retrieve from the protocol.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_property_value
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_PROPERTY_VALUE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulVal {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Char>}
     */
    pstrVal {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbVal {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidVal {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }
}
