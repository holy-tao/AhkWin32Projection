#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides application category information to Add/Remove Programs in Control Panel. The APPCATEGORYINFOLIST structure is used create a complete list of categories for an application publisher.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-appcategoryinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPCATEGORYINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>LCID</b>
     * 
     * Unused.
     * @type {Integer}
     */
    Locale {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string containing the display name of the category. This string displays in the <b>Category</b> list in Add/Remove Programs. This string buffer must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {Pointer<PWSTR>}
     */
    pszDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * A GUID identifying the application category.
     * @type {Pointer<Guid>}
     */
    AppCategoryId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
