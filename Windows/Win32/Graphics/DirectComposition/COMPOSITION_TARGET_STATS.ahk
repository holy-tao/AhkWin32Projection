#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COMPOSITION_STATS.ahk

/**
 * Contains per-target information for a composition frame and render target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_target_stats
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_TARGET_STATS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * @type {Integer}
     */
    outstandingPresents {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * @type {Integer}
     */
    presentTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * @type {Integer}
     */
    vblankDuration {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[COMPOSITION_STATS](ns-dcomptypes-composition_stats.md)**
     * @type {COMPOSITION_STATS}
     */
    presentedStats{
        get {
            if(!this.HasProp("__presentedStats"))
                this.__presentedStats := COMPOSITION_STATS(this.ptr + 24)
            return this.__presentedStats
        }
    }

    /**
     * Type: **[COMPOSITION_STATS](ns-dcomptypes-composition_stats.md)**
     * @type {COMPOSITION_STATS}
     */
    completedStats{
        get {
            if(!this.HasProp("__completedStats"))
                this.__completedStats := COMPOSITION_STATS(this.ptr + 48)
            return this.__completedStats
        }
    }
}
