#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTML_PAINTER_INFO extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    lZOrder {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    iidDrawObject {
        get {
            if(!this.HasProp("__iidDrawObject"))
                this.__iidDrawObject := Guid(8, this)
            return this.__iidDrawObject
        }
    }

    /**
     * @type {RECT}
     */
    rcExpand {
        get {
            if(!this.HasProp("__rcExpand"))
                this.__rcExpand := RECT(24, this)
            return this.__rcExpand
        }
    }
}
