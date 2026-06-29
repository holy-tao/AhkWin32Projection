#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CHARRANGE.ahk" { CHARRANGE }
#Import "..\..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }

/**
 * Information that a rich edit control uses to format its output for a particular device. This structure is used with the EM_FORMATRANGE message.
 * @remarks
 * <b>hdcTarget</b> contains the HDC to format for, which is usually the same as the HDC specified by <b>hdc</b> but can be different. For example, if you create a print preview module, <b>hdc</b> is the HDC of the window in which the output is viewed, and <b>hdcTarget</b> is the HDC for the printer. 
 * 	
 * 
 * The values for <b>rc</b> and <b>rcPage</b> can be obtained by using <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdevicecaps">GetDeviceCaps</a>.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-formatrange
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct FORMATRANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * A HDC for the device to render to, if <a href="https://msdn.microsoft.com/6d1e562b-d741-4d4a-a395-554083cb0dbb">EM_FORMATRANGE</a> is being used to send the output to a device.
     */
    hdc : HDC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * An HDC for the target device to format for.
     */
    hdcTarget : HDC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The area within the <i>rcPage</i> rectangle to render to. Units are measured in twips.
     */
    rc : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The entire area of a page on the rendering device. Units are measured in twips.
     */
    rcPage : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of characters to format.
     */
    chrg : CHARRANGE

}
