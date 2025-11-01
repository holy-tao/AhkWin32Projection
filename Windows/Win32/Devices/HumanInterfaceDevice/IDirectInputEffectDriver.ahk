#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * These three methods allow additional interfaces to be added to the DirectInputEffectDriver object without affecting the functionality of the original interface.
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/nn-dinputd-idirectinputeffectdriver
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class IDirectInputEffectDriver extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputEffectDriver
     * @type {Guid}
     */
    static IID => Guid("{02538130-898f-11d0-9ad0-00a0c9a06e35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceID", "GetVersions", "Escape", "SetGain", "SendForceFeedbackCommand", "GetForceFeedbackState", "DownloadEffect", "DestroyEffect", "StartEffect", "StopEffect", "GetEffectStatus"]

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-deviceid
     */
    DeviceID(param0, param1, param2, param3, param4) {
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, param4Marshal, param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIDRIVERVERSIONS>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-getversions
     */
    GetVersions(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<DIEFFESCAPE>} param2 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-escape
     */
    Escape(param0, param1, param2) {
        result := ComCall(5, this, "uint", param0, "uint", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-setgain
     */
    SetGain(param0, param1) {
        result := ComCall(6, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-sendforcefeedbackcommand
     */
    SendForceFeedbackCommand(param0, param1) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIDEVICESTATE>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-getforcefeedbackstate
     */
    GetForceFeedbackState(param0, param1) {
        result := ComCall(8, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<DIEFFECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-downloadeffect
     */
    DownloadEffect(param0, param1, param2, param3, param4) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", param0, "uint", param1, param2Marshal, param2, "ptr", param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-destroyeffect
     */
    DestroyEffect(param0, param1) {
        result := ComCall(10, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-starteffect
     */
    StartEffect(param0, param1, param2, param3) {
        result := ComCall(11, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-stopeffect
     */
    StopEffect(param0, param1) {
        result := ComCall(12, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-geteffectstatus
     */
    GetEffectStatus(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", param0, "uint", param1, param2Marshal, param2, "HRESULT")
        return result
    }
}
