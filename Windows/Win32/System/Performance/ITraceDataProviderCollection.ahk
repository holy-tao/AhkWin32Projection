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
 * To create the object from a script, use the Pla.TraceDataProviderCollection program identifier.
 * @see https://learn.microsoft.com/windows/win32/api//content/pla/nn-pla-itracedataprovidercollection
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the number of trace providers in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retVal
    }

    /**
     * Retrieves the requested trace provider from the collection.
     * @remarks
     * This property is the object's default property.
     * @param {VARIANT} index 
     * @returns {ITraceDataProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &ppProvider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITraceDataProvider(ppProvider)
    }

    /**
     * Retrieves an interface to the enumeration. (ITraceDataProviderCollection.get__NewEnum)
     * @remarks
     * C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedatacollector">ITraceDataCollector</a> interface, use the <b>punkVal</b> member of the variant.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(retVal)
    }

    /**
     * Adds a trace provider to the collection.
     * @param {ITraceDataProvider} pProvider An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovider">ITraceDataProvider</a> interface of the trace provider to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-add
     */
    Add(pProvider) {
        result := ComCall(10, this, "ptr", pProvider, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a trace provider from the collection.
     * @remarks
     * If the variant type is VT_DISPATCH, pass the <b>IDispatch</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovider">ITraceDataProvider</a> interface to be removed.
     * 
     * Note that by removing the trace provider from the collection, you are also removing the provider from the trace data collector.
     * @param {VARIANT} vProvider The zero-based index of the trace provider to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-remove
     */
    Remove(vProvider) {
        result := ComCall(11, this, "ptr", vProvider, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all trace providers from the collection.
     * @remarks
     * Note that by removing the providers from the collection, you are also removing the providers from the trace data collector.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-clear
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds one or more trace providers to the collection.
     * @param {ITraceDataProviderCollection} providers An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovidercollection">ITraceDataProviderCollection</a> interface to a collection of one or more trace providers to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-addrange
     */
    AddRange(providers) {
        result := ComCall(13, this, "ptr", providers, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a trace data provider object.
     * @returns {ITraceDataProvider} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovider">ITraceDataProvider</a> interface that you use to specify a trace provider to enable in the trace session.
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-createtracedataprovider
     */
    CreateTraceDataProvider() {
        result := ComCall(14, this, "ptr*", &Provider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITraceDataProvider(Provider)
    }

    /**
     * Populates the collection with registered trace providers.
     * @param {BSTR} server The computer whose registered trace providers you want to enumerate. You can specify a computer name, a fully qualified domain name, or an IP address (IPv4 or IPv6 format). If <b>NULL</b>, PLA enumerates the providers on the local computer.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-gettracedataproviders
     */
    GetTraceDataProviders(server) {
        if(server is String) {
            pin := BSTR.Alloc(server)
            server := pin.Value
        }

        result := ComCall(15, this, "ptr", server, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Populates the collection with the list of providers that have been registered by the specified process.
     * @param {BSTR} Server The computer whose registered trace providers you want to enumerate. You can specify a computer name, a fully qualified domain name, or an IP address (IPv4 or IPv6 format). If <b>NULL</b>, PLA enumerates the providers on the local computer.
     * @param {Integer} Pid The process identifier of the process that registered the providers.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-itracedataprovidercollection-gettracedataprovidersbyprocess
     */
    GetTraceDataProvidersByProcess(Server, Pid) {
        if(Server is String) {
            pin := BSTR.Alloc(Server)
            Server := pin.Value
        }

        result := ComCall(16, this, "ptr", Server, "uint", Pid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
