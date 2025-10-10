#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_EXTENSIONS structure contains an array of extensions.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_extensions
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_EXTENSIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the array <b>rgExtension</b>.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of structures, each holding information of type <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> about a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CRL</a>.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
