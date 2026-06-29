#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags controlling what is returned in the enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_callback_data_flags
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_CALLBACK_DATA_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Start the scan at the first entry in the directory.
     * @type {Integer (Int32)}
     */
    static PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN => 1

    /**
     * Return only one entry from the enumeration.
     * @type {Integer (Int32)}
     */
    static PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY => 2
}
