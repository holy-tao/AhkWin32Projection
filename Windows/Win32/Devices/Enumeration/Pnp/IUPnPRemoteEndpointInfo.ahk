#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPRemoteEndpointInfo interface allows a hosted device to obtain information about a requester (that is, a control point) and the request.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpremoteendpointinfo
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPRemoteEndpointInfo extends IUnknown{
    /**
     * The interface identifier for IUPnPRemoteEndpointInfo
     * @type {Guid}
     */
    static IID => Guid("{c92eb863-0269-4aff-9c72-75321bba2952}")

    /**
     * The class identifier for UPnPRemoteEndpointInfo
     * @type {Guid}
     */
    static CLSID => Guid("{2e5e84e9-4049-4244-b728-2d24227157c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} bstrValueName 
     * @param {Pointer<UInt32>} pdwValue 
     * @returns {HRESULT} 
     */
    GetDwordValue(bstrValueName, pdwValue) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        result := ComCall(3, this, "ptr", bstrValueName, "uint*", pdwValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrValueName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    GetStringValue(bstrValueName, pbstrValue) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        result := ComCall(4, this, "ptr", bstrValueName, "ptr", pbstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrValueName 
     * @param {Pointer<Guid>} pguidValue 
     * @returns {HRESULT} 
     */
    GetGuidValue(bstrValueName, pguidValue) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        result := ComCall(5, this, "ptr", bstrValueName, "ptr", pguidValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
