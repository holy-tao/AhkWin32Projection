#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the current chunk is a text-type property or a value-type property.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ne-filter-chunkstate
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct CHUNKSTATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The current chunk is a text-type property.
     * @type {Integer (Int32)}
     */
    static CHUNK_TEXT => 1

    /**
     * The current chunk is a value-type property.
     * @type {Integer (Int32)}
     */
    static CHUNK_VALUE => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static CHUNK_FILTER_OWNED_VALUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CHUNK_IMAGE => 8
}
