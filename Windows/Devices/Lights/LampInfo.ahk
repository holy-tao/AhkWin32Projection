#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Container of various properties of an individual lamp for a specific index.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class LampInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Zero based index of the lamp.  Every lamp is associated with one unique index.
     * @remarks
     * Valid indexes are in the range of 0 to [LampCount](lamparray_lampcount.md) - 1.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.index
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * Purpose/s of the lamp.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.purposes
     * @type {Integer} 
     */
    Purposes {
        get => this.get_Purposes()
    }

    /**
     * 3D position of the lamp relative to the origin of the bounding-box.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * The number of red intensities settable for this lamp.
     * @remarks
     * If the lamp index has a fixed color, this will be 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.redlevelcount
     * @type {Integer} 
     */
    RedLevelCount {
        get => this.get_RedLevelCount()
    }

    /**
     * The number of green intensities settable for this lamp.
     * @remarks
     * If the lamp index has a fixed color, this will be 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.greenlevelcount
     * @type {Integer} 
     */
    GreenLevelCount {
        get => this.get_GreenLevelCount()
    }

    /**
     * The number of blue intensities settable for this lamp.
     * @remarks
     * If the lamp index has a fixed color, this will 0.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.bluelevelcount
     * @type {Integer} 
     */
    BlueLevelCount {
        get => this.get_BlueLevelCount()
    }

    /**
     * The number of color independent intensities settable for this lamp.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.gainlevelcount
     * @type {Integer} 
     */
    GainLevelCount {
        get => this.get_GainLevelCount()
    }

    /**
     * If this lamp index has a fixed color, the color is returned; otherwise null.
     * @remarks
     * Inspect [GainLevelCount](lampinfo_gainlevelcount.md) for possible scaling of this lamp color.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.fixedcolor
     * @type {IReference<Color>} 
     */
    FixedColor {
        get => this.get_FixedColor()
    }

    /**
     * Time between the device receiving an update for a lamp and it emanating from the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.updatelatency
     * @type {TimeSpan} 
     */
    UpdateLatency {
        get => this.get_UpdateLatency()
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
    get_Index() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_Index()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Purposes() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_Purposes()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RedLevelCount() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_RedLevelCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GreenLevelCount() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_GreenLevelCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BlueLevelCount() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_BlueLevelCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GainLevelCount() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_GainLevelCount()
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_FixedColor() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_FixedColor()
    }

    /**
     * Finds the nearest/closest matching color to the desired color, supported by this lamp.  Call this to know whether a specific color will be applied during (e.g.) [LampArray.SetColor](lamparray_setcolor_1486217082.md)
     * @remarks
     * Not every lamp on a LampArray is guaranteed to support true 24-bit RGB color (is dependent on device capabilities). Based on the available color levels the nearest color is determined, assuming that each channel is linearly scaled over the available levels.
     * @param {Color} desiredColor The color to find the nearest/closest.
     * @returns {Color} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lampinfo.getnearestsupportedcolor
     */
    GetNearestSupportedColor(desiredColor) {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.GetNearestSupportedColor(desiredColor)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UpdateLatency() {
        if (!this.HasProp("__ILampInfo")) {
            if ((queryResult := this.QueryInterface(ILampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampInfo := ILampInfo(outPtr)
        }

        return this.__ILampInfo.get_UpdateLatency()
    }

;@endregion Instance Methods
}
