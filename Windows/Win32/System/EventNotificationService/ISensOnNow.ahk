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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnACPower", "OnBatteryPower", "BatteryLow"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensonnow-onacpower
     */
    OnACPower() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBatteryLifePercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensonnow-onbatterypower
     */
    OnBatteryPower(dwBatteryLifePercent) {
        result := ComCall(8, this, "uint", dwBatteryLifePercent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBatteryLifePercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensonnow-batterylow
     */
    BatteryLow(dwBatteryLifePercent) {
        result := ComCall(9, this, "uint", dwBatteryLifePercent, "HRESULT")
        return result
    }
}
