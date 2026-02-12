#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTaskDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a background task deferral returned by the [IBackgroundTaskInstance.GetDeferral](ibackgroundtaskinstance_getdeferral_254836512.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskdeferral
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTaskDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTaskDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Informs the system that an asynchronous operation associated with a background task has finished.
     * @remarks
     * If a background task uses an asynchronous operation, it is possible for the [Run](ibackgroundtask_run_2017283929.md) method to return before the background task has completed its work. As soon as the [Run](ibackgroundtask_run_2017283929.md) method returns, the system might suspend or terminate the background task host process, which could prevent completion of asynchronous operations started by the background task.
     * 
     * To keep the host process from being suspended or terminated while the background task is running, use the [GetDeferral](ibackgroundtaskinstance_getdeferral_254836512.md) method to get a background task deferral for each asynchronous operation initiated. Then, when the asynchronous operation is finished, call the BackgroundTaskDeferral.Complete method.
     * 
     * Ensure that you complete all background task deferrals. Most background tasks have a timeout after which the app will be suspended or terminated regardless of whether there are any pending deferrals. However, leaving outstanding background task deferrals interferes with the system's ability to manage process lifetimes in a timely way.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IBackgroundTaskDeferral")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskDeferral := IBackgroundTaskDeferral(outPtr)
        }

        return this.__IBackgroundTaskDeferral.Complete()
    }

;@endregion Instance Methods
}
