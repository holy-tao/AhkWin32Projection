#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDispatcherQueueShutdownStartingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides the arguments for the [ShutdownStarting](dispatcherqueue_shutdownstarting.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueueshutdownstartingeventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DispatcherQueueShutdownStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDispatcherQueueShutdownStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDispatcherQueueShutdownStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a deferral object so that you can use to continue to post work to the **DisbpatcherQueue** until you mark the deferral complete.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueueshutdownstartingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDispatcherQueueShutdownStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDispatcherQueueShutdownStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDispatcherQueueShutdownStartingEventArgs := IDispatcherQueueShutdownStartingEventArgs(outPtr)
        }

        return this.__IDispatcherQueueShutdownStartingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
