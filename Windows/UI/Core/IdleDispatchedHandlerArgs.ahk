#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIdleDispatchedHandlerArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines the arguments returned by a [IdleDispatchedHandler](idledispatchedhandler.md) callback.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.idledispatchedhandlerargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class IdleDispatchedHandlerArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIdleDispatchedHandlerArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIdleDispatchedHandlerArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the event dispatcher's message queue is empty or not.
     * @remarks
     * > [!NOTE]
     * > This property must be handled within the code for the event handler. This data becomes stale quickly and cannot be stored or used outside of the handler. If you access this property outside of the [IdleDispatchedHandler](idledispatchedhandler.md) invoked by the call to [CoreDispatcher.RunAsync](coredispatcher_runasync_447339746.md), your call to IsDispatcherIdle will fail.
     * 
     * When a work item is scheduled with the [CoreDispatcher.RunAsync](coredispatcher_runasync_447339746.md) method, the item performs any processing only when there are no message pending in the event queue. However, if the [IdleDispatchedHandlerArgs](idledispatchedhandlerargs.md) sent to the delegate has the IsDispatcherIdle property set to **false**, the work item immediately suspends background processing until the event queue is empty again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.idledispatchedhandlerargs.isdispatcheridle
     * @type {Boolean} 
     */
    IsDispatcherIdle {
        get => this.get_IsDispatcherIdle()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDispatcherIdle() {
        if (!this.HasProp("__IIdleDispatchedHandlerArgs")) {
            if ((queryResult := this.QueryInterface(IIdleDispatchedHandlerArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIdleDispatchedHandlerArgs := IIdleDispatchedHandlerArgs(outPtr)
        }

        return this.__IIdleDispatchedHandlerArgs.get_IsDispatcherIdle()
    }

;@endregion Instance Methods
}
