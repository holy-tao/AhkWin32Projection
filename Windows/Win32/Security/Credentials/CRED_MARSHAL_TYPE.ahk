#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of credential to be marshaled by CredMarshalCredential or unmarshaled by CredUnmarshalCredential.
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ne-wincred-cred_marshal_type
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CRED_MARSHAL_TYPE{

    /**
     * Specifies that the credential is a certificate reference described by a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-cert_credential_info">CERT_CREDENTIAL_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static CertCredential => 1

    /**
     * Specifies that the credential is a reference to a CRED_FLAGS_USERNAME_TARGET credential described by a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-username_target_credential_info">USERNAME_TARGET_CREDENTIAL_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static UsernameTargetCredential => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BinaryBlobCredential => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static UsernameForPackedCredentials => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BinaryBlobForSystem => 5
}
