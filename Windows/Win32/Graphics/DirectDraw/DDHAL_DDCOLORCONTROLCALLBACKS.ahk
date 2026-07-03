#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHALCOLORCB_COLORCONTROL.ahk" { LPDDHALCOLORCB_COLORCONTROL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDCOLORCONTROLCALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    ColorControl : LPDDHALCOLORCB_COLORCONTROL

}
