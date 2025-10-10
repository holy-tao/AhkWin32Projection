#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_ACCESS_RIGHTS_ENUM enumeration defines access rights to the fax server.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_access_rights_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ACCESS_RIGHTS_ENUM{

    /**
     * The user can submit low-priority fax jobs. Users can view and manage their jobs in the fax server's queue and their messages in the outgoing fax archive.
     * @type {Integer (Int32)}
     */
    static farSUBMIT_LOW => 1

    /**
     * The user can submit normal-priority and low-priority fax jobs. Users can view and manage their jobs in the fax server queue and their messages in the outgoing fax archive.
     * @type {Integer (Int32)}
     */
    static farSUBMIT_NORMAL => 2

    /**
     * The user can submit low-priority, normal-priority, and high-priority fax jobs. Users can view and manage their jobs in the fax server queue and their messages in the outgoing fax archive.
     * @type {Integer (Int32)}
     */
    static farSUBMIT_HIGH => 4

    /**
     * The user can view all incoming and outgoing jobs in the fax server queue.
     * @type {Integer (Int32)}
     */
    static farQUERY_JOBS => 8

    /**
     * The user can manage all incoming and outgoing jobs in the fax server queue.
     * @type {Integer (Int32)}
     */
    static farMANAGE_JOBS => 16

    /**
     * The user can view the fax server configuration data.
     * @type {Integer (Int32)}
     */
    static farQUERY_CONFIG => 32

    /**
     * The user can set the fax server configuration data.
     * @type {Integer (Int32)}
     */
    static farMANAGE_CONFIG => 64

    /**
     * The user can view all fax messages in the incoming archive.
     * @type {Integer (Int32)}
     */
    static farQUERY_IN_ARCHIVE => 128

    /**
     * The user can manage all fax messages in the incoming archive.
     * @type {Integer (Int32)}
     */
    static farMANAGE_IN_ARCHIVE => 256

    /**
     * The user can view all fax messages in the outgoing archive.
     * @type {Integer (Int32)}
     */
    static farQUERY_OUT_ARCHIVE => 512

    /**
     * The user can manage all fax messages in the outgoing archive.
     * @type {Integer (Int32)}
     */
    static farMANAGE_OUT_ARCHIVE => 1024
}
