#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains a SubjectAlgorithm to be matched in the certificate trust list (CTL) and the SubjectIdentifier to be matched in one of the CTL entries in calls to CertFindSubjectInCTL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_any_subject_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_ANY_SUBJECT_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of an algorithm type and any associated additional parameters. The <b>pszObjId</b> can be set to <b>NULL</b> to exclude a <b>SubjectAlgorithm</b> comparison.
     */
    SubjectAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> containing a unique identifier of the subject.
     */
    SubjectIdentifier : CRYPT_INTEGER_BLOB

}
