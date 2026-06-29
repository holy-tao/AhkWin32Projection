#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes timing and composition statistics for a compositor frame.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_frame_stats
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct COMPOSITION_FRAME_STATS {
    #StructPack 8

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The time the frame started.
     */
    startTime : Int64

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The frame's target time.
     */
    targetTime : Int64

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The amount of time the frame took.
     */
    framePeriod : Int64

}
