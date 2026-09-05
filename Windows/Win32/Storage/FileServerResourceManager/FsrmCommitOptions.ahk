#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the options for committing a collection of objects.
 * @remarks
 * The <b>FsrmCommitOptions_Asynchronous</b> option is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmCommitOptions extends Win32Enum {

    /**
     * Use no options and commit the collection of objects synchronously.
     * Native name: FsrmCommitOptions_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Reserved. Do not use.
     * Native name: FsrmCommitOptions_Asynchronous
     * @type {Integer (Int32)}
     */
    static Asynchronous => 1
}
