#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_HEAP_OBJECT_FLAGS{

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
