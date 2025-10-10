#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides a list of supported application categories from an application publisher to Add/Remove Programs in Control Panel.
 * @see https://docs.microsoft.com/windows/win32/api//appmgmt/ns-appmgmt-appcategoryinfolist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPCATEGORYINFOLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the count of <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfo">APPCATEGORYINFO</a> elements in the array pointed to by <b>pCategoryInfo</b>.
     * @type {Integer}
     */
    cCategory {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfo">APPCATEGORYINFO</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfo">APPCATEGORYINFO</a> structures. This array contains all the categories an application publisher supports and must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {Pointer<APPCATEGORYINFO>}
     */
    pCategoryInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
