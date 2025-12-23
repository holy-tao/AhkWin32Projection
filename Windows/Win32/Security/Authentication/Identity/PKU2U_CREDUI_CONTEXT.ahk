#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies a PKU2U client context.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-pku2u_credui_context
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PKU2U_CREDUI_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The version number of the context. This must be <b>PKU2U_CREDUI_CONTEXT_VERSION</b>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of this structure, not including the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows it.
     * @type {Integer}
     */
    cbHeaderLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The size, in bytes, of this structure, including the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows it.
     * @type {Integer}
     */
    cbStructureLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows this structure.
     * @type {Integer}
     */
    CertArrayCount {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The number of bytes from the beginning of this structure in memory to the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows this structure.
     * @type {Integer}
     */
    CertArrayOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
