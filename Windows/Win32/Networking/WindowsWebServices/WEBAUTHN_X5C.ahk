#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The X.509 certificate chain.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_x5c
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_X5C extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length of X.509 encoded certificate.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The X.509 encoded certificate bytes.
     * @type {Pointer<Byte>}
     */
    pbData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
