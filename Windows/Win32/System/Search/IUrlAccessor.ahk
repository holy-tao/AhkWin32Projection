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
     * 
     * @param {Pointer<PROPSPEC>} pSpec 
     * @param {Pointer<PROPVARIANT>} pVar 
     * @returns {HRESULT} 
     */
    AddRequestParameter(pSpec, pVar) {
        result := ComCall(3, this, "ptr", pSpec, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszDocFormat 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetDocFormat(wszDocFormat, dwSize, pdwLength) {
        wszDocFormat := wszDocFormat is String ? StrPtr(wszDocFormat) : wszDocFormat

        result := ComCall(4, this, "ptr", wszDocFormat, "uint", dwSize, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pClsid 
     * @returns {HRESULT} 
     */
    GetCLSID(pClsid) {
        result := ComCall(5, this, "ptr", pClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszHost 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetHost(wszHost, dwSize, pdwLength) {
        wszHost := wszHost is String ? StrPtr(wszHost) : wszHost

        result := ComCall(6, this, "ptr", wszHost, "uint", dwSize, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDirectory() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pllSize 
     * @returns {HRESULT} 
     */
    GetSize(pllSize) {
        result := ComCall(8, this, "uint*", pllSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftLastModified 
     * @returns {HRESULT} 
     */
    GetLastModified(pftLastModified) {
        result := ComCall(9, this, "ptr", pftLastModified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszFileName 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetFileName(wszFileName, dwSize, pdwLength) {
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName

        result := ComCall(10, this, "ptr", wszFileName, "uint", dwSize, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pSD 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetSecurityDescriptor(pSD, dwSize, pdwLength) {
        result := ComCall(11, this, "char*", pSD, "uint", dwSize, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszRedirectedURL 
     * @param {Integer} dwSize 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetRedirectedURL(wszRedirectedURL, dwSize, pdwLength) {
        wszRedirectedURL := wszRedirectedURL is String ? StrPtr(wszRedirectedURL) : wszRedirectedURL

        result := ComCall(12, this, "ptr", wszRedirectedURL, "uint", dwSize, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSPClsid 
     * @returns {HRESULT} 
     */
    GetSecurityProvider(pSPClsid) {
        result := ComCall(13, this, "ptr", pSPClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    BindToStream(ppStream) {
        result := ComCall(14, this, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFilter>} ppFilter 
     * @returns {HRESULT} 
     */
    BindToFilter(ppFilter) {
        result := ComCall(15, this, "ptr", ppFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
