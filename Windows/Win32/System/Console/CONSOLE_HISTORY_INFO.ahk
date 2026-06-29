#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * See reference information about the CONSOLE_HISTORY_INFO structure, which contains information about the console history.
 * @see https://learn.microsoft.com/windows/console/console-history-info
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_HISTORY_INFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes. Set this member to `sizeof(CONSOLE_HISTORY_INFO)`.
     */
    cbSize : UInt32 := this.Size

    /**
     * The number of commands kept in each history buffer.
     */
    HistoryBufferSize : UInt32

    /**
     * The number of history buffers kept for this console process.
     */
    NumberOfHistoryBuffers : UInt32

    /**
     * This parameter can be zero or the following value.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **HISTORY_NO_DUP_FLAG** 0x1 | Duplicate entries will not be stored in the history buffer.
     */
    dwFlags : UInt32

}
