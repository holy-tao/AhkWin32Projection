#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapInputEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data about user input for the [MapTapped](mapcontrol_maptapped.md), [MapDoubleTapped](mapcontrol_mapdoubletapped.md), and [MapHolding](mapcontrol_mapholding.md) events of the [MapControl](mapcontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapinputeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapInputEventArgs extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapInputEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapInputEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the physical location on the [MapControl](mapcontrol.md) that received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapinputeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the geographic location on the [MapControl](mapcontrol.md) that received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapinputeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapInputEventArgs](mapinputeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapInputEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IMapInputEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapInputEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapInputEventArgs := IMapInputEventArgs(outPtr)
        }

        return this.__IMapInputEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapInputEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapInputEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapInputEventArgs := IMapInputEventArgs(outPtr)
        }

        return this.__IMapInputEventArgs.get_Location()
    }

;@endregion Instance Methods
}
