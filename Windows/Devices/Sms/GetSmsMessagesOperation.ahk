#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ISmsMessage.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IAsyncInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the retrieval of messages.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class GetSmsMessagesOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAsyncOperationWithProgress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAsyncOperationWithProgress.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the progress status of the asynchronous message operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.progress
     * @type {AsyncOperationProgressHandler<Generic, Generic>} 
     */
    Progress {
        get => this.get_Progress()
        set => this.put_Progress(value)
    }

    /**
     * Specifies whether the asynchronous message retrieval operation has completed or not.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.completed
     * @type {AsyncOperationWithProgressCompletedHandler<Generic, Generic>} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    /**
     * Indicates the ID of the asynchronous message operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Specifies the status of the asynchronous message operations.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Specifies the error code for the asynchronous message operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.errorcode
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
     * @param {AsyncOperationProgressHandler<Generic, Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Progress(handler) {
        if (!this.HasProp("__IAsyncOperationWithProgress")) {
            piid := Guid("{12f85589-415d-5b5d-b0d0-fda3b0295adc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperationWithProgress := IAsyncOperationWithProgress(IVectorView.Call.Bind(IVectorView, ISmsMessage), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IAsyncOperationWithProgress.put_Progress(handler)
    }

    /**
     * 
     * @returns {AsyncOperationProgressHandler<Generic, Generic>} 
     */
    get_Progress() {
        if (!this.HasProp("__IAsyncOperationWithProgress")) {
            piid := Guid("{12f85589-415d-5b5d-b0d0-fda3b0295adc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperationWithProgress := IAsyncOperationWithProgress(IVectorView.Call.Bind(IVectorView, ISmsMessage), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IAsyncOperationWithProgress.get_Progress()
    }

    /**
     * 
     * @param {AsyncOperationWithProgressCompletedHandler<Generic, Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        if (!this.HasProp("__IAsyncOperationWithProgress")) {
            piid := Guid("{12f85589-415d-5b5d-b0d0-fda3b0295adc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperationWithProgress := IAsyncOperationWithProgress(IVectorView.Call.Bind(IVectorView, ISmsMessage), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IAsyncOperationWithProgress.put_Completed(handler)
    }

    /**
     * 
     * @returns {AsyncOperationWithProgressCompletedHandler<Generic, Generic>} 
     */
    get_Completed() {
        if (!this.HasProp("__IAsyncOperationWithProgress")) {
            piid := Guid("{12f85589-415d-5b5d-b0d0-fda3b0295adc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperationWithProgress := IAsyncOperationWithProgress(IVectorView.Call.Bind(IVectorView, ISmsMessage), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IAsyncOperationWithProgress.get_Completed()
    }

    /**
     * Retrieves the result of the asynchronous message retrieval operation.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.getresults
     */
    GetResults() {
        if (!this.HasProp("__IAsyncOperationWithProgress")) {
            piid := Guid("{12f85589-415d-5b5d-b0d0-fda3b0295adc}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperationWithProgress := IAsyncOperationWithProgress(IVectorView.Call.Bind(IVectorView, ISmsMessage), (ptr) => IPropertyValue(ptr).GetInt32(), outPtr)
        }

        return this.__IAsyncOperationWithProgress.GetResults()
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
     * Cancels the asynchronous operations.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.cancel
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
     * Closes the asynchronous operations.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.getsmsmessagesoperation.close
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
