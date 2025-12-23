#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CYPHER_BLOCK.ahk

/**
 * The LM_OWF_PASSWORD stores the Lan Manage (LM) one-way function (OWF) of a user's password.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc325731(v=vs.85)">NT_OWF_PASSWORD</a> is an alias for this structure.
 * @see https://learn.microsoft.com/windows/win32/api/mschapp/ns-mschapp-lm_owf_password
 * @namespace Windows.Win32.System.PasswordManagement
 * @version v4.0.30319
 */
class LM_OWF_PASSWORD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/mschapp/ns-mschapp-cypher_block">CYPHER_BLOCK</a> structures that contain a LM OWF password hash. The contents of the array are calculated using the <b>LmEncryptedPasswordHash()</b> function as defined in <a href="https://www.ietf.org/rfc/rfc2433.txt">RFC 2433</a>, section A.8.
     * @type {Array<CYPHER_BLOCK>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 0, 2, CYPHER_BLOCK, "")
            return this.__dataProxyArray
        }
    }
}
