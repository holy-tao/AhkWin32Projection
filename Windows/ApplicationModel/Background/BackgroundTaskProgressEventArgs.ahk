#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTaskProgressEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents progress information for a task at the time a progress update notification is sent.
 * @remarks
 * The system generates this class and passes it as an argument to the application's [BackgroundTaskProgressEventHandler](backgroundtaskprogresseventhandler.md) handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskprogresseventargs
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskProgressEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTaskProgressEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTaskProgressEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier of the background task instance for this progress status notification.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskprogresseventargs.instanceid
     * @type {Guid} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

    /**
     * Gets progress status for a background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskprogresseventargs.progress
     * @type {Integer} 
     */
    Progress {
        get => this.get_Progress()
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
        if (!this.HasProp("__IBackgroundTaskProgressEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskProgressEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskProgressEventArgs := IBackgroundTaskProgressEventArgs(outPtr)
        }

        return this.__IBackgroundTaskProgressEventArgs.get_InstanceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Progress() {
        if (!this.HasProp("__IBackgroundTaskProgressEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskProgressEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskProgressEventArgs := IBackgroundTaskProgressEventArgs(outPtr)
        }

        return this.__IBackgroundTaskProgressEventArgs.get_Progress()
    }

;@endregion Instance Methods
}
