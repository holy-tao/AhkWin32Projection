#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }

/**
 * The DD_DIRECTDRAW_LOCAL structure contains driver information that is relevant to the current DirectDraw process only.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_directdraw_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_DIRECTDRAW_LOCAL {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpGbl : DD_DIRECTDRAW_GLOBAL.Ptr

}
