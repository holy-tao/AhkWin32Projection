#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsMessageReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for [ISmsBinaryMessage](ismsbinarymessage.md) event handlers.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * An instance of the SmsMessageReceivedEventArgs class can be retrieved from the [SmsMessageReceivedEventHandler](smsmessagereceivedeventhandler.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedeventargs
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsMessageReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsMessageReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsMessageReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves an object that holds the text representation of the message. If the message is not successfully decoded, an error is returned.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedeventargs.textmessage
     * @type {SmsTextMessage} 
     */
    TextMessage {
        get => this.get_TextMessage()
    }

    /**
     * Retrieves an object that holds the binary representation of the message. This is of interest only to clients who want to pass binary messages on directly or do their own interpretation of the binary message contents.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedeventargs.binarymessage
     * @type {SmsBinaryMessage} 
     */
    BinaryMessage {
        get => this.get_BinaryMessage()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SmsTextMessage} 
     */
    get_TextMessage() {
        if (!this.HasProp("__ISmsMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedEventArgs := ISmsMessageReceivedEventArgs(outPtr)
        }

        return this.__ISmsMessageReceivedEventArgs.get_TextMessage()
    }

    /**
     * 
     * @returns {SmsBinaryMessage} 
     */
    get_BinaryMessage() {
        if (!this.HasProp("__ISmsMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedEventArgs := ISmsMessageReceivedEventArgs(outPtr)
        }

        return this.__ISmsMessageReceivedEventArgs.get_BinaryMessage()
    }

;@endregion Instance Methods
}
