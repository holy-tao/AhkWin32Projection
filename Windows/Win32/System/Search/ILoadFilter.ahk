#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Storage\IndexServer\IFilter.ahk" { IFilter }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\FILTERED_DATA_SOURCES.ahk" { FILTERED_DATA_SOURCES }

/**
 * Defines methods and properties that are implemented by the FilterRegistration object, which provides methods for loading a filter.
 * @remarks
 * A filter, also known as a filter handler, is an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/filtereg/nn-filtereg-iloadfilter
 * @namespace Windows.Win32.System.Search
 */
export default struct ILoadFilter extends IUnknown {
    /**
     * The interface identifier for ILoadFilter
     * @type {Guid}
     */
    static IID := Guid("{c7310722-ac80-11d1-8df3-00c04fb6ef4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILoadFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadIFilter            : IntPtr
        LoadIFilterFromStorage : IntPtr
        LoadIFilterFromStream  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILoadFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves and loads the most appropriate filter that is mapped to a Shell data source.
     * @remarks
     * A filter, also known as a filter handler, is an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface.
     * 
     * <b>ILoadFilter</b> attempts to load a filter that can process a Shell data source of the type specified in the <i>pFilteredSources</i> parameter through the <i>pwcsPath</i> parameter.If an appropriate filter for the data source is not found, and <i>fUseDefault</i> is <b>false</b>, this method returns null in the <i>ppIFilt</i> parameter. If an appropriate filter for the data source is not found, and <i>fUseDefault</i> is <b>true</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface on the default <b>IFilter</b> is returned in the <i>ppIFilt</i> parameter.
     * @param {PWSTR} pwcsPath Pointer to a comma-delimited null-terminated Unicode string buffer that specifies the path of the file to be filtered. This parameter can be null.
     * @param {Pointer<FILTERED_DATA_SOURCES>} pFilteredSources Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/filtereg/ns-filtereg-filtered_data_sources">FILTERED_DATA_SOURCES</a> structure that specifies parameters for a Shell data source for which a filter is loaded. This parameter cannot be null.
     * @param {IUnknown} pUnkOuter If the object is being created as part of an aggregate, specify a pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate.
     * @param {BOOL} fUseDefault If <b>TRUE</b>, use the default filter; if <b>FALSE</b>, proceed with the most appropriate filter that is available.
     * @param {Pointer<Guid>} pFilterClsid Pointer to the CLSID (CLSID_FilterRegistration) that receives the class identifier of the returned filter.
     * @param {Pointer<Integer>} SearchDecSize Not implemented.
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc Not implemented.
     * @param {Pointer<IFilter>} ppIFilt The address of a pointer to an implementation of an <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface that <b>LoadIFilter</b> selects.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/filtereg/nf-filtereg-iloadfilter-loadifilter
     */
    LoadIFilter(pwcsPath, pFilteredSources, pUnkOuter, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        pwcsPath := pwcsPath is String ? StrPtr(pwcsPath) : pwcsPath

        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pwcsPath, FILTERED_DATA_SOURCES.Ptr, pFilteredSources, "ptr", pUnkOuter, BOOL, fUseDefault, Guid.Ptr, pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, IFilter.Ptr, ppIFilt, "HRESULT")
        return result
    }

    /**
     * Do not use:\_this method is not implemented. (ILoadFilter.LoadIFilterFromStorage)
     * @param {IStorage} pStg 
     * @param {IUnknown} pUnkOuter 
     * @param {PWSTR} pwcsOverride 
     * @param {BOOL} fUseDefault 
     * @param {Pointer<Guid>} pFilterClsid 
     * @param {Pointer<Integer>} SearchDecSize 
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc 
     * @param {Pointer<IFilter>} ppIFilt 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/filtereg/nf-filtereg-iloadfilter-loadifilterfromstorage
     */
    LoadIFilterFromStorage(pStg, pUnkOuter, pwcsOverride, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        pwcsOverride := pwcsOverride is String ? StrPtr(pwcsOverride) : pwcsOverride

        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pStg, "ptr", pUnkOuter, "ptr", pwcsOverride, BOOL, fUseDefault, Guid.Ptr, pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, IFilter.Ptr, ppIFilt, "HRESULT")
        return result
    }

    /**
     * Do not use:\_this method is not implemented. (ILoadFilter.LoadIFilterFromStream)
     * @param {IStream} pStm 
     * @param {Pointer<FILTERED_DATA_SOURCES>} pFilteredSources 
     * @param {IUnknown} pUnkOuter 
     * @param {BOOL} fUseDefault 
     * @param {Pointer<Guid>} pFilterClsid 
     * @param {Pointer<Integer>} SearchDecSize 
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc 
     * @param {Pointer<IFilter>} ppIFilt 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/filtereg/nf-filtereg-iloadfilter-loadifilterfromstream
     */
    LoadIFilterFromStream(pStm, pFilteredSources, pUnkOuter, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pStm, FILTERED_DATA_SOURCES.Ptr, pFilteredSources, "ptr", pUnkOuter, BOOL, fUseDefault, Guid.Ptr, pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, IFilter.Ptr, ppIFilt, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILoadFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadIFilter := CallbackCreate(GetMethod(implObj, "LoadIFilter"), flags, 9)
        this.vtbl.LoadIFilterFromStorage := CallbackCreate(GetMethod(implObj, "LoadIFilterFromStorage"), flags, 9)
        this.vtbl.LoadIFilterFromStream := CallbackCreate(GetMethod(implObj, "LoadIFilterFromStream"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadIFilter)
        CallbackFree(this.vtbl.LoadIFilterFromStorage)
        CallbackFree(this.vtbl.LoadIFilterFromStream)
    }
}
