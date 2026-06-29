#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS {
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
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_GET_ACCESSOR => 65536

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_SET_ACCESSOR => 131072

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_LET_VARIABLE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_CONST_VARIABLE => 524288
}
