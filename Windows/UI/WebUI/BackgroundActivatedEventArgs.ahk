#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\IBackgroundActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Makes all data available from the [IBackgroundTask.Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method available to your event handler when your app is activated by a background trigger.
 * @remarks
 * The system passes this object to your background activated event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.backgroundactivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class BackgroundActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the background task that activated the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.backgroundactivatedeventargs.taskinstance
     * @type {IBackgroundTaskInstance} 
     */
    TaskInstance {
        get => this.get_TaskInstance()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBackgroundTaskInstance} 
     */
    get_TaskInstance() {
        if (!this.HasProp("__IBackgroundActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundActivatedEventArgs := IBackgroundActivatedEventArgs(outPtr)
        }

        return this.__IBackgroundActivatedEventArgs.get_TaskInstance()
    }

;@endregion Instance Methods
}
