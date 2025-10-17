#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\HRGN.ahk
#Include .\HTML_PAINT_XFORM.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTML_PAINT_DRAW_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {RECT}
     */
    rcViewport{
        get {
            if(!this.HasProp("__rcViewport"))
                this.__rcViewport := RECT(0, this)
            return this.__rcViewport
        }
    }

    /**
     * @type {HRGN}
     */
    hrgnUpdate{
        get {
            if(!this.HasProp("__hrgnUpdate"))
                this.__hrgnUpdate := HRGN(16, this)
            return this.__hrgnUpdate
        }
    }

    /**
     * @type {HTML_PAINT_XFORM}
     */
    xform{
        get {
            if(!this.HasProp("__xform"))
                this.__xform := HTML_PAINT_XFORM(24, this)
            return this.__xform
        }
    }
}
