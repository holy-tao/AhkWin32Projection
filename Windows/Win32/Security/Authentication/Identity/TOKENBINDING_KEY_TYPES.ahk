#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains all of the combinations of types of token binding keys that a client device or server supports.
 * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/ns-tokenbinding-tokenbinding_key_types
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TOKENBINDING_KEY_TYPES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the array that the <b>key</b> member contains.
     * @type {Integer}
     */
    keyCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<Int32>}
     */
    keyType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
