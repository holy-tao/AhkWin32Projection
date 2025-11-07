#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * The DISPLAYCONFIG_PATH_SOURCE_INFO structure contains source information for a single path.
 * @remarks
 * 
 * A DISPLAYCONFIG_PATH_SOURCE_INFO structure is specified in the <b>sourceInfo</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_info">DISPLAYCONFIG_PATH_INFO</a> structure.
 * 
 * A source corresponds to a surface on which the display adapter can render pixels. Each display adapter is capable of rendering to x number of sources. What this means is how many desktops can be rendered for extend mode. This is typically 2. For example, source 0 might be rendering pixels from 0,0 to 1024,768, and source 1 might be rendering pixels from 1025,0 to 2048, 768.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-displayconfig_path_source_info
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_PATH_SOURCE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The identifier of the adapter that this source information relates to.
     * @type {LUID}
     */
    adapterId{
        get {
            if(!this.HasProp("__adapterId"))
                this.__adapterId := LUID(0, this)
            return this.__adapterId
        }
    }

    /**
     * The source identifier on the specified adapter that this path relates to.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    modeInfoIdx {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * This bitfield backs the following members:
     * - cloneGroupId
     * - sourceModeInfoIdx
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    cloneGroupId {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    sourceModeInfoIdx {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }

    /**
     * A bitwise OR of flag values that indicates the status of the source. The following values are supported:
     * @type {Integer}
     */
    statusFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
