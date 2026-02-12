#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDigitalWindowBounds.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the bounds of the digital window captured when the [DigitalWindowControl](digitalwindowcontrol.md) is active.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowbounds
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class DigitalWindowBounds extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDigitalWindowBounds

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDigitalWindowBounds.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the y-axis value of the top side of the digital window bounds.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowbounds.normalizedorigintop
     * @type {Float} 
     */
    NormalizedOriginTop {
        get => this.get_NormalizedOriginTop()
        set => this.put_NormalizedOriginTop(value)
    }

    /**
     * Gets or sets the x-axis value of the left side of the digital window bounds.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowbounds.normalizedoriginleft
     * @type {Float} 
     */
    NormalizedOriginLeft {
        get => this.get_NormalizedOriginLeft()
        set => this.put_NormalizedOriginLeft(value)
    }

    /**
     * Gets or sets a value specifying the scale of the digital window bounds.
     * @remarks
     * The digital window must have the same aspect ratio as the capture preview stream, so rather than specifying a width and height, apps specify a scale value relative to the preview stream resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowbounds.scale
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the **DigitalWindowBounds** class.
     * @remarks
     * Find the range of supported bounds values for the capture device by calling [DigitalWindowControl.GetCapabilitiesForSize](digitalwindowcontrol_getcapabilityforsize_1381309850.md). Set the bounds of the digital window by calling [DigitalWindowControl.Configure](digitalwindowcontrol_configure_1826541684.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.DigitalWindowBounds")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NormalizedOriginTop() {
        if (!this.HasProp("__IDigitalWindowBounds")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowBounds := IDigitalWindowBounds(outPtr)
        }

        return this.__IDigitalWindowBounds.get_NormalizedOriginTop()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_NormalizedOriginTop(value) {
        if (!this.HasProp("__IDigitalWindowBounds")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowBounds := IDigitalWindowBounds(outPtr)
        }

        return this.__IDigitalWindowBounds.put_NormalizedOriginTop(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NormalizedOriginLeft() {
        if (!this.HasProp("__IDigitalWindowBounds")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowBounds := IDigitalWindowBounds(outPtr)
        }

        return this.__IDigitalWindowBounds.get_NormalizedOriginLeft()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_NormalizedOriginLeft(value) {
        if (!this.HasProp("__IDigitalWindowBounds")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowBounds := IDigitalWindowBounds(outPtr)
        }

        return this.__IDigitalWindowBounds.put_NormalizedOriginLeft(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        if (!this.HasProp("__IDigitalWindowBounds")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowBounds := IDigitalWindowBounds(outPtr)
        }

        return this.__IDigitalWindowBounds.get_Scale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__IDigitalWindowBounds")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowBounds := IDigitalWindowBounds(outPtr)
        }

        return this.__IDigitalWindowBounds.put_Scale(value)
    }

;@endregion Instance Methods
}
