#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_HEAP_OBJECT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_NEW_OBJECT
     * @type {Integer (Int32)}
     */
    static NEW_OBJECT => 1

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_IS_ROOT
     * @type {Integer (Int32)}
     */
    static IS_ROOT => 2

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_SITE_CLOSED
     * @type {Integer (Int32)}
     */
    static SITE_CLOSED => 4

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL
     * @type {Integer (Int32)}
     */
    static EXTERNAL => 8

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_UNKNOWN
     * @type {Integer (Int32)}
     */
    static EXTERNAL_UNKNOWN => 16

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_DISPATCH
     * @type {Integer (Int32)}
     */
    static EXTERNAL_DISPATCH => 32

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_SIZE_APPROXIMATE
     * @type {Integer (Int32)}
     */
    static SIZE_APPROXIMATE => 64

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_SIZE_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static SIZE_UNAVAILABLE => 128

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_NEW_STATE_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static NEW_STATE_UNAVAILABLE => 256

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_WINRT_INSTANCE
     * @type {Integer (Int32)}
     */
    static WINRT_INSTANCE => 512

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_WINRT_RUNTIMECLASS
     * @type {Integer (Int32)}
     */
    static WINRT_RUNTIMECLASS => 1024

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_WINRT_DELEGATE
     * @type {Integer (Int32)}
     */
    static WINRT_DELEGATE => 2048

    /**
     * Native name: PROFILER_HEAP_OBJECT_FLAGS_WINRT_NAMESPACE
     * @type {Integer (Int32)}
     */
    static WINRT_NAMESPACE => 4096
}
