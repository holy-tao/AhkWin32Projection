#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to retrieve and provide the Service Control Protocol Description (SCPD) document to a UPnP control point application to expose actions supported by the service and provide information about state variables.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpservicedocumentaccess
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServiceDocumentAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPServiceDocumentAccess
     * @type {Guid}
     */
    static IID => Guid("{21905529-0a5e-4589-825d-7e6d87ea6998}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentURL", "GetDocument"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDocUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservicedocumentaccess-getdocumenturl
     */
    GetDocumentURL(pbstrDocUrl) {
        result := ComCall(3, this, "ptr", pbstrDocUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDoc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservicedocumentaccess-getdocument
     */
    GetDocument(pbstrDoc) {
        result := ComCall(4, this, "ptr", pbstrDoc, "HRESULT")
        return result
    }
}
