#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk

/**
 * Used by IImePadApplet::CreateUI to specify applet window style.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-imeappletui
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEAPPLETUI extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Window handle created by applet window.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 0)
            return this.__hwnd
        }
    }

    /**
     * Applet window style. The style is a combination of <b>IPAWS_*</b> flags; see the Remarks of <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nf-imepad-iimepad-request">IImePad::Request</a> for the possible <b>IPAWS_*</b> flags.
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The applet window's initial width.
     * @type {Integer}
     */
    width {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The applet window's initial height.
     * @type {Integer}
     */
    height {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Minimum width of the applet window. Valid only when <b>IPAWS_MINWIDTHFIXED</b> style is set in <i>dwStyle</i>.
     * @type {Integer}
     */
    minWidth {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Minimum height of applet window. Valid only when <b>IPAWS_MINHEIGHTFIXED</b> is set in <i>dwStyle</i>.
     * @type {Integer}
     */
    minHeight {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Maximum width of applet window. Valid only when <b>IPAWS_MAXWIDTHFIXED</b> is set in <i>dwStyle</i>.
     * @type {Integer}
     */
    maxWidth {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Maximum height of applet window. Valid only when <b>IPAWS_MAXHEIGHTFIXED</b> is set in <i>dwStyle</i>.
     * @type {Integer}
     */
    maxHeight {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Reserved.
     * @type {Pointer}
     */
    lReserved1 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reserved.
     * @type {Pointer}
     */
    lReserved2 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
