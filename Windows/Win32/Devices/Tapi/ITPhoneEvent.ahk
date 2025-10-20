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
     * @param {Pointer<Int32>} pEvent 
     * @returns {HRESULT} 
     */
    get_Event(pEvent) {
        result := ComCall(8, this, "int*", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_ButtonState(pState) {
        result := ComCall(9, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_HookSwitchState(pState) {
        result := ComCall(10, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDevice 
     * @returns {HRESULT} 
     */
    get_HookSwitchDevice(pDevice) {
        result := ComCall(11, this, "int*", pDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRingMode 
     * @returns {HRESULT} 
     */
    get_RingMode(plRingMode) {
        result := ComCall(12, this, "int*", plRingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plButtonLampId 
     * @returns {HRESULT} 
     */
    get_ButtonLampId(plButtonLampId) {
        result := ComCall(13, this, "int*", plButtonLampId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppNumber 
     * @returns {HRESULT} 
     */
    get_NumberGathered(ppNumber) {
        result := ComCall(14, this, "ptr", ppNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCallInfo 
     * @returns {HRESULT} 
     */
    get_Call(ppCallInfo) {
        result := ComCall(15, this, "ptr", ppCallInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
