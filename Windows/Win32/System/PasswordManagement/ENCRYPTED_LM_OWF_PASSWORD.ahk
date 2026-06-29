#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CYPHER_BLOCK.ahk" { CYPHER_BLOCK }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The ENCRYPTED_LM_OWF_PASSWORD stores a user's encrypted Lan Manager (LM) one-way function (OWF) password hash.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc325729(v=vs.85)">ENCRYPTED_NT_OWF_PASSWORD</a> is an alias for this structure.
 * @see https://learn.microsoft.com/windows/win32/api/mschapp/ns-mschapp-encrypted_lm_owf_password
 * @namespace Windows.Win32.System.PasswordManagement
 */
export default struct ENCRYPTED_LM_OWF_PASSWORD {
    #StructPack 2

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-cypher_block">CYPHER_BLOCK</a> structures that contain an encrypted LM OWF password hash. The contents of the array are calculated using the <b>OldLmPasswordHashEncryptedWithNewNtPasswordHash()</b> function as defined in <a href="https://www.ietf.org/rfc/rfc2433.txt">RFC 2433</a>, section A.16.
     */
    data : CYPHER_BLOCK[2]

}
