#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a PKU2U client context.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-pku2u_credui_context
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKU2U_CREDUI_CONTEXT {
    #StructPack 8

    /**
     * The version number of the context. This must be <b>PKU2U_CREDUI_CONTEXT_VERSION</b>.
     */
    Version : Int64

    /**
     * The size, in bytes, of this structure, not including the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows it.
     */
    cbHeaderLength : UInt16

    /**
     * The size, in bytes, of this structure, including the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows it.
     */
    cbStructureLength : UInt32

    /**
     * The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows this structure.
     */
    CertArrayCount : UInt16

    /**
     * The number of bytes from the beginning of this structure in memory to the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-pku2u_cert_blob">PKU2U_CERT_BLOB</a> structure that follows this structure.
     */
    CertArrayOffset : UInt32

}
