#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MENUITEMTEMPLATEHEADER.ahk
#Include .\MENUITEMTEMPLATE.ahk
#Include .\MENUEX_TEMPLATE_HEADER.ahk
#Include .\MENUEX_TEMPLATE_ITEM.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUTEMPLATEEX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {MENUITEMTEMPLATEHEADER}
     */
    mitHeader{
        get {
            if(!this.HasProp("__mitHeader"))
                this.__mitHeader := MENUITEMTEMPLATEHEADER(this.ptr + 0)
            return this.__mitHeader
        }
    }

    /**
     * @type {Array<MENUITEMTEMPLATE>}
     */
    miTemplate{
        get {
            if(!this.HasProp("__miTemplateProxyArray"))
                this.__miTemplateProxyArray := Win32FixedArray(this.ptr + 8, 8, MENUITEMTEMPLATE, "")
            return this.__miTemplateProxyArray
        }
    }

    /**
     * @type {MENUEX_TEMPLATE_HEADER}
     */
    mexHeader{
        get {
            if(!this.HasProp("__mexHeader"))
                this.__mexHeader := MENUEX_TEMPLATE_HEADER(this.ptr + 0)
            return this.__mexHeader
        }
    }

    /**
     * @type {Array<MENUEX_TEMPLATE_ITEM>}
     */
    mexItem{
        get {
            if(!this.HasProp("__mexItemProxyArray"))
                this.__mexItemProxyArray := Win32FixedArray(this.ptr + 8, 8, MENUEX_TEMPLATE_ITEM, "")
            return this.__mexItemProxyArray
        }
    }
}
