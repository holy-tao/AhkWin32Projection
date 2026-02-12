#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICashDrawerCloseAlarm.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CashDrawerCloseAlarm.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * The cash drawer close alarm. Parameter defaults are provided, however the user can update them as appropriate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerclosealarm
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawerCloseAlarm extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICashDrawerCloseAlarm

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICashDrawerCloseAlarm.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the alarm timeout for the cash drawer close alarm.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerclosealarm.alarmtimeout
     * @type {TimeSpan} 
     */
    AlarmTimeout {
        get => this.get_AlarmTimeout()
        set => this.put_AlarmTimeout(value)
    }

    /**
     * Frequency of beep tone.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerclosealarm.beepfrequency
     * @type {Integer} 
     */
    BeepFrequency {
        get => this.get_BeepFrequency()
        set => this.put_BeepFrequency(value)
    }

    /**
     * Duration of the cash drawer close alarm beep.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerclosealarm.beepduration
     * @type {TimeSpan} 
     */
    BeepDuration {
        get => this.get_BeepDuration()
        set => this.put_BeepDuration(value)
    }

    /**
     * Delay between cash drawer closed alarm beeps.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerclosealarm.beepdelay
     * @type {TimeSpan} 
     */
    BeepDelay {
        get => this.get_BeepDelay()
        set => this.put_BeepDelay(value)
    }

    /**
     * Event allowing the app to be notified if the alarm timeout has been triggered.
     * @type {TypedEventHandler<CashDrawerCloseAlarm, IInspectable>}
    */
    OnAlarmTimeoutExpired {
        get {
            if(!this.HasProp("__OnAlarmTimeoutExpired")){
                this.__OnAlarmTimeoutExpired := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c54fbda4-5e0b-54c3-94f2-83351e41c46f}"),
                    CashDrawerCloseAlarm,
                    IInspectable
                )
                this.__OnAlarmTimeoutExpiredToken := this.add_AlarmTimeoutExpired(this.__OnAlarmTimeoutExpired.iface)
            }
            return this.__OnAlarmTimeoutExpired
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAlarmTimeoutExpiredToken")) {
            this.remove_AlarmTimeoutExpired(this.__OnAlarmTimeoutExpiredToken)
            this.__OnAlarmTimeoutExpired.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_AlarmTimeout(value) {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.put_AlarmTimeout(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AlarmTimeout() {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.get_AlarmTimeout()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BeepFrequency(value) {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.put_BeepFrequency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BeepFrequency() {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.get_BeepFrequency()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_BeepDuration(value) {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.put_BeepDuration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BeepDuration() {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.get_BeepDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_BeepDelay(value) {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.put_BeepDelay(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BeepDelay() {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.get_BeepDelay()
    }

    /**
     * 
     * @param {TypedEventHandler<CashDrawerCloseAlarm, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AlarmTimeoutExpired(handler) {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.add_AlarmTimeoutExpired(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AlarmTimeoutExpired(token) {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.remove_AlarmTimeoutExpired(token)
    }

    /**
     * Starts the alarm countdown, returning an awaitable object that completes when the cash drawer is closed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerclosealarm.startasync
     */
    StartAsync() {
        if (!this.HasProp("__ICashDrawerCloseAlarm")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCloseAlarm.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCloseAlarm := ICashDrawerCloseAlarm(outPtr)
        }

        return this.__ICashDrawerCloseAlarm.StartAsync()
    }

;@endregion Instance Methods
}
