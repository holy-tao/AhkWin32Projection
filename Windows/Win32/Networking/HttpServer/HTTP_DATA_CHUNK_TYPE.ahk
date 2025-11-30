#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the data source for a data chunk.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_data_chunk_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_DATA_CHUNK_TYPE extends Win32Enum{

    /**
     * The data source is a memory data block. The union should be interpreted as a <b>FromMemory</b> structure.
     * @type {Integer (Int32)}
     */
    static HttpDataChunkFromMemory => 0

    /**
     * The data source is a file handle data block. The union should be interpreted as a <b>FromFileHandle</b> structure.
     * @type {Integer (Int32)}
     */
    static HttpDataChunkFromFileHandle => 1

    /**
     * The data source is a fragment cache data block. The union should be interpreted as a <b>FromFragmentCache</b> structure.
     * @type {Integer (Int32)}
     */
    static HttpDataChunkFromFragmentCache => 2

    /**
     * The data source is a fragment cache data block. The union should be interpreted as a <b>FromFragmentCacheEx</b> structure.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static HttpDataChunkFromFragmentCacheEx => 3

    /**
     * The data source is a trailers data block. The union should be interpreted as a <b>Trailers</b> structure.
     * 
     * <b>Windows 10, version 2004 and prior:  </b>This flag is not supported.
     * @type {Integer (Int32)}
     */
    static HttpDataChunkTrailers => 4

    /**
     * @type {Integer (Int32)}
     */
    static HttpDataChunkFromWinHttpFastForwarding => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HttpDataChunkMaximum => 6
}
