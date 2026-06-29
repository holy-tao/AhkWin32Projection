#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how to open or create a file.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_FILE_OPENMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Open an existing file. Fail if the file does not exist.
     * @type {Integer (Int32)}
     */
    static MF_OPENMODE_FAIL_IF_NOT_EXIST => 0

    /**
     * Create a new file. Fail if the file already exists.
     * @type {Integer (Int32)}
     */
    static MF_OPENMODE_FAIL_IF_EXIST => 1

    /**
     * Open an existing file and truncate it, so that the size is zero bytes. Fail if the file does not already exist.
     * @type {Integer (Int32)}
     */
    static MF_OPENMODE_RESET_IF_EXIST => 2

    /**
     * If the file does not exist, create a new file. If the file exists, open it.
     * @type {Integer (Int32)}
     */
    static MF_OPENMODE_APPEND_IF_EXIST => 3

    /**
     * Create a new file. If the file exists, overwrite the file.
     * @type {Integer (Int32)}
     */
    static MF_OPENMODE_DELETE_IF_EXIST => 4
}
