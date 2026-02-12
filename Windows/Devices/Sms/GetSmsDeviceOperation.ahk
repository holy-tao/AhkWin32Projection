#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SmsDevice.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IAsyncInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Retrieves an [SmsDevice](smsdevice.md) object asynchronously.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class GetSmsDeviceOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAsyncOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAsyncOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies whether the asynchronous [SmsDevice](smsdevice.md) object retrieval operation has completed or not.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation.completed
     * @type {AsyncOperationCompletedHandler<Generic>} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    /**
     * Specifies the ID of the asynchronous [SmsDevice](smsdevice.md) object retrieval operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Specifies the status of the asynchronous [SmsDevice](smsdevice.md) object retrieval operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Specifies the error code for the asynchronous [SmsDevice](smsdevice.md) object retrieval operation
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {AsyncOperationCompletedHandler<Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{ab710de1-fcbb-5bd6-9f2f-285fa9fb44e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation(SmsDevice, outPtr)
        }

        return this.__IAsyncOperation.put_Completed(handler)
    }

    /**
     * 
     * @returns {AsyncOperationCompletedHandler<Generic>} 
     */
    get_Completed() {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{ab710de1-fcbb-5bd6-9f2f-285fa9fb44e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation(SmsDevice, outPtr)
        }

        return this.__IAsyncOperation.get_Completed()
    }

    /**
     * Gets the results of the asynchronous [SmsDevice](smsdevice.md) object retrieval operation.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation.getresults
     */
    GetResults() {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{ab710de1-fcbb-5bd6-9f2f-285fa9fb44e8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation(SmsDevice, outPtr)
        }

        return this.__IAsyncOperation.GetResults()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_ErrorCode()
    }

    /**
     * Cancels the asynchronous [SmsDevice](smsdevice.md) object retrieval.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation.cancel
     */
    Cancel() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.Cancel()
    }

    /**
     * Closes the asynchronous [SmsDevice](smsdevice.md) object retrieval operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsdeviceoperation.close
     */
    Close() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.Close()
    }

;@endregion Instance Methods
}
