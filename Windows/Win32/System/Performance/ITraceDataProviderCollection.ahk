#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_Count(retVal) {
        result := ComCall(7, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<ITraceDataProvider>} ppProvider 
     * @returns {HRESULT} 
     */
    get_Item(index, ppProvider) {
        result := ComCall(8, this, "ptr", index, "ptr", ppProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(retVal) {
        result := ComCall(9, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceDataProvider>} pProvider 
     * @returns {HRESULT} 
     */
    Add(pProvider) {
        result := ComCall(10, this, "ptr", pProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vProvider 
     * @returns {HRESULT} 
     */
    Remove(vProvider) {
        result := ComCall(11, this, "ptr", vProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceDataProviderCollection>} providers 
     * @returns {HRESULT} 
     */
    AddRange(providers) {
        result := ComCall(13, this, "ptr", providers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceDataProvider>} Provider 
     * @returns {HRESULT} 
     */
    CreateTraceDataProvider(Provider) {
        result := ComCall(14, this, "ptr", Provider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} server 
     * @returns {HRESULT} 
     */
    GetTraceDataProviders(server) {
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(15, this, "ptr", server, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Server 
     * @param {Integer} Pid 
     * @returns {HRESULT} 
     */
    GetTraceDataProvidersByProcess(Server, Pid) {
        Server := Server is String ? BSTR.Alloc(Server).Value : Server

        result := ComCall(16, this, "ptr", Server, "uint", Pid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
