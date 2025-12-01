#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible states of a collection object.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmcollectionstate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmCollectionState extends Win32Enum{

    /**
     * The collection object is fetching data.
     * @type {Integer (Int32)}
     */
    static FsrmCollectionState_Fetching => 1

    /**
     * The collection object is committing its data.
     * @type {Integer (Int32)}
     */
    static FsrmCollectionState_Committing => 2

    /**
     * The collection object is complete (has stopped fetching or committing data).
     * @type {Integer (Int32)}
     */
    static FsrmCollectionState_Complete => 3

    /**
     * The collection operation (fetching or committing) was canceled.
     * @type {Integer (Int32)}
     */
    static FsrmCollectionState_Cancelled => 4
}
