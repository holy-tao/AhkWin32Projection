#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_COMPRESSION enumerated type specifies whether compression is to be used in the data link for header and data.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_compression
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_COMPRESSION extends Win32Enum{

    /**
     * Data headers are not compressed.
     * @type {Integer (Int32)}
     */
    static MBN_COMPRESSION_NONE => 0

    /**
     * Data headers are compressed.
     * @type {Integer (Int32)}
     */
    static MBN_COMPRESSION_ENABLE => 1
}
