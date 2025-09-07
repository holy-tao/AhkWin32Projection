#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the response when a credential provider attempts to serialize credentials.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_get_serialization_response
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE{

    /**
     * No credential was serialized because more information is needed. One example of this would be if a credential requires both a PIN and an answer to a secret question, but the user has only provided the PIN. This signals the caller should be given a chance to alter its response.
     * @type {Integer (Int32)}
     */
    static CPGSR_NO_CREDENTIAL_NOT_FINISHED => 0

    /**
     * The credential provider has not serialized a credential but has completed its work. This response has multiple meanings. It can mean that no credential was serialized and that the user should not try again. This response can also mean that no credential was submitted but the credential's work is complete. For example, in the Change Password scenario, this response implies success.
     * @type {Integer (Int32)}
     */
    static CPGSR_NO_CREDENTIAL_FINISHED => 1

    /**
     * A credential was serialized. This response implies that a serialization structure was passed back.
     * @type {Integer (Int32)}
     */
    static CPGSR_RETURN_CREDENTIAL_FINISHED => 2

    /**
     * The credential provider has not serialized a credential, but has completed its work. The difference between this value and <b>CPGSR_NO_CREDENTIAL_FINISHED</b> is that this flag will force the logon UI to return, which will call <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-unadvise">UnAdvise</a> for all the credential providers.
     * @type {Integer (Int32)}
     */
    static CPGSR_RETURN_NO_CREDENTIAL_FINISHED => 3
}
