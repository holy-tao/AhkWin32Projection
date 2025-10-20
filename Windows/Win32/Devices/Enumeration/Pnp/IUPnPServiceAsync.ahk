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
     * 
     * @param {BSTR} bstrActionName 
     * @param {VARIANT} vInActionArgs 
     * @param {Pointer<IUPnPAsyncResult>} pAsyncResult 
     * @param {Pointer<UInt64>} pullRequestID 
     * @returns {HRESULT} 
     */
    BeginInvokeAction(bstrActionName, vInActionArgs, pAsyncResult, pullRequestID) {
        bstrActionName := bstrActionName is String ? BSTR.Alloc(bstrActionName).Value : bstrActionName

        result := ComCall(3, this, "ptr", bstrActionName, "ptr", vInActionArgs, "ptr", pAsyncResult, "uint*", pullRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @param {Pointer<VARIANT>} pvOutActionArgs 
     * @param {Pointer<VARIANT>} pvRetVal 
     * @returns {HRESULT} 
     */
    EndInvokeAction(ullRequestID, pvOutActionArgs, pvRetVal) {
        result := ComCall(4, this, "uint", ullRequestID, "ptr", pvOutActionArgs, "ptr", pvRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrVariableName 
     * @param {Pointer<IUPnPAsyncResult>} pAsyncResult 
     * @param {Pointer<UInt64>} pullRequestID 
     * @returns {HRESULT} 
     */
    BeginQueryStateVariable(bstrVariableName, pAsyncResult, pullRequestID) {
        bstrVariableName := bstrVariableName is String ? BSTR.Alloc(bstrVariableName).Value : bstrVariableName

        result := ComCall(5, this, "ptr", bstrVariableName, "ptr", pAsyncResult, "uint*", pullRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     */
    EndQueryStateVariable(ullRequestID, pValue) {
        result := ComCall(6, this, "uint", ullRequestID, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkCallback 
     * @param {Pointer<IUPnPAsyncResult>} pAsyncResult 
     * @param {Pointer<UInt64>} pullRequestID 
     * @returns {HRESULT} 
     */
    BeginSubscribeToEvents(pUnkCallback, pAsyncResult, pullRequestID) {
        result := ComCall(7, this, "ptr", pUnkCallback, "ptr", pAsyncResult, "uint*", pullRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @returns {HRESULT} 
     */
    EndSubscribeToEvents(ullRequestID) {
        result := ComCall(8, this, "uint", ullRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPAsyncResult>} pAsyncResult 
     * @param {Pointer<UInt64>} pullRequestID 
     * @returns {HRESULT} 
     */
    BeginSCPDDownload(pAsyncResult, pullRequestID) {
        result := ComCall(9, this, "ptr", pAsyncResult, "uint*", pullRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @param {Pointer<BSTR>} pbstrSCPDDoc 
     * @returns {HRESULT} 
     */
    EndSCPDDownload(ullRequestID, pbstrSCPDDoc) {
        result := ComCall(10, this, "uint", ullRequestID, "ptr", pbstrSCPDDoc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullRequestID 
     * @returns {HRESULT} 
     */
    CancelAsyncOperation(ullRequestID) {
        result := ComCall(11, this, "uint", ullRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
