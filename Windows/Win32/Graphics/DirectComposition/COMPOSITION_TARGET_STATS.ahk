#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COMPOSITION_STATS.ahk" { COMPOSITION_STATS }

/**
 * Contains per-target information for a composition frame and render target.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_target_stats
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct COMPOSITION_TARGET_STATS {
    #StructPack 8

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     */
    outstandingPresents : UInt32

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     */
    presentTime : Int64

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     */
    vblankDuration : Int64

    /**
     * Type: **[COMPOSITION_STATS](ns-dcomptypes-composition_stats.md)**
     */
    presentedStats : COMPOSITION_STATS

    /**
     * Type: **[COMPOSITION_STATS](ns-dcomptypes-composition_stats.md)**
     */
    completedStats : COMPOSITION_STATS

}
