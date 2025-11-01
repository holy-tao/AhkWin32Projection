#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITPhoneDeviceSpecificEvent exposes methods that allow an application to retrieve information about a phone device-specific event.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itphonedevicespecificevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPhoneDeviceSpecificEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPhoneDeviceSpecificEvent
     * @type {Guid}
     */
    static IID => Guid("{63ffb2a6-872b-4cd3-a501-326e8fb40af7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Phone", "get_lParam1", "get_lParam2", "get_lParam3"]

    /**
     * 
     * @param {Pointer<ITPhone>} ppPhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_phone
     */
    get_Phone(ppPhone) {
        result := ComCall(7, this, "ptr*", ppPhone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pParam1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam1
     */
    get_lParam1(pParam1) {
        result := ComCall(8, this, "int*", pParam1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pParam2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam2
     */
    get_lParam2(pParam2) {
        result := ComCall(9, this, "int*", pParam2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pParam3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam3
     */
    get_lParam3(pParam3) {
        result := ComCall(10, this, "int*", pParam3, "HRESULT")
        return result
    }
}
