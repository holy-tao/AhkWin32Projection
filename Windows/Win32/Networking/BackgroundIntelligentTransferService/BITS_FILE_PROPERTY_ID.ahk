#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify ID values corresponding to background copy file properties.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/ne-bits5_0-bits_file_property_id
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BITS_FILE_PROPERTY_ID extends Win32Enum{

    /**
     * The full set of HTTP response headers from the server's last HTTP response packet.
     * @type {Integer (Int32)}
     */
    static BITS_FILE_PROPERTY_ID_HTTP_RESPONSE_HEADERS => 1
}
