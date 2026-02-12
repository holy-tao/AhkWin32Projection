#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRegionOfInterest.ahk
#Include .\IRegionOfInterest2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a region of interest which is a rectangular region on the image which is used for functions such as focus and exposure.
 * @remarks
 * Get an instance of this class by accessing the [RegionOfInterest](regionofinterest_regionofinterest_1221375020.md) property.
 * 
 * The region of interest specifies the rectangular area of preview that functions such as focus and exposure are computed over. This enables scenarios such as tap to focus.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class RegionOfInterest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRegionOfInterest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRegionOfInterest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies if auto focus is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest.autofocusenabled
     * @type {Boolean} 
     */
    AutoFocusEnabled {
        get => this.get_AutoFocusEnabled()
        set => this.put_AutoFocusEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if auto white balance is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest.autowhitebalanceenabled
     * @type {Boolean} 
     */
    AutoWhiteBalanceEnabled {
        get => this.get_AutoWhiteBalanceEnabled()
        set => this.put_AutoWhiteBalanceEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if auto exposure is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest.autoexposureenabled
     * @type {Boolean} 
     */
    AutoExposureEnabled {
        get => this.get_AutoExposureEnabled()
        set => this.put_AutoExposureEnabled(value)
    }

    /**
     * Gets or sets the rectangle that defines the region of focus.
     * @remarks
     * To specify a point with non-normalized coordinates, meaning the [BoundsNormalized](regionofinterest_boundsnormalized.md) property is not set or set to FALSE, you should specify a rectangle with width of 1 and height of 1.
     * 
     * To specify a point with normalized coordinates, meaning [BoundsNormalized](regionofinterest_boundsnormalized.md) is set to TRUE, you should specify a rectangle with width of FLT_EPSILON and height of FLT_EPSILON.
     * 
     * If the region of interest specified by the developer is smaller than what is supported by the hardware, the driver will default to the smallest supported rectangle possible that fully contains the specified region.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
        set => this.put_Bounds(value)
    }

    /**
     * Gets or sets the type of region represented by the [RegionOfInterest](regionofinterest.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets a value indicating whether the [Bounds](regionofinterest_bounds.md) Rect is in pixels or is mapped to a range of 0 to 1.0.
     * @remarks
     * For information on how this property affects the bounds of the region of interest, see the [Bounds](regionofinterest_bounds.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest.boundsnormalized
     * @type {Boolean} 
     */
    BoundsNormalized {
        get => this.get_BoundsNormalized()
        set => this.put_BoundsNormalized(value)
    }

    /**
     * Gets or sets the weight of the region of interest.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionofinterest.weight
     * @type {Integer} 
     */
    Weight {
        get => this.get_Weight()
        set => this.put_Weight(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [RegionOfInterest](regionofinterest.md) control.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.RegionOfInterest")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoFocusEnabled() {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.get_AutoFocusEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoFocusEnabled(value) {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.put_AutoFocusEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoWhiteBalanceEnabled() {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.get_AutoWhiteBalanceEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoWhiteBalanceEnabled(value) {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.put_AutoWhiteBalanceEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoExposureEnabled() {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.get_AutoExposureEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoExposureEnabled(value) {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.put_AutoExposureEnabled(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.get_Bounds()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Bounds(value) {
        if (!this.HasProp("__IRegionOfInterest")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest := IRegionOfInterest(outPtr)
        }

        return this.__IRegionOfInterest.put_Bounds(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IRegionOfInterest2")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest2 := IRegionOfInterest2(outPtr)
        }

        return this.__IRegionOfInterest2.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__IRegionOfInterest2")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest2 := IRegionOfInterest2(outPtr)
        }

        return this.__IRegionOfInterest2.put_Type(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BoundsNormalized() {
        if (!this.HasProp("__IRegionOfInterest2")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest2 := IRegionOfInterest2(outPtr)
        }

        return this.__IRegionOfInterest2.get_BoundsNormalized()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BoundsNormalized(value) {
        if (!this.HasProp("__IRegionOfInterest2")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest2 := IRegionOfInterest2(outPtr)
        }

        return this.__IRegionOfInterest2.put_BoundsNormalized(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Weight() {
        if (!this.HasProp("__IRegionOfInterest2")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest2 := IRegionOfInterest2(outPtr)
        }

        return this.__IRegionOfInterest2.get_Weight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Weight(value) {
        if (!this.HasProp("__IRegionOfInterest2")) {
            if ((queryResult := this.QueryInterface(IRegionOfInterest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionOfInterest2 := IRegionOfInterest2(outPtr)
        }

        return this.__IRegionOfInterest2.put_Weight(value)
    }

;@endregion Instance Methods
}
