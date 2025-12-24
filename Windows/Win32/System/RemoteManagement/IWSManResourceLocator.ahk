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
     * @type {BSTR} 
     */
    ResourceURI {
        get => this.get_ResourceURI()
        set => this.put_ResourceURI(value)
    }

    /**
     * @type {BSTR} 
     */
    FragmentPath {
        get => this.get_FragmentPath()
        set => this.put_FragmentPath(value)
    }

    /**
     * @type {BSTR} 
     */
    FragmentDialect {
        get => this.get_FragmentDialect()
        set => this.put_FragmentDialect(value)
    }

    /**
     * @type {BOOL} 
     */
    MustUnderstandOptions {
        get => this.get_MustUnderstandOptions()
        set => this.put_MustUnderstandOptions(value)
    }

    /**
     * @type {BSTR} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * The resource URI of the requested resource. This property can contain only the path, not a query string for specific instances.
     * @remarks
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> is the corresponding scripting object for the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> interface.
     * 
     * The following is an example of a proper path for  <b>ResourceURI</b>.
     * 
     * <pre class="syntax" xml:space="preserve"><c>"http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service"</c></pre>
     * The following path does not work because it  contains a key for a specific instance. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addselector">IWSManResourceLocator::AddSelector</a> method to specify a particular instance.
     * 
     * <pre class="syntax" xml:space="preserve"><c>"http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service?Name=winmgmt"</c></pre>
     * The corresponding scripting method is <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator-resourceuri">ResourceLocator.ResourceURI</a>.
     * 
     * 
     * @param {BSTR} uri 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_resourceuri
     */
    put_ResourceURI(uri) {
        uri := uri is String ? BSTR.Alloc(uri).Value : uri

        result := ComCall(7, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * The resource URI of the requested resource. This property can contain only the path, not a query string for specific instances.
     * @remarks
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> is the corresponding scripting object for the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> interface.
     * 
     * The following is an example of a proper path for  <b>ResourceURI</b>.
     * 
     * <pre class="syntax" xml:space="preserve"><c>"http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service"</c></pre>
     * The following path does not work because it  contains a key for a specific instance. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addselector">IWSManResourceLocator::AddSelector</a> method to specify a particular instance.
     * 
     * <pre class="syntax" xml:space="preserve"><c>"http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service?Name=winmgmt"</c></pre>
     * The corresponding scripting method is <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator-resourceuri">ResourceLocator.ResourceURI</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_resourceuri
     */
    get_ResourceURI() {
        uri := BSTR()
        result := ComCall(8, this, "ptr", uri, "HRESULT")
        return uri
    }

    /**
     * Adds a selector to the ResourceLocator object. The selector specifies a particular instance of a resource.
     * @param {BSTR} resourceSelName The selector name. For example, when requesting WMI data, this parameter is the key property for a WMI class.
     * @param {VARIANT} selValue The selector value. For example, for WMI data, this parameter contains a value for a key property that identifies a specific instance.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addselector
     */
    AddSelector(resourceSelName, selValue) {
        resourceSelName := resourceSelName is String ? BSTR.Alloc(resourceSelName).Value : resourceSelName

        result := ComCall(9, this, "ptr", resourceSelName, "ptr", selValue, "HRESULT")
        return result
    }

    /**
     * Removes all the selectors from a ResourceLocator object. You can provide a ResourceLocator object instead of specifying a resource URI in IWSManSession object operations such as Get, Put, or Enumerate.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-clearselectors
     */
    ClearSelectors() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Gets or sets the path for a resource fragment or property when ResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_fragmentpath
     */
    get_FragmentPath() {
        text := BSTR()
        result := ComCall(11, this, "ptr", text, "HRESULT")
        return text
    }

    /**
     * Gets or sets the path for a resource fragment or property when ResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate.
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_fragmentpath
     */
    put_FragmentPath(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(12, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * Gets or sets the language dialect for a resource fragment dialect when IWSManResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate.
     * @remarks
     * 
     * The dialect string defaults to the XPath 1.0 specification. For more information, see <a href="https://www.w3.org/TR/xpath">http://www.w3.org/TR/xpath</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_fragmentdialect
     */
    get_FragmentDialect() {
        text := BSTR()
        result := ComCall(13, this, "ptr", text, "HRESULT")
        return text
    }

    /**
     * Gets or sets the language dialect for a resource fragment dialect when IWSManResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate.
     * @remarks
     * 
     * The dialect string defaults to the XPath 1.0 specification. For more information, see <a href="https://www.w3.org/TR/xpath">http://www.w3.org/TR/xpath</a>.
     * 
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_fragmentdialect
     */
    put_FragmentDialect(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(14, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * Adds data required to process the request. For example, some WMI providers may require an IWbemContext or SWbemNamedValueSet object with provider-specific information.
     * @param {BSTR} OptionName The name of the optional data object.
     * @param {VARIANT} OptionValue A value supplied for the optional data object.
     * @param {BOOL} mustComply A flag that indicates the option must be processed. The default is <b>False</b> (0).
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addoption
     */
    AddOption(OptionName, OptionValue, mustComply) {
        OptionName := OptionName is String ? BSTR.Alloc(OptionName).Value : OptionName

        result := ComCall(15, this, "ptr", OptionName, "ptr", OptionValue, "int", mustComply, "HRESULT")
        return result
    }

    /**
     * Gets or sets the MustUnderstandOptions value for the ResourceLocator object.
     * @param {BOOL} mustUnderstand 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_mustunderstandoptions
     */
    put_MustUnderstandOptions(mustUnderstand) {
        result := ComCall(16, this, "int", mustUnderstand, "HRESULT")
        return result
    }

    /**
     * Gets or sets the MustUnderstandOptions value for the ResourceLocator object.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_mustunderstandoptions
     */
    get_MustUnderstandOptions() {
        result := ComCall(17, this, "int*", &mustUnderstand := 0, "HRESULT")
        return mustUnderstand
    }

    /**
     * Removes any options from the ResourceLocator object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-clearoptions
     */
    ClearOptions() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Gets an XML representation of additional error information.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_error
     */
    get_Error() {
        value := BSTR()
        result := ComCall(19, this, "ptr", value, "HRESULT")
        return value
    }
}
