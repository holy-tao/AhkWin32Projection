#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the streaming modes to use for the file stream.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilestreamingmode
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmFileStreamingMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The streaming mode is unknown; do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingMode_Unknown => 0

    /**
     * Use the streaming interface for reading from the file.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingMode_Read => 1

    /**
     * Use the streaming interface for writing to the  file.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingMode_Write => 2
}
