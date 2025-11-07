#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Supplies the path to a resource. You can use an IWSManResourceLocator object instead of a resource URI in IWSManSession object operations such as IWSManSession.Get, IWSManSession.Put, or IWSManSession.Enumerate.
 * @remarks
 * 
  * The corresponding scripting object is <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanresourcelocator
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManResourceLocator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManResourceLocator
     * @type {Guid}
     */
    static IID => Guid("{a7a1ba28-de41-466a-ad0a-c4059ead7428}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ResourceURI", "get_ResourceURI", "AddSelector", "ClearSelectors", "get_FragmentPath", "put_FragmentPath", "get_FragmentDialect", "put_FragmentDialect", "AddOption", "put_MustUnderstandOptions", "get_MustUnderstandOptions", "ClearOptions", "get_Error"]

    /**
     * 
     * @param {BSTR} uri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_resourceuri
     */
    put_ResourceURI(uri) {
        uri := uri is String ? BSTR.Alloc(uri).Value : uri

        result := ComCall(7, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_resourceuri
     */
    get_ResourceURI() {
        uri := BSTR()
        result := ComCall(8, this, "ptr", uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @param {BSTR} resourceSelName 
     * @param {VARIANT} selValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addselector
     */
    AddSelector(resourceSelName, selValue) {
        resourceSelName := resourceSelName is String ? BSTR.Alloc(resourceSelName).Value : resourceSelName

        result := ComCall(9, this, "ptr", resourceSelName, "ptr", selValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-clearselectors
     */
    ClearSelectors() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_fragmentpath
     */
    get_FragmentPath() {
        text := BSTR()
        result := ComCall(11, this, "ptr", text, "HRESULT")
        return text
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_fragmentpath
     */
    put_FragmentPath(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(12, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_fragmentdialect
     */
    get_FragmentDialect() {
        text := BSTR()
        result := ComCall(13, this, "ptr", text, "HRESULT")
        return text
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_fragmentdialect
     */
    put_FragmentDialect(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(14, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} OptionName 
     * @param {VARIANT} OptionValue 
     * @param {BOOL} mustComply 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addoption
     */
    AddOption(OptionName, OptionValue, mustComply) {
        OptionName := OptionName is String ? BSTR.Alloc(OptionName).Value : OptionName

        result := ComCall(15, this, "ptr", OptionName, "ptr", OptionValue, "int", mustComply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} mustUnderstand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_mustunderstandoptions
     */
    put_MustUnderstandOptions(mustUnderstand) {
        result := ComCall(16, this, "int", mustUnderstand, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_mustunderstandoptions
     */
    get_MustUnderstandOptions() {
        result := ComCall(17, this, "int*", &mustUnderstand := 0, "HRESULT")
        return mustUnderstand
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-clearoptions
     */
    ClearOptions() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_error
     */
    get_Error() {
        value := BSTR()
        result := ComCall(19, this, "ptr", value, "HRESULT")
        return value
    }
}
