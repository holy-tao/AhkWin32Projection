#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iconnectionrequestcallback
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IConnectionRequestCallback extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnComplete"]

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iconnectionrequestcallback-oncomplete
     */
    OnComplete(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }
}
