#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIMIZEDMETRICS_ARRANGE.ahk" { MINIMIZEDMETRICS_ARRANGE }

/**
 * Contains the scalable metrics associated with minimized windows.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-minimizedmetrics
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MINIMIZEDMETRICS {
    #StructPack 4

    /**
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(MINIMIZEDMETRICS)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * The width of minimized windows, in pixels.
     */
    iWidth : Int32

    /**
     * The horizontal space between arranged minimized windows, in pixels.
     */
    iHorzGap : Int32

    /**
     * The vertical space between arranged minimized windows, in pixels.
     */
    iVertGap : Int32

    iArrange : MINIMIZEDMETRICS_ARRANGE

}
