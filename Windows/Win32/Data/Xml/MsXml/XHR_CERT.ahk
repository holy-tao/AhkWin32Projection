#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines a buffer that points to an encoded certificate.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ns-msxml6-xhr_cert
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XHR_CERT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the encoded certificate.
     * @type {Integer}
     */
    cbCert {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the buffer that contains the encoded certificate.
     * @type {Pointer<Byte>}
     */
    pbCert {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
