#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUrlAccessor.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for invoking, initializing, and managing IUrlAccessor objects. (ISearchProtocol)
 * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nn-searchapi-isearchprotocol
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchProtocol extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchProtocol
     * @type {Guid}
     */
    static IID => Guid("{c73106ba-ac80-11d1-8df3-00c04fb6ef4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "CreateAccessor", "CloseAccessor", "ShutDown"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchprotocol-init
     */
    Init(pTimeoutInfo, pProtocolHandlerSite, pProxyInfo) {
        result := ComCall(3, this, "ptr", pTimeoutInfo, "ptr", pProtocolHandlerSite, "ptr", pProxyInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchprotocol-createaccessor
     */
    CreateAccessor(pcwszURL, pAuthenticationInfo, pIncrementalAccessInfo, pItemInfo) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(4, this, "ptr", pcwszURL, "ptr", pAuthenticationInfo, "ptr", pIncrementalAccessInfo, "ptr", pItemInfo, "ptr*", &ppAccessor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchprotocol-closeaccessor
     */
    CloseAccessor(pAccessor) {
        result := ComCall(5, this, "ptr", pAccessor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-isearchprotocol-shutdown
     */
    ShutDown() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
