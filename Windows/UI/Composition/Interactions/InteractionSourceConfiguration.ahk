#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionObject.ahk
#Include .\IInteractionSourceConfiguration.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the configuration of a VisualInteractionSource input.
 * @remarks
 * By default, [VisualInteractionSource](visualinteractionsource.md) uses the same configuration for all types of input. InteractionSourceConfiguration lets you override the default configuration for a specific type of input.
 * 
 * For example, you might use touch and touchpad inputs to control panning (X, Y) and zoom, but use pointer wheel input only for zoom. In this case, you can use the InteractionSourceConfiguration returned by [VisualInteractionSource.PointerWheelConfig](visualinteractionsource_pointerwheelconfig.md) to override the configuration of [PositionXSourceMode](visualinteractionsource_positionxsourcemode.md) and [PositionYSourceMode](visualinteractionsource_positionysourcemode.md) and disable them for pointer wheel input only.
 * 
 * ```csharp
 * // Set the defaults for the VisualInteractionSource.
 * interactionSource.PositionXSourceMode = InteractionSourceMode.EnabledWithInertia;
 * interactionSource.PositionYSourceMode = InteractionSourceMode.EnabledWithInertia;
 * interactionSource.ScaleSourceMode = InteractionSourceMode.EnabledWithInertia;
 * 
 * // Modify the pointer wheel configuration to disable X and Y.
 * // PointerWheelConfig returns an instance of InteractionSourceConfiguration.
 * interactionSource.PointerWheelConfig.PositionXSourceMode =
 *     InteractionSourceRedirectionMode.Disabled;
 * interactionSource.PointerWheelConfig.PositionYSourceMode =
 *     InteractionSourceRedirectionMode.Disabled;
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionsourceconfiguration
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionSourceConfiguration extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionSourceConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionSourceConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates how interactions are processed for this [VisualInteractionSource](visualinteractionsource.md) input on the X axis.
     * @remarks
     * This property overrides the configuration of [VisualInteractionSource.PositionXSourceMode](visualinteractionsource_positionxsourcemode.md). It must be enabled to allow the [VisualInteractionSource](visualinteractionsource.md) to send X-axis data to [InteractionTracker](interactiontracker.md).
     * 
     * For more info, see [VisualInteractionSource.PointerWheelConfig](visualinteractionsource_pointerwheelconfig.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionsourceconfiguration.positionxsourcemode
     * @type {Integer} 
     */
    PositionXSourceMode {
        get => this.get_PositionXSourceMode()
        set => this.put_PositionXSourceMode(value)
    }

    /**
     * Gets or sets a value that indicates how interactions are processed for this [VisualInteractionSource](visualinteractionsource.md) input on the Y axis.
     * @remarks
     * This property overrides the configuration of [VisualInteractionSource.PositionYSourceMode](visualinteractionsource_positionysourcemode.md). It must be enabled to allow the [VisualInteractionSource](visualinteractionsource.md) to send Y-axis data to [InteractionTracker](interactiontracker.md).
     * 
     * For more info, see [VisualInteractionSource.PointerWheelConfig](visualinteractionsource_pointerwheelconfig.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionsourceconfiguration.positionysourcemode
     * @type {Integer} 
     */
    PositionYSourceMode {
        get => this.get_PositionYSourceMode()
        set => this.put_PositionYSourceMode(value)
    }

    /**
     * Gets or sets a value that indicates how interactions are processed for this [VisualInteractionSource](visualinteractionsource.md) input on the scale axis.
     * @remarks
     * This property overrides the configuration of [VisualInteractionSource.ScaleSourceMode](visualinteractionsource_scalesourcemode.md). It must be enabled to allow the [VisualInteractionSource](visualinteractionsource.md) to send scale data to [InteractionTracker](interactiontracker.md).
     * 
     * For more info, see [VisualInteractionSource.PointerWheelConfig](visualinteractionsource_pointerwheelconfig.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionsourceconfiguration.scalesourcemode
     * @type {Integer} 
     */
    ScaleSourceMode {
        get => this.get_ScaleSourceMode()
        set => this.put_ScaleSourceMode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionXSourceMode() {
        if (!this.HasProp("__IInteractionSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IInteractionSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionSourceConfiguration := IInteractionSourceConfiguration(outPtr)
        }

        return this.__IInteractionSourceConfiguration.get_PositionXSourceMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionXSourceMode(value) {
        if (!this.HasProp("__IInteractionSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IInteractionSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionSourceConfiguration := IInteractionSourceConfiguration(outPtr)
        }

        return this.__IInteractionSourceConfiguration.put_PositionXSourceMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionYSourceMode() {
        if (!this.HasProp("__IInteractionSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IInteractionSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionSourceConfiguration := IInteractionSourceConfiguration(outPtr)
        }

        return this.__IInteractionSourceConfiguration.get_PositionYSourceMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionYSourceMode(value) {
        if (!this.HasProp("__IInteractionSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IInteractionSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionSourceConfiguration := IInteractionSourceConfiguration(outPtr)
        }

        return this.__IInteractionSourceConfiguration.put_PositionYSourceMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaleSourceMode() {
        if (!this.HasProp("__IInteractionSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IInteractionSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionSourceConfiguration := IInteractionSourceConfiguration(outPtr)
        }

        return this.__IInteractionSourceConfiguration.get_ScaleSourceMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScaleSourceMode(value) {
        if (!this.HasProp("__IInteractionSourceConfiguration")) {
            if ((queryResult := this.QueryInterface(IInteractionSourceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionSourceConfiguration := IInteractionSourceConfiguration(outPtr)
        }

        return this.__IInteractionSourceConfiguration.put_ScaleSourceMode(value)
    }

;@endregion Instance Methods
}
