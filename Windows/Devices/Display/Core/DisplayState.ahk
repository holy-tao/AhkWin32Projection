#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayState.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a slice in time of display pipeline state for a subset of the system's display targets. If [IsReadOnly](displaystate_isreadonly.md) is `false`, then this object can be modified by connecting targets that are owned by the caller's [DisplayManager](displaymanager.md), or by modifying path properties. Modifying a **DisplayState** object, or its child objects, does not directly modify the system's display state until you call [TryApply](displaystate_tryapply_634222246.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether this [DisplayState](displaystate.md) and its child views and paths can be modified.
     * @remarks
     * To take ownership of targets and create modifiable subset of this state object, use [DisplayManager.TryAcquireTargetsAndCreateSubstate](displaymanager_tryacquiretargetsandcreatesubstate_1986245730.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets a value indicating whether the system display state has changed since this [DisplayState](displaystate.md) was created.
     * @remarks
     * A value of `true` means that the other properties of this object can no longer be relied upon to reflect actual hardware state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.isstale
     * @type {Boolean} 
     */
    IsStale {
        get => this.get_IsStale()
    }

    /**
     * Returns the set of [DisplayTarget](displaytarget.md) objects used to create this [DisplayState](displaystate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.targets
     * @type {IVectorView<DisplayTarget>} 
     */
    Targets {
        get => this.get_Targets()
    }

    /**
     * Gets a collection containing the views of the [DisplayState](displaystate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.views
     * @type {IVectorView<DisplayView>} 
     */
    Views {
        get => this.get_Views()
    }

    /**
     * Reserved for future use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.properties
     * @type {IMap<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
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
    get_IsReadOnly() {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.get_IsReadOnly()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStale() {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.get_IsStale()
    }

    /**
     * 
     * @returns {IVectorView<DisplayTarget>} 
     */
    get_Targets() {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.get_Targets()
    }

    /**
     * 
     * @returns {IVectorView<DisplayView>} 
     */
    get_Views() {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.get_Views()
    }

    /**
     * 
     * @returns {IMap<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.get_Properties()
    }

    /**
     * Connects the specified target to an existing logical clone group, and returns the resulting path.
     * @param {DisplayTarget} target A [DisplayTarget](displaytarget.md) object.
     * @returns {DisplayPath} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.connecttarget
     */
    ConnectTarget(target) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.ConnectTarget(target)
    }

    /**
     * Connects the specified target, and returns the resulting path.
     * @param {DisplayTarget} target A [DisplayTarget](displaytarget.md) object.
     * @param {DisplayView} view_ 
     * @returns {DisplayPath} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.connecttarget
     */
    ConnectTargetToView(target, view_) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.ConnectTargetToView(target, view_)
    }

    /**
     * Indicates whether or not the specified target can be connected to the specified view.
     * @param {DisplayTarget} target A [DisplayTarget](displaytarget.md) object.
     * @param {DisplayView} view_ A [DisplayView](displayview.md) object.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.canconnecttargettoview
     */
    CanConnectTargetToView(target, view_) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.CanConnectTargetToView(target, view_)
    }

    /**
     * Retrieves a [DisplayView](displayview.md) object representing the view to which the target is connected.
     * @param {DisplayTarget} target A [DisplayTarget](displaytarget.md) object.
     * @returns {DisplayView} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.getviewfortarget
     */
    GetViewForTarget(target) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.GetViewForTarget(target)
    }

    /**
     * Retrieves a [DisplayPath](displaypath.md) object representing the specified target.
     * @param {DisplayTarget} target A [DisplayTarget](displaytarget.md) object.
     * @returns {DisplayPath} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.getpathfortarget
     */
    GetPathForTarget(target) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.GetPathForTarget(target)
    }

    /**
     * Disconnects the specified target.
     * @param {DisplayTarget} target A [DisplayTarget](displaytarget.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.disconnecttarget
     */
    DisconnectTarget(target) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.DisconnectTarget(target)
    }

    /**
     * Attempts to "functionalize" this [DisplayState](displaystate.md) by trying to evaluate the best modes on all paths given all specified [DisplayPath](displaypath.md) properties as constraints. This method then (optionally, see **Remarks**) updates all **DisplayPath** and [DisplayView](displayview.md) properties with the results of the functionalization. In particular, all **DisplayPath** and **DisplayView** properties set to null will have their values computed and set.
     * @remarks
     * Use the [ValidateTopologyOnly](displaystatefunctionalizeoptions.md) option to prevent updating all **DisplayPath** properties with the results of the functionalization.
     * 
     * Note that calling [TryApply](displaystate_tryapply_634222246.md) also implicitly functionalizes the state before applying it to the system, but **TryApply** never updates this state's **DisplayPath** properties with the results of the functionalization.
     * 
     * Functionalizing a **DisplayState** can be a fairly expensive operation, since it involves querying display drivers and comparing many possible modes. The operation will usually be cheaper if you set more of your **DisplayPath** properties before calling this method (or calling **TryApply**), since it reduces the amount of work needed to evaluate the "best" mode on a given path.
     * 
     * Using **TryFunctionalize** to determine whether the current state can be functionalized before calling **TryApply** is a good practice, since **TryApply** is always more expensive than **TryFunctionalize**. Once **TryFunctionalize** succeeds, a subsequent call to **TryApply** will be cheaper, since it no longer has to do the work of functionalizing modes.
     * @param {Integer} options The [DisplayStateFunctionalizeOptions](displaystatefunctionalizeoptions.md) to use.
     * @returns {DisplayStateOperationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.tryfunctionalize
     */
    TryFunctionalize(options) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.TryFunctionalize(options)
    }

    /**
     * Attempts to atomically apply this [DisplayState](displaystate.md) to the relevant hardware. Implicitly, this involves "functionalizing" all paths to determine the best modes matching all [DisplayPath](displaypath.md) and [DisplayView](displayview.md) properties.
     * @remarks
     * After applying this [DisplayState](displaystate.md), no properties are updated on this object or any of the [DisplayPath](displaypath.md) nor [DisplayView](displayview.md) objects. You can use [DisplayManager.TryAcquireTargetsAndReadCurrentState](displaymanager_tryacquiretargetsandreadcurrentstate_305775428.md) to read the state that was set by the **TryApply** operation.
     * @param {Integer} options The [DisplayStateApplyOptions](displaystateapplyoptions.md) to use.
     * @returns {DisplayStateOperationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.tryapply
     */
    TryApply(options) {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.TryApply(options)
    }

    /**
     * Creates a copy of this **DisplayState** object, including copies of all views and paths.
     * @returns {DisplayState} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystate.clone
     */
    Clone() {
        if (!this.HasProp("__IDisplayState")) {
            if ((queryResult := this.QueryInterface(IDisplayState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayState := IDisplayState(outPtr)
        }

        return this.__IDisplayState.Clone()
    }

;@endregion Instance Methods
}
