#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include .\CHARRANGE.ahk

/**
 * Information that a rich edit control uses to format its output for a particular device. This structure is used with the EM_FORMATRANGE message.
 * @remarks
 * 
  * <b>hdcTarget</b> contains the HDC to format for, which is usually the same as the HDC specified by <b>hdc</b> but can be different. For example, if you create a print preview module, <b>hdc</b> is the HDC of the window in which the output is viewed, and <b>hdcTarget</b> is the HDC for the printer. 
  * 	
  * 
  * The values for <b>rc</b> and <b>rcPage</b> can be obtained by using <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdevicecaps">GetDeviceCaps</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-formatrange
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class FORMATRANGE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * A HDC for the device to render to, if <a href="https://msdn.microsoft.com/6d1e562b-d741-4d4a-a395-554083cb0dbb">EM_FORMATRANGE</a> is being used to send the output to a device.
     * @type {HDC}
     */
    hdc{
        get {
            if(!this.HasProp("__hdc"))
                this.__hdc := HDC(this.ptr + 0)
            return this.__hdc
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * An HDC for the target device to format for.
     * @type {HDC}
     */
    hdcTarget{
        get {
            if(!this.HasProp("__hdcTarget"))
                this.__hdcTarget := HDC(this.ptr + 8)
            return this.__hdcTarget
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The area within the <i>rcPage</i> rectangle to render to. Units are measured in twips.
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(this.ptr + 16)
            return this.__rc
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The entire area of a page on the rendering device. Units are measured in twips.
     * @type {RECT}
     */
    rcPage{
        get {
            if(!this.HasProp("__rcPage"))
                this.__rcPage := RECT(this.ptr + 32)
            return this.__rcPage
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of characters to format.
     * @type {CHARRANGE}
     */
    chrg{
        get {
            if(!this.HasProp("__chrg"))
                this.__chrg := CHARRANGE(this.ptr + 48)
            return this.__chrg
        }
    }
}
