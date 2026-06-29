#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_ENUM_FLAGS {
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
    static PROFILER_HEAP_ENUM_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_ENUM_FLAGS_STORE_RELATIONSHIP_FLAGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_ENUM_FLAGS_SUBSTRINGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_ENUM_FLAGS_RELATIONSHIP_SUBSTRINGS => 3
}
