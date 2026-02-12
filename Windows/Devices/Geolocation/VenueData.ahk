#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVenueData.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the venue associated with a geographic location.
 * @remarks
 * This class represents a venue, such as a shopping mall or office building. The `VenueData` object is created as a property of the [Geoposition](geoposition.md) class when venue information is available for a geographic location. Otherwise, this property returns `null`.
 * 
 * Venue information is not available for all geographic locations. A `VenueData` object will be returned only when the geographic location is within a venue that’s supported by the data provider.
 * 
 * 
 * 
 * > [!NOTE]
 * > In this release, Bing is the exclusive data provider for all venue information.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.venuedata
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class VenueData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVenueData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVenueData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier (ID) of the venue.
     * @remarks
     * The `Id` property value and string format is determined by the data provider.
     * 
     * > [!NOTE]
     * > This property is equivalent to the ID of a Bing venue map.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.venuedata.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the identifier (ID) of the building level.
     * @remarks
     * The `Level` property value and string format is determined by the data provider.
     * 
     * > [!NOTE]
     * > This property is equivalent to the name of a floor in a Bing venue map.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.venuedata.level
     * @type {HSTRING} 
     */
    Level {
        get => this.get_Level()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IVenueData")) {
            if ((queryResult := this.QueryInterface(IVenueData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVenueData := IVenueData(outPtr)
        }

        return this.__IVenueData.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Level() {
        if (!this.HasProp("__IVenueData")) {
            if ((queryResult := this.QueryInterface(IVenueData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVenueData := IVenueData(outPtr)
        }

        return this.__IVenueData.get_Level()
    }

;@endregion Instance Methods
}
