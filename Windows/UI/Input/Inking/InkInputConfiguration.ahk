#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkInputConfiguration.ahk
#Include .\IInkInputConfiguration2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages which types of secondary input can be processed by the [InkPresenter](inkpresenter.md) object.
 * @remarks
 * To manage how secondary input is processed by your app, see [InkInputProcessingConfiguration](inkinputprocessingconfiguration.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputconfiguration
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkInputConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkInputConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkInputConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether input from a pen's primary barrel button is processed by the [InkPresenter](inkpresenter.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputconfiguration.isprimarybarrelbuttoninputenabled
     * @type {Boolean} 
     */
    IsPrimaryBarrelButtonInputEnabled {
        get => this.get_IsPrimaryBarrelButtonInputEnabled()
        set => this.put_IsPrimaryBarrelButtonInputEnabled(value)
    }

    /**
     * Gets or sets whether input from a pen's eraser tip is processed by the [InkPresenter](inkpresenter.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputconfiguration.iseraserinputenabled
     * @type {Boolean} 
     */
    IsEraserInputEnabled {
        get => this.get_IsEraserInputEnabled()
        set => this.put_IsEraserInputEnabled(value)
    }

    /**
     * Gets or sets whether pen haptic feedback is enabled for the active pen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputconfiguration.ispenhapticfeedbackenabled
     * @type {Boolean} 
     */
    IsPenHapticFeedbackEnabled {
        get => this.get_IsPenHapticFeedbackEnabled()
        set => this.put_IsPenHapticFeedbackEnabled(value)
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
    get_IsPrimaryBarrelButtonInputEnabled() {
        if (!this.HasProp("__IInkInputConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputConfiguration := IInkInputConfiguration(outPtr)
        }

        return this.__IInkInputConfiguration.get_IsPrimaryBarrelButtonInputEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPrimaryBarrelButtonInputEnabled(value) {
        if (!this.HasProp("__IInkInputConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputConfiguration := IInkInputConfiguration(outPtr)
        }

        return this.__IInkInputConfiguration.put_IsPrimaryBarrelButtonInputEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEraserInputEnabled() {
        if (!this.HasProp("__IInkInputConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputConfiguration := IInkInputConfiguration(outPtr)
        }

        return this.__IInkInputConfiguration.get_IsEraserInputEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEraserInputEnabled(value) {
        if (!this.HasProp("__IInkInputConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputConfiguration := IInkInputConfiguration(outPtr)
        }

        return this.__IInkInputConfiguration.put_IsEraserInputEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPenHapticFeedbackEnabled() {
        if (!this.HasProp("__IInkInputConfiguration2")) {
            if ((queryResult := this.QueryInterface(IInkInputConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputConfiguration2 := IInkInputConfiguration2(outPtr)
        }

        return this.__IInkInputConfiguration2.get_IsPenHapticFeedbackEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPenHapticFeedbackEnabled(value) {
        if (!this.HasProp("__IInkInputConfiguration2")) {
            if ((queryResult := this.QueryInterface(IInkInputConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputConfiguration2 := IInkInputConfiguration2(outPtr)
        }

        return this.__IInkInputConfiguration2.put_IsPenHapticFeedbackEnabled(value)
    }

;@endregion Instance Methods
}
