#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_SECURITY_INTERFACE structure specifies the security interfaces that calls to Peer Graphing APIs use to validate, secure, and free records.
 * @remarks
 * 
 * If you have developed your own SSP, your application must not call the Peer Graphing API to access data in the graphing database; doing so can lead to a deadlock situation.  Instead, the application should look at a cached copy of the information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_security_interface
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_SECURITY_INTERFACE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Specifies the size of the structure. Set the value to   sizeof(<b>PEER_SECURITY_INTERFACE</b>). This member is required and has no default value.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the full path and file name of a .DLL that  implements the SSP interface. See the <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">SSPI documentation</a> for further information on the SSP interface.
     * @type {PWSTR}
     */
    pwzSspFilename {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the ID of the security module in the SSP to use.
     * @type {PWSTR}
     */
    pwzPackageName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the byte count of the <b>pbSecurityInfo</b> member.	This member is not required if <b>pbSecurityInfo</b> is <b>NULL</b>.  However, if <b>pbSecurityInfo</b> is not <b>NULL</b>, this member must have a value.
     * @type {Integer}
     */
    cbSecurityInfo {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to a buffer that contains the information  used to create or open a peer graph. This member is optional and can be <b>NULL</b>.
     * 
     * The security data blob pointed to by <b>pbSecurityInfo</b> is  copied and then passed to the SSPI function call of <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">AcquireCredentialsHandle</a>.
     * @type {Pointer<Integer>}
     */
    pbSecurityInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the security context. This security context is then passed as the first parameter to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nc-p2p-pfnpeer_validate_record">PFNPEER_VALIDATE_RECORD</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nc-p2p-pfnpeer_free_security_data">PFNPEER_FREE_SECURITY_DATA</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nc-p2p-pfnpeer_secure_record">PFNPEER_SECURE_RECORD</a>. This member is optional and can be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a callback function that is called when a record requires validation. This member is optional and can be <b>NULL</b>. If <b>pfnSecureRecord</b> is <b>NULL</b>, this member must also be <b>NULL</b>.
     * @deprecated
     * @type {Pointer<PFNPEER_VALIDATE_RECORD>}
     */
    pfnValidateRecord {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a callback function that is called when a record must be secured. This member is optional and can be <b>NULL</b>. If <b>pfnValidateRecord</b> is <b>NULL</b>, this member must also be <b>NULL</b>.
     * @deprecated
     * @type {Pointer<PFNPEER_SECURE_RECORD>}
     */
    pfnSecureRecord {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to a callback function used to free any data allocated by the callback pointed to by <b>pfnSecureRecord</b>. This member is optional and can be <b>NULL</b>.
     * @deprecated
     * @type {Pointer<PFNPEER_FREE_SECURITY_DATA>}
     */
    pfnFreeSecurityData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * 
     * @deprecated
     * @type {Pointer<PFNPEER_ON_PASSWORD_AUTH_FAILED>}
     */
    pfnAuthFailed {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
