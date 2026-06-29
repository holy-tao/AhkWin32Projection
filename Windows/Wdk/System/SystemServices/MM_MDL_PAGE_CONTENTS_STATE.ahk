#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MM_MDL_PAGE_CONTENTS_STATE {
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
    static MmMdlPageContentsDynamic => 0

    /**
     * @type {Integer (Int32)}
     */
    static MmMdlPageContentsInvariant => 1

    /**
     * @type {Integer (Int32)}
     */
    static MmMdlPageContentsQuery => 2
}
