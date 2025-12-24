#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IValueMap.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Specifies a trace provider to enable in the trace session.
 * @remarks
 * 
 * If you want to retrieve only the display name or GUID of a specific provider or  retrieve only the list of processes registered as that provider, you can get this interface by calling the <b>CoCreateInstance</b> function and passing __uuidof(TraceDataProvider) as the class identifier and __uuidof(ITraceDataProvider) as the interface identifier. To create the object from a script for this purpose, use the Pla.TraceDataProvider program identifier. 
 * 
 * Do not use the <b>CoCreateInstance</b> function if you are going to add the interface to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovidercollection">ITraceDataProviderCollection</a> collection.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-itracedataprovider
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ITraceDataProvider extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITraceDataProvider
     * @type {Guid}
     */
    static IID => Guid("{03837512-098b-11d8-9414-505054503030}")

    /**
     * The class identifier for TraceDataProvider
     * @type {Guid}
     */
    static CLSID => Guid("{03837513-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "put_DisplayName", "get_Guid", "put_Guid", "get_Level", "get_KeywordsAny", "get_KeywordsAll", "get_Properties", "get_FilterEnabled", "put_FilterEnabled", "get_FilterType", "put_FilterType", "get_FilterData", "put_FilterData", "Query", "Resolve", "SetSecurity", "GetSecurity", "GetRegisteredProcesses"]

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
     * Retrieves or sets the display name of the provider.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_displayname
     */
    get_DisplayName() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the display name of the provider.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the provider's GUID.
     * @returns {Guid} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_guid
     */
    get_Guid() {
        guid := Guid()
        result := ComCall(9, this, "ptr", guid, "HRESULT")
        return guid
    }

    /**
     * Retrieves or sets the provider's GUID.
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-put_guid
     */
    put_Guid(guid) {
        result := ComCall(10, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * Retrieves the level of information used to enable the provider.
     * @remarks
     * 
     * The <i>ppLevel</i> parameter is a provider-defined value that specifies the level of information that the event generates. For example, you can use this value to indicate the severity level of the events (informational, warning, error) that you want the provider to generate.
     * 
     * You use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface to retrieve or set the level value. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property contains the level value. 
     * 
     * You can also use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-add">IValueMap::Add</a> method to add one or more level values. You need to use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface only when you want to name the level, or you want to enable or disable levels without having to add or remove them. Only one level can be enabled.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property contains the string representation of the level, for example, Information. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the level value. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_enabled">IValueMapItem::Enabled</a> property indicates whether the level is enabled.  
     * 
     * If you use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> to set the level and the value map collection contains one or more items, PLA searches the collection for a matching value and enables it and disables the others. If the value does not exist in the list, PLA adds the level (the item is not named).
     * 
     * 
     * @returns {IValueMap} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_level
     */
    get_Level() {
        result := ComCall(11, this, "ptr*", &ppLevel := 0, "HRESULT")
        return IValueMap(ppLevel)
    }

    /**
     * Retrieves the list of keywords that determine the category of events that you want the provider to write.
     * @remarks
     * 
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
     * 
     * 
     * @returns {IValueMap} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_keywordsany
     */
    get_KeywordsAny() {
        result := ComCall(12, this, "ptr*", &ppKeywords := 0, "HRESULT")
        return IValueMap(ppKeywords)
    }

    /**
     * Retrieves the list of keywords that restricts the category of events that you want the provider to write.
     * @remarks
     * 
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
     * 
     * 
     * @returns {IValueMap} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_keywordsall
     */
    get_KeywordsAll() {
        result := ComCall(13, this, "ptr*", &ppKeywords := 0, "HRESULT")
        return IValueMap(ppKeywords)
    }

    /**
     * Retrieves the list of extended data items that Event Tracing for Windows (ETW) includes with the event.
     * @remarks
     * 
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
     * 
     * 
     * @returns {IValueMap} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_properties
     */
    get_Properties() {
        result := ComCall(14, this, "ptr*", &ppProperties := 0, "HRESULT")
        return IValueMap(ppProperties)
    }

    /**
     * Retrieves or sets a value that determines whether the filter data is used to enable the provider.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_filterenabled
     */
    get_FilterEnabled() {
        result := ComCall(15, this, "short*", &FilterEnabled := 0, "HRESULT")
        return FilterEnabled
    }

    /**
     * Retrieves or sets a value that determines whether the filter data is used to enable the provider.
     * @param {VARIANT_BOOL} FilterEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-put_filterenabled
     */
    put_FilterEnabled(FilterEnabled) {
        result := ComCall(16, this, "short", FilterEnabled, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a provider-defined filter type.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_filtertype
     */
    get_FilterType() {
        result := ComCall(17, this, "uint*", &pulType := 0, "HRESULT")
        return pulType
    }

    /**
     * Retrieves or sets a provider-defined filter type.
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-put_filtertype
     */
    put_FilterType(ulType) {
        result := ComCall(18, this, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets arbitrary data that is sent to the trace data provider for filtering purposes.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-get_filterdata
     */
    get_FilterData() {
        result := ComCall(19, this, "ptr*", &ppData := 0, "HRESULT")
        return ppData
    }

    /**
     * Retrieves or sets arbitrary data that is sent to the trace data provider for filtering purposes.
     * @param {Pointer<SAFEARRAY>} pData 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-put_filterdata
     */
    put_FilterData(pData) {
        result := ComCall(20, this, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Retrieves details about a registered provider.
     * @param {BSTR} bstrName The name of the registered provider. The name is case-insensitive. You can also specify the string form of the provider's GUID.
     * @param {BSTR} bstrServer The computer on which the provider is registered. You can specify the computer's name, fully qualified domain name, or IP address.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-query
     */
    Query(bstrName, bstrServer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer

        result := ComCall(21, this, "ptr", bstrName, "ptr", bstrServer, "HRESULT")
        return result
    }

    /**
     * Merges the details about a provider with this instance.
     * @param {IDispatch} pFrom The interface of the provider to merge with this instance.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-resolve
     */
    Resolve(pFrom) {
        result := ComCall(22, this, "ptr", pFrom, "HRESULT")
        return result
    }

    /**
     * Sets the security information for the trace data provider.
     * @param {BSTR} Sddl A string that describes the security descriptor for the object. For details, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor Definition Language</a>.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-setsecurity
     */
    SetSecurity(Sddl) {
        Sddl := Sddl is String ? BSTR.Alloc(Sddl).Value : Sddl

        result := ComCall(23, this, "ptr", Sddl, "HRESULT")
        return result
    }

    /**
     * Retrieves the security information for the trace data provider.
     * @param {Integer} SecurityInfo The object-related security information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> data type.
     * @returns {BSTR} A string that describes the security descriptor for the object. For details, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor Definition Language</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-getsecurity
     */
    GetSecurity(SecurityInfo) {
        Sddl := BSTR()
        result := ComCall(24, this, "uint", SecurityInfo, "ptr", Sddl, "HRESULT")
        return Sddl
    }

    /**
     * Retrieves a list of processes that have registered as an Event Tracing for Windows (ETW) provider.
     * @returns {IValueMap} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that contains the list of processes that have registered as an ETW provider. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property  contains the name of the binary, and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the process identifier.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-itracedataprovider-getregisteredprocesses
     */
    GetRegisteredProcesses() {
        result := ComCall(25, this, "ptr*", &Processes := 0, "HRESULT")
        return IValueMap(Processes)
    }
}
