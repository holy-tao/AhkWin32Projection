#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about paragraph formatting attributes in a rich edit control. (PARAFORMAT)
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-paraformat
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class PARAFORMAT extends Win32Struct
{
    static sizeof => 156

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Structure size, in bytes. The member must be filled before passing to the rich edit control.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Value specifying numbering options. This member can be zero or PFN_BULLET.
     * @type {Integer}
     */
    wNumbering {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    wEffects {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Indentation of the first line in the paragraph, in twips. If the paragraph formatting is being set and PFM_OFFSETINDENT is specified, this member is treated as a relative value that is added to the starting indentation of each affected paragraph.
     * @type {Integer}
     */
    dxStartIndent {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Size, of the right indentation relative to the right margin, in twips.
     * @type {Integer}
     */
    dxRightIndent {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Indentation of the second and subsequent lines of a paragraph relative to the starting indentation, in twips. The first line is indented if this member is negative or outdented if this member is positive.
     * @type {Integer}
     */
    dxOffset {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * @type {Integer}
     */
    wAlignment {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Number of tab stops.
     * @type {Integer}
     */
    cTabCount {
        get => NumGet(this, 26, "short")
        set => NumPut("short", value, this, 26)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Array of absolute tab stop positions. Each element in the array specifies information about a tab stop. The 24 low-order bits specify the absolute offset, in twips. To use this member, set the PFM_TABSTOPS flag in the 
     * 					<b>dwMask</b> member.
     *                     
     * 
     * <b>Rich Edit 2.0:</b> For compatibility with TOM interfaces, you can use the eight high-order bits to store additional information about each tab stop.
     * @type {Array<UInt32>}
     */
    rgxTabs{
        get {
            if(!this.HasProp("__rgxTabsProxyArray"))
                this.__rgxTabsProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "uint")
            return this.__rgxTabsProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 156
    }
}
