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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_DisplayName(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    get_Guid(guid) {
        result := ComCall(9, this, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    put_Guid(guid) {
        result := ComCall(10, this, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppLevel 
     * @returns {HRESULT} 
     */
    get_Level(ppLevel) {
        result := ComCall(11, this, "ptr", ppLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppKeywords 
     * @returns {HRESULT} 
     */
    get_KeywordsAny(ppKeywords) {
        result := ComCall(12, this, "ptr", ppKeywords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppKeywords 
     * @returns {HRESULT} 
     */
    get_KeywordsAll(ppKeywords) {
        result := ComCall(13, this, "ptr", ppKeywords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} ppProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppProperties) {
        result := ComCall(14, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} FilterEnabled 
     * @returns {HRESULT} 
     */
    get_FilterEnabled(FilterEnabled) {
        result := ComCall(15, this, "ptr", FilterEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} FilterEnabled 
     * @returns {HRESULT} 
     */
    put_FilterEnabled(FilterEnabled) {
        result := ComCall(16, this, "short", FilterEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulType 
     * @returns {HRESULT} 
     */
    get_FilterType(pulType) {
        result := ComCall(17, this, "uint*", pulType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     */
    put_FilterType(ulType) {
        result := ComCall(18, this, "uint", ulType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} ppData 
     * @returns {HRESULT} 
     */
    get_FilterData(ppData) {
        result := ComCall(19, this, "ptr", ppData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pData 
     * @returns {HRESULT} 
     */
    put_FilterData(pData) {
        result := ComCall(20, this, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrServer 
     * @returns {HRESULT} 
     */
    Query(bstrName, bstrServer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer

        result := ComCall(21, this, "ptr", bstrName, "ptr", bstrServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pFrom 
     * @returns {HRESULT} 
     */
    Resolve(pFrom) {
        result := ComCall(22, this, "ptr", pFrom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Sddl 
     * @returns {HRESULT} 
     */
    SetSecurity(Sddl) {
        Sddl := Sddl is String ? BSTR.Alloc(Sddl).Value : Sddl

        result := ComCall(23, this, "ptr", Sddl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SecurityInfo 
     * @param {Pointer<BSTR>} Sddl 
     * @returns {HRESULT} 
     */
    GetSecurity(SecurityInfo, Sddl) {
        result := ComCall(24, this, "uint", SecurityInfo, "ptr", Sddl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IValueMap>} Processes 
     * @returns {HRESULT} 
     */
    GetRegisteredProcesses(Processes) {
        result := ComCall(25, this, "ptr", Processes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
