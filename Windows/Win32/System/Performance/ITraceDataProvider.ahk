#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IValueMap.ahk" { IValueMap }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Specifies a trace provider to enable in the trace session.
 * @remarks
 * If you want to retrieve only the display name or GUID of a specific provider or  retrieve only the list of processes registered as that provider, you can get this interface by calling the <b>CoCreateInstance</b> function and passing __uuidof(TraceDataProvider) as the class identifier and __uuidof(ITraceDataProvider) as the interface identifier. To create the object from a script for this purpose, use the Pla.TraceDataProvider program identifier. 
 * 
 * Do not use the <b>CoCreateInstance</b> function if you are going to add the interface to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovidercollection">ITraceDataProviderCollection</a> collection.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-itracedataprovider
 * @namespace Windows.Win32.System.Performance
 */
export default struct ITraceDataProvider extends IDispatch {
    /**
     * The interface identifier for ITraceDataProvider
     * @type {Guid}
     */
    static IID := Guid("{03837512-098b-11d8-9414-505054503030}")

    /**
     * The class identifier for TraceDataProvider
     * @type {Guid}
     */
    static CLSID := Guid("{03837513-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITraceDataProvider interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DisplayName        : IntPtr
        put_DisplayName        : IntPtr
        get_Guid               : IntPtr
        put_Guid               : IntPtr
        get_Level              : IntPtr
        get_KeywordsAny        : IntPtr
        get_KeywordsAll        : IntPtr
        get_Properties         : IntPtr
        get_FilterEnabled      : IntPtr
        put_FilterEnabled      : IntPtr
        get_FilterType         : IntPtr
        put_FilterType         : IntPtr
        get_FilterData         : IntPtr
        put_FilterData         : IntPtr
        Query                  : IntPtr
        Resolve                : IntPtr
        SetSecurity            : IntPtr
        GetSecurity            : IntPtr
        GetRegisteredProcesses : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITraceDataProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {Guid} 
     */
    Guid {
        get => this.get_Guid()
        set => this.put_Guid(value)
    }

    /**
     * @type {IValueMap} 
     */
    Level {
        get => this.get_Level()
    }

    /**
     * @type {IValueMap} 
     */
    KeywordsAny {
        get => this.get_KeywordsAny()
    }

    /**
     * @type {IValueMap} 
     */
    KeywordsAll {
        get => this.get_KeywordsAll()
    }

    /**
     * @type {IValueMap} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FilterEnabled {
        get => this.get_FilterEnabled()
        set => this.put_FilterEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    FilterType {
        get => this.get_FilterType()
        set => this.put_FilterType(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    FilterData {
        get => this.get_FilterData()
        set => this.put_FilterData(value)
    }

    /**
     * Retrieves or sets the display name of the provider. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_displayname
     */
    get_DisplayName() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the display name of the provider. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the provider's GUID. (Get)
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_guid
     */
    get_Guid() {
        guid := Guid()
        result := ComCall(9, this, Guid.Ptr, guid, "HRESULT")
        return guid
    }

    /**
     * Retrieves or sets the provider's GUID. (Put)
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_guid
     */
    put_Guid(guid) {
        result := ComCall(10, this, Guid, guid, "HRESULT")
        return result
    }

    /**
     * Retrieves the level of information used to enable the provider.
     * @remarks
     * The <i>ppLevel</i> parameter is a provider-defined value that specifies the level of information that the event generates. For example, you can use this value to indicate the severity level of the events (informational, warning, error) that you want the provider to generate.
     * 
     * You use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface to retrieve or set the level value. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property contains the level value. 
     * 
     * You can also use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-add">IValueMap::Add</a> method to add one or more level values. You need to use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface only when you want to name the level, or you want to enable or disable levels without having to add or remove them. Only one level can be enabled.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property contains the string representation of the level, for example, Information. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the level value. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_enabled">IValueMapItem::Enabled</a> property indicates whether the level is enabled.  
     * 
     * If you use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> to set the level and the value map collection contains one or more items, PLA searches the collection for a matching value and enables it and disables the others. If the value does not exist in the list, PLA adds the level (the item is not named).
     * @returns {IValueMap} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_level
     */
    get_Level() {
        result := ComCall(11, this, "ptr*", &ppLevel := 0, "HRESULT")
        return IValueMap(ppLevel)
    }

    /**
     * Retrieves the list of keywords that determine the category of events that you want the provider to write.
     * @remarks
     * Keywords determine the category of events that you want the provider to write. The provider writes an event if any of the event's keyword bits match any of the bits set in this <b>KeywordsAny</b> mask.
     * 
     * To include all events that a provider provides, set this property to zero. To include only specific events, set this keyword mask to those specific events. For example, if the provider defines an event for its initialization and clean-up routines (bit 0), an event for its file operations (bit 1), and an event for its calculation operations (bit 2), you can choose to include only two of these events by setting this mask to 5 (set bits 0 and 2) to receive initialization and clean-up events and calculation events.
     * 
     * To further restrict the category of events that you want the provider to write, also set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedataprovider-get_keywordsall">ITraceDataProvider::KeywordsAll</a> property.
     * 
     * If the provider defines more complex event keywords (for example, the provider defines an event that sets bit 0 for read and bit 1 for local access and a second event that sets bit 0 for read and bit 2 for remote access), you could set this mask to 1 to receive all read events, or you could set this mask to 1 and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedataprovider-get_keywordsall">KeywordsAll</a> mask to 3 to receive local reads only.
     * 
     * If an event's keyword is zero, the provider will write the event to the session, regardless of this mask or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedataprovider-get_keywordsall">KeywordsAll</a> mask.
     * 
     * 
     * 
     * For providers that were written on an operating system prior to Windows Vista, the keyword value will be mapped to the enable flags.
     * 
     * You use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface to retrieve or set the keywords value. You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property to retrieve the keywords value (the value of all of the items in the map when combined with the <b>OR</b> operator), or you can enumerate each item in the map to retrieve the individual keyword values.
     * 
     * Likewise, when you set the keywords value, you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property to set the keywords value, or you can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-add">IValueMap::Add</a> method to add each individual keyword value.
     * 
     * If you use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> to set the keywords and the value map contains one or more items, PLA searches the collection for matching values and enables them and disables the others. If the value does not exist in the list, PLA adds the keyword (the item is not named).
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property contains the string representation of the keyword. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the keyword value. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_enabled">IValueMapItem::Enabled</a> property indicates if the keyword is enabled.  You need to use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface only when you want to name the keyword or you want to enable or disable keywords without having to add or remove them.
     * @returns {IValueMap} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_keywordsany
     */
    get_KeywordsAny() {
        result := ComCall(12, this, "ptr*", &ppKeywords := 0, "HRESULT")
        return IValueMap(ppKeywords)
    }

    /**
     * Retrieves the list of keywords that restricts the category of events that you want the provider to write.
     * @remarks
     * The provider writes an event if any of the event's keyword bits match any of the bits set in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedataprovider-get_keywordsany">KeywordsAny</a> property. 
     * The keywords specified in the  <b>KeywordsAll</b> property further restrict the category of events that you want the provider to write. If the event's keyword meets the <b>KeywordsAny</b> condition, the provider will write the event only if all of the bits in the <b>KeywordsAll</b> mask exist in the event's keyword. The <b>KeywordsAll</b> mask is not used if <b>KeywordsAny</b> is zero.
     * 
     * For more information about how the <b>KeywordsAll</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedataprovider-get_keywordsany">KeywordsAny</a> conditions relate, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedataprovider-get_keywordsany">KeywordsAny</a>.
     * 
     * You use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface to retrieve or set the keywords value. You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property to retrieve the keywords value (the value of all of the items in the map when combined with the <b>OR</b> operator), or you can enumerate each item in the map to retrieve the individual keyword values.
     * 
     * Likewise, when you set the keywords value, you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property to set the keywords value, or you can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-add">IValueMap::Add</a> method to add each individual keyword value.
     * 
     * If you use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> to set the keywords and the value map contains one or more items, PLA searches the collection for matching values and enables them and disables the others. If the value does not exist in the list, PLA adds the keyword (the item is not named).
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property contains the string representation of the keyword. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the keyword value. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_enabled">IValueMapItem::Enabled</a> property indicates if the keyword is enabled.  You need to use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface only when you want to name the keyword or you want to enable or disable keywords without having to add or remove them.
     * @returns {IValueMap} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_keywordsall
     */
    get_KeywordsAll() {
        result := ComCall(13, this, "ptr*", &ppKeywords := 0, "HRESULT")
        return IValueMap(ppKeywords)
    }

    /**
     * Retrieves the list of extended data items that Event Tracing for Windows (ETW) includes with the event.
     * @remarks
     * Use this property to request the following data items with the event.
     * 
     * <table>
     * <tr>
     * <th>Data item</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * Sid (value 0x01)
     * 
     * </td>
     * <td>
     * Includes the user's security identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SessionId (value 0x02)
     * 
     * </td>
     * <td>
     * Includes the session identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * StackTrace (value 0x04)
     * 
     * </td>
     * <td>
     * Includes the stack trace.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface to retrieve or specify the extended data items. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property contains items that are combined by using the <b>OR</b> operator. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property contains the string representation of the extended data item. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the extended data item value.
     * @returns {IValueMap} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_properties
     */
    get_Properties() {
        result := ComCall(14, this, "ptr*", &ppProperties := 0, "HRESULT")
        return IValueMap(ppProperties)
    }

    /**
     * Retrieves or sets a value that determines whether the filter data is used to enable the provider. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_filterenabled
     */
    get_FilterEnabled() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &FilterEnabled := 0, "HRESULT")
        return FilterEnabled
    }

    /**
     * Retrieves or sets a value that determines whether the filter data is used to enable the provider. (Put)
     * @param {VARIANT_BOOL} FilterEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_filterenabled
     */
    put_FilterEnabled(FilterEnabled) {
        result := ComCall(16, this, VARIANT_BOOL, FilterEnabled, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a provider-defined filter type. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_filtertype
     */
    get_FilterType() {
        result := ComCall(17, this, "uint*", &pulType := 0, "HRESULT")
        return pulType
    }

    /**
     * Retrieves or sets a provider-defined filter type. (Put)
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_filtertype
     */
    put_FilterType(ulType) {
        result := ComCall(18, this, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets arbitrary data that is sent to the trace data provider for filtering purposes. (Get)
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_filterdata
     */
    get_FilterData() {
        result := ComCall(19, this, "ptr*", &ppData := 0, "HRESULT")
        return ppData
    }

    /**
     * Retrieves or sets arbitrary data that is sent to the trace data provider for filtering purposes. (Put)
     * @param {Pointer<SAFEARRAY>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_filterdata
     */
    put_FilterData(pData) {
        result := ComCall(20, this, SAFEARRAY.Ptr, pData, "HRESULT")
        return result
    }

    /**
     * Retrieves details about a registered provider.
     * @remarks
     * To specify kernel providers, set the <i>bstrName</i> parameter to "Windows Kernel Trace".
     * 
     * To specify the context logger, set <i>bstrName</i> to "Circular Kernel Context Logger". The context logger provides a snapshot of the current state of the computer. The logger writes to an in-memory 100-megabyte circular log (not to a file). To release its contents to consumers, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-commit">IDataCollectorSet::Commit</a> method to flush the session.
     * @param {BSTR} bstrName The name of the registered provider. The name is case-insensitive. You can also specify the string form of the provider's GUID.
     * @param {BSTR} bstrServer The computer on which the provider is registered. You can specify the computer's name, fully qualified domain name, or IP address.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-query
     */
    Query(bstrName, bstrServer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer

        result := ComCall(21, this, BSTR, bstrName, BSTR, bstrServer, "HRESULT")
        return result
    }

    /**
     * Merges the details about a provider with this instance.
     * @remarks
     * You can specify an interface of a provider or a collection that contains the provider. If you specify a collection, the method finds the matching provider.
     * @param {IDispatch} pFrom The interface of the provider to merge with this instance.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-resolve
     */
    Resolve(pFrom) {
        result := ComCall(22, this, "ptr", pFrom, "HRESULT")
        return result
    }

    /**
     * Sets the security information for the trace data provider.
     * @param {BSTR} Sddl A string that describes the security descriptor for the object. For details, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor Definition Language</a>.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-setsecurity
     */
    SetSecurity(Sddl) {
        Sddl := Sddl is String ? BSTR.Alloc(Sddl).Value : Sddl

        result := ComCall(23, this, BSTR, Sddl, "HRESULT")
        return result
    }

    /**
     * Retrieves the security information for the trace data provider.
     * @param {Integer} SecurityInfo The object-related security information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> data type.
     * @returns {BSTR} A string that describes the security descriptor for the object. For details, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor Definition Language</a>.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-getsecurity
     */
    GetSecurity(SecurityInfo) {
        Sddl := BSTR.Owned()
        result := ComCall(24, this, "uint", SecurityInfo, BSTR.Ptr, Sddl, "HRESULT")
        return Sddl
    }

    /**
     * Retrieves a list of processes that have registered as an Event Tracing for Windows (ETW) provider.
     * @returns {IValueMap} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that contains the list of processes that have registered as an ETW provider. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property  contains the name of the binary, and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the process identifier.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-getregisteredprocesses
     */
    GetRegisteredProcesses() {
        result := ComCall(25, this, "ptr*", &Processes := 0, "HRESULT")
        return IValueMap(Processes)
    }

    Query(iid) {
        if (ITraceDataProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_Guid := CallbackCreate(GetMethod(implObj, "get_Guid"), flags, 2)
        this.vtbl.put_Guid := CallbackCreate(GetMethod(implObj, "put_Guid"), flags, 2)
        this.vtbl.get_Level := CallbackCreate(GetMethod(implObj, "get_Level"), flags, 2)
        this.vtbl.get_KeywordsAny := CallbackCreate(GetMethod(implObj, "get_KeywordsAny"), flags, 2)
        this.vtbl.get_KeywordsAll := CallbackCreate(GetMethod(implObj, "get_KeywordsAll"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
        this.vtbl.get_FilterEnabled := CallbackCreate(GetMethod(implObj, "get_FilterEnabled"), flags, 2)
        this.vtbl.put_FilterEnabled := CallbackCreate(GetMethod(implObj, "put_FilterEnabled"), flags, 2)
        this.vtbl.get_FilterType := CallbackCreate(GetMethod(implObj, "get_FilterType"), flags, 2)
        this.vtbl.put_FilterType := CallbackCreate(GetMethod(implObj, "put_FilterType"), flags, 2)
        this.vtbl.get_FilterData := CallbackCreate(GetMethod(implObj, "get_FilterData"), flags, 2)
        this.vtbl.put_FilterData := CallbackCreate(GetMethod(implObj, "put_FilterData"), flags, 2)
        this.vtbl.Query := CallbackCreate(GetMethod(implObj, "Query"), flags, 3)
        this.vtbl.Resolve := CallbackCreate(GetMethod(implObj, "Resolve"), flags, 2)
        this.vtbl.SetSecurity := CallbackCreate(GetMethod(implObj, "SetSecurity"), flags, 2)
        this.vtbl.GetSecurity := CallbackCreate(GetMethod(implObj, "GetSecurity"), flags, 3)
        this.vtbl.GetRegisteredProcesses := CallbackCreate(GetMethod(implObj, "GetRegisteredProcesses"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_Guid)
        CallbackFree(this.vtbl.put_Guid)
        CallbackFree(this.vtbl.get_Level)
        CallbackFree(this.vtbl.get_KeywordsAny)
        CallbackFree(this.vtbl.get_KeywordsAll)
        CallbackFree(this.vtbl.get_Properties)
        CallbackFree(this.vtbl.get_FilterEnabled)
        CallbackFree(this.vtbl.put_FilterEnabled)
        CallbackFree(this.vtbl.get_FilterType)
        CallbackFree(this.vtbl.put_FilterType)
        CallbackFree(this.vtbl.get_FilterData)
        CallbackFree(this.vtbl.put_FilterData)
        CallbackFree(this.vtbl.Query)
        CallbackFree(this.vtbl.Resolve)
        CallbackFree(this.vtbl.SetSecurity)
        CallbackFree(this.vtbl.GetSecurity)
        CallbackFree(this.vtbl.GetRegisteredProcesses)
    }
}
