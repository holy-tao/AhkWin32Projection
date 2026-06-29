#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct MergeFlags {
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
    static MergeFlagsNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MergeManifest => 1

    /**
     * @type {Integer (Int32)}
     */
    static DropMemberRefCAs => 2

    /**
     * @type {Integer (Int32)}
     */
    static NoDupCheck => 4

    /**
     * @type {Integer (Int32)}
     */
    static MergeExportedTypes => 8
}
