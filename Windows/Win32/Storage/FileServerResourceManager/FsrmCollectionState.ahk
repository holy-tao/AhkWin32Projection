#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible states of a collection object.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmcollectionstate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmCollectionState extends Win32Enum {

    /**
     * The collection object is fetching data.
     * Native name: FsrmCollectionState_Fetching
     * @type {Integer (Int32)}
     */
    static Fetching => 1

    /**
     * The collection object is committing its data.
     * Native name: FsrmCollectionState_Committing
     * @type {Integer (Int32)}
     */
    static Committing => 2

    /**
     * The collection object is complete (has stopped fetching or committing data).
     * Native name: FsrmCollectionState_Complete
     * @type {Integer (Int32)}
     */
    static Complete => 3

    /**
     * The collection operation (fetching or committing) was canceled.
     * Native name: FsrmCollectionState_Cancelled
     * @type {Integer (Int32)}
     */
    static Cancelled => 4
}
