#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AM_COLCON.ahk

/**
 * Describes the currently selected button from the DVD highlight information.
 * @remarks
 * The <b>AM_PROPERTY_DVDSUBPIC_HLI</b> property uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_property_sphli
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_PROPERTY_SPHLI extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Highlight status of current selection.
     * @type {Integer}
     */
    HLISS {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved for internal use. Do not use or set.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Start presentation time divided by 90,000.
     * @type {Integer}
     */
    StartPTM {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * End presentation time divided by 90,000.
     * @type {Integer}
     */
    EndPTM {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Start x-coordinate pixel of the current highlight button.
     * @type {Integer}
     */
    StartX {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Start y-coordinate pixel of the current highlight button.
     * @type {Integer}
     */
    StartY {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Ending x-coordinate pixel of the current highlight button.
     * @type {Integer}
     */
    StopX {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Ending y-coordinate pixel of the current highlight button.
     * @type {Integer}
     */
    StopY {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Color contrast description of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_colcon">AM_COLCON</a>.
     * @type {AM_COLCON}
     */
    ColCon{
        get {
            if(!this.HasProp("__ColCon"))
                this.__ColCon := AM_COLCON(this.ptr + 20)
            return this.__ColCon
        }
    }
}
