#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Storage\IndexServer\IFilter.ahk" { IFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for a protocol handler's IUrlAccessor object to query the Filter Daemon for the appropriate filter for the URL item.
 * @remarks
 * When a protocol handler encounters items with embedded documents, the protocol handler requests additional filters from the Filter Daemon by calling the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-iprotocolhandlersite-getfilter">IProtocolHandlerSite::GetFilter</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-iprotocolhandlersite
 * @namespace Windows.Win32.System.Search
 */
export default struct IProtocolHandlerSite extends IUnknown {
    /**
     * The interface identifier for IProtocolHandlerSite
     * @type {Guid}
     */
    static IID := Guid("{0b63e385-9ccc-11d0-bcdb-00805fccce04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProtocolHandlerSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProtocolHandlerSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the appropriate IFilteraccording to the supplied parameters.
     * @remarks
     * This method queries the Filter Host to identify the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> object to use for the URL item.
     * 
     * The choice of filter is based on the file name extension, a CLSID that identifies the file's content type in the registry, or on the MIME content type. You need to provide only one of the three parameters to this method. If you provide multiple parameters, they are tested in the following order: <i>pcwszContentType</i>, <i>pclsidObj</i>, <i>pcwszExtension</i>. The first valid parameter is used to select the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a>; the others are ignored.
     * @param {Pointer<Guid>} pclsidObj Type: <b>CLSID*</b>
     * 
     * Pointer to the CLSID of the document type from the registry. This is used for items with embedded documents to indicate the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> to use for that embedded document.
     * @param {PWSTR} pcwszContentType Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that contains the type of the document. This is used to retrieve <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a><b>s</b> that are mapped according to MIME type.
     * @param {PWSTR} pcwszExtension Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that contains the file name extension, without the preceding period. This is used to retrieve <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> objects that are mapped according to the file name extension.
     * @returns {IFilter} Type: <b>IFilter**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> that the protocol handler uses.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iprotocolhandlersite-getfilter
     */
    GetFilter(pclsidObj, pcwszContentType, pcwszExtension) {
        pcwszContentType := pcwszContentType is String ? StrPtr(pcwszContentType) : pcwszContentType
        pcwszExtension := pcwszExtension is String ? StrPtr(pcwszExtension) : pcwszExtension

        result := ComCall(3, this, Guid.Ptr, pclsidObj, "ptr", pcwszContentType, "ptr", pcwszExtension, "ptr*", &ppFilter := 0, "HRESULT")
        return IFilter(ppFilter)
    }

    Query(iid) {
        if (IProtocolHandlerSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFilter := CallbackCreate(GetMethod(implObj, "GetFilter"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFilter)
    }
}
