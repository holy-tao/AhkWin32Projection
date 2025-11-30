#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class PIPE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_DontCare => 0

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_RangeNotFixed => 1

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_RangeFixed => 2

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_CompressionUnknown => 3

    /**
     * @type {Integer (Int32)}
     */
    static PipeState_Finalized => 4
}
