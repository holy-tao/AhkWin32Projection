#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISignalNotifier.ahk
#Include .\ISignalNotifierStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Runs a method when an event or semaphore is signaled. A timeout value can also be specified, causing the delegate to run after the time span has elapsed if the named event does not occur (or if the semaphore does not reach a signaled state).
  * 
  * > [!NOTE]
  * > The ThreadPool API is supported for desktop as well as UWP apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalnotifier
 * @namespace Windows.System.Threading.Core
 * @version WindowsRuntime 1.4
 */
class SignalNotifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISignalNotifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISignalNotifier.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Attaches a [SignalHandler](signalhandler.md) delegate to an event. The delegated method will run if the event occurs or the time span elapses, whichever comes first.
     * @param {HSTRING} name Indicates the event that causes the method to run.
     * @param {SignalHandler} handler Indicates the method that will run in response to the event, or when the time span elapses, whichever comes first.
     * @returns {SignalNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalnotifier.attachtoevent
     */
    static AttachToEvent(name, handler) {
        if (!SignalNotifier.HasProp("__ISignalNotifierStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.Core.SignalNotifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISignalNotifierStatics.IID)
            SignalNotifier.__ISignalNotifierStatics := ISignalNotifierStatics(factoryPtr)
        }

        return SignalNotifier.__ISignalNotifierStatics.AttachToEvent(name, handler)
    }

    /**
     * Attaches a [SignalHandler](signalhandler.md) delegate to an event. The delegated method will run the next time the event occurs.
     * @param {HSTRING} name Indicates the event that causes the method to run.
     * @param {SignalHandler} handler Indicates the method that will run in response to the event.
     * @param {TimeSpan} timeout 
     * @returns {SignalNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalnotifier.attachtoevent
     */
    static AttachToEventWithTimeout(name, handler, timeout) {
        if (!SignalNotifier.HasProp("__ISignalNotifierStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.Core.SignalNotifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISignalNotifierStatics.IID)
            SignalNotifier.__ISignalNotifierStatics := ISignalNotifierStatics(factoryPtr)
        }

        return SignalNotifier.__ISignalNotifierStatics.AttachToEventWithTimeout(name, handler, timeout)
    }

    /**
     * Attaches a [SignalHandler](signalhandler.md) delegate to a named semaphore and specifies a timeout value. The delegated method will run when the named semaphore is signaled, or if the time span elapses before the semaphore reaches a signaled state.
     * @param {HSTRING} name Names the semaphore that signals the method to run.
     * @param {SignalHandler} handler Indicates the delegate that will run in response to the named semaphore entering the signaled state.
     * @returns {SignalNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalnotifier.attachtosemaphore
     */
    static AttachToSemaphore(name, handler) {
        if (!SignalNotifier.HasProp("__ISignalNotifierStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.Core.SignalNotifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISignalNotifierStatics.IID)
            SignalNotifier.__ISignalNotifierStatics := ISignalNotifierStatics(factoryPtr)
        }

        return SignalNotifier.__ISignalNotifierStatics.AttachToSemaphore(name, handler)
    }

    /**
     * Attaches a [SignalHandler](signalhandler.md) delegate to a named semaphore. The delegated method will run when the named semaphore is signaled.
     * @param {HSTRING} name Names the semaphore that signals the method to run.
     * @param {SignalHandler} handler Indicates the delegate that will run in response to the named semaphore entering the signaled state.
     * @param {TimeSpan} timeout 
     * @returns {SignalNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalnotifier.attachtosemaphore
     */
    static AttachToSemaphoreWithTimeout(name, handler, timeout) {
        if (!SignalNotifier.HasProp("__ISignalNotifierStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Threading.Core.SignalNotifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISignalNotifierStatics.IID)
            SignalNotifier.__ISignalNotifierStatics := ISignalNotifierStatics(factoryPtr)
        }

        return SignalNotifier.__ISignalNotifierStatics.AttachToSemaphoreWithTimeout(name, handler, timeout)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Submits the [SignalNotifier](signalnotifier.md) to the thread pool.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalnotifier.enable
     */
    Enable() {
        if (!this.HasProp("__ISignalNotifier")) {
            if ((queryResult := this.QueryInterface(ISignalNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignalNotifier := ISignalNotifier(outPtr)
        }

        return this.__ISignalNotifier.Enable()
    }

    /**
     * Terminates the [SignalNotifier](signalnotifier.md) if it has not already started running.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalnotifier.terminate
     */
    Terminate() {
        if (!this.HasProp("__ISignalNotifier")) {
            if ((queryResult := this.QueryInterface(ISignalNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignalNotifier := ISignalNotifier(outPtr)
        }

        return this.__ISignalNotifier.Terminate()
    }

;@endregion Instance Methods
}
