#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information about a composition render target.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_target_id
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct COMPOSITION_TARGET_ID {
    #StructPack 4

    /**
     * Type: **[LUID](/windows/win32/api/winnt/ns-winnt-luid)**
     * 
     * The locally unique identifier (LUID) of the display adapter to which the monitor is connected.
     */
    displayAdapterLuid : LUID

    /**
     * Type: **[LUID](/windows/win32/api/winnt/ns-winnt-luid)**
     * 
     * The locally unique identifier (LUID) of the render adapter.
     */
    renderAdapterLuid : LUID

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The unique ID of the video present source.
     */
    vidPnSourceId : UInt32

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The unique ID of the video present target.
     */
    vidPnTargetId : UInt32

    /**
     * A unique identifier for this `COMPOSITION_TARGET_ID`.
     */
    uniqueId : UInt32

}
