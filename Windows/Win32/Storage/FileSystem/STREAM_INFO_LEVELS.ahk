#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that are used with the FindFirstStreamW function to specify the information level of the returned data.
 * @see https://learn.microsoft.com/windows/win32/api/fileapi/ne-fileapi-stream_info_levels
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct STREAM_INFO_LEVELS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
