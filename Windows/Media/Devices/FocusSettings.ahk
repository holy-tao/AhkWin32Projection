#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents settings for a [FocusControl](focuscontrol.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focussettings
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class FocusSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating the focus mode setting.
     * @remarks
     * Autofocus mode, enabled by using the [FocusMode.Continuous](focusmode.md) value, is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on continuous autofocus.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focussettings.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets a value indicating the auto focus range setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focussettings.autofocusrange
     * @type {Integer} 
     */
    AutoFocusRange {
        get => this.get_AutoFocusRange()
        set => this.put_AutoFocusRange(value)
    }

    /**
     * Gets or sets the focus value setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focussettings.value
     * @type {IReference<Integer>} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets a value indicating the manual focus distance setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focussettings.distance
     * @type {IReference<Integer>} 
     */
    Distance {
        get => this.get_Distance()
        set => this.put_Distance(value)
    }

    /**
     * Gets or sets a value indicating whether the capture device should wait for focus before capturing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focussettings.waitforfocus
     * @type {Boolean} 
     */
    WaitForFocus {
        get => this.get_WaitForFocus()
        set => this.put_WaitForFocus(value)
    }

    /**
     * Gets or sets a value that indicates to the driver if it should disable determining a focus position when the focus search fails.
     * @remarks
     * This property only impacts autofocus (single autofocus and continuous autofocus).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focussettings.disabledriverfallback
     * @type {Boolean} 
     */
    DisableDriverFallback {
        get => this.get_DisableDriverFallback()
        set => this.put_DisableDriverFallback(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FocusSettings](focussettings.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.FocusSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.put_Mode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoFocusRange() {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.get_AutoFocusRange()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoFocusRange(value) {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.put_AutoFocusRange(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Value() {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.get_Value()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.put_Value(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Distance() {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.get_Distance()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Distance(value) {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.put_Distance(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WaitForFocus() {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.get_WaitForFocus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_WaitForFocus(value) {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.put_WaitForFocus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisableDriverFallback() {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.get_DisableDriverFallback()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DisableDriverFallback(value) {
        if (!this.HasProp("__IFocusSettings")) {
            if ((queryResult := this.QueryInterface(IFocusSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusSettings := IFocusSettings(outPtr)
        }

        return this.__IFocusSettings.put_DisableDriverFallback(value)
    }

;@endregion Instance Methods
}
