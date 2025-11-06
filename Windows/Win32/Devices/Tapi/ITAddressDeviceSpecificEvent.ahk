#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITAddress.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAddressDeviceSpecificEvent exposes methods that allow an application to retrieve information about a device-specific event.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddressdevicespecificevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddressDeviceSpecificEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAddressDeviceSpecificEvent
     * @type {Guid}
     */
    static IID => Guid("{3acb216b-40bd-487a-8672-5ce77bd7e3a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Address", "get_Call", "get_lParam1", "get_lParam2", "get_lParam3"]

    /**
     * 
     * @returns {ITAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_address
     */
    get_Address() {
        result := ComCall(7, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_call
     */
    get_Call() {
        result := ComCall(8, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_lparam1
     */
    get_lParam1() {
        result := ComCall(9, this, "int*", &pParam1 := 0, "HRESULT")
        return pParam1
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_lparam2
     */
    get_lParam2() {
        result := ComCall(10, this, "int*", &pParam2 := 0, "HRESULT")
        return pParam2
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_lparam3
     */
    get_lParam3() {
        result := ComCall(11, this, "int*", &pParam3 := 0, "HRESULT")
        return pParam3
    }
}
