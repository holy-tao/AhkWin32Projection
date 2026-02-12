#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\Com\IStream.ahk
#Include ..\..\Storage\IndexServer\IFilter.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for processing an individual item in a content source whose URL is provided by the gatherer to the filter host.
 * @remarks
 * This is the main interface for pulling data from the content source. The Get... methods are for properties that are required by or useful to the filter host. Not all data sources have these properties. If the property returned by one of these methods is not meaningful for your data source, your protocol handler should return E_NOTIMPL.
 * 
 * The Bind... methods provide access to the data.
 * 
 * Although the protocol handler runs in the protocol host's multithreaded environment, each protocol handler runs in its own thread, employing one <b>IUrlAccessor</b> object at a time.
 * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nn-searchapi-iurlaccessor
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
     * Requests a property-value set.
     * @remarks
     * Implement this method to obtain additional information from the content source (for instance, the If-Modified-Since header in an HTTP request).
     * @param {Pointer<PROPSPEC>} pSpec Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structure containing the requested property.
     * @param {Pointer<PROPVARIANT>} pVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure containing the value for the property specified by <i>pSpec</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-addrequestparameter
     */
    AddRequestParameter(pSpec, pVar) {
        result := ComCall(3, this, "ptr", pSpec, "ptr", pVar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the document format, represented as a Multipurpose Internet Mail Extensions (MIME) string.
     * @remarks
     * The <i>wszDocFormat</i> is used to identify the correct <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> for the stream returned by <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-bindtostream">IUrlAccessor::BindToStream</a>. Implement this method when the URL item is supposed to have a different association than is indicated by the file name extension or content type. For example, if .doc items are not associated with Microsoft Word, this method should return the <a href="https://docs.microsoft.com/windows/desktop/com/clsid-key-hklm">CLSID Key</a> key of the appropriate document source.
     * 
     * If you do not provide an implementation of this method or the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-getclsid">IUrlAccessor::GetCLSID</a> method, the filter host uses the out parameters from <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-getfilename">IUrlAccessor::GetFileName</a> to determine the Multipurpose Internet Mail Extensions (MIME) content type.
     * @param {PWSTR} wszDocFormat Type: <b>WCHAR[]</b>
     * 
     * Receives a pointer to a null-terminated Unicode string containing the MIME type for the current item.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size of <i>wszDocFormat</i> in <b>TCHAR</b><b>s</b>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of <b>TCHAR</b><b>s</b> written to <i>wszDocFormat</i>, not including the terminating <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getdocformat
     */
    GetDocFormat(wszDocFormat, dwSize) {
        wszDocFormat := wszDocFormat is String ? StrPtr(wszDocFormat) : wszDocFormat

        result := ComCall(4, this, "ptr", wszDocFormat, "uint", dwSize, "uint*", &pdwLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwLength
    }

    /**
     * Gets the CLSID for the document type of the URL item being processed.
     * @remarks
     * If this information is not available, you can return E_NOTIMPL or E_FAIL.
     * @returns {Guid} Type: <b>CLSID*</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/com/clsid">CLSID</a> for the document type of the URL item being processed.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getclsid
     */
    GetCLSID() {
        pClsid := Guid()
        result := ComCall(5, this, "ptr", pClsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pClsid
    }

    /**
     * Gets the host name for the content source, if applicable.
     * @param {PWSTR} wszHost Type: <b>WCHAR[]</b>
     * 
     * Receives the name of the host that the content source file resides on, as a null-terminated Unicode string.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size in <b>TCHAR</b><b>s</b> of <i>wszHost</i>, not including the terminating <b>NULL</b>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of <b>TCHAR</b><b>s</b> written to <i>wszHost</i>, not including the terminating <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-gethost
     */
    GetHost(wszHost, dwSize) {
        wszHost := wszHost is String ? StrPtr(wszHost) : wszHost

        result := ComCall(6, this, "ptr", wszHost, "uint", dwSize, "uint*", &pdwLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwLength
    }

    /**
     * Ascertains whether the item URL points to a directory.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the URL is a directory, otherwise S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-isdirectory
     */
    IsDirectory() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the size of the content designated by the URL.
     * @remarks
     * The value calculated in this method is a factor in determining limitations on <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> output size. This method should return 0 for containers if the protocol implementation is for a hierarchical content source.
     *             
     * 
     * Implement this method for non-files by returning the size of the document to be indexed. For example, to index a database where each row is a document, return the best estimate of the size of the row.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * Receives a pointer to the 
     *      number of bytes of data contained in the URL.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getsize
     */
    GetSize() {
        result := ComCall(8, this, "uint*", &pllSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pllSize
    }

    /**
     * Gets the time stamp identifying when the URL was last modified.
     * @remarks
     * This method is used to determine whether a URL has changed since the last time it was indexed. If the last modified time has not changed, the indexer does not process the URL's content.  
     *             
     * 
     * Directory URLs are always processed regardless of the time stamp returned by this method.
     * @returns {FILETIME} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>*</b>
     * 
     * Receives a pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> identifying the time stamp when the URL was last modified.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getlastmodified
     */
    GetLastModified() {
        pftLastModified := FILETIME()
        result := ComCall(9, this, "ptr", pftLastModified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pftLastModified
    }

    /**
     * Retrieves the file name of the item, which the filter host uses for indexing. If the item does not exist in a file system and the IUrlAccessor::BindToStream method is implemented, this method returns the shell's System.ParsingPath property for the item.
     * @remarks
     * If this method is implemented, the filter host uses the file name to determine the correct <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> to use to parse the content of the stream returned by <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-bindtostream">IUrlAccessor::BindToStream</a>.
     * @param {PWSTR} wszFileName Type: <b>WCHAR[]</b>
     * 
     * Receives the file name as a null-terminated Unicode string.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size in 
     *                 <b>TCHAR</b><b>s</b> of
     *                 <i>wszFileName</i>, not including the terminating <b>NULL</b>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of 
     *            <b>TCHAR</b><b>s</b> written to <b>wszFileName</b>, not including
     *                 <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getfilename
     */
    GetFileName(wszFileName, dwSize) {
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName

        result := ComCall(10, this, "ptr", wszFileName, "uint", dwSize, "uint*", &pdwLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwLength
    }

    /**
     * Gets the security descriptor for the URL item. Security is applied at query time, so this descriptor identifies security for read access.
     * @remarks
     * This method allows custom mappings between users registered to a content source and those users registered on the domain, if they are different. Security descriptors created in this method must be self-relative.
     *             
     * 
     * If the URL contains a user security identifier (SID), then the protocol handler is invoked in the security context of that user, and this method must return E_NOTIMPL. 
     *             
     * 
     * If the URL does not contain a user SID, then the protocol handler is invoked in the security context of the system service. In that case, this method can return either an access control list (ACL) to restrict read access, or <a href="https://docs.microsoft.com/windows/desktop/search/-search-prth-error-constants">PRTH_S_ACL_IS_READ_EVERYONE</a> to allow anyone read access during querying.
     *             
     * 
     * <div class="alert"><b>Note</b>  If this method returns E_NOTIMPL and the URL does NOT contain a user SID, then the item is retrievable by all user queries.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pSD Type: <b>BYTE*</b>
     * 
     * Receives a pointer to the security descriptor.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size in <b>TCHAR</b><b>s</b> of the <i>pSD</i> array.
     * @param {Pointer<Integer>} pdwLength Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of <b>TCHAR</b><b>s</b> written to <i>pSD</i>, not including the terminating <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getsecuritydescriptor
     */
    GetSecurityDescriptor(pSD, dwSize, pdwLength) {
        pSDMarshal := pSD is VarRef ? "char*" : "ptr"
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pSDMarshal, pSD, "uint", dwSize, pdwLengthMarshal, pdwLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the redirected URL for the current item.
     * @remarks
     * File URLs are not redirected. This method applies only to a content source of HTTP.
     *             
     * 
     * If this method is implemented, the URL that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchprotocol-createaccessor">ISearchProtocol::CreateAccessor</a> will be redirected to the value returned by this method. All subsequent relative URL links will be processed based on the redirected URL.
     * @param {PWSTR} wszRedirectedURL Type: <b>WCHAR[]</b>
     * 
     * Receives the redirected URL as a Unicode string, not including the terminating <b>NULL</b>.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Size in <b>TCHAR</b><b>s</b> of <i>wszRedirectedURL</i>, not including the terminating <b>NULL</b>.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of
     *                 <b>TCHAR</b><b>s</b> 
     *                 written to <i>wszRedirectedURL</i>,
     *                 not including the terminating <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getredirectedurl
     */
    GetRedirectedURL(wszRedirectedURL, dwSize) {
        wszRedirectedURL := wszRedirectedURL is String ? StrPtr(wszRedirectedURL) : wszRedirectedURL

        result := ComCall(12, this, "ptr", wszRedirectedURL, "uint", dwSize, "uint*", &pdwLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwLength
    }

    /**
     * Gets the security provider for the URL.
     * @returns {Guid} Type: <b>CLSID*</b>
     * 
     * Receives a pointer to a security provider's CLSID.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-getsecurityprovider
     */
    GetSecurityProvider() {
        pSPClsid := Guid()
        result := ComCall(13, this, "ptr", pSPClsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSPClsid
    }

    /**
     * Binds the item being processed to an IStream interface [Structured Storage] data stream and retrieves a pointer to that stream.
     * @remarks
     * Using the information returned by the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-getfilename">IUrlAccessor::GetFileName</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-getclsid">IUrlAccessor::GetCLSID</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-getdocformat">IUrlAccessor::GetDocFormat</a> methods, the appropriate content <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> object is created and passed to this stream by the IPersistStream interface.
     * @returns {IStream} Type: <b>IStream**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that contains the item represented by the URL.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-bindtostream
     */
    BindToStream() {
        result := ComCall(14, this, "ptr*", &ppStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppStream)
    }

    /**
     * Binds the item being processed to the appropriate IFilterand retrieves a pointer to the IFilter.
     * @remarks
     * This method retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> to enumerate the properties of the item associated with the specified URL, based on the protocol's information about that URL.
     *             
     * 
     * If the URL's content is also accessible from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> returned by <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iurlaccessor-bindtostream">IUrlAccessor::BindToStream</a>, then a separate <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> is invoked on the IStream to retrieve additional properties.
     * @returns {IFilter} Type: <b>IFilter**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> that can return metadata about the item being processed.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-iurlaccessor-bindtofilter
     */
    BindToFilter() {
        result := ComCall(15, this, "ptr*", &ppFilter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFilter(ppFilter)
    }
}
