#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether the URL is from a trusted source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_url_trust_status
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_URL_TRUST_STATUS{

    /**
     * The validity of the URL cannot be guaranteed because it is not signed. The application should warn the user.
     * @type {Integer (Int32)}
     */
    static MF_LICENSE_URL_UNTRUSTED => 0

    /**
     * The URL is the original one provided with the content.
     * @type {Integer (Int32)}
     */
    static MF_LICENSE_URL_TRUSTED => 1

    /**
     * The URL was originally signed and has been tampered with. The file should be considered corrupted, and the application should not navigate to the URL without issuing a strong warning the user.
     * @type {Integer (Int32)}
     */
    static MF_LICENSE_URL_TAMPERED => 2
}
