#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The ISensOnNow interface handles AC and battery power events fired by the System Event Notification Service (SENS).
 * @see https://docs.microsoft.com/windows/win32/api//sensevts/nn-sensevts-isensonnow
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class ISensOnNow extends IDispatch{
    /**
     * The interface identifier for ISensOnNow
     * @type {Guid}
     */
    static IID => Guid("{d597bab2-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    OnACPower() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBatteryLifePercent 
     * @returns {HRESULT} 
     */
    OnBatteryPower(dwBatteryLifePercent) {
        result := ComCall(8, this, "uint", dwBatteryLifePercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBatteryLifePercent 
     * @returns {HRESULT} 
     */
    BatteryLow(dwBatteryLifePercent) {
        result := ComCall(9, this, "uint", dwBatteryLifePercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
