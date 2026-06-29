#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_DEALLOCATE_RANGES_ALLOCATOR {
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
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_SAA => 1

    /**
     * @type {Integer (Int32)}
     */
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_CAA => 2

    /**
     * @type {Integer (Int32)}
     */
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_MAA => 3
}
