#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for processing an individual item in a content source whose URL is provided by the gatherer to the filter host.
 * @remarks
 * 
  * This is the main interface for pulling data from the content source. The Get... methods are for properties that are required by or useful to the filter host. Not all data sources have these properties. If the property returned by one of these methods is not meaningful for your data source, your protocol handler should return E_NOTIMPL.
  * 
  * The Bind... methods provide access to the data.
  * 
  * Although the protocol handler runs in the protocol host's multithreaded environment, each protocol handler runs in its own thread, employing one <b>IUrlAccessor</b> object at a time.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-iurlaccessor
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IUrlAccessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUrlAccessor
     * @type {Guid}
     */
    static IID => Guid("{0b63e318-9ccc-11d0-bcdb-00805fccce04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRequestParameter", "GetDocFormat", "GetCLSID", "GetHost", "IsDirectory", "GetSize", "GetLastModified", "GetFileName", "GetSecurityDescriptor", "GetRedirectedURL", "GetSecurityProvider", "BindToStream", "BindToFilter"]

    /**
     * 
     * @param {Pointer<PROPSPEC>} pSpec 
     * @param {Pointer<PROPVARIANT>} pVar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-addrequestparameter
     */
    AddRequestParameter(pSpec, pVar) {
        result := ComCall(3, this, "ptr", pSpec, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszDocFormat 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getdocformat
     */
    GetDocFormat(wszDocFormat, dwSize, pdwLength) {
        wszDocFormat := wszDocFormat is String ? StrPtr(wszDocFormat) : wszDocFormat

        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", wszDocFormat, "uint", dwSize, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getclsid
     */
    GetCLSID(pClsid) {
        result := ComCall(5, this, "ptr", pClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszHost 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-gethost
     */
    GetHost(wszHost, dwSize, pdwLength) {
        wszHost := wszHost is String ? StrPtr(wszHost) : wszHost

        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", wszHost, "uint", dwSize, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-isdirectory
     */
    IsDirectory() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pllSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getsize
     */
    GetSize(pllSize) {
        pllSizeMarshal := pllSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pllSizeMarshal, pllSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftLastModified 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getlastmodified
     */
    GetLastModified(pftLastModified) {
        result := ComCall(9, this, "ptr", pftLastModified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszFileName 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getfilename
     */
    GetFileName(wszFileName, dwSize, pdwLength) {
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName

        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", wszFileName, "uint", dwSize, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSD 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getsecuritydescriptor
     */
    GetSecurityDescriptor(pSD, dwSize, pdwLength) {
        pSDMarshal := pSD is VarRef ? "char*" : "ptr"
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pSDMarshal, pSD, "uint", dwSize, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszRedirectedURL 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getredirectedurl
     */
    GetRedirectedURL(wszRedirectedURL, dwSize, pdwLength) {
        wszRedirectedURL := wszRedirectedURL is String ? StrPtr(wszRedirectedURL) : wszRedirectedURL

        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", wszRedirectedURL, "uint", dwSize, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSPClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-getsecurityprovider
     */
    GetSecurityProvider(pSPClsid) {
        result := ComCall(13, this, "ptr", pSPClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-bindtostream
     */
    BindToStream(ppStream) {
        result := ComCall(14, this, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFilter>} ppFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor-bindtofilter
     */
    BindToFilter(ppFilter) {
        result := ComCall(15, this, "ptr*", ppFilter, "HRESULT")
        return result
    }
}
