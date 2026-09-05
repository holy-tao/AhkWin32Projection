#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class PIPE_ALLOCATOR_PLACE extends Win32Enum {

    /**
     * Native name: Pipe_Allocator_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: Pipe_Allocator_FirstPin
     * @type {Integer (Int32)}
     */
    static FirstPin => 1

    /**
     * Native name: Pipe_Allocator_LastPin
     * @type {Integer (Int32)}
     */
    static LastPin => 2

    /**
     * Native name: Pipe_Allocator_MiddlePin
     * @type {Integer (Int32)}
     */
    static MiddlePin => 3
}
