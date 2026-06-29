#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COORD.ahk" { COORD }

/**
 * See reference information about the WINDOW_BUFFER_SIZE_RECORD structure, which describes a change in the size of the console screen buffer.
 * @remarks
 * Buffer size events are placed in the input buffer when the console is in window-aware mode (**ENABLE\_WINDOW\_INPUT**).
 * @see https://learn.microsoft.com/windows/console/window-buffer-size-record-str
 * @namespace Windows.Win32.System.Console
 */
export default struct WINDOW_BUFFER_SIZE_RECORD {
    #StructPack 2

    /**
     * A [**COORD**](coord-str.md) structure that contains the size of the console screen buffer, in character cell columns and rows.
     */
    dwSize : COORD

}
