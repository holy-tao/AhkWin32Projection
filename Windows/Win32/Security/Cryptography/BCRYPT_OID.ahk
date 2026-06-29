#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a DER-encoded object identifier (OID).
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_oid
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_OID {
    #StructPack 8

    /**
     * The size, in bytes, of the <b>pbOID</b> buffer.
     */
    cbOID : UInt32

    /**
     * The address of a buffer that contains the OID.
     */
    pbOID : IntPtr

}
