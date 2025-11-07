#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags for the MFP_ACQUIRE_USER_CREDENTIAL_EVENT structure.
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/ne-mfplay-_mfp_credential_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class _MFP_CREDENTIAL_FLAGS{

    /**
     * The player object does not have any stored credentials and requires them from the application. If the player object can provide cached or stored credentials to the server, it does not set this flag.
     * @type {Integer (Int32)}
     */
    static MFP_CREDENTIAL_PROMPT => 1

    /**
     * The credentials are saved to persistent storage. This flag acts as a hint for the application's UI. If the application prompts the user for credentials, the UI can indicate that the credentials have already been saved.
     * 
     * 
     * 
     * [out] If the application sets this flag, the player object saves the user credentials in persistent storage. Otherwise, the player object does not save the credentials.
     * @type {Integer (Int32)}
     */
    static MFP_CREDENTIAL_SAVE => 2

    /**
     * [out] If the application sets this flag, the player object does not cache the user credentials in memory. Otherwise, the player object   does not cache the credentials. If you set this flag, do not set the <b>MFP_CREDENTIAL_SAVE</b> flag.
     * @type {Integer (Int32)}
     */
    static MFP_CREDENTIAL_DO_NOT_CACHE => 4

    /**
     * The credentials will be sent in clear text. The application should  warn the user that the credentials will be sent over the network without encryption.
     * 
     * [out] On output, set this flag to allow the player object to send credentials in clear text, without prompting the user to re-enter the credentials.
     * @type {Integer (Int32)}
     */
    static MFP_CREDENTIAL_CLEAR_TEXT => 8

    /**
     * The credentials will be used to authenticate with a proxy.
     * @type {Integer (Int32)}
     */
    static MFP_CREDENTIAL_PROXY => 16

    /**
     * The authentication scheme supports authentication of the user who is currently logged on.
     * @type {Integer (Int32)}
     */
    static MFP_CREDENTIAL_LOGGED_ON_USER => 32
}
