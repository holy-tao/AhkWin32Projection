#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * The COLORKEY structure communicates color key information between the renderer and another filter.
 * @remarks
 * 
  * The video renderer supports a data transport accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlay">IOverlay</a> interface. This will typically be used by hardware decoder filters that need the renderer to communicate where to put the data rather than requiring the renderer to draw the data. One mechanism for communicating where to put the images is by using a color key. This structure is used by a filter (typically a hardware decoder) to describe color key requirements to the video renderer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-colorkey
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COLORKEY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Key type. Can be <b>CK_NOCOLORKEY</b>, <b>CK_INDEX</b>, or <b>CK_RGB</b>. The <b>CK_INDEX</b> and <b>CK_RGB</b> can be combined with a bitwise <b>OR</b>.
     * @type {Integer}
     */
    KeyType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Palette index.
     * @type {Integer}
     */
    PaletteIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Lowest RGB color value.
     * @type {COLORREF}
     */
    LowColorValue{
        get {
            if(!this.HasProp("__LowColorValue"))
                this.__LowColorValue := COLORREF(this.ptr + 8)
            return this.__LowColorValue
        }
    }

    /**
     * Highest RGB color value.
     * @type {COLORREF}
     */
    HighColorValue{
        get {
            if(!this.HasProp("__HighColorValue"))
                this.__HighColorValue := COLORREF(this.ptr + 12)
            return this.__HighColorValue
        }
    }
}
