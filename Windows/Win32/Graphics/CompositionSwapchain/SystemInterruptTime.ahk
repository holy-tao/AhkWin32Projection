#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the amount of time since the system was last started, in 100ns intervals.
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ns-presentationtypes-systeminterrupttime
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct SystemInterruptTime {
    #StructPack 8

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * 
     * The amount of time since the system was last started, in 100ns intervals.
     */
    value : Int64

}
