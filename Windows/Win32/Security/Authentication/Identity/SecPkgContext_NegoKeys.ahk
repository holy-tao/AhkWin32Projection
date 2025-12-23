#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Holds the negotiated security package keys.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_negokeys
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_NegoKeys extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The key type.
     * @type {Integer}
     */
    KeyType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of the key, in bytes.
     * @type {Integer}
     */
    KeyLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The key value.
     * @type {Pointer<Integer>}
     */
    KeyValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The key type for the verification key.
     * @type {Integer}
     */
    VerifyKeyType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The length of the verification key, in bytes.
     * @type {Integer}
     */
    VerifyKeyLength {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The verification key value.
     * @type {Pointer<Integer>}
     */
    VerifyKeyValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
