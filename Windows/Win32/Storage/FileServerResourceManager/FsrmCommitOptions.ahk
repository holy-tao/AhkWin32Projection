#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the options for committing a collection of objects.
 * @remarks
 * The <b>FsrmCommitOptions_Asynchronous</b> option is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmCommitOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use no options and commit the collection of objects synchronously.
     * @type {Integer (Int32)}
     */
    static FsrmCommitOptions_None => 0

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static FsrmCommitOptions_Asynchronous => 1
}
