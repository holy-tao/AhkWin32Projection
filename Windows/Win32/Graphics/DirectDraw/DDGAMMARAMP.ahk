#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDGAMMARAMP structure contains red, green, and blue ramp data for the IDirectDrawGammaControl::GetGammaRamp and IDirectDrawGammaControl::SetGammaRamp methods.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddgammaramp
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDGAMMARAMP {
    #StructPack 2

    /**
     * Array of 256 WORD elements that describe the red gamma ramp.
     */
    red : UInt16[256]

    /**
     * Array of 256 WORD elements that describe the green gamma ramp.
     */
    green : UInt16[256]

    /**
     * Array of 256 WORD elements that describe the blue gamma ramp.
     */
    blue : UInt16[256]

}
