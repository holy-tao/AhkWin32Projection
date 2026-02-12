#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISuspendingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for an app suspending event.
 * @remarks
 * This object is accessed when you implement a handler to respond to [Suspending](../windows.applicationmodel.core/coreapplication_suspending.md) events.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.suspendingeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class SuspendingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISuspendingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISuspendingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the app suspending operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.suspendingeventargs.suspendingoperation
     * @type {SuspendingOperation} 
     */
    SuspendingOperation {
        get => this.get_SuspendingOperation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SuspendingOperation} 
     */
    get_SuspendingOperation() {
        if (!this.HasProp("__ISuspendingEventArgs")) {
            if ((queryResult := this.QueryInterface(ISuspendingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISuspendingEventArgs := ISuspendingEventArgs(outPtr)
        }

        return this.__ISuspendingEventArgs.get_SuspendingOperation()
    }

;@endregion Instance Methods
}
