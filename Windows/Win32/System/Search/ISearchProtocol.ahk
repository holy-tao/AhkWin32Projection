#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUrlAccessor.ahk" { IUrlAccessor }
#Import ".\PROXY_INFO.ahk" { PROXY_INFO }
#Import ".\ITEM_INFO.ahk" { ITEM_INFO }
#Import ".\TIMEOUT_INFO.ahk" { TIMEOUT_INFO }
#Import ".\IProtocolHandlerSite.ahk" { IProtocolHandlerSite }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUTHENTICATION_INFO.ahk" { AUTHENTICATION_INFO }
#Import ".\INCREMENTAL_ACCESS_INFO.ahk" { INCREMENTAL_ACCESS_INFO }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for invoking, initializing, and managing IUrlAccessor objects. (ISearchProtocol)
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchprotocol
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchProtocol extends IUnknown {
    /**
     * The interface identifier for ISearchProtocol
     * @type {Guid}
     */
    static IID := Guid("{c73106ba-ac80-11d1-8df3-00c04fb6ef4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchProtocol interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init           : IntPtr
        CreateAccessor : IntPtr
        CloseAccessor  : IntPtr
        ShutDown       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchProtocol.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a protocol handler.
     * @remarks
     * After the protocol handler is <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">created</a>, this method is called to perform any initialization specific to the protocol handler. This method is not called again.  
     *       
     * 
     * Because the protocol host may unexpectedly terminate before calling <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchprotocol-shutdown">ISearchProtocol::ShutDown</a>, protocol handlers with persistent information, such as temporary files and registry entries, should do an initial clean-up of resources previously opened in this method before starting the current instance.
     * @param {Pointer<TIMEOUT_INFO>} pTimeoutInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-timeout_info">TIMEOUT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-timeout_info">TIMEOUT_INFO</a> structure that contains information about connection time-outs.
     * @param {IProtocolHandlerSite} pProtocolHandlerSite Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iprotocolhandlersite">IProtocolHandlerSite</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iprotocolhandlersite">IProtocolHandlerSite</a> interface that enables protocol handlers to access <a href="https://docs.microsoft.com/windows-hardware/test/hlk/api/ifilter-interface">IFiltear</a> within the filter host.
     * @param {Pointer<PROXY_INFO>} pProxyInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-proxy_info">PROXY_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-proxy_info">PROXY_INFO</a> structure that contains information about the proxy settings necessary for accessing items in the content source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-init
     */
    Init(pTimeoutInfo, pProtocolHandlerSite, pProxyInfo) {
        result := ComCall(3, this, TIMEOUT_INFO.Ptr, pTimeoutInfo, "ptr", pProtocolHandlerSite, PROXY_INFO.Ptr, pProxyInfo, "HRESULT")
        return result
    }

    /**
     * Creates and initializes an IUrlAccessor object.
     * @remarks
     * The protocol host calls this method on the protocol handler once for every URL processed by the gatherer and retrieves a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object. This method creates and initializes an <b>IUrlAccessor</b> object to process an item currently being accessed by the gatherer.
     * @param {PWSTR} pcwszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the URL of the item being accessed.
     * @param {Pointer<AUTHENTICATION_INFO>} pAuthenticationInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-authentication_info">AUTHENTICATION_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-authentication_info">AUTHENTICATION_INFO</a> structure that contains authentication information necessary for accessing this item in the content source.
     * @param {Pointer<INCREMENTAL_ACCESS_INFO>} pIncrementalAccessInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-incremental_access_info">INCREMENTAL_ACCESS_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-incremental_access_info">INCREMENTAL_ACCESS_INFO</a> structure that contains incremental access information, such as the last time the file was accessed by the gatherer.
     * @param {Pointer<ITEM_INFO>} pItemInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-item_info">ITEM_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-item_info">ITEM_INFO</a> structure that contains information about the URL item, such as the name of the item's workspace catalog.
     * @returns {IUrlAccessor} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a>**</b>
     * 
     * Receives the address of a pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object created by this method. This object contains information about the URL item, such as the item's file name.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-createaccessor
     */
    CreateAccessor(pcwszURL, pAuthenticationInfo, pIncrementalAccessInfo, pItemInfo) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(4, this, "ptr", pcwszURL, AUTHENTICATION_INFO.Ptr, pAuthenticationInfo, INCREMENTAL_ACCESS_INFO.Ptr, pIncrementalAccessInfo, ITEM_INFO.Ptr, pItemInfo, "ptr*", &ppAccessor := 0, "HRESULT")
        return IUrlAccessor(ppAccessor)
    }

    /**
     * Closes a previously created IUrlAccessor object.
     * @remarks
     * The protocol host will release the <i>pAccessor</i> pointer passed to this method when this method returns. Use this method to release any resources associated with the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object, freeing it for reuse by the protocol handler.
     *             
     * 
     * Accessors can be created and maintained in a pool, as resources to be used by protocol handlers when needed, and this might improve performance. If you are implementing a pool of <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> objects, use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> to add an <b>IUrlAccessor</b> to your pool.
     * @param {IUrlAccessor} pAccessor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object that was used to process the current URL item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-closeaccessor
     */
    CloseAccessor(pAccessor) {
        result := ComCall(5, this, "ptr", pAccessor, "HRESULT")
        return result
    }

    /**
     * Shuts down the protocol handler.
     * @remarks
     * This method is called by the protocol host to enable the protocol handler to clean up and release any associated resources.
     *           
     * 
     * The protocol host makes one call to this method before it exits. After this method is called, this instance will not be used any more. However, it is also possible for the protocol host process to terminate abruptly without calling this method. Protocol handlers that have persisted global states, such as registry entries and temporary files, should verify that those resources are cleaned up in the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchprotocol-init">ISearchProtocol::Init</a> method before initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-shutdown
     */
    ShutDown() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchProtocol.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 4)
        this.vtbl.CreateAccessor := CallbackCreate(GetMethod(implObj, "CreateAccessor"), flags, 6)
        this.vtbl.CloseAccessor := CallbackCreate(GetMethod(implObj, "CloseAccessor"), flags, 2)
        this.vtbl.ShutDown := CallbackCreate(GetMethod(implObj, "ShutDown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.CreateAccessor)
        CallbackFree(this.vtbl.CloseAccessor)
        CallbackFree(this.vtbl.ShutDown)
    }
}
