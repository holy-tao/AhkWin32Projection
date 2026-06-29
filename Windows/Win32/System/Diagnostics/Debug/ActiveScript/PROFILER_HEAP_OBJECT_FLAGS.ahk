#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_OBJECT_FLAGS {
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
    static PROFILER_HEAP_OBJECT_FLAGS_NEW_OBJECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_IS_ROOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_SITE_CLOSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_UNKNOWN => 16

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_DISPATCH => 32

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_SIZE_APPROXIMATE => 64

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_SIZE_UNAVAILABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_NEW_STATE_UNAVAILABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_WINRT_INSTANCE => 512

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_WINRT_RUNTIMECLASS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_WINRT_DELEGATE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_HEAP_OBJECT_FLAGS_WINRT_NAMESPACE => 4096
}
