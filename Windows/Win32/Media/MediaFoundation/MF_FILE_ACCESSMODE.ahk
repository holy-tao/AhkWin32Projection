#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the requested access mode for opening a file.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_FILE_ACCESSMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Read mode.
     * @type {Integer (Int32)}
     */
    static MF_ACCESSMODE_READ => 1

    /**
     * Write mode.
     * @type {Integer (Int32)}
     */
    static MF_ACCESSMODE_WRITE => 2

    /**
     * Read and write mode.
     * @type {Integer (Int32)}
     */
    static MF_ACCESSMODE_READWRITE => 3
}
