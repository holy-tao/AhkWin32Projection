#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsSendMessageResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates the results of calling [SmsDevice2.SendMessageAndGetResultAsync](smsdevice2_sendmessageandgetresultasync_123752871.md).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * You access an SmsSendMessageResult object through the asynchronous result of the [SmsDevice2.SendMessageAndGetResultAsync](smsdevice2_sendmessageandgetresultasync_123752871.md) method. For information about working with the results of asynchronous methods, see [Asynchronous programming (Windows Runtime apps)](/previous-versions/windows/apps/hh464924(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsSendMessageResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsSendMessageResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsSendMessageResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the send operation was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult.issuccessful
     * @type {Boolean} 
     */
    IsSuccessful {
        get => this.get_IsSuccessful()
    }

    /**
     * Gets a list of message numbers sent.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult.messagereferencenumbers
     * @type {IVectorView<Integer>} 
     */
    MessageReferenceNumbers {
        get => this.get_MessageReferenceNumbers()
    }

    /**
     * Gets the cellular class used in the send operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Gets the error code for a modem error associated with the send operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult.modemerrorcode
     * @type {Integer} 
     */
    ModemErrorCode {
        get => this.get_ModemErrorCode()
    }

    /**
     * Gets a boolean value indicating whether the send operation has encountered a transient error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult.iserrortransient
     * @type {Boolean} 
     */
    IsErrorTransient {
        get => this.get_IsErrorTransient()
    }

    /**
     * Gets the error code for a network error associated with the send operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult.networkcausecode
     * @type {Integer} 
     */
    NetworkCauseCode {
        get => this.get_NetworkCauseCode()
    }

    /**
     * Gets the error code for a transport failure associated with the send operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smssendmessageresult.transportfailurecause
     * @type {Integer} 
     */
    TransportFailureCause {
        get => this.get_TransportFailureCause()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccessful() {
        if (!this.HasProp("__ISmsSendMessageResult")) {
            if ((queryResult := this.QueryInterface(ISmsSendMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsSendMessageResult := ISmsSendMessageResult(outPtr)
        }

        return this.__ISmsSendMessageResult.get_IsSuccessful()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_MessageReferenceNumbers() {
        if (!this.HasProp("__ISmsSendMessageResult")) {
            if ((queryResult := this.QueryInterface(ISmsSendMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsSendMessageResult := ISmsSendMessageResult(outPtr)
        }

        return this.__ISmsSendMessageResult.get_MessageReferenceNumbers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        if (!this.HasProp("__ISmsSendMessageResult")) {
            if ((queryResult := this.QueryInterface(ISmsSendMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsSendMessageResult := ISmsSendMessageResult(outPtr)
        }

        return this.__ISmsSendMessageResult.get_CellularClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ModemErrorCode() {
        if (!this.HasProp("__ISmsSendMessageResult")) {
            if ((queryResult := this.QueryInterface(ISmsSendMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsSendMessageResult := ISmsSendMessageResult(outPtr)
        }

        return this.__ISmsSendMessageResult.get_ModemErrorCode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsErrorTransient() {
        if (!this.HasProp("__ISmsSendMessageResult")) {
            if ((queryResult := this.QueryInterface(ISmsSendMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsSendMessageResult := ISmsSendMessageResult(outPtr)
        }

        return this.__ISmsSendMessageResult.get_IsErrorTransient()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkCauseCode() {
        if (!this.HasProp("__ISmsSendMessageResult")) {
            if ((queryResult := this.QueryInterface(ISmsSendMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsSendMessageResult := ISmsSendMessageResult(outPtr)
        }

        return this.__ISmsSendMessageResult.get_NetworkCauseCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportFailureCause() {
        if (!this.HasProp("__ISmsSendMessageResult")) {
            if ((queryResult := this.QueryInterface(ISmsSendMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsSendMessageResult := ISmsSendMessageResult(outPtr)
        }

        return this.__ISmsSendMessageResult.get_TransportFailureCause()
    }

;@endregion Instance Methods
}
