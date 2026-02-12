#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IZoomSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents zoom settings that can be applied to the [ZoomControl](zoomcontrol.md) by calling the [Configure](zoomcontrol_configure_1205629206.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomsettings
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ZoomSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IZoomSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IZoomSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a [ZoomTransitionMode](zoomtransitionmode.md) value indicating how the capture device should transition to the new zoom value specified with the [Value](zoomsettings_value.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomsettings.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets the zoom value to which the [ZoomControl](zoomcontrol.md) will transition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomsettings.value
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ZoomSettings](zoomsettings.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.ZoomSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IZoomSettings")) {
            if ((queryResult := this.QueryInterface(IZoomSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomSettings := IZoomSettings(outPtr)
        }

        return this.__IZoomSettings.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IZoomSettings")) {
            if ((queryResult := this.QueryInterface(IZoomSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomSettings := IZoomSettings(outPtr)
        }

        return this.__IZoomSettings.put_Mode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        if (!this.HasProp("__IZoomSettings")) {
            if ((queryResult := this.QueryInterface(IZoomSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomSettings := IZoomSettings(outPtr)
        }

        return this.__IZoomSettings.get_Value()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IZoomSettings")) {
            if ((queryResult := this.QueryInterface(IZoomSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IZoomSettings := IZoomSettings(outPtr)
        }

        return this.__IZoomSettings.put_Value(value)
    }

;@endregion Instance Methods
}
