#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RASTERIZER_STATUS structure contains information about whether TrueType is installed. This structure is filled when an application calls the GetRasterizerCaps function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-rasterizer_status
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct RASTERIZER_STATUS {
    #StructPack 2

    /**
     * The size, in bytes, of the <b>RASTERIZER_STATUS</b> structure.
     */
    nSize : Int16

    /**
     * Specifies whether at least one TrueType font is installed and whether TrueType is enabled. This value is TT_AVAILABLE, TT_ENABLED, or both if TrueType is on the system.
     */
    wFlags : Int16

    /**
     * The language in the system's Setup.inf file.
     */
    nLanguageID : Int16

}
