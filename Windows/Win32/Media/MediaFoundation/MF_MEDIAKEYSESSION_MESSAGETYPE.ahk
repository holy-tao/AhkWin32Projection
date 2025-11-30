#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a Content Decryption Module (CDM) message.
 * @remarks
 * 
 * This value is used by the [IMFContentDecryptionModuleSessionCallbacks::KeyMessage](../mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks-keymessage.md) callback.
 * 
 * **MF_MEDIAKEYSESSION_MESSAGETYPE** is based on the Encrypted Media Extension specification's [MediaKeyStatus](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeymessagetype) enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_mediakeysession_messagetype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIAKEYSESSION_MESSAGETYPE extends Win32Enum{

    /**
     * The message contains a request for a new license.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_MESSAGETYPE_LICENSE_REQUEST => 0

    /**
     * The message contains a request to renew an existing license.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_MESSAGETYPE_LICENSE_RENEWAL => 1

    /**
     * The message contains a record of license destruction.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_MESSAGETYPE_LICENSE_RELEASE => 2

    /**
     * The message contains a request for App-Assisted Individualization (or re-individualization).
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_MESSAGETYPE_INDIVIDUALIZATION_REQUEST => 3
}
