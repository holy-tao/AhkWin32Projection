#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Stores information about properties in the Windows Property System, and is used by the IItemPropertyBag interface.
 * @remarks
 * To preview attachments with a third-party protocol handler on computers running Windows XP or Windows Server 2003, it may be necessary to use the <a href="https://docs.microsoft.com/windows/desktop/search/iitempropertybag">IItemPropertyBag</a> interface and the following APIs: the <a href="https://docs.microsoft.com/windows/desktop/search/-search-isearchprotocolui">ISearchProtocolUI</a>, <a href="https://docs.microsoft.com/windows/desktop/search/-search-iitempreviewerext">IItemPreviewerExt</a> and <a href="https://docs.microsoft.com/windows/desktop/search/-search-isearchitem">ISearchItem</a> interfaces, the <a href="https://docs.microsoft.com/windows/desktop/search/-search-linkinfo">LINKINFO</a> and <b>ITEMPROP</b> structures, and the <a href="https://docs.microsoft.com/windows/desktop/search/-search-linktype">LINKTYPE</a> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/subsmgr/ns-subsmgr-itemprop
 * @namespace Windows.Win32.System.Search
 */
export default struct ITEMPROP {
    #StructPack 8

    variantValue : VARIANT

    pwszName : PWSTR

}
