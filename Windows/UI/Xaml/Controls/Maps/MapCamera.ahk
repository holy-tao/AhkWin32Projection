#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapCamera.ahk
#Include .\IMapCameraFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the position of a camera to define the view of a map.
 * @remarks
 * The MapCamera class uses a position to define the view of a map in the same way that the position of a real camera determines its view of the Earth.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapCamera extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapCamera

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapCamera.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a map camera, to define the view of a map based on location.
     * @remarks
     * This constructor is equivalent to calling [MapCamera(Geopoint, Double, Double, Double, Double)](mapcamera_mapcamera_1532703584.md) with the following default parameter values: *headingInDegrees* = 0 (North), *pitchInDegrees* = 0 (looking straight down), *rollInDegrees* = 0 (no tilt), and *fieldOfViewInDegrees* = 45.
     * @param {Geopoint} location_ The location of the camera in the map.
     * @returns {MapCamera} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.#ctor
     */
    static CreateInstanceWithLocation(location_) {
        if (!MapCamera.HasProp("__IMapCameraFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapCamera")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapCameraFactory.IID)
            MapCamera.__IMapCameraFactory := IMapCameraFactory(factoryPtr)
        }

        return MapCamera.__IMapCameraFactory.CreateInstanceWithLocation(location_)
    }

    /**
     * Creates a map camera, to define the view of a map based on location and heading.
     * @remarks
     * This constructor is equivalent to calling [MapCamera(Geopoint, Double, Double, Double, Double)](mapcamera_mapcamera_1532703584.md) with the following default parameter values: *pitchInDegrees* = 0 (looking straight down), *rollInDegrees* = 0 (no tilt), and *fieldOfViewInDegrees* = 45.
     * 
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {Geopoint} location_ The location of the camera in the map.
     * @param {Float} headingInDegrees The directional heading of the camera in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West. The default *headingInDegrees* value is 0.
     * @returns {MapCamera} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.#ctor
     */
    static CreateInstanceWithLocationAndHeading(location_, headingInDegrees) {
        if (!MapCamera.HasProp("__IMapCameraFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapCamera")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapCameraFactory.IID)
            MapCamera.__IMapCameraFactory := IMapCameraFactory(factoryPtr)
        }

        return MapCamera.__IMapCameraFactory.CreateInstanceWithLocationAndHeading(location_, headingInDegrees)
    }

    /**
     * Creates a map camera, to define the view of a map based on location, heading, and pitch.
     * @remarks
     * This constructor is equivalent to calling [MapCamera(Geopoint, Double, Double, Double, Double)](mapcamera_mapcamera_1532703584.md) with the following default parameter values: *rollInDegrees* = 0 (no tilt), and *fieldOfViewInDegrees* = 45.
     * 
     * See additional comments in the [MapCamera(Geopoint, Double, Double, Double, Double)](mapcamera_mapcamera_1532703584.md) overload.
     * 
     * The maximum and minimum values of pitch/tilt depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>pitch/tilt</td><td>0-75</td><td>0-90</td><td>0-180</td></tr>
     * </table>
     * 
     *  Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {Geopoint} location_ The location of the camera in the map.
     * @param {Float} headingInDegrees The directional heading of the camera in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West. The default *headingInDegrees* value is 0.
     * @param {Float} pitchInDegrees The pitch of the map's camera in degrees, where 90 is looking out at the horizon (maximum) and 0 is looking straight down (minimum). The default *pitchInDegrees* value is 0.
     * @returns {MapCamera} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.#ctor
     */
    static CreateInstanceWithLocationHeadingAndPitch(location_, headingInDegrees, pitchInDegrees) {
        if (!MapCamera.HasProp("__IMapCameraFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapCamera")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapCameraFactory.IID)
            MapCamera.__IMapCameraFactory := IMapCameraFactory(factoryPtr)
        }

        return MapCamera.__IMapCameraFactory.CreateInstanceWithLocationHeadingAndPitch(location_, headingInDegrees, pitchInDegrees)
    }

    /**
     * Creates a map camera, to define the view of a map based on location, heading, pitch, roll, and field of view.
     * @remarks
     * > [!NOTE]
     * > Adjusting [Roll](mapcamera_roll.md) may interfere with normal gesture operations and leave the map in an inconsistent state. We do not recommend adjusting [Roll](mapcamera_roll.md) without thoroughly testing your app.
     * 
     * The valid range of pitch differs between 2D, 3D, and Streetside map views. When switching from 3D to 2D for example, values that are acceptable in the current view may be out of range in the next view. If that’s the case, the current pitch value will be truncated to the nearest acceptable value in the next view.
     * 
     * When leaving a Streetside view, the map returns to the previous view settings. The Streetside pitch is not maintained outside of the Streetside experience.
     * 
     * The maximum and minimum values of pitch/tilt depend on the type of map view: 2D, 3D, or Streetside. The range for field of view is the same in all views.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>pitch/tilt</td><td>0-75</td><td>0-90</td><td>0-180</td></tr>
     *    <tr><td>field of view</td><td>1-120</td><td>1-120</td><td>1-120</td></tr>
     * </table>
     * 
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {Geopoint} location_ The location of the camera in the map.
     * @param {Float} headingInDegrees The directional heading of the camera in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West. The default *headingInDegrees* value is 0.
     * @param {Float} pitchInDegrees The pitch of the map's camera in degrees, where 90 is looking out at the horizon (maximum) and 0 is looking straight down (minimum). The default *pitchInDegrees* value is 0.
     * @param {Float} rollInDegrees The roll of the camera in degrees, where -90 is tilting to the left and +90 is tilting to the right. The default *rollInDegrees* value is 0.
     * @param {Float} fieldOfViewInDegrees The horizontal angle of view that appears in the camera, in degrees. The default *fieldOfViewInDegrees* value is 45.0.
     * > [!NOTE]
     * > In Windows 10, version 1803, you can override the default value by passing NAN as the input. This will recalculate the field of view based on aspect ratio of the view. However, if you pass NAN as the input on Windows 10, version 1709 and earlier, the operating system will likely throw an exception.
     * @returns {MapCamera} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.#ctor
     */
    static CreateInstanceWithLocationHeadingPitchRollAndFieldOfView(location_, headingInDegrees, pitchInDegrees, rollInDegrees, fieldOfViewInDegrees) {
        if (!MapCamera.HasProp("__IMapCameraFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapCamera")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapCameraFactory.IID)
            MapCamera.__IMapCameraFactory := IMapCameraFactory(factoryPtr)
        }

        return MapCamera.__IMapCameraFactory.CreateInstanceWithLocationHeadingPitchRollAndFieldOfView(location_, headingInDegrees, pitchInDegrees, rollInDegrees, fieldOfViewInDegrees)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the location of the camera in the map.
     * @remarks
     * The following image demonstrates the location of the map's camera relative to the scene. This property corresponds to the **MapCamera location**.
     * 
     * <img src="images/MapControl_TechDiagram.png" alt="The relationship between MapCamera location and MapScene location relative to the map." />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets or sets the directional heading of the camera in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * @remarks
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.heading
     * @type {Float} 
     */
    Heading {
        get => this.get_Heading()
        set => this.put_Heading(value)
    }

    /**
     * Gets or sets the pitch of the map's camera in degrees, where 90 is looking out at the horizon (maximum) and 0 is looking straight down (minimum).
     * @remarks
     * For more information about pitch, see the remarks section of the [MapCamera(Geopoint, Double, Double, Double, Double)](mapcamera_mapcamera_1532703584.md) overload.
     * 
     * The maximum and minimum values of pitch/tilt depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>pitch/tilt</td><td>0-75</td><td>0-90</td><td>0-180</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.pitch
     * @type {Float} 
     */
    Pitch {
        get => this.get_Pitch()
        set => this.put_Pitch(value)
    }

    /**
     * Gets or sets the roll of the camera in degrees, where -90 is tilting to the left and +90 is tilting to the right.
     * @remarks
     * > [!NOTE]
     * > Adjusting Roll may interfere with normal gesture operations and leave the map in an inconsistent state. We do not recommend adjusting Roll without thoroughly testing your app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.roll
     * @type {Float} 
     */
    Roll {
        get => this.get_Roll()
        set => this.put_Roll(value)
    }

    /**
     * Gets or sets the vertical angle of view that appears in the camera, in degrees.
     * @remarks
     * The maximum and minimum values of field of view is the same in all views.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>field of view</td><td>1-120</td><td>1-120</td><td>1-120</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamera.fieldofview
     * @type {Float} 
     */
    FieldOfView {
        get => this.get_FieldOfView()
        set => this.put_FieldOfView(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.get_Location()
    }

    /**
     * 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.put_Location(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Heading() {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.get_Heading()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Heading(value) {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.put_Heading(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pitch() {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.get_Pitch()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Pitch(value) {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.put_Pitch(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Roll() {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.get_Roll()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Roll(value) {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.put_Roll(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FieldOfView() {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.get_FieldOfView()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FieldOfView(value) {
        if (!this.HasProp("__IMapCamera")) {
            if ((queryResult := this.QueryInterface(IMapCamera.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapCamera := IMapCamera(outPtr)
        }

        return this.__IMapCamera.put_FieldOfView(value)
    }

;@endregion Instance Methods
}
