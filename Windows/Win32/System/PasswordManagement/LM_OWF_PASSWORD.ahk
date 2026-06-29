#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CYPHER_BLOCK.ahk" { CYPHER_BLOCK }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The LM_OWF_PASSWORD stores the Lan Manage (LM) one-way function (OWF) of a user's password.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc325731(v=vs.85)">NT_OWF_PASSWORD</a> is an alias for this structure.
 * @see https://learn.microsoft.com/windows/win32/api/mschapp/ns-mschapp-lm_owf_password
 * @namespace Windows.Win32.System.PasswordManagement
 */
export default struct LM_OWF_PASSWORD {
    #StructPack 2

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-cypher_block">CYPHER_BLOCK</a> structures that contain a LM OWF password hash. The contents of the array are calculated using the <b>LmEncryptedPasswordHash()</b> function as defined in <a href="https://www.ietf.org/rfc/rfc2433.txt">RFC 2433</a>, section A.8.
     */
    data : CYPHER_BLOCK[2]

}
