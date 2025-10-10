#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the options for failing IO operations that violate a file screen.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmfilescreenflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileScreenFlags{

    /**
     * If this flag is set, the server will fail any IO operation that violates the file screen. If this flag is 
 *       not set, the server will not fail violating IO operations but will still run any action associated with the file 
 *       screen.
     * @type {Integer (Int32)}
     */
    static FsrmFileScreenFlags_Enforce => 1
}
