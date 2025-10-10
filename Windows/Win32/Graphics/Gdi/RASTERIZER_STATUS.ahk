#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RASTERIZER_STATUS structure contains information about whether TrueType is installed. This structure is filled when an application calls the GetRasterizerCaps function.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-rasterizer_status
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class RASTERIZER_STATUS extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * The size, in bytes, of the <b>RASTERIZER_STATUS</b> structure.
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Specifies whether at least one TrueType font is installed and whether TrueType is enabled. This value is TT_AVAILABLE, TT_ENABLED, or both if TrueType is on the system.
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * The language in the system's Setup.inf file.
     * @type {Integer}
     */
    nLanguageID {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }
}
