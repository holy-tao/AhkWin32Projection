#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IConnectionRequestCallback extends IUnknown{
    /**
     * The interface identifier for IConnectionRequestCallback
     * @type {Guid}
     */
    static IID => Guid("{272c9ae0-7161-4ae0-91bd-9f448ee9c427}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    OnComplete(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
