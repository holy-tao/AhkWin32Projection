#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Supplies the path to a resource. You can use an IWSManResourceLocator object instead of a resource URI in IWSManSession object operations such as IWSManSession.Get, IWSManSession.Put, or IWSManSession.Enumerate.
 * @remarks
 * The corresponding scripting object is <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManResourceLocator extends IDispatch {
    /**
     * The interface identifier for IWSManResourceLocator
     * @type {Guid}
     */
    static IID := Guid("{a7a1ba28-de41-466a-ad0a-c4059ead7428}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManResourceLocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_ResourceURI           : IntPtr
        get_ResourceURI           : IntPtr
        AddSelector               : IntPtr
        ClearSelectors            : IntPtr
        get_FragmentPath          : IntPtr
        put_FragmentPath          : IntPtr
        get_FragmentDialect       : IntPtr
        put_FragmentDialect       : IntPtr
        AddOption                 : IntPtr
        put_MustUnderstandOptions : IntPtr
        get_MustUnderstandOptions : IntPtr
        ClearOptions              : IntPtr
        get_Error                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManResourceLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The resource URI of the requested resource. This property can contain only the path, not a query string for specific instances. (Put)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> is the corresponding scripting object for the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> interface.
     * 
     * The following is an example of a proper path for  <b>ResourceURI</b>.
     * 
     * 
     * ``` syntax
     * "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service"
     * ```
     * 
     * The following path does not work because it  contains a key for a specific instance. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addselector">IWSManResourceLocator::AddSelector</a> method to specify a particular instance.
     * 
     * 
     * ``` syntax
     * "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service?Name=winmgmt"
     * ```
     * 
     * The corresponding scripting method is <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator-resourceuri">ResourceLocator.ResourceURI</a>.
     * @param {BSTR} uri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_resourceuri
     */
    put_ResourceURI(uri) {
        uri := uri is String ? BSTR.Alloc(uri).Value : uri

        result := ComCall(7, this, BSTR, uri, "HRESULT")
        return result
    }

    /**
     * The resource URI of the requested resource. This property can contain only the path, not a query string for specific instances. (Get)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> is the corresponding scripting object for the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> interface.
     * 
     * The following is an example of a proper path for  <b>ResourceURI</b>.
     * 
     * 
     * ``` syntax
     * "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service"
     * ```
     * 
     * The following path does not work because it  contains a key for a specific instance. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addselector">IWSManResourceLocator::AddSelector</a> method to specify a particular instance.
     * 
     * 
     * ``` syntax
     * "http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service?Name=winmgmt"
     * ```
     * 
     * The corresponding scripting method is <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator-resourceuri">ResourceLocator.ResourceURI</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_resourceuri
     */
    get_ResourceURI() {
        uri := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, uri, "HRESULT")
        return uri
    }

    /**
     * Adds a selector to the ResourceLocator object. The selector specifies a particular instance of a resource.
     * @param {BSTR} resourceSelName The selector name. For example, when requesting WMI data, this parameter is the key property for a WMI class.
     * @param {VARIANT} selValue The selector value. For example, for WMI data, this parameter contains a value for a key property that identifies a specific instance.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addselector
     */
    AddSelector(resourceSelName, selValue) {
        resourceSelName := resourceSelName is String ? BSTR.Alloc(resourceSelName).Value : resourceSelName

        result := ComCall(9, this, BSTR, resourceSelName, VARIANT, selValue, "HRESULT")
        return result
    }

    /**
     * Removes all the selectors from a ResourceLocator object. You can provide a ResourceLocator object instead of specifying a resource URI in IWSManSession object operations such as Get, Put, or Enumerate.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-clearselectors
     */
    ClearSelectors() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Gets or sets the path for a resource fragment or property when ResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_fragmentpath
     */
    get_FragmentPath() {
        text := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, text, "HRESULT")
        return text
    }

    /**
     * Gets or sets the path for a resource fragment or property when ResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate. (Put)
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_fragmentpath
     */
    put_FragmentPath(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(12, this, BSTR, text, "HRESULT")
        return result
    }

    /**
     * Gets or sets the language dialect for a resource fragment dialect when IWSManResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate. (Get)
     * @remarks
     * The dialect string defaults to the XPath 1.0 specification. For more information, see <a href="https://www.w3.org/TR/xpath">http://www.w3.org/TR/xpath</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_fragmentdialect
     */
    get_FragmentDialect() {
        text := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, text, "HRESULT")
        return text
    }

    /**
     * Gets or sets the language dialect for a resource fragment dialect when IWSManResourceLocator is used in IWSManSession object methods such as Get, Put, or Enumerate. (Put)
     * @remarks
     * The dialect string defaults to the XPath 1.0 specification. For more information, see <a href="https://www.w3.org/TR/xpath">http://www.w3.org/TR/xpath</a>.
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_fragmentdialect
     */
    put_FragmentDialect(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(14, this, BSTR, text, "HRESULT")
        return result
    }

    /**
     * Adds data required to process the request. For example, some WMI providers may require an IWbemContext or SWbemNamedValueSet object with provider-specific information.
     * @param {BSTR} OptionName The name of the optional data object.
     * @param {VARIANT} OptionValue A value supplied for the optional data object.
     * @param {BOOL} mustComply A flag that indicates the option must be processed. The default is <b>False</b> (0).
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-addoption
     */
    AddOption(OptionName, OptionValue, mustComply) {
        OptionName := OptionName is String ? BSTR.Alloc(OptionName).Value : OptionName

        result := ComCall(15, this, BSTR, OptionName, VARIANT, OptionValue, BOOL, mustComply, "HRESULT")
        return result
    }

    /**
     * Gets or sets the MustUnderstandOptions value for the ResourceLocator object. (Put)
     * @param {BOOL} mustUnderstand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-put_mustunderstandoptions
     */
    put_MustUnderstandOptions(mustUnderstand) {
        result := ComCall(16, this, BOOL, mustUnderstand, "HRESULT")
        return result
    }

    /**
     * Gets or sets the MustUnderstandOptions value for the ResourceLocator object. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_mustunderstandoptions
     */
    get_MustUnderstandOptions() {
        result := ComCall(17, this, BOOL.Ptr, &mustUnderstand := 0, "HRESULT")
        return mustUnderstand
    }

    /**
     * Removes any options from the ResourceLocator object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-clearoptions
     */
    ClearOptions() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Gets an XML representation of additional error information. (IWSManResourceLocator.get_Error)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanresourcelocator-get_error
     */
    get_Error() {
        value := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWSManResourceLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_ResourceURI := CallbackCreate(GetMethod(implObj, "put_ResourceURI"), flags, 2)
        this.vtbl.get_ResourceURI := CallbackCreate(GetMethod(implObj, "get_ResourceURI"), flags, 2)
        this.vtbl.AddSelector := CallbackCreate(GetMethod(implObj, "AddSelector"), flags, 3)
        this.vtbl.ClearSelectors := CallbackCreate(GetMethod(implObj, "ClearSelectors"), flags, 1)
        this.vtbl.get_FragmentPath := CallbackCreate(GetMethod(implObj, "get_FragmentPath"), flags, 2)
        this.vtbl.put_FragmentPath := CallbackCreate(GetMethod(implObj, "put_FragmentPath"), flags, 2)
        this.vtbl.get_FragmentDialect := CallbackCreate(GetMethod(implObj, "get_FragmentDialect"), flags, 2)
        this.vtbl.put_FragmentDialect := CallbackCreate(GetMethod(implObj, "put_FragmentDialect"), flags, 2)
        this.vtbl.AddOption := CallbackCreate(GetMethod(implObj, "AddOption"), flags, 4)
        this.vtbl.put_MustUnderstandOptions := CallbackCreate(GetMethod(implObj, "put_MustUnderstandOptions"), flags, 2)
        this.vtbl.get_MustUnderstandOptions := CallbackCreate(GetMethod(implObj, "get_MustUnderstandOptions"), flags, 2)
        this.vtbl.ClearOptions := CallbackCreate(GetMethod(implObj, "ClearOptions"), flags, 1)
        this.vtbl.get_Error := CallbackCreate(GetMethod(implObj, "get_Error"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_ResourceURI)
        CallbackFree(this.vtbl.get_ResourceURI)
        CallbackFree(this.vtbl.AddSelector)
        CallbackFree(this.vtbl.ClearSelectors)
        CallbackFree(this.vtbl.get_FragmentPath)
        CallbackFree(this.vtbl.put_FragmentPath)
        CallbackFree(this.vtbl.get_FragmentDialect)
        CallbackFree(this.vtbl.put_FragmentDialect)
        CallbackFree(this.vtbl.AddOption)
        CallbackFree(this.vtbl.put_MustUnderstandOptions)
        CallbackFree(this.vtbl.get_MustUnderstandOptions)
        CallbackFree(this.vtbl.ClearOptions)
        CallbackFree(this.vtbl.get_Error)
    }
}
