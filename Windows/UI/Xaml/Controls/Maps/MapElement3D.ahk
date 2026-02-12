#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapElement.ahk
#Include .\IMapElement3D.ahk
#Include .\IMapElement3DStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a 3D element displayed on a [MapControl](mapcontrol.md).
 * @remarks
 * To display the 3D object on a map control, add the MapElement3D to the [MapElements](mapelementslayer_mapelements.md) collection of a [MapElementsLayer](mapelementslayer.md). Then, add the [MapElementsLayer](mapelementslayer.md) to the [Layers](mapcontrol_layers.md) collection of the map.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapElement3D extends MapElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapElement3D

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapElement3D.IID

    /**
     * Gets the dependency property that backs the [Location](mapelement3d_location.md) Windows Runtime property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.locationproperty
     * @type {DependencyProperty} 
     */
    static LocationProperty {
        get => MapElement3D.get_LocationProperty()
    }

    /**
     * Gets the dependency property that backs the [Heading](mapelement3d_heading.md) Windows Runtime property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.headingproperty
     * @type {DependencyProperty} 
     */
    static HeadingProperty {
        get => MapElement3D.get_HeadingProperty()
    }

    /**
     * Gets the dependency property that backs the [Pitch](mapelement3d_pitch.md) Windows Runtime property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.pitchproperty
     * @type {DependencyProperty} 
     */
    static PitchProperty {
        get => MapElement3D.get_PitchProperty()
    }

    /**
     * Gets the dependency property that backs the [Roll](mapelement3d_roll.md) Windows Runtime property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.rollproperty
     * @type {DependencyProperty} 
     */
    static RollProperty {
        get => MapElement3D.get_RollProperty()
    }

    /**
     * Gets the dependency property that backs the [Scale](mapelement3d_scale.md) Windows Runtime property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.scaleproperty
     * @type {DependencyProperty} 
     */
    static ScaleProperty {
        get => MapElement3D.get_ScaleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocationProperty() {
        if (!MapElement3D.HasProp("__IMapElement3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElement3DStatics.IID)
            MapElement3D.__IMapElement3DStatics := IMapElement3DStatics(factoryPtr)
        }

        return MapElement3D.__IMapElement3DStatics.get_LocationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeadingProperty() {
        if (!MapElement3D.HasProp("__IMapElement3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElement3DStatics.IID)
            MapElement3D.__IMapElement3DStatics := IMapElement3DStatics(factoryPtr)
        }

        return MapElement3D.__IMapElement3DStatics.get_HeadingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PitchProperty() {
        if (!MapElement3D.HasProp("__IMapElement3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElement3DStatics.IID)
            MapElement3D.__IMapElement3DStatics := IMapElement3DStatics(factoryPtr)
        }

        return MapElement3D.__IMapElement3DStatics.get_PitchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RollProperty() {
        if (!MapElement3D.HasProp("__IMapElement3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElement3DStatics.IID)
            MapElement3D.__IMapElement3DStatics := IMapElement3DStatics(factoryPtr)
        }

        return MapElement3D.__IMapElement3DStatics.get_RollProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleProperty() {
        if (!MapElement3D.HasProp("__IMapElement3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElement3DStatics.IID)
            MapElement3D.__IMapElement3DStatics := IMapElement3DStatics(factoryPtr)
        }

        return MapElement3D.__IMapElement3DStatics.get_ScaleProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the geographic location of the [MapElement3D](mapelement3d.md) on the [MapControl](mapcontrol.md). .
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets or sets the 3D model that represents a 3D object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.model
     * @type {MapModel3D} 
     */
    Model {
        get => this.get_Model()
        set => this.put_Model(value)
    }

    /**
     * Gets or sets the directional heading of the 3D map element in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * @remarks
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.heading
     * @type {Float} 
     */
    Heading {
        get => this.get_Heading()
        set => this.put_Heading(value)
    }

    /**
     * Gets or sets a value that indicates by how many degrees you want the 3D map element to be tilted. A value of 0 is looking out at the horizon and a value of -90 is looking straight down. A value of 90 is looking straight up. The default value is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.pitch
     * @type {Float} 
     */
    Pitch {
        get => this.get_Pitch()
        set => this.put_Pitch(value)
    }

    /**
     * Gets or sets the roll of the 3D map element in degrees, where -90 is tilting to the left and +90 is tilting to the right.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.roll
     * @type {Float} 
     */
    Roll {
        get => this.get_Roll()
        set => this.put_Roll(value)
    }

    /**
     * The scale to apply to the 3D map element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement3d.scale
     * @type {Vector3} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [MapElement3D](mapelement3d.md) instance.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement3D")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.get_Location()
    }

    /**
     * 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.put_Location(value)
    }

    /**
     * 
     * @returns {MapModel3D} 
     */
    get_Model() {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.get_Model()
    }

    /**
     * 
     * @param {MapModel3D} value 
     * @returns {HRESULT} 
     */
    put_Model(value) {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.put_Model(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Heading() {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.get_Heading()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Heading(value) {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.put_Heading(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pitch() {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.get_Pitch()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Pitch(value) {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.put_Pitch(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Roll() {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.get_Roll()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Roll(value) {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.put_Roll(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Scale() {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.get_Scale()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__IMapElement3D")) {
            if ((queryResult := this.QueryInterface(IMapElement3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3D := IMapElement3D(outPtr)
        }

        return this.__IMapElement3D.put_Scale(value)
    }

;@endregion Instance Methods
}
