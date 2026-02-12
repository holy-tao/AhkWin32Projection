#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the [DataRequested](datatransfermanager_datarequested.md) event. The system fires this event when the user invokes the Share UI.
 * @remarks
 * When you use the [DataTransferManager](datatransfermanager.md) class to launch the Share UI programmatically, the system fires a [DataRequested](datatransfermanager_datarequested.md) event. The object included with this event is an instance of the **DataRequestedEventArgs** class.
 * 
 * This event has one property, [Request](datarequestedeventargs_request.md). This property contains an instance of the [DataRequest](datarequest.md) class, which your app uses to supply the content the user wants to share with the target app.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequestedeventargs
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Enables you to get the [DataRequest](datarequest.md) object and either give it data or a failure message.
     * @remarks
     * When a user invokes the Share UI to share content, the system fires a [datarequested](datatransfermanager_datarequested.md) event. The **request** property of the event contains a [DataRequest](datarequest.md) object, which lets your app supply the information the user wants to share.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequestedeventargs.request
     * @type {DataRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IDataRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDataRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataRequestedEventArgs := IDataRequestedEventArgs(outPtr)
        }

        return this.__IDataRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
