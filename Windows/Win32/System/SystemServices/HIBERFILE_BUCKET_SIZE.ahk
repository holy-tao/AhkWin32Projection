#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct HIBERFILE_BUCKET_SIZE {
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
    static HiberFileBucket1GB => 0

    /**
     * @type {Integer (Int32)}
     */
    static HiberFileBucket2GB => 1

    /**
     * @type {Integer (Int32)}
     */
    static HiberFileBucket4GB => 2

    /**
     * @type {Integer (Int32)}
     */
    static HiberFileBucket8GB => 3

    /**
     * @type {Integer (Int32)}
     */
    static HiberFileBucket16GB => 4

    /**
     * @type {Integer (Int32)}
     */
    static HiberFileBucket32GB => 5

    /**
     * @type {Integer (Int32)}
     */
    static HiberFileBucketUnlimited => 6

    /**
     * @type {Integer (Int32)}
     */
    static HiberFileBucketMax => 7
}
