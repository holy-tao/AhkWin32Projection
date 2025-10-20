#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientPortManagement extends IUnknown{
    /**
     * The interface identifier for IRTCClientPortManagement
     * @type {Guid}
     */
    static IID => Guid("{d5df3f03-4bde-4417-aefe-71177bdaea66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @returns {HRESULT} 
     */
    StartListenAddressAndPort(bstrInternalLocalAddress, lInternalLocalPort) {
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress

        result := ComCall(3, this, "ptr", bstrInternalLocalAddress, "int", lInternalLocalPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @returns {HRESULT} 
     */
    StopListenAddressAndPort(bstrInternalLocalAddress, lInternalLocalPort) {
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress

        result := ComCall(4, this, "ptr", bstrInternalLocalAddress, "int", lInternalLocalPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enPortType 
     * @param {Pointer<Int32>} plMinValue 
     * @param {Pointer<Int32>} plMaxValue 
     * @returns {HRESULT} 
     */
    GetPortRange(enPortType, plMinValue, plMaxValue) {
        result := ComCall(5, this, "int", enPortType, "int*", plMinValue, "int*", plMaxValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
