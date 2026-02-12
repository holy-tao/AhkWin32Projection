#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerIndependentInputSource.ahk
#Include .\IRadialControllerIndependentInputSource2.ahk
#Include .\IRadialControllerIndependentInputSourceStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables an app to handle radial controller input on the background thread.
 * @remarks
 * Call [DispatcherQueueController.CreateOnDedicatedThread](../windows.system/dispatcherqueuecontroller_createondedicatedthread_660689653.md) to create the [DispatcherQueue](../windows.system/dispatcherqueue.md) on the background thread where the RadialControllerIndependentInputSource is instantiated. Access this [DispatcherQueue](../windows.system/dispatcherqueue.md) using the [RadialControllerIndependentInputSource.DispatcherQueue](radialcontrollerindependentinputsource_dispatcherqueue.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.core.radialcontrollerindependentinputsource
 * @namespace Windows.UI.Input.Core
 * @version WindowsRuntime 1.4
 */
class RadialControllerIndependentInputSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerIndependentInputSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerIndependentInputSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of [RadialControllerIndependentInputSource](radialcontrollerindependentinputsource.md) for the running app's current [CoreWindow](../windows.ui.core/corewindow.md).
     * @param {CoreApplicationView} view_ The app window and its thread.
     * @returns {RadialControllerIndependentInputSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.core.radialcontrollerindependentinputsource.createforview
     */
    static CreateForView(view_) {
        if (!RadialControllerIndependentInputSource.HasProp("__IRadialControllerIndependentInputSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Core.RadialControllerIndependentInputSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerIndependentInputSourceStatics.IID)
            RadialControllerIndependentInputSource.__IRadialControllerIndependentInputSourceStatics := IRadialControllerIndependentInputSourceStatics(factoryPtr)
        }

        return RadialControllerIndependentInputSource.__IRadialControllerIndependentInputSourceStatics.CreateForView(view_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a reference to a wheel input device or accessory such as the Surface Dial.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.core.radialcontrollerindependentinputsource.controller
     * @type {RadialController} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * Gets the event message dispatcher associated with the current view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.core.radialcontrollerindependentinputsource.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Gets the [DispatcherQueue](../windows.system/dispatcherqueue.md) associated with this [RadialControllerIndependentInputSource](radialcontrollerindependentinputsource.md).
     * @remarks
     * Some platform objects require thread affinity for posting events back to the thread where the object was instantiated. The [DispatcherQueue](../windows.system/dispatcherqueue.md) lets you post work to this thread. 
     * 
     * These platform objects can be created on the UI thread, where the [DispatcherQueue](../windows.system/dispatcherqueue.md) already exists, or they can be created on a long running, non-UI thread with a DispatcherQueue created with the [DispatcherQueueController.CreateOnDedicatedThread](../windows.system/dispatcherqueuecontroller_createondedicatedthread_660689653.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.core.radialcontrollerindependentinputsource.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RadialController} 
     */
    get_Controller() {
        if (!this.HasProp("__IRadialControllerIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(IRadialControllerIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerIndependentInputSource := IRadialControllerIndependentInputSource(outPtr)
        }

        return this.__IRadialControllerIndependentInputSource.get_Controller()
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        if (!this.HasProp("__IRadialControllerIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(IRadialControllerIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerIndependentInputSource := IRadialControllerIndependentInputSource(outPtr)
        }

        return this.__IRadialControllerIndependentInputSource.get_Dispatcher()
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__IRadialControllerIndependentInputSource2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerIndependentInputSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerIndependentInputSource2 := IRadialControllerIndependentInputSource2(outPtr)
        }

        return this.__IRadialControllerIndependentInputSource2.get_DispatcherQueue()
    }

;@endregion Instance Methods
}
