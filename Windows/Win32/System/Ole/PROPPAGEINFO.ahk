#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * Contains parameters used to describe a property page to a property frame. A property page fills a caller-provided structure in the IPropertyPage::GetPageInfo method.
 * @remarks
 * 
  * The <b>pszTitle</b>, <b>pszDocString</b>, and the <b>pszHelpFile</b> members specified in this structure should contain text sensitive to the locale obtained through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid">IPropertyPageSite::GetLocaleID</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ns-ocidl-proppageinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PROPPAGEINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/nf-wtypesbase-olestr">OLESTR</a> that contains the string that appears in the tab for this page. The string must be allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The caller of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-getpageinfo">IPropertyPage::GetPageInfo</a> is responsible for freeing the memory with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {PWSTR}
     */
    pszTitle{
        get {
            if(!this.HasProp("__pszTitle"))
                this.__pszTitle := PWSTR(this.ptr + 8)
            return this.__pszTitle
        }
    }

    /**
     * Required dimensions of the page's dialog box, in pixels.
     * @type {SIZE}
     */
    size{
        get {
            if(!this.HasProp("__size"))
                this.__size := SIZE(this.ptr + 16)
            return this.__size
        }
    }

    /**
     * Pointer to a text string describing the page, which can be displayed in the property sheet dialog box (current frame implementation doesn't use this field). The text must be allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The caller of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-getpageinfo">IPropertyPage::GetPageInfo</a> is responsible for freeing the memory with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {PWSTR}
     */
    pszDocString{
        get {
            if(!this.HasProp("__pszDocString"))
                this.__pszDocString := PWSTR(this.ptr + 24)
            return this.__pszDocString
        }
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/nf-wtypesbase-olestr">OLESTR</a> that contains the simple name of the help file that describes this property page used instead of implementing <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-help">IPropertyPage::Help</a>. When the user presses Help, the Help method is normally called. If that method fails, the frame will open the help system with this help file (prefixed with the value of the HelpDir key in the property page's registry entries under its CLSID) and will instruct the help system to display the context described by the <b>dwHelpContext</b> field. The path must be allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The caller of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-getpageinfo">IPropertyPage::GetPageInfo</a> is responsible for freeing the memory with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @type {PWSTR}
     */
    pszHelpFile{
        get {
            if(!this.HasProp("__pszHelpFile"))
                this.__pszHelpFile := PWSTR(this.ptr + 32)
            return this.__pszHelpFile
        }
    }

    /**
     * Context identifier for the help topic within <b>pszHelpFile</b> that describes this page.
     * @type {Integer}
     */
    dwHelpContext {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
