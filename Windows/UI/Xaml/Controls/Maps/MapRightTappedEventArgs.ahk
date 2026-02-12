#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapRightTappedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [MapRightTapped](mapcontrol_maprighttapped.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maprighttappedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapRightTappedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapRightTappedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapRightTappedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the physical position on the [MapControl](mapcontrol.md) where it received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maprighttappedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the geographic location that corresponds to where the [MapControl](mapcontrol.md) received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maprighttappedeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapRightTappedEventArgs](maprighttappedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapRightTappedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IMapRightTappedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapRightTappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRightTappedEventArgs := IMapRightTappedEventArgs(outPtr)
        }

        return this.__IMapRightTappedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapRightTappedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapRightTappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRightTappedEventArgs := IMapRightTappedEventArgs(outPtr)
        }

        return this.__IMapRightTappedEventArgs.get_Location()
    }

;@endregion Instance Methods
}
