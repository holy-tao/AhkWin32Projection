#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * Contains information about a composition render target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_target_id
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_TARGET_ID extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **[LUID](/windows/win32/api/winnt/ns-winnt-luid)**
     * 
     * The locally unique identifier (LUID) of the display adapter to which the monitor is connected.
     * @type {LUID}
     */
    displayAdapterLuid{
        get {
            if(!this.HasProp("__displayAdapterLuid"))
                this.__displayAdapterLuid := LUID(this.ptr + 0)
            return this.__displayAdapterLuid
        }
    }

    /**
     * Type: **[LUID](/windows/win32/api/winnt/ns-winnt-luid)**
     * 
     * The locally unique identifier (LUID) of the render adapter.
     * @type {LUID}
     */
    renderAdapterLuid{
        get {
            if(!this.HasProp("__renderAdapterLuid"))
                this.__renderAdapterLuid := LUID(this.ptr + 8)
            return this.__renderAdapterLuid
        }
    }

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The unique ID of the video present source.
     * @type {Integer}
     */
    vidPnSourceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The unique ID of the video present target.
     * @type {Integer}
     */
    vidPnTargetId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A unique identifier for this `COMPOSITION_TARGET_ID`.
     * @type {Integer}
     */
    uniqueId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
