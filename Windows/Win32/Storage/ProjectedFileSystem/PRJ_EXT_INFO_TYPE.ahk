#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies extended information types
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_ext_info_type
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_EXT_INFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_extended_info">PRJ_EXTENDED_INFO</a> specifies the target of a symbolic link.
     * @type {Integer (Int32)}
     */
    static PRJ_EXT_INFO_TYPE_SYMLINK => 1
}
