#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MM_ROTATE_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MmToFrameBuffer => 0

    /**
     * @type {Integer (Int32)}
     */
    static MmToFrameBufferNoCopy => 1

    /**
     * @type {Integer (Int32)}
     */
    static MmToRegularMemory => 2

    /**
     * @type {Integer (Int32)}
     */
    static MmToRegularMemoryNoCopy => 3

    /**
     * @type {Integer (Int32)}
     */
    static MmMaximumRotateDirection => 4
}
