#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class PIPE_STATE extends Win32Enum {

    /**
     * Native name: PipeState_DontCare
     * @type {Integer (Int32)}
     */
    static DontCare => 0

    /**
     * Native name: PipeState_RangeNotFixed
     * @type {Integer (Int32)}
     */
    static RangeNotFixed => 1

    /**
     * Native name: PipeState_RangeFixed
     * @type {Integer (Int32)}
     */
    static RangeFixed => 2

    /**
     * Native name: PipeState_CompressionUnknown
     * @type {Integer (Int32)}
     */
    static CompressionUnknown => 3

    /**
     * Native name: PipeState_Finalized
     * @type {Integer (Int32)}
     */
    static Finalized => 4
}
