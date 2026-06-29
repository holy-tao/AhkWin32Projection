#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\BLENDFUNCTION.ahk" { BLENDFUNCTION }
#Import ".\BP_PAINTPARAMS_FLAGS.ahk" { BP_PAINTPARAMS_FLAGS }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Defines paint operation parameters for BeginBufferedPaint.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-bp_paintparams
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BP_PAINTPARAMS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : BP_PAINTPARAMS_FLAGS

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to exclusion <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure. This rectangle is excluded from the clipping region.  May be <b>NULL</b> for no exclusion rectangle.
     */
    prcExclude : RECT.Ptr

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-blendfunction">BLENDFUNCTION</a>*</b>
     * 
     * A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-blendfunction">BLENDFUNCTION</a> structure, which controls blending by specifying the blending functions for source and destination bitmaps.  If <b>NULL</b>, the source buffer is copied to the destination with no blending.
     */
    pBlendFunction : BLENDFUNCTION.Ptr

}
