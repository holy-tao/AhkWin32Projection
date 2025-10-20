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
     * 
     * @param {Pointer<ITPhone>} ppPhone 
     * @returns {HRESULT} 
     */
    get_Phone(ppPhone) {
        result := ComCall(7, this, "ptr", ppPhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pParam1 
     * @returns {HRESULT} 
     */
    get_lParam1(pParam1) {
        result := ComCall(8, this, "int*", pParam1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pParam2 
     * @returns {HRESULT} 
     */
    get_lParam2(pParam2) {
        result := ComCall(9, this, "int*", pParam2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pParam3 
     * @returns {HRESULT} 
     */
    get_lParam3(pParam3) {
        result := ComCall(10, this, "int*", pParam3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
