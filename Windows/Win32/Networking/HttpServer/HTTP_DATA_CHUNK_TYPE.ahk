#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the data source for a data chunk.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_data_chunk_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_DATA_CHUNK_TYPE extends Win32Enum {

    /**
     * The data source is a memory data block. The union should be interpreted as a <b>FromMemory</b> structure.
     * Native name: HttpDataChunkFromMemory
     * @type {Integer (Int32)}
     */
    static FromMemory => 0

    /**
     * The data source is a file handle data block. The union should be interpreted as a <b>FromFileHandle</b> structure.
     * Native name: HttpDataChunkFromFileHandle
     * @type {Integer (Int32)}
     */
    static FromFileHandle => 1

    /**
     * The data source is a fragment cache data block. The union should be interpreted as a <b>FromFragmentCache</b> structure.
     * Native name: HttpDataChunkFromFragmentCache
     * @type {Integer (Int32)}
     */
    static FromFragmentCache => 2

    /**
     * The data source is a fragment cache data block. The union should be interpreted as a <b>FromFragmentCacheEx</b> structure.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>This flag is not supported.
     * Native name: HttpDataChunkFromFragmentCacheEx
     * @type {Integer (Int32)}
     */
    static FromFragmentCacheEx => 3

    /**
     * The data source is a trailers data block. The union should be interpreted as a <b>Trailers</b> structure.
     * 
     * <b>Windows 10, version 2004 and prior:  </b>This flag is not supported.
     * Native name: HttpDataChunkTrailers
     * @type {Integer (Int32)}
     */
    static Trailers => 4

    /**
     * Native name: HttpDataChunkFromWinHttpFastForwarding
     * @type {Integer (Int32)}
     */
    static FromWinHttpFastForwarding => 5

    /**
     * Native name: HttpDataChunkMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 6
}
