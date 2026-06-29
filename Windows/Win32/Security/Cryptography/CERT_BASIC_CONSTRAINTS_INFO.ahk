#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * The CERT_BASIC_CONSTRAINTS_INFO structure contains information that indicates whether the certified subject can act as a certification authority (CA), an end entity, or both.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_basic_constraints_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_BASIC_CONSTRAINTS_INFO {
    #StructPack 8

    /**
     * A
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> value can contain one of the following:
     * 
     * <ul>
     * <li>A CERT_CA_SUBJECT_FLAG that, when set, indicates that the certificate's subject can act as a CA.</li>
     * <li>A CERT_END_ENTITY_SUBJECT_FLAG that, when set, indicates that the certificate's subject can act as an end entity.</li>
     * <li>Both of the above, combined using a bitwise-<b>OR</b> operation.</li>
     * </ul>
     */
    SubjectType : CRYPT_BIT_BLOB

    /**
     * A Boolean value that indicates whether the <b>dwPathLenConstraint</b> field sets the maximum length of the certification path.
     */
    fPathLenConstraint : BOOL

    /**
     * The maximum number of CA certificates that can follow this certificate in a certification validation path. A value of zero indicates that the subject of this certificate can issue certificates only to end entities and not to CAs.
     */
    dwPathLenConstraint : UInt32

    /**
     * The number of elements in the <b>rgSubtreesConstraint</b> array.
     */
    cSubtreesConstraint : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structures that establish subtree constraints.
     */
    rgSubtreesConstraint : CRYPT_INTEGER_BLOB.Ptr

}
