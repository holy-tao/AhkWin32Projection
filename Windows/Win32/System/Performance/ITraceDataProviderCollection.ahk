#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ITraceDataProvider.ahk" { ITraceDataProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Manages a collection of TraceDataProvider objects.To get this interface, access the ITraceDataCollector::TraceDataProviders property.You can also call the CoCreateInstance function to create a new instance of the TraceDataProviderCollection object.
 * @remarks
 * To create the object from a script, use the Pla.TraceDataProviderCollection program identifier.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-itracedataprovidercollection
 * @namespace Windows.Win32.System.Performance
 */
export default struct ITraceDataProviderCollection extends IDispatch {
    /**
     * The interface identifier for ITraceDataProviderCollection
     * @type {Guid}
     */
    static IID := Guid("{03837510-098b-11d8-9414-505054503030}")

    /**
     * The class identifier for TraceDataProviderCollection
     * @type {Guid}
     */
    static CLSID := Guid("{03837511-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITraceDataProviderCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count                      : IntPtr
        get_Item                       : IntPtr
        get__NewEnum                   : IntPtr
        Add                            : IntPtr
        Remove                         : IntPtr
        Clear                          : IntPtr
        AddRange                       : IntPtr
        CreateTraceDataProvider        : IntPtr
        GetTraceDataProviders          : IntPtr
        GetTraceDataProvidersByProcess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITraceDataProviderCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested trace provider from the collection.
     * @remarks
     * This property is the object's default property.
     * @param {VARIANT} index 
     * @returns {ITraceDataProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, VARIANT, index, "ptr*", &ppProvider := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * Adds a trace provider to the collection.
     * @param {ITraceDataProvider} pProvider An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovider">ITraceDataProvider</a> interface of the trace provider to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-add
     */
    Add(pProvider) {
        result := ComCall(10, this, "ptr", pProvider, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-remove
     */
    Remove(vProvider) {
        result := ComCall(11, this, VARIANT, vProvider, "HRESULT")
        return result
    }

    /**
     * Removes all trace providers from the collection.
     * @remarks
     * Note that by removing the providers from the collection, you are also removing the providers from the trace data collector.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more trace providers to the collection.
     * @param {ITraceDataProviderCollection} providers An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovidercollection">ITraceDataProviderCollection</a> interface to a collection of one or more trace providers to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-addrange
     */
    AddRange(providers) {
        result := ComCall(13, this, "ptr", providers, "HRESULT")
        return result
    }

    /**
     * Creates a trace data provider object.
     * @returns {ITraceDataProvider} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedataprovider">ITraceDataProvider</a> interface that you use to specify a trace provider to enable in the trace session.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-createtracedataprovider
     */
    CreateTraceDataProvider() {
        result := ComCall(14, this, "ptr*", &Provider := 0, "HRESULT")
        return ITraceDataProvider(Provider)
    }

    /**
     * Populates the collection with registered trace providers.
     * @param {BSTR} server The computer whose registered trace providers you want to enumerate. You can specify a computer name, a fully qualified domain name, or an IP address (IPv4 or IPv6 format). If <b>NULL</b>, PLA enumerates the providers on the local computer.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-gettracedataproviders
     */
    GetTraceDataProviders(server) {
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(15, this, BSTR, server, "HRESULT")
        return result
    }

    /**
     * Populates the collection with the list of providers that have been registered by the specified process.
     * @param {BSTR} Server The computer whose registered trace providers you want to enumerate. You can specify a computer name, a fully qualified domain name, or an IP address (IPv4 or IPv6 format). If <b>NULL</b>, PLA enumerates the providers on the local computer.
     * @param {Integer} Pid The process identifier of the process that registered the providers.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedataprovidercollection-gettracedataprovidersbyprocess
     */
    GetTraceDataProvidersByProcess(Server, Pid) {
        Server := Server is String ? BSTR.Alloc(Server).Value : Server

        result := ComCall(16, this, BSTR, Server, "uint", Pid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITraceDataProviderCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.AddRange := CallbackCreate(GetMethod(implObj, "AddRange"), flags, 2)
        this.vtbl.CreateTraceDataProvider := CallbackCreate(GetMethod(implObj, "CreateTraceDataProvider"), flags, 2)
        this.vtbl.GetTraceDataProviders := CallbackCreate(GetMethod(implObj, "GetTraceDataProviders"), flags, 2)
        this.vtbl.GetTraceDataProvidersByProcess := CallbackCreate(GetMethod(implObj, "GetTraceDataProvidersByProcess"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.AddRange)
        CallbackFree(this.vtbl.CreateTraceDataProvider)
        CallbackFree(this.vtbl.GetTraceDataProviders)
        CallbackFree(this.vtbl.GetTraceDataProvidersByProcess)
    }
}
