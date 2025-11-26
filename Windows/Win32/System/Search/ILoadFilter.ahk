#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines methods and properties that are implemented by the FilterRegistration object, which provides methods for loading a filter.
 * @remarks
 * 
 * A filter, also known as a filter handler, is an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//filtereg/nn-filtereg-iloadfilter
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ILoadFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoadFilter
     * @type {Guid}
     */
    static IID => Guid("{c7310722-ac80-11d1-8df3-00c04fb6ef4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadIFilter", "LoadIFilterFromStorage", "LoadIFilterFromStream"]

    /**
     * Retrieves and loads the most appropriate filter that is mapped to a Shell data source.
     * @param {PWSTR} pwcsPath Pointer to a comma-delimited null-terminated Unicode string buffer that specifies the path of the file to be filtered. This parameter can be null.
     * @param {Pointer<FILTERED_DATA_SOURCES>} pFilteredSources Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/filtereg/ns-filtereg-filtered_data_sources">FILTERED_DATA_SOURCES</a> structure that specifies parameters for a Shell data source for which a filter is loaded. This parameter cannot be null.
     * @param {IUnknown} pUnkOuter If the object is being created as part of an aggregate, specify a pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate.
     * @param {BOOL} fUseDefault If <b>TRUE</b>, use the default filter; if <b>FALSE</b>, proceed with the most appropriate filter that is available.
     * @param {Pointer<Guid>} pFilterClsid Pointer to the CLSID (CLSID_FilterRegistration) that receives the class identifier of the returned filter.
     * @param {Pointer<Integer>} SearchDecSize Not implemented.
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc Not implemented.
     * @param {Pointer<IFilter>} ppIFilt The address of a pointer to an implementation of an <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface that <b>LoadIFilter</b> selects.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//filtereg/nf-filtereg-iloadfilter-loadifilter
     */
    LoadIFilter(pwcsPath, pFilteredSources, pUnkOuter, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        pwcsPath := pwcsPath is String ? StrPtr(pwcsPath) : pwcsPath

        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pwcsPath, "ptr", pFilteredSources, "ptr", pUnkOuter, "int", fUseDefault, "ptr", pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, "ptr*", ppIFilt, "HRESULT")
        return result
    }

    /**
     * Do not use:\_this method is not implemented.
     * @param {IStorage} pStg 
     * @param {IUnknown} pUnkOuter 
     * @param {PWSTR} pwcsOverride 
     * @param {BOOL} fUseDefault 
     * @param {Pointer<Guid>} pFilterClsid 
     * @param {Pointer<Integer>} SearchDecSize 
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc 
     * @param {Pointer<IFilter>} ppIFilt 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//filtereg/nf-filtereg-iloadfilter-loadifilterfromstorage
     */
    LoadIFilterFromStorage(pStg, pUnkOuter, pwcsOverride, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        pwcsOverride := pwcsOverride is String ? StrPtr(pwcsOverride) : pwcsOverride

        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pStg, "ptr", pUnkOuter, "ptr", pwcsOverride, "int", fUseDefault, "ptr", pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, "ptr*", ppIFilt, "HRESULT")
        return result
    }

    /**
     * Do not use:\_this method is not implemented.
     * @param {IStream} pStm 
     * @param {Pointer<FILTERED_DATA_SOURCES>} pFilteredSources 
     * @param {IUnknown} pUnkOuter 
     * @param {BOOL} fUseDefault 
     * @param {Pointer<Guid>} pFilterClsid 
     * @param {Pointer<Integer>} SearchDecSize 
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc 
     * @param {Pointer<IFilter>} ppIFilt 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//filtereg/nf-filtereg-iloadfilter-loadifilterfromstream
     */
    LoadIFilterFromStream(pStm, pFilteredSources, pUnkOuter, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pStm, "ptr", pFilteredSources, "ptr", pUnkOuter, "int", fUseDefault, "ptr", pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, "ptr*", ppIFilt, "HRESULT")
        return result
    }
}
