#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables the sending of a message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SendSmsMessageOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAsyncAction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAsyncAction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A handler for the completed event of an asynchronous action.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation.completed
     * @type {AsyncActionCompletedHandler} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    /**
     * Indicates the ID of the asynchronous message operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Specifies the status of the asynchronous message operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Specifies the error code for the asynchronous message operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation.errorcode
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
     * @param {AsyncActionCompletedHandler} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        if (!this.HasProp("__IAsyncAction")) {
            if ((queryResult := this.QueryInterface(IAsyncAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncAction := IAsyncAction(outPtr)
        }

        return this.__IAsyncAction.put_Completed(handler)
    }

    /**
     * 
     * @returns {AsyncActionCompletedHandler} 
     */
    get_Completed() {
        if (!this.HasProp("__IAsyncAction")) {
            if ((queryResult := this.QueryInterface(IAsyncAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncAction := IAsyncAction(outPtr)
        }

        return this.__IAsyncAction.get_Completed()
    }

    /**
     * Retrieves the result of the asynchronous operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation.getresults
     */
    GetResults() {
        if (!this.HasProp("__IAsyncAction")) {
            if ((queryResult := this.QueryInterface(IAsyncAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncAction := IAsyncAction(outPtr)
        }

        return this.__IAsyncAction.GetResults()
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
     * Cancels the asynchronous operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation.cancel
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
     * Closes the asynchronous operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.sendsmsmessageoperation.close
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
