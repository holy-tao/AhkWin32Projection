#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores time-out values for connections and data.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-timeout_info
 * @namespace Windows.Win32.System.Search
 */
export default struct TIMEOUT_INFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The time-out value for a connection, in seconds.
     */
    dwConnectTimeout : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The time-out value for data, in seconds.
     */
    dwDataTimeout : UInt32

}
