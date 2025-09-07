#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the color contrast description from the DVD highlight (HLI) structure.
 * @remarks
 * This structure is contained within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_property_sphli">AM_PROPERTY_SPHLI</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_colcon
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_COLCON extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    _bitfield4 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
