#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_SERVER_APIVERSION_ENUM enumeration defines the version of the fax API. No value below is supported on any version of the fax service earlier than the one it designates.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_server_apiversion_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_SERVER_APIVERSION_ENUM{

    /**
     * API Version 0, the fax service API used by the BackOffice Small Business Server 2000 (SBS) and BackOffice Server 2000 (BOS). Not supported.
     * @type {Integer (Int32)}
     */
    static fsAPI_VERSION_0 => 0

    /**
     * API Version 1, the fax service API used by the Windows XP fax service server.
     * @type {Integer (Int32)}
     */
    static fsAPI_VERSION_1 => 65536

    /**
     * API Version 2, the fax service API used by the Windows Server 2003 fax service server.
     * @type {Integer (Int32)}
     */
    static fsAPI_VERSION_2 => 131072

    /**
     * API Version 3, the fax service API used by the Windows Vista fax service server.
     * @type {Integer (Int32)}
     */
    static fsAPI_VERSION_3 => 196608
}
