#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.IndexServer
 */

;@region Functions
/**
 * Retrieves IFilter from path name for object.
 * @param {PWSTR} pwcsPath A pointer to the full path of an object for which an <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer is to be returned. The path can include a full filename or only the file name extension; for example, ".ext".
 * @param {IUnknown} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate in which this storage object exists.
 * @returns {Pointer<Void>} A pointer to a variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/ntquery/nf-ntquery-loadifilter
 * @since windows5.0
 */
export LoadIFilter(pwcsPath, pUnkOuter) {
    pwcsPath := pwcsPath is String ? StrPtr(pwcsPath) : pwcsPath

    result := DllCall("query.dll\LoadIFilter", "ptr", pwcsPath, "ptr", pUnkOuter, "ptr*", &ppIUnk := 0, "HRESULT")
    return ppIUnk
}

/**
 * 
 * @param {PWSTR} pwcsPath 
 * @param {Integer} dwFlags 
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} 
 */
export LoadIFilterEx(pwcsPath, dwFlags, riid) {
    pwcsPath := pwcsPath is String ? StrPtr(pwcsPath) : pwcsPath

    result := DllCall("query.dll\LoadIFilterEx", "ptr", pwcsPath, "uint", dwFlags, Guid.Ptr, riid, "ptr*", &ppIUnk := 0, "HRESULT")
    return ppIUnk
}

/**
 * Retrieves the IFilter interface pointer for the specified storage object. This is especially useful when filtering the contents of a document and processing embedded OLE objects that are accessible through their IStorage interfaces.
 * @remarks
 * This function is not a full implementation of a COM persistent handler.
 * @param {IStorage} pStg A pointer to the <b>IStorage</b> interface to be used to access the file.
 * @param {IUnknown} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate in which this storage object exists.
 * @returns {Pointer<Void>} A pointer to an output variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/ntquery/nf-ntquery-bindifilterfromstorage
 * @since windows5.0
 */
export BindIFilterFromStorage(pStg, pUnkOuter) {
    result := DllCall("query.dll\BindIFilterFromStorage", "ptr", pStg, "ptr", pUnkOuter, "ptr*", &ppIUnk := 0, "HRESULT")
    return ppIUnk
}

/**
 * Retrieves the IFilter interface pointer for the specified storage object. This is especially useful when filtering the contents of a document and processing embedded OLE objects accessible through their IStream interfaces.
 * @remarks
 * This function is not a full implementation of a COM persistent handler.
 * @param {IStream} pStm A pointer to the <b>IStream</b> interface to be used to access the file.
 * @param {IUnknown} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate in which this stream object exists.
 * @returns {Pointer<Void>} A pointer to an output variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer.
 * @see https://learn.microsoft.com/windows/win32/api/ntquery/nf-ntquery-bindifilterfromstream
 * @since windows5.0
 */
export BindIFilterFromStream(pStm, pUnkOuter) {
    result := DllCall("query.dll\BindIFilterFromStream", "ptr", pStm, "ptr", pUnkOuter, "ptr*", &ppIUnk := 0, "HRESULT")
    return ppIUnk
}

;@endregion Functions
