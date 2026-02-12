#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapCustomExperience.ahk
#Include .\IStreetsideExperience.ahk
#Include .\IStreetsideExperienceFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a custom map experience that provides a street-level view of a geographic location.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class StreetsideExperience extends MapCustomExperience {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreetsideExperience

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreetsideExperience.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [StreetsideExperience](streetsideexperience.md) based on the specified panoramic view.
     * @remarks
     * This constructor is equivalent to calling [StreetsideExperience(StreetsidePanorama, Double, Double, Double)](streetsideexperience_streetsideexperience_675528640.md) with the following default parameter values: *headingInDegrees* = 0 (North), *pitchInDegrees* = 90 (looking at the horizon), and *fieldOfViewInDegrees* = 75.
     * @param {StreetsidePanorama} panorama The panoramic view to appear in the [StreetsideExperience](streetsideexperience.md).
     * @returns {StreetsideExperience} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.#ctor
     */
    static CreateInstanceWithPanorama(panorama) {
        if (!StreetsideExperience.HasProp("__IStreetsideExperienceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.StreetsideExperience")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStreetsideExperienceFactory.IID)
            StreetsideExperience.__IStreetsideExperienceFactory := IStreetsideExperienceFactory(factoryPtr)
        }

        return StreetsideExperience.__IStreetsideExperienceFactory.CreateInstanceWithPanorama(panorama)
    }

    /**
     * Creates a [StreetsideExperience](streetsideexperience.md) based on the specified panoramic view and camera position.
     * @remarks
     * The valid range of pitch differs between 2D, 3D, and Streetside map views. When switching from 3D to 2D for example, values that are acceptable in the current view may be out of range in the next view. If that’s the case, the current pitch value will be truncated to the nearest acceptable value in the next view.
     * 
     * When leaving a Streetside view, the map returns to the previous view settings. The Streetside pitch is not maintained outside of the Streetside experience.
     * 
     * The maximum and minimum values of pitch/tilt depend on the type of map view: 2D, 3D, or Streetside. The range for field of view is the same in all views.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>pitch/tilt</td><td>0-75</td><td>0-90</td><td>0-180</td></tr>
     *    <tr><td>field of view</td><td>22-90</td><td>22-90</td><td>22-90</td></tr>
     * </table>
     * 
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {StreetsidePanorama} panorama The panoramic view to appear in the [StreetsideExperience](streetsideexperience.md).
     * @param {Float} headingInDegrees The directional heading of the map's camera in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West. The default *headingInDegrees* value is 0.
     * @param {Float} pitchInDegrees The pitch of the map's camera in degrees, where 90 is looking out at the horizon (maximum) and 0 is looking straight down (minimum). The default *pitchInDegrees* value is 90.
     * @param {Float} fieldOfViewInDegrees The horizontal angle of view that appears in the map's camera, in degrees. The default *fieldOfViewInDegrees* value is 75.
     * @returns {StreetsideExperience} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.#ctor
     */
    static CreateInstanceWithPanoramaHeadingPitchAndFieldOfView(panorama, headingInDegrees, pitchInDegrees, fieldOfViewInDegrees) {
        if (!StreetsideExperience.HasProp("__IStreetsideExperienceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.StreetsideExperience")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStreetsideExperienceFactory.IID)
            StreetsideExperience.__IStreetsideExperienceFactory := IStreetsideExperienceFactory(factoryPtr)
        }

        return StreetsideExperience.__IStreetsideExperienceFactory.CreateInstanceWithPanoramaHeadingPitchAndFieldOfView(panorama, headingInDegrees, pitchInDegrees, fieldOfViewInDegrees)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates if address text is visible in the [StreetsideExperience](streetsideexperience.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.addresstextvisible
     * @type {Boolean} 
     */
    AddressTextVisible {
        get => this.get_AddressTextVisible()
        set => this.put_AddressTextVisible(value)
    }

    /**
     * Gets or sets a value that indicates if the cursor is visible in the [StreetsideExperience](streetsideexperience.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.cursorvisible
     * @type {Boolean} 
     */
    CursorVisible {
        get => this.get_CursorVisible()
        set => this.put_CursorVisible(value)
    }

    /**
     * Gets or sets a value that indicates if the overview map is visible in the [StreetsideExperience](streetsideexperience.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.overviewmapvisible
     * @type {Boolean} 
     */
    OverviewMapVisible {
        get => this.get_OverviewMapVisible()
        set => this.put_OverviewMapVisible(value)
    }

    /**
     * Gets or sets a value that indicates if street labels are visible in the [StreetsideExperience](streetsideexperience.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.streetlabelsvisible
     * @type {Boolean} 
     */
    StreetLabelsVisible {
        get => this.get_StreetLabelsVisible()
        set => this.put_StreetLabelsVisible(value)
    }

    /**
     * Gets or sets a value that indicates if the exit button is visible in the [StreetsideExperience](streetsideexperience.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.exitbuttonvisible
     * @type {Boolean} 
     */
    ExitButtonVisible {
        get => this.get_ExitButtonVisible()
        set => this.put_ExitButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates if zoom buttons are visible in the [StreetsideExperience](streetsideexperience.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsideexperience.zoombuttonsvisible
     * @type {Boolean} 
     */
    ZoomButtonsVisible {
        get => this.get_ZoomButtonsVisible()
        set => this.put_ZoomButtonsVisible(value)
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
    get_AddressTextVisible() {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.get_AddressTextVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AddressTextVisible(value) {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.put_AddressTextVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CursorVisible() {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.get_CursorVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CursorVisible(value) {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.put_CursorVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OverviewMapVisible() {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.get_OverviewMapVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_OverviewMapVisible(value) {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.put_OverviewMapVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StreetLabelsVisible() {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.get_StreetLabelsVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StreetLabelsVisible(value) {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.put_StreetLabelsVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExitButtonVisible() {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.get_ExitButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExitButtonVisible(value) {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.put_ExitButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ZoomButtonsVisible() {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.get_ZoomButtonsVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ZoomButtonsVisible(value) {
        if (!this.HasProp("__IStreetsideExperience")) {
            if ((queryResult := this.QueryInterface(IStreetsideExperience.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsideExperience := IStreetsideExperience(outPtr)
        }

        return this.__IStreetsideExperience.put_ZoomButtonsVisible(value)
    }

;@endregion Instance Methods
}
