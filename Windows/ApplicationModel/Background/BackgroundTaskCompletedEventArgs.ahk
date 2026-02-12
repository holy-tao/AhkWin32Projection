#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTaskCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents completion information for a task at the time a completion notification is sent.
 * @remarks
 * The system generates this class and passes it as an argument to the application's [BackgroundTaskCompletedEventHandler](backgroundtaskcompletedeventhandler.md) handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskcompletedeventargs
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTaskCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTaskCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier of the background task instance for this completion status notification.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskcompletedeventargs.instanceid
     * @type {Guid} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_InstanceId() {
        if (!this.HasProp("__IBackgroundTaskCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskCompletedEventArgs := IBackgroundTaskCompletedEventArgs(outPtr)
        }

        return this.__IBackgroundTaskCompletedEventArgs.get_InstanceId()
    }

    /**
     * Throws an exception if the background task completed event has reported an error.
     * @remarks
     * This method should be called from within a **try** block. If the background task completed event reported an error, it will be caught as an exception in the subsequent **catch** clause.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskcompletedeventargs.checkresult
     */
    CheckResult() {
        if (!this.HasProp("__IBackgroundTaskCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskCompletedEventArgs := IBackgroundTaskCompletedEventArgs(outPtr)
        }

        return this.__IBackgroundTaskCompletedEventArgs.CheckResult()
    }

;@endregion Instance Methods
}
