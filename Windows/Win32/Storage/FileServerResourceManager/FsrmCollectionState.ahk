#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible states of a collection object.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmcollectionstate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmCollectionState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
