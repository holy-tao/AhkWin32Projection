#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_displayname
     */
    get_DisplayName(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_guid
     */
    get_Guid(guid) {
        result := ComCall(9, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_guid
     */
    put_Guid(guid) {
        result := ComCall(10, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_level
     */
    get_Level(ppLevel) {
        result := ComCall(11, this, "ptr*", ppLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppKeywords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_keywordsany
     */
    get_KeywordsAny(ppKeywords) {
        result := ComCall(12, this, "ptr*", ppKeywords, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppKeywords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_keywordsall
     */
    get_KeywordsAll(ppKeywords) {
        result := ComCall(13, this, "ptr*", ppKeywords, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_properties
     */
    get_Properties(ppProperties) {
        result := ComCall(14, this, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} FilterEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_filterenabled
     */
    get_FilterEnabled(FilterEnabled) {
        result := ComCall(15, this, "ptr", FilterEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} FilterEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_filterenabled
     */
    put_FilterEnabled(FilterEnabled) {
        result := ComCall(16, this, "short", FilterEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_filtertype
     */
    get_FilterType(pulType) {
        pulTypeMarshal := pulType is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pulTypeMarshal, pulType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_filtertype
     */
    put_FilterType(ulType) {
        result := ComCall(18, this, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-get_filterdata
     */
    get_FilterData(ppData) {
        result := ComCall(19, this, "ptr*", ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-put_filterdata
     */
    put_FilterData(pData) {
        result := ComCall(20, this, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-query
     */
    Query(bstrName, bstrServer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer

        result := ComCall(21, this, "ptr", bstrName, "ptr", bstrServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-resolve
     */
    Resolve(pFrom) {
        result := ComCall(22, this, "ptr", pFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Sddl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-setsecurity
     */
    SetSecurity(Sddl) {
        Sddl := Sddl is String ? BSTR.Alloc(Sddl).Value : Sddl

        result := ComCall(23, this, "ptr", Sddl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SecurityInfo 
     * @param {Pointer<BSTR>} Sddl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-getsecurity
     */
    GetSecurity(SecurityInfo, Sddl) {
        result := ComCall(24, this, "uint", SecurityInfo, "ptr", Sddl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} Processes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovider-getregisteredprocesses
     */
    GetRegisteredProcesses(Processes) {
        result := ComCall(25, this, "ptr*", Processes, "HRESULT")
        return result
    }
}
