#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_KNOWN_FOLDER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderDesktop => 1

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderDocuments => 2

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderDownloads => 3

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderMusic => 4

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderPictures => 5

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderVideos => 6

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderOther => 7

    /**
     * @type {Integer (Int32)}
     */
    static KnownFolderMax => 7
}
