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
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @returns {HRESULT} 
     */
    DeviceID(param0, param1, param2, param3, param4) {
        result := ComCall(3, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, "ptr", param4, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DIDRIVERVERSIONS>} param0 
     * @returns {HRESULT} 
     */
    GetVersions(param0) {
        result := ComCall(4, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(5, this, "uint", param0, "uint", param1, "ptr", param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetGain(param0, param1) {
        result := ComCall(6, this, "uint", param0, "uint", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SendForceFeedbackCommand(param0, param1) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIDEVICESTATE>} param1 
     * @returns {HRESULT} 
     */
    GetForceFeedbackState(param0, param1) {
        result := ComCall(8, this, "uint", param0, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<UInt32>} param2 
     * @param {Pointer<DIEFFECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} 
     */
    DownloadEffect(param0, param1, param2, param3, param4) {
        result := ComCall(9, this, "uint", param0, "uint", param1, "uint*", param2, "ptr", param3, "uint", param4, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    DestroyEffect(param0, param1) {
        result := ComCall(10, this, "uint", param0, "uint", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    StartEffect(param0, param1, param2, param3) {
        result := ComCall(11, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    StopEffect(param0, param1) {
        result := ComCall(12, this, "uint", param0, "uint", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<UInt32>} param2 
     * @returns {HRESULT} 
     */
    GetEffectStatus(param0, param1, param2) {
        result := ComCall(13, this, "uint", param0, "uint", param1, "uint*", param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
