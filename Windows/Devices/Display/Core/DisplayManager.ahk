#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayManager.ahk
#Include .\IDisplayManager2.ahk
#Include .\IDisplayManager3.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IDisplayManagerStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DisplayManager.ahk
#Include .\DisplayManagerEnabledEventArgs.ahk
#Include .\DisplayManagerDisabledEventArgs.ahk
#Include .\DisplayManagerChangedEventArgs.ahk
#Include .\DisplayManagerPathsFailedOrInvalidatedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Manages the ownership of a [DisplayTarget](displaytarget.md) object or objects, and provides methods to create [DisplayState](displaystate.md) objects.
 * @remarks
 * This object implements **IClosable*/*IDisposable**, which should be used to revoke ownership of all [DisplayTarget](displaytarget.md) objects once they are no longer being used.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [DisplayManager](displaymanager.md) instance with the specified options.
     * @param {Integer} options 
     * @returns {DisplayManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.create
     */
    static Create(options) {
        if (!DisplayManager.HasProp("__IDisplayManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayManagerStatics.IID)
            DisplayManager.__IDisplayManagerStatics := IDisplayManagerStatics(factoryPtr)
        }

        return DisplayManager.__IDisplayManagerStatics.Create(options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnEnabledToken")) {
            this.remove_Enabled(this.__OnEnabledToken)
            this.__OnEnabled.iface.Dispose()
        }

        if(this.HasProp("__OnDisabledToken")) {
            this.remove_Disabled(this.__OnDisabledToken)
            this.__OnDisabled.iface.Dispose()
        }

        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPathsFailedOrInvalidatedToken")) {
            this.remove_PathsFailedOrInvalidated(this.__OnPathsFailedOrInvalidatedToken)
            this.__OnPathsFailedOrInvalidated.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Enumerates the set of display targets currently present on the system.
     * @returns {IVectorView<DisplayTarget>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.getcurrenttargets
     */
    GetCurrentTargets() {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.GetCurrentTargets()
    }

    /**
     * Enumerates the set of display adapters currently present on the system.
     * @returns {IVectorView<DisplayAdapter>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.getcurrentadapters
     */
    GetCurrentAdapters() {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.GetCurrentAdapters()
    }

    /**
     * Attempts to acquire exclusive ownership of a [DisplayTarget](displaytarget.md).
     * @param {DisplayTarget} target The [DisplayTarget](displaytarget.md) to try to acquire exclusive ownership of.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.tryacquiretarget
     */
    TryAcquireTarget(target) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.TryAcquireTarget(target)
    }

    /**
     * Releases ownership of the specified display target, allowing other components on the system to acquire ownership.
     * @param {DisplayTarget} target The [DisplayTarget](displaytarget.md) to release ownership of.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.releasetarget
     */
    ReleaseTarget(target) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.ReleaseTarget(target)
    }

    /**
     * Creates a read-only [DisplayState](displaystate.md) object populated with the entire system display state for all targets.
     * @returns {DisplayManagerResultWithState} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.tryreadcurrentstateforalltargets
     */
    TryReadCurrentStateForAllTargets() {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.TryReadCurrentStateForAllTargets()
    }

    /**
     * Attempts to acquire exclusive ownership of a collection of [DisplayTarget](displaytarget.md) objects, and creates a modifiable [DisplayState](displaystate.md) populated with the current state of the supplied targets.
     * @param {IIterable<DisplayTarget>} targets A collection of [DisplayTarget](displaytarget.md) objects whose ownership will be attempted to be acquired.
     * @returns {DisplayManagerResultWithState} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.tryacquiretargetsandreadcurrentstate
     */
    TryAcquireTargetsAndReadCurrentState(targets) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.TryAcquireTargetsAndReadCurrentState(targets)
    }

    /**
     * Attempts to acquire exclusive ownership of a collection of [DisplayTarget](displaytarget.md) objects, and creates an empty modifiable [DisplayState](displaystate.md) object, which supports connecting paths to these targets.
     * @param {IIterable<DisplayTarget>} targets A collection of [DisplayTarget](displaytarget.md) objects whose ownership will be attempted to be acquired.
     * @returns {DisplayManagerResultWithState} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.tryacquiretargetsandcreateemptystate
     */
    TryAcquireTargetsAndCreateEmptyState(targets) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.TryAcquireTargetsAndCreateEmptyState(targets)
    }

    /**
     * Attempts to acquire exclusive ownership of a collection of [DisplayTarget](displaytarget.md) objects, and carves out a subset of a given [DisplayState](displaystate.md) for only the targets passed to this method. The resulting state can be modified and applied.
     * @param {DisplayState} existingState An existing [DisplayState](displaystate.md) object to carve out a subset of paths to create the new [DisplayState](displaystate.md) result.
     * @param {IIterable<DisplayTarget>} targets A collection of [DisplayTarget](displaytarget.md) objects whose ownership will be attempted to be acquired.
     * @returns {DisplayManagerResultWithState} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.tryacquiretargetsandcreatesubstate
     */
    TryAcquireTargetsAndCreateSubstate(existingState, targets) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.TryAcquireTargetsAndCreateSubstate(existingState, targets)
    }

    /**
     * Creates a [DisplayDevice](displaydevice.md) object for the given adapter. The **DisplayDevice** can be used to create and present full-screen content to targets on the given adapter.
     * @param {DisplayAdapter} adapter_ The [DisplayAdapter](displayadapter.md) to create a [DisplayDevice](displaydevice.md) for.
     * @returns {DisplayDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.createdisplaydevice
     */
    CreateDisplayDevice(adapter_) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.CreateDisplayDevice(adapter_)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerEnabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Enabled(handler) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.add_Enabled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Enabled(token) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.remove_Enabled(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerDisabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Disabled(handler) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.add_Disabled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Disabled(token) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.remove_Disabled(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.remove_Changed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerPathsFailedOrInvalidatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PathsFailedOrInvalidated(handler) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.add_PathsFailedOrInvalidated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PathsFailedOrInvalidated(token) {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.remove_PathsFailedOrInvalidated(token)
    }

    /**
     * Starts listening for all [DisplayManager](displaymanager.md) events atomically. [DisplayManager](displaymanager.md) events are not raised until you call **Start**.
     * @remarks
     * All callers of **Start** are required to have subscribed to [Enabled](displaymanager_enabled.md), [Disabled](displaymanager_disabled.md), [Changed](displaymanager_changed.md), and [PathsFailedOrInvalidated](displaymanager_pathsfailedorinvalidated.md). **Start** fails if there are no subscribers to any of those events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.start
     */
    Start() {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.Start()
    }

    /**
     * Stops listening to all [DisplayManager](displaymanager.md) events atomically, and triggers [Disabled](displaymanager_disabled.md) synchronously.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.stop
     */
    Stop() {
        if (!this.HasProp("__IDisplayManager")) {
            if ((queryResult := this.QueryInterface(IDisplayManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager := IDisplayManager(outPtr)
        }

        return this.__IDisplayManager.Stop()
    }

    /**
     * 
     * @returns {DisplayManagerResultWithState} 
     */
    TryReadCurrentStateForModeQuery() {
        if (!this.HasProp("__IDisplayManager2")) {
            if ((queryResult := this.QueryInterface(IDisplayManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager2 := IDisplayManager2(outPtr)
        }

        return this.__IDisplayManager2.TryReadCurrentStateForModeQuery()
    }

    /**
     * 
     * @param {DisplayAdapter} indirectAdapter 
     * @param {DisplayAdapter} renderAdapter 
     * @returns {DisplayDevice} 
     */
    CreateDisplayDeviceForIndirectAdapter(indirectAdapter, renderAdapter) {
        if (!this.HasProp("__IDisplayManager3")) {
            if ((queryResult := this.QueryInterface(IDisplayManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManager3 := IDisplayManager3(outPtr)
        }

        return this.__IDisplayManager3.CreateDisplayDeviceForIndirectAdapter(indirectAdapter, renderAdapter)
    }

    /**
     * Revokes ownership of all [DisplayTarget](displaytarget.md) objects owned by this [DisplayManager](displaymanager.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanager.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
