#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a Content Decryption Module (CDM) session key.
 * @remarks
 * This enumeration is with the [MFMediaKeyStatus](ns-mfidl-mfmediakeystatus.md) structure used as the output parameter for the [IMFContentDecryptionModuleSession::GetKeyStatuses](../mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getkeystatuses.md) method.
 * 
 * 
 * **MF_MEDIAKEY_STATUS** is based on the Encrypted Media Extension specification's [MediaKeyStatus](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeystatus) enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_mediakey_status
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIAKEY_STATUS extends Win32Enum {

    /**
     * The CDM is certain the key is currently usable for decryption.
     * Native name: MF_MEDIAKEY_STATUS_USABLE
     * @type {Integer (Int32)}
     */
    static USABLE => 0

    /**
     * The key is no longer usable for decryption because its expiration time has passed.
     * Native name: MF_MEDIAKEY_STATUS_EXPIRED
     * @type {Integer (Int32)}
     */
    static EXPIRED => 1

    /**
     * There are output restrictions associated with the key that cannot currently be met. Media data decrypted with this key may be presented at a lower quality (e.g., resolution), if necessary according to the output restrictions.
     * Native name: MF_MEDIAKEY_STATUS_OUTPUT_DOWNSCALED
     * @type {Integer (Int32)}
     */
    static OUTPUT_DOWNSCALED => 2

    /**
     * There are output restrictions associated with the key that disallow output.
     * Native name: MF_MEDIAKEY_STATUS_OUTPUT_NOT_ALLOWED
     * @type {Integer (Int32)}
     */
    static OUTPUT_NOT_ALLOWED => 3

    /**
     * The status of the key is not yet known and is being determined. The status will be updated with the actual status when it has been determined.
     * Native name: MF_MEDIAKEY_STATUS_STATUS_PENDING
     * @type {Integer (Int32)}
     */
    static STATUS_PENDING => 4

    /**
     * The key is not currently usable for decryption because of an error in the CDM unrelated to the other values. This value is not actionable by the application.
     * Native name: MF_MEDIAKEY_STATUS_INTERNAL_ERROR
     * @type {Integer (Int32)}
     */
    static INTERNAL_ERROR => 5

    /**
     * The key itself is no longer available to the CDM, but information about the key, such as a record of license destruction, is available.
     * Native name: MF_MEDIAKEY_STATUS_RELEASED
     * @type {Integer (Int32)}
     */
    static RELEASED => 6

    /**
     * There are output restrictions associated with the key that cannot currently be met. Media data decrypted with this key may be blocked from presentation, if necessary according to the output restrictions. The application should avoid using streams that will trigger the output restrictions associated with the key.
     * Native name: MF_MEDIAKEY_STATUS_OUTPUT_RESTRICTED
     * @type {Integer (Int32)}
     */
    static OUTPUT_RESTRICTED => 7
}
