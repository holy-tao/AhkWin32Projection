#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that are used with the FindFirstFileEx function to specify the information level of the returned data.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-findex_info_levels
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FINDEX_INFO_LEVELS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfileexa">FindFirstFileEx</a> function retrieves a 
     *       standard set of attribute information. The data is returned in a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static FindExInfoStandard => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfileexa">FindFirstFileEx</a> function does not query the short file name, improving overall enumeration speed. The data is returned in a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure, and the <b>cAlternateFileName</b> 
     *     member is always a <b>NULL</b> string.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static FindExInfoBasic => 1

    /**
     * This value is used for validation. Supported values are less than this value.
     * @type {Integer (Int32)}
     */
    static FindExInfoMaxInfoLevel => 2
}
