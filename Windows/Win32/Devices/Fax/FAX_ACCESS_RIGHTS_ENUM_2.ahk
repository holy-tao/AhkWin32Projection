#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines access rights on the fax server.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_access_rights_enum_2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ACCESS_RIGHTS_ENUM_2{

    /**
     * The user can submit low-priority fax jobs. Users can view and manage their jobs in the fax server's queue and their messages in the outgoing fax archive.
     * @type {Integer (Int32)}
     */
    static far2SUBMIT_LOW => 1

    /**
     * The user can submit normal-priority and low-priority fax jobs. Users can view and manage their jobs in the fax server queue and their messages in the outgoing fax archive.
     * @type {Integer (Int32)}
     */
    static far2SUBMIT_NORMAL => 2

    /**
     * The user can submit low-priority, normal-priority, and high-priority fax jobs. Users can view and manage their jobs in the fax server queue and their messages in the outgoing fax archive.
     * @type {Integer (Int32)}
     */
    static far2SUBMIT_HIGH => 4

    /**
     * The user can query outgoing jobs belonging to all accounts, including other user's accounts.
     * @type {Integer (Int32)}
     */
    static far2QUERY_OUT_JOBS => 8

    /**
     * The user can manage outgoing jobs belonging to all accounts, including other user's accounts.
     * @type {Integer (Int32)}
     */
    static far2MANAGE_OUT_JOBS => 16

    /**
     * The user can view and query the fax server's configuration data.
     * @type {Integer (Int32)}
     */
    static far2QUERY_CONFIG => 32

    /**
     * The user can view and set the fax server's configuration data.
     * @type {Integer (Int32)}
     */
    static far2MANAGE_CONFIG => 64

    /**
     * The user can query archived messages belonging to all accounts, including other user's accounts.
     * @type {Integer (Int32)}
     */
    static far2QUERY_ARCHIVES => 128

    /**
     * The user can manage archived messages belonging to all accounts, including other user's accounts.
     * @type {Integer (Int32)}
     */
    static far2MANAGE_ARCHIVES => 256

    /**
     * The user can manage all the messages in the server's receive folder. This includes the right to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-glossary">reassign</a> and delete messages.
     * @type {Integer (Int32)}
     */
    static far2MANAGE_RECEIVE_FOLDER => 512
}
