#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies client credentials when calling the QueryContextAttributes (CredSSP) function.
 * @see https://docs.microsoft.com/windows/win32/api//credssp/ns-credssp-secpkgcontext_clientcreds
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SecPkgContext_ClientCreds extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in characters, of the <b>AuthBuffer</b> buffer.
     * @type {Integer}
     */
    AuthBufferLen {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a buffer that represents the client credentials.
     * @type {Pointer<Integer>}
     */
    AuthBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
