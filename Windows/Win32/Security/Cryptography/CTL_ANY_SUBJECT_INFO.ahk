#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains a SubjectAlgorithm to be matched in the certificate trust list (CTL) and the SubjectIdentifier to be matched in one of the CTL entries in calls to CertFindSubjectInCTL.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_any_subject_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_ANY_SUBJECT_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of an algorithm type and any associated additional parameters. The <b>pszObjId</b> can be set to <b>NULL</b> to exclude a <b>SubjectAlgorithm</b> comparison.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    SubjectAlgorithm{
        get {
            if(!this.HasProp("__SubjectAlgorithm"))
                this.__SubjectAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 0)
            return this.__SubjectAlgorithm
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> containing a unique identifier of the subject.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SubjectIdentifier{
        get {
            if(!this.HasProp("__SubjectIdentifier"))
                this.__SubjectIdentifier := CRYPT_INTEGER_BLOB(this.ptr + 24)
            return this.__SubjectIdentifier
        }
    }
}
