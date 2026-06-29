#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ISensOnNow interface handles AC and battery power events fired by the System Event Notification Service (SENS).
 * @see https://learn.microsoft.com/windows/win32/api/sensevts/nn-sensevts-isensonnow
 * @namespace Windows.Win32.System.EventNotificationService
 */
export default struct ISensOnNow extends IDispatch {
    /**
     * The interface identifier for ISensOnNow
     * @type {Guid}
     */
    static IID := Guid("{d597bab2-5b9f-11d1-8dd2-00aa004abd5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISensOnNow interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        OnACPower      : IntPtr
        OnBatteryPower : IntPtr
        BatteryLow     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISensOnNow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * SENS calls the OnACPower method to notify your application that the computer is using AC power.
     * @remarks
     * SENS calls this method to notify your application that AC power has been activated.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method returned successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensonnow-onacpower
     */
    OnACPower() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * SENS calls the OnBatteryPower method to notify an application that a computer is using battery power.
     * @remarks
     * SENS calls this method to notify an application that a computer is using battery power. The remaining percentage of battery power is specified.
     * @param {Integer} dwBatteryLifePercent The percent of battery power that remains.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensonnow-onbatterypower
     */
    OnBatteryPower(dwBatteryLifePercent) {
        result := ComCall(8, this, "uint", dwBatteryLifePercent, "HRESULT")
        return result
    }

    /**
     * The BatteryLow method notifies an application that battery power is low. SENS calls the BatteryLow method to notify an application that a computer is using battery power.
     * @remarks
     * SENS calls this method to notify an application that a computer is using battery power. The remaining percentage of battery power is specified.
     * @param {Integer} dwBatteryLifePercent The percent of battery power that remains.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensonnow-batterylow
     */
    BatteryLow(dwBatteryLifePercent) {
        result := ComCall(9, this, "uint", dwBatteryLifePercent, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISensOnNow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnACPower := CallbackCreate(GetMethod(implObj, "OnACPower"), flags, 1)
        this.vtbl.OnBatteryPower := CallbackCreate(GetMethod(implObj, "OnBatteryPower"), flags, 2)
        this.vtbl.BatteryLow := CallbackCreate(GetMethod(implObj, "BatteryLow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnACPower)
        CallbackFree(this.vtbl.OnBatteryPower)
        CallbackFree(this.vtbl.BatteryLow)
    }
}
