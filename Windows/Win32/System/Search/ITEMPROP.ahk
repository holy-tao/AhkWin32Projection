#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Stores information about properties in the Windows Property System, and is used by the IItemPropertyBag interface.
 * @remarks
 * To preview attachments with a third-party protocol handler on computers running Windows XP or Windows Server 2003, it may be necessary to use the <a href="https://docs.microsoft.com/windows/desktop/search/iitempropertybag">IItemPropertyBag</a> interface and the following APIs: the <a href="https://docs.microsoft.com/windows/desktop/search/-search-isearchprotocolui">ISearchProtocolUI</a>, <a href="https://docs.microsoft.com/windows/desktop/search/-search-iitempreviewerext">IItemPreviewerExt</a> and <a href="https://docs.microsoft.com/windows/desktop/search/-search-isearchitem">ISearchItem</a> interfaces, the <a href="https://docs.microsoft.com/windows/desktop/search/-search-linkinfo">LINKINFO</a> and <b>ITEMPROP</b> structures, and the <a href="https://docs.microsoft.com/windows/desktop/search/-search-linktype">LINKTYPE</a> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/subsmgr/ns-subsmgr-itemprop
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITEMPROP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {VARIANT}
     */
    variantValue{
        get {
            if(!this.HasProp("__variantValue"))
                this.__variantValue := VARIANT(this.ptr + 0)
            return this.__variantValue
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 16)
            return this.__pwszName
        }
    }
}
