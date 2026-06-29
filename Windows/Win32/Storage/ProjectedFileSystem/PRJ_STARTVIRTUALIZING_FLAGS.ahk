#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags to provide when starting a virtualization instance.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_startvirtualizing_flags
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_STARTVIRTUALIZING_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flags.
     * @type {Integer (Int32)}
     */
    static PRJ_FLAG_NONE => 0

    /**
     * Specifies that ProjFS should maintain a "negative path cache" for the virtualization instance. If the negative path cache is active, then if the provider indicates that a file path does not exist by returning HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND) from its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback, ProjFS will fail subsequent opens of that path without calling the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback again. 
     * 
     * To resume receiving the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> for paths the provider has indicated do not exist, the provider must call <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjclearnegativepathcache">PrjClearNegativePathCache</a>.
     * @type {Integer (Int32)}
     */
    static PRJ_FLAG_USE_NEGATIVE_PATH_CACHE => 1
}
