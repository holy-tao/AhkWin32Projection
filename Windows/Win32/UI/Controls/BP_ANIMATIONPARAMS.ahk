#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BP_ANIMATIONSTYLE.ahk" { BP_ANIMATIONSTYLE }

/**
 * Defines animation parameters for the BP_PAINTPARAMS structure used by BeginBufferedPaint.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-bp_animationparams
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BP_ANIMATIONPARAMS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Reserved.
     */
    dwFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ne-uxtheme-bp_animationstyle">BP_ANIMATIONSTYLE</a></b>
     * 
     * Animation style.
     */
    style : BP_ANIMATIONSTYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Length of the animation, in milliseconds.
     */
    dwDuration : UInt32

}
