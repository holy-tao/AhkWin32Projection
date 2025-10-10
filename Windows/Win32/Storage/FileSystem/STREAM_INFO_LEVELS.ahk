#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that are used with the FindFirstStreamW function to specify the information level of the returned data.
 * @see https://docs.microsoft.com/windows/win32/api//fileapi/ne-fileapi-stream_info_levels
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class STREAM_INFO_LEVELS{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirststreamw">FindFirstStreamW</a> function retrieves standard 
 *       stream information. The data is returned in a 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/ns-fileapi-win32_find_stream_data">WIN32_FIND_STREAM_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static FindStreamInfoStandard => 0

    /**
     * Used to determine valid enumeration values. All supported enumeration values are less than 
 *       <b>FindStreamInfoMaxInfoLevel</b>.
     * @type {Integer (Int32)}
     */
    static FindStreamInfoMaxInfoLevel => 1
}
