#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITPhoneEvent interface contains methods that retrieve the description of phone events that have occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itphoneevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPhoneEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPhoneEvent
     * @type {Guid}
     */
    static IID => Guid("{8f942dd8-64ed-4aaf-a77d-b23db0837ead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Phone", "get_Event", "get_ButtonState", "get_HookSwitchState", "get_HookSwitchDevice", "get_RingMode", "get_ButtonLampId", "get_NumberGathered", "get_Call"]

    /**
     * 
     * @param {Pointer<ITPhone>} ppPhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_phone
     */
    get_Phone(ppPhone) {
        result := ComCall(7, this, "ptr*", ppPhone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_event
     */
    get_Event(pEvent) {
        result := ComCall(8, this, "int*", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_buttonstate
     */
    get_ButtonState(pState) {
        result := ComCall(9, this, "int*", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_hookswitchstate
     */
    get_HookSwitchState(pState) {
        result := ComCall(10, this, "int*", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_hookswitchdevice
     */
    get_HookSwitchDevice(pDevice) {
        result := ComCall(11, this, "int*", pDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRingMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_ringmode
     */
    get_RingMode(plRingMode) {
        result := ComCall(12, this, "int*", plRingMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plButtonLampId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_buttonlampid
     */
    get_ButtonLampId(plButtonLampId) {
        result := ComCall(13, this, "int*", plButtonLampId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_numbergathered
     */
    get_NumberGathered(ppNumber) {
        result := ComCall(14, this, "ptr", ppNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCallInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_call
     */
    get_Call(ppCallInfo) {
        result := ComCall(15, this, "ptr*", ppCallInfo, "HRESULT")
        return result
    }
}
