#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class MM_ROTATE_DIRECTION extends Win32Enum {

    /**
     * Native name: MmToFrameBuffer
     * @type {Integer (Int32)}
     */
    static ToFrameBuffer => 0

    /**
     * Native name: MmToFrameBufferNoCopy
     * @type {Integer (Int32)}
     */
    static ToFrameBufferNoCopy => 1

    /**
     * Native name: MmToRegularMemory
     * @type {Integer (Int32)}
     */
    static ToRegularMemory => 2

    /**
     * Native name: MmToRegularMemoryNoCopy
     * @type {Integer (Int32)}
     */
    static ToRegularMemoryNoCopy => 3

    /**
     * Native name: MmMaximumRotateDirection
     * @type {Integer (Int32)}
     */
    static MaximumRotateDirection => 4
}
