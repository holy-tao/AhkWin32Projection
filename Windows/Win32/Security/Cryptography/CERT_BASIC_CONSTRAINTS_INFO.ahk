#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * The CERT_BASIC_CONSTRAINTS_INFO structure contains information that indicates whether the certified subject can act as a certification authority (CA), an end entity, or both.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_basic_constraints_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_BASIC_CONSTRAINTS_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> value can contain one of the following:
     * 
     * <ul>
     * <li>A CERT_CA_SUBJECT_FLAG that, when set, indicates that the certificate's subject can act as a CA.</li>
     * <li>A CERT_END_ENTITY_SUBJECT_FLAG that, when set, indicates that the certificate's subject can act as an end entity.</li>
     * <li>Both of the above, combined using a bitwise-<b>OR</b> operation.</li>
     * </ul>
     * @type {CRYPT_BIT_BLOB}
     */
    SubjectType{
        get {
            if(!this.HasProp("__SubjectType"))
                this.__SubjectType := CRYPT_BIT_BLOB(this.ptr + 0)
            return this.__SubjectType
        }
    }

    /**
     * A Boolean value that indicates whether the <b>dwPathLenConstraint</b> field sets the maximum length of the certification path.
     * @type {Integer}
     */
    fPathLenConstraint {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The maximum number of CA certificates that can follow this certificate in a certification validation path. A value of zero indicates that the subject of this certificate can issue certificates only to end entities and not to CAs.
     * @type {Integer}
     */
    dwPathLenConstraint {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of elements in the <b>rgSubtreesConstraint</b> array.
     * @type {Integer}
     */
    cSubtreesConstraint {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structures that establish subtree constraints.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgSubtreesConstraint {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
