#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides application category information to Add/Remove Programs in Control Panel. The APPCATEGORYINFOLIST structure is used create a complete list of categories for an application publisher.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-appcategoryinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct APPCATEGORYINFO {
    #StructPack 8

    /**
     * Type: <b>LCID</b>
     * 
     * Unused.
     */
    Locale : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string containing the display name of the category. This string displays in the <b>Category</b> list in Add/Remove Programs. This string buffer must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    pszDescription : PWSTR

    /**
     * Type: <b>GUID</b>
     * 
     * A GUID identifying the application category.
     */
    AppCategoryId : Guid

}
