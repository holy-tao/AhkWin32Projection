#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * Used by IImePadApplet::CreateUI to specify applet window style.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-imeappletui
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEAPPLETUI {
    #StructPack 8

    /**
     * Window handle created by applet window.
     */
    hwnd : HWND

    /**
     * Applet window style. The style is a combination of <b>IPAWS_*</b> flags; see the Remarks of <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nf-imepad-iimepad-request">IImePad::Request</a> for the possible <b>IPAWS_*</b> flags.
     */
    dwStyle : UInt32

    /**
     * The applet window's initial width.
     */
    width : Int32

    /**
     * The applet window's initial height.
     */
    height : Int32

    /**
     * Minimum width of the applet window. Valid only when <b>IPAWS_MINWIDTHFIXED</b> style is set in <i>dwStyle</i>.
     */
    minWidth : Int32

    /**
     * Minimum height of applet window. Valid only when <b>IPAWS_MINHEIGHTFIXED</b> is set in <i>dwStyle</i>.
     */
    minHeight : Int32

    /**
     * Maximum width of applet window. Valid only when <b>IPAWS_MAXWIDTHFIXED</b> is set in <i>dwStyle</i>.
     */
    maxWidth : Int32

    /**
     * Maximum height of applet window. Valid only when <b>IPAWS_MAXHEIGHTFIXED</b> is set in <i>dwStyle</i>.
     */
    maxHeight : Int32

    /**
     * Reserved.
     */
    lReserved1 : LPARAM

    /**
     * Reserved.
     */
    lReserved2 : LPARAM

}
