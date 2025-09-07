#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the options for committing a collection of objects.
 * @remarks
 * The <b>FsrmCommitOptions_Asynchronous</b> option is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmCommitOptions{

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
