#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains details about a credential.
 * @remarks
 * 
 * Once the user has entered credential information into a credential tile, it needs to be put into a buffer. Packaging up this information is called serialization and is necessary regardless of whether the scenario uses a Logon UI or a Credential UI. The <b>CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</b> defines the structure for serialization. After serialization, where the buffer is sent depends on whether it is a Logon UI or Credential UI scenario. With a Logon UI, the buffer is passed to <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/winlogon">Winlogon</a>. In the Credential UI scenario, this buffer is returned to the calling application which then uses it to authenticate the user.
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Even if you are implementing a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a> of <b>CPUS_LOGON</b>, you do not directly call <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a>. That call is handled by the system. You merely need to pass your credentials to <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/winlogon">Winlogon</a>.
 * 
 * </div>
 * <div> </div>
 * Credential providers may also enumerate a credential tile if an input credential is received from <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-setserialization">SetSerialization</a>. One example where this is useful is if a user provides an invalid user-password combination. The Credential UI will pass the credentials back to the credential provider since they are invalid. The credential provider can opt to display a tile to the user that already has the user name filled in.
 * 
 * Input credentials can take many different forms. It is important that credential providers are robust when receiving serialized credentials. This could include incomplete or partial credentials. In many cases, an incomplete input credential is a hint about what type of credential the caller wants. One case where this process is used is with callers who only wish to gather smart card credentials from the user. During the <b>CPUS_LOGON</b> usage scenario, the system uses <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-setserialization">SetSerialization</a> to fill in some of the information from a remote machine. Logon UI will call <b>SetSerialization</b> zero or one times each enumeration cycle.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/ns-credentialprovider-credential_provider_credential_serialization
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * The unique identifier of the authentication package. This parameter is required when calling <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a>.  In a Credential UI scenario, this value is set before a serialization is sent through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-setserialization">SetSerialization</a>. This is the same as the authentication package value returned by <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage">LsaLookupAuthenticationPackage</a>. Content providers can use this parameter to determine if they are able to return credentials for this authentication package. Developers who write their own authentication package may supply their own value.
     * @type {Integer}
     */
    ulAuthenticationPackage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The CLSID of the credential provider. Credential providers assign their own CLSID to this member during serialization. Credential UI ignores this member.
     * @type {Pointer<Guid>}
     */
    clsidCredentialProvider {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The size, in bytes, of the credential pointed to by <b>rgbSerialization</b>.
     * @type {Integer}
     */
    cbSerialization {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>byte*</b>
     * 
     * An array of bytes containing serialized credential information. The exact format of this data depends on the authentication package targeted by a credential provider.
     * @type {Pointer<Integer>}
     */
    rgbSerialization {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
