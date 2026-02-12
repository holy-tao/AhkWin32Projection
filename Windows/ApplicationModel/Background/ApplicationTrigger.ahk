#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * This is used by the [BackgroundTaskBuilder](backgroundtaskbuilder.md) to programmatically trigger a background task from within your application.
 * @remarks
 * Use the [SetTrigger](backgroundtaskbuilder_settrigger_2125876510.md) method to specify the [IBackgroundTrigger](ibackgroundtrigger.md) for the background task. See [Trigger a background task from within your app](/windows/uwp/launch-resume/trigger-background-task-from-app) for an example of how to use this class to activate a background task from within your app.
 * 
 * > [!IMPORTANT]
 * > An app can only register one **ApplicationTrigger** with the [BackgroundTaskBuilder](/uwp/api/Windows.ApplicationModel.Background.BackgroundTaskBuilder) at any given time.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.applicationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ApplicationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new [ApplicationTrigger](applicationtrigger.md) class
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ApplicationTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * This method attempts to set the trigger and start the registered background task with specified arguments.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.applicationtrigger.requestasync
     */
    RequestAsync() {
        if (!this.HasProp("__IApplicationTrigger")) {
            if ((queryResult := this.QueryInterface(IApplicationTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationTrigger := IApplicationTrigger(outPtr)
        }

        return this.__IApplicationTrigger.RequestAsync()
    }

    /**
     * This method attempts to set the trigger and start the registered background task.
     * @param {ValueSet} arguments 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.applicationtrigger.requestasync
     */
    RequestAsyncWithArguments(arguments) {
        if (!this.HasProp("__IApplicationTrigger")) {
            if ((queryResult := this.QueryInterface(IApplicationTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationTrigger := IApplicationTrigger(outPtr)
        }

        return this.__IApplicationTrigger.RequestAsyncWithArguments(arguments)
    }

;@endregion Instance Methods
}
