#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes how the BCryptBuffer structure represents a generic Cryptography API: Next Generation (CNG) buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcryptbuffer
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCryptBuffer extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the buffer.
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    BufferType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A 32-bit value defined by the *BufferType* member.
     * @type {Pointer<Void>}
     */
    pvBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
