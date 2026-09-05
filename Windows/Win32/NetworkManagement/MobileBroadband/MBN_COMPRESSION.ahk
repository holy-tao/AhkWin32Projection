#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_COMPRESSION enumerated type specifies whether compression is to be used in the data link for header and data.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_compression
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_COMPRESSION extends Win32Enum {

    /**
     * Data headers are not compressed.
     * Native name: MBN_COMPRESSION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Data headers are compressed.
     * Native name: MBN_COMPRESSION_ENABLE
     * @type {Integer (Int32)}
     */
    static ENABLE => 1
}
