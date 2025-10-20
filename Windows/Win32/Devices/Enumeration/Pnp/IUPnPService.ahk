#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPService interface enables an application to query state variables and invoke actions on an instance of a service.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpservice
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPService extends IDispatch{
    /**
     * The interface identifier for IUPnPService
     * @type {Guid}
     */
    static IID => Guid("{a295019c-dc65-47dd-90dc-7fe918a1ab44}")

    /**
     * The class identifier for UPnPService
     * @type {Guid}
     */
    static CLSID => Guid("{c624ba95-fbcb-4409-8c03-8cceec533ef1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrVariableName 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     */
    QueryStateVariable(bstrVariableName, pValue) {
        bstrVariableName := bstrVariableName is String ? BSTR.Alloc(bstrVariableName).Value : bstrVariableName

        result := ComCall(7, this, "ptr", bstrVariableName, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrActionName 
     * @param {VARIANT} vInActionArgs 
     * @param {Pointer<VARIANT>} pvOutActionArgs 
     * @param {Pointer<VARIANT>} pvRetVal 
     * @returns {HRESULT} 
     */
    InvokeAction(bstrActionName, vInActionArgs, pvOutActionArgs, pvRetVal) {
        bstrActionName := bstrActionName is String ? BSTR.Alloc(bstrActionName).Value : bstrActionName

        result := ComCall(8, this, "ptr", bstrActionName, "ptr", vInActionArgs, "ptr", pvOutActionArgs, "ptr", pvRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ServiceTypeIdentifier(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkCallback 
     * @returns {HRESULT} 
     */
    AddCallback(pUnkCallback) {
        result := ComCall(10, this, "ptr", pUnkCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     */
    get_Id(pbstrId) {
        result := ComCall(11, this, "ptr", pbstrId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plValue 
     * @returns {HRESULT} 
     */
    get_LastTransportStatus(plValue) {
        result := ComCall(12, this, "int*", plValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
