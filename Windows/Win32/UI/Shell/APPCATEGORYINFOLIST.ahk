#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APPCATEGORYINFO.ahk" { APPCATEGORYINFO }

/**
 * Provides a list of supported application categories from an application publisher to Add/Remove Programs in Control Panel.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-appcategoryinfolist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct APPCATEGORYINFOLIST {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A value of type <b>DWORD</b> that specifies the count of <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfo">APPCATEGORYINFO</a> elements in the array pointed to by <b>pCategoryInfo</b>.
     */
    cCategory : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfo">APPCATEGORYINFO</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfo">APPCATEGORYINFO</a> structures. This array contains all the categories an application publisher supports and must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    pCategoryInfo : APPCATEGORYINFO.Ptr

}
