#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a Content Decryption Module (CDM) session, represented by an IMFContentDecryptionModuleSession object.
 * @remarks
 * Pass a member of this enumeration into [IMFContentDecryptionModule::CreateSession](../mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createsession.md)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_mediakeysession_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIAKEYSESSION_TYPE extends Win32Enum {

    /**
     * A session for which the license, key(s) and record of or data related to the session are not persisted.
     * Native name: MF_MEDIAKEYSESSION_TYPE_TEMPORARY
     * @type {Integer (Int32)}
     */
    static TEMPORARY => 0

    /**
     * A session for which the license (and potentially other data related to the session) will be persisted.
     * Native name: MF_MEDIAKEYSESSION_TYPE_PERSISTENT_LICENSE
     * @type {Integer (Int32)}
     */
    static PERSISTENT_LICENSE => 1

    /**
     * A record of license destruction.
     * Native name: MF_MEDIAKEYSESSION_TYPE_PERSISTENT_RELEASE_MESSAGE
     * @type {Integer (Int32)}
     */
    static PERSISTENT_RELEASE_MESSAGE => 2

    /**
     * A record of license usage.
     * Native name: MF_MEDIAKEYSESSION_TYPE_PERSISTENT_USAGE_RECORD
     * @type {Integer (Int32)}
     */
    static PERSISTENT_USAGE_RECORD => 3
}
