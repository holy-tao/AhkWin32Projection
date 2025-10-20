#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to asynchronously query state variables and invoke actions on an instance of a service .
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpserviceasync
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServiceAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPServiceAsync
     * @type {Guid}
     */
    static IID => Guid("{098bdaf5-5ec1-49e7-a260-b3a11dd8680c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginInvokeAction", "EndInvokeAction", "BeginQueryStateVariable", "EndQueryStateVariable", "BeginSubscribeToEvents", "EndSubscribeToEvents", "BeginSCPDDownload", "EndSCPDDownload", "CancelAsyncOperation"]

    /**
     * 
     * @param {BSTR} bstrActionName 
     * @param {VARIANT} vInActionArgs 
     * @param {IUPnPAsyncResult} pAsyncResult 
     * @param {Pointer<Integer>} pullRequestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-begininvokeaction
     */
    BeginInvokeAction(bstrActionName, vInActionArgs, pAsyncResult, pullRequestID) {
        bstrActionName := bstrActionName is String ? BSTR.Alloc(bstrActionName).Value : bstrActionName

        result := ComCall(3, this, "ptr", bstrActionName, "ptr", vInActionArgs, "ptr", pAsyncResult, "uint*", pullRequestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @param {Pointer<VARIANT>} pvOutActionArgs 
     * @param {Pointer<VARIANT>} pvRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-endinvokeaction
     */
    EndInvokeAction(ullRequestID, pvOutActionArgs, pvRetVal) {
        result := ComCall(4, this, "uint", ullRequestID, "ptr", pvOutActionArgs, "ptr", pvRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrVariableName 
     * @param {IUPnPAsyncResult} pAsyncResult 
     * @param {Pointer<Integer>} pullRequestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-beginquerystatevariable
     */
    BeginQueryStateVariable(bstrVariableName, pAsyncResult, pullRequestID) {
        bstrVariableName := bstrVariableName is String ? BSTR.Alloc(bstrVariableName).Value : bstrVariableName

        result := ComCall(5, this, "ptr", bstrVariableName, "ptr", pAsyncResult, "uint*", pullRequestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-endquerystatevariable
     */
    EndQueryStateVariable(ullRequestID, pValue) {
        result := ComCall(6, this, "uint", ullRequestID, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkCallback 
     * @param {IUPnPAsyncResult} pAsyncResult 
     * @param {Pointer<Integer>} pullRequestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-beginsubscribetoevents
     */
    BeginSubscribeToEvents(pUnkCallback, pAsyncResult, pullRequestID) {
        result := ComCall(7, this, "ptr", pUnkCallback, "ptr", pAsyncResult, "uint*", pullRequestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-endsubscribetoevents
     */
    EndSubscribeToEvents(ullRequestID) {
        result := ComCall(8, this, "uint", ullRequestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUPnPAsyncResult} pAsyncResult 
     * @param {Pointer<Integer>} pullRequestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-beginscpddownload
     */
    BeginSCPDDownload(pAsyncResult, pullRequestID) {
        result := ComCall(9, this, "ptr", pAsyncResult, "uint*", pullRequestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @param {Pointer<BSTR>} pbstrSCPDDoc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-endscpddownload
     */
    EndSCPDDownload(ullRequestID, pbstrSCPDDoc) {
        result := ComCall(10, this, "uint", ullRequestID, "ptr", pbstrSCPDDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceasync-cancelasyncoperation
     */
    CancelAsyncOperation(ullRequestID) {
        result := ComCall(11, this, "uint", ullRequestID, "HRESULT")
        return result
    }
}
