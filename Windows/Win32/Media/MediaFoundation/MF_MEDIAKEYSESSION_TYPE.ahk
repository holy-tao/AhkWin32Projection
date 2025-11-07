#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a Content Decryption Module (CDM) session, represented by an IMFContentDecryptionModuleSession object.
 * @remarks
 * 
 * Pass a member of this enumeration into [IMFContentDecryptionModule::CreateSession](../mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createsession.md)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_mediakeysession_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIAKEYSESSION_TYPE{

    /**
     * A session for which the license, key(s) and record of or data related to the session are not persisted.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_TYPE_TEMPORARY => 0

    /**
     * A session for which the license (and potentially other data related to the session) will be persisted.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_TYPE_PERSISTENT_LICENSE => 1

    /**
     * A record of license destruction.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_TYPE_PERSISTENT_RELEASE_MESSAGE => 2

    /**
     * A record of license usage.
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYSESSION_TYPE_PERSISTENT_USAGE_RECORD => 3
}
