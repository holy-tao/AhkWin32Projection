#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITraceDataProvider.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a collection of TraceDataProvider objects.To get this interface, access the ITraceDataCollector::TraceDataProviders property.You can also call the CoCreateInstance function to create a new instance of the TraceDataProviderCollection object.
 * @remarks
 * 
 * To create the object from a script, use the Pla.TraceDataProviderCollection program identifier.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-itracedataprovidercollection
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ITraceDataProviderCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITraceDataProviderCollection
     * @type {Guid}
     */
    static IID => Guid("{03837510-098b-11d8-9414-505054503030}")

    /**
     * The class identifier for TraceDataProviderCollection
     * @type {Guid}
     */
    static CLSID => Guid("{03837511-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Add", "Remove", "Clear", "AddRange", "CreateTraceDataProvider", "GetTraceDataProviders", "GetTraceDataProvidersByProcess"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {ITraceDataProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &ppProvider := 0, "HRESULT")
        return ITraceDataProvider(ppProvider)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * 
     * @param {ITraceDataProvider} pProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-add
     */
    Add(pProvider) {
        result := ComCall(10, this, "ptr", pProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-remove
     */
    Remove(vProvider) {
        result := ComCall(11, this, "ptr", vProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITraceDataProviderCollection} providers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-addrange
     */
    AddRange(providers) {
        result := ComCall(13, this, "ptr", providers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITraceDataProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-createtracedataprovider
     */
    CreateTraceDataProvider() {
        result := ComCall(14, this, "ptr*", &Provider := 0, "HRESULT")
        return ITraceDataProvider(Provider)
    }

    /**
     * 
     * @param {BSTR} server 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-gettracedataproviders
     */
    GetTraceDataProviders(server) {
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(15, this, "ptr", server, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Server 
     * @param {Integer} Pid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-gettracedataprovidersbyprocess
     */
    GetTraceDataProvidersByProcess(Server, Pid) {
        Server := Server is String ? BSTR.Alloc(Server).Value : Server

        result := ComCall(16, this, "ptr", Server, "uint", Pid, "HRESULT")
        return result
    }
}
