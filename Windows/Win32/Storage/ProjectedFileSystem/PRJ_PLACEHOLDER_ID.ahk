#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the length of a placeholder identifier.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_placeholder_id
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_PLACEHOLDER_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The length of a placeholder identifier.
     * @type {Integer (Int32)}
     */
    static PRJ_PLACEHOLDER_ID_LENGTH => 128
}
