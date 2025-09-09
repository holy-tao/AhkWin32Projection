#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DATABLOCK_HEADER.ahk
#Include ..\..\System\Console\COORD.ahk

/**
 * Holds an extra data block used by IShellLinkDataList. It holds console properties.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-nt_console_props
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NT_CONSOLE_PROPS extends Win32Struct
{
    static sizeof => 204

    static packingSize => 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a> structure with the <b>NT_CONSOLE_PROPS</b> structure's size and signature. The signature for an <b>NT_CONSOLE_PROPS</b> structure is NT_CONSOLE_PROPS_SIG.
     * @type {DATABLOCK_HEADER}
     */
    dbh{
        get {
            if(!this.HasProp("__dbh"))
                this.__dbh := DATABLOCK_HEADER(this.ptr + 0)
            return this.__dbh
        }
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Fill attribute for the console.
     * @type {Integer}
     */
    wFillAttribute {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Fill attribute for console pop-ups.
     * @type {Integer}
     */
    wPopupFillAttribute {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the console's screen buffer size.
     * @type {COORD}
     */
    dwScreenBufferSize{
        get {
            if(!this.HasProp("__dwScreenBufferSize"))
                this.__dwScreenBufferSize := COORD(this.ptr + 12)
            return this.__dwScreenBufferSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the console's window size.
     * @type {COORD}
     */
    dwWindowSize{
        get {
            if(!this.HasProp("__dwWindowSize"))
                this.__dwWindowSize := COORD(this.ptr + 16)
            return this.__dwWindowSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the console's window origin.
     * @type {COORD}
     */
    dwWindowOrigin{
        get {
            if(!this.HasProp("__dwWindowOrigin"))
                this.__dwWindowOrigin := COORD(this.ptr + 20)
            return this.__dwWindowOrigin
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The font.
     * @type {Integer}
     */
    nFont {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The input buffer size.
     * @type {Integer}
     */
    nInputBufferSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/console/coord-str">COORD</a> structure with the font size.
     * @type {COORD}
     */
    dwFontSize{
        get {
            if(!this.HasProp("__dwFontSize"))
                this.__dwFontSize := COORD(this.ptr + 32)
            return this.__dwFontSize
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The font family.
     * @type {Integer}
     */
    uFontFamily {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The font weight.
     * @type {Integer}
     */
    uFontWeight {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>WCHAR[LF_FACESIZE]</b>
     * 
     * A character array that contains the font's face name.
     * @type {String}
     */
    FaceName {
        get => StrGet(this.ptr + 44, 31, "UTF-16")
        set => StrPut(value, this.ptr + 44, 31, "UTF-16")
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The cursor size.
     * @type {Integer}
     */
    uCursorSize {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in full-screen mode, or <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bFullScreen {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in quick-edit mode, or <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bQuickEdit {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in insert mode, or <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bInsertMode {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if the console is in auto-position mode, or <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bAutoPosition {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the history buffer.
     * @type {Integer}
     */
    uHistoryBufferSize {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The number of history buffers.
     * @type {Integer}
     */
    uNumberOfHistoryBuffers {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A boolean value that is set to <b>TRUE</b> if old duplicate history lists should be discarded, or <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bHistoryNoDup {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>[16]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> values with the console's color settings.
     * @type {Array<UInt32>}
     */
    ColorTable{
        get {
            if(!this.HasProp("__ColorTableProxyArray"))
                this.__ColorTableProxyArray := Win32FixedArray(this.ptr + 140, 16, Primitive, "uint")
            return this.__ColorTableProxyArray
        }
    }
}
