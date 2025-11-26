#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITPhone.ahk
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
     * @type {ITPhone} 
     */
    Phone {
        get => this.get_Phone()
    }

    /**
     * @type {Integer} 
     */
    lParam1 {
        get => this.get_lParam1()
    }

    /**
     * @type {Integer} 
     */
    lParam2 {
        get => this.get_lParam2()
    }

    /**
     * @type {Integer} 
     */
    lParam3 {
        get => this.get_lParam3()
    }

    /**
     * The get_Phone method retrieves the ITPhone interface pointer for a phone device event.
     * @returns {ITPhone} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface for the phone object involved in the event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphonedevicespecificevent-get_phone
     */
    get_Phone() {
        result := ComCall(7, this, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    /**
     * The get_lParam1 method retrieves the first of three buffers specific to a given phone device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a <b>long</b> concerning information on the phone device event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam1
     */
    get_lParam1() {
        result := ComCall(8, this, "int*", &pParam1 := 0, "HRESULT")
        return pParam1
    }

    /**
     * The get_lParam2 method retrieves the second of three buffers specific to a given phone device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a <b>long</b> concerning information on the phone device event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam2
     */
    get_lParam2() {
        result := ComCall(9, this, "int*", &pParam2 := 0, "HRESULT")
        return pParam2
    }

    /**
     * The get_lParam3 method retrieves the third of three buffers specific to a given phone device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a variable that receives information on the phone device event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam3
     */
    get_lParam3() {
        result := ComCall(10, this, "int*", &pParam3 := 0, "HRESULT")
        return pParam3
    }
}
