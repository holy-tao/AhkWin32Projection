#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the behavior when opening a file.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_FILE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the default behavior.
     * @type {Integer (Int32)}
     */
    static MF_FILEFLAGS_NONE => 0

    /**
     * Open the file with no system caching.
     * @type {Integer (Int32)}
     */
    static MF_FILEFLAGS_NOBUFFERING => 1

    /**
     * Subsequent open operations can have write access to the file.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static MF_FILEFLAGS_ALLOW_WRITE_SHARING => 2
}
