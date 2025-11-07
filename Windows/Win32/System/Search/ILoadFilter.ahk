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
     * Retrieves IFilter from path name for object.
     * @param {PWSTR} pwcsPath A pointer to the full path of an object for which an <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer is to be returned. The path can include a full filename or only the file name extension; for example, ".ext".
     * @param {Pointer<FILTERED_DATA_SOURCES>} pFilteredSources 
     * @param {IUnknown} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate in which this storage object exists.
     * @param {BOOL} fUseDefault 
     * @param {Pointer<Guid>} pFilterClsid 
     * @param {Pointer<Integer>} SearchDecSize 
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc 
     * @param {Pointer<IFilter>} ppIFilt 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was denied access to the filter file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function encountered an invalid handle, probably due to a low-memory situation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function did not have sufficient memory or other resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntquery/nf-ntquery-loadifilter
     */
    LoadIFilter(pwcsPath, pFilteredSources, pUnkOuter, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        pwcsPath := pwcsPath is String ? StrPtr(pwcsPath) : pwcsPath

        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pwcsPath, "ptr", pFilteredSources, "ptr", pUnkOuter, "int", fUseDefault, "ptr", pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, "ptr*", ppIFilt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStorage} pStg 
     * @param {IUnknown} pUnkOuter 
     * @param {PWSTR} pwcsOverride 
     * @param {BOOL} fUseDefault 
     * @param {Pointer<Guid>} pFilterClsid 
     * @param {Pointer<Integer>} SearchDecSize 
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc 
     * @param {Pointer<IFilter>} ppIFilt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/filtereg/nf-filtereg-iloadfilter-loadifilterfromstorage
     */
    LoadIFilterFromStorage(pStg, pUnkOuter, pwcsOverride, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        pwcsOverride := pwcsOverride is String ? StrPtr(pwcsOverride) : pwcsOverride

        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pStg, "ptr", pUnkOuter, "ptr", pwcsOverride, "int", fUseDefault, "ptr", pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, "ptr*", ppIFilt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStm 
     * @param {Pointer<FILTERED_DATA_SOURCES>} pFilteredSources 
     * @param {IUnknown} pUnkOuter 
     * @param {BOOL} fUseDefault 
     * @param {Pointer<Guid>} pFilterClsid 
     * @param {Pointer<Integer>} SearchDecSize 
     * @param {Pointer<Pointer<Integer>>} pwcsSearchDesc 
     * @param {Pointer<IFilter>} ppIFilt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/filtereg/nf-filtereg-iloadfilter-loadifilterfromstream
     */
    LoadIFilterFromStream(pStm, pFilteredSources, pUnkOuter, fUseDefault, pFilterClsid, SearchDecSize, pwcsSearchDesc, ppIFilt) {
        SearchDecSizeMarshal := SearchDecSize is VarRef ? "int*" : "ptr"
        pwcsSearchDescMarshal := pwcsSearchDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pStm, "ptr", pFilteredSources, "ptr", pUnkOuter, "int", fUseDefault, "ptr", pFilterClsid, SearchDecSizeMarshal, SearchDecSize, pwcsSearchDescMarshal, pwcsSearchDesc, "ptr*", ppIFilt, "HRESULT")
        return result
    }
}
