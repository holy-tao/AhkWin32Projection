#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes timing and composition information.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_stats
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct COMPOSITION_STATS {
    #StructPack 8

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The running total count of times that a frame was presented to the target.
     */
    presentCount : UInt32

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The running total count of v-blanks at which the last frame was presented to the target.
     */
    refreshCount : UInt32

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     */
    virtualRefreshCount : UInt32

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     */
    time : Int64

}
