#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Interface to define a geographic shape.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.igeoshape
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeoshape extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeoshape
     * @type {Guid}
     */
    static IID => Guid("{c99ca2af-c729-43c1-8fab-d6dec914df7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GeoshapeType", "get_SpatialReferenceId", "get_AltitudeReferenceSystem"]

    /**
     * The type of geographic shape.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.igeoshape.geoshapetype
     * @type {Integer} 
     */
    GeoshapeType {
        get => this.get_GeoshapeType()
    }

    /**
     * The spatial reference identifier for the geographic shape, corresponding to a spatial reference system based on the specific ellipsoid used for either flat-earth mapping or round-earth mapping.
     * @remarks
     * The spatial reference id (SRID) corresponds to a spatial reference system based on the specific ellipsoid used for either flat-earth mapping or round-earth mapping. Spatial instances with the same SRID can be used when performing operations with spatial data methods on your data. The result of any spatial method derived from two spatial data instances is valid only if those instances have the same SRID that is based on the same unit of measurement, datum, and projection used to determine the coordinates of the instances. The most common units of measurement of a SRID are meters or square meters. The default SRID on Windows is 4326 which is WGS84 ellipsoid.
     * 
     * The spatial reference identification system is defined by the [European Petroleum Survey Group (EPSG)](https://epsg.org/) standard, which is a set of standards developed for cartography, surveying, and geodetic data storage. This standard is owned by the Oil and Gas Producers (OGP) Surveying and Positioning Committee.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.igeoshape.spatialreferenceid
     * @type {Integer} 
     */
    SpatialReferenceId {
        get => this.get_SpatialReferenceId()
    }

    /**
     * The altitude reference system of the geographic shape.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.igeoshape.altitudereferencesystem
     * @type {Integer} 
     */
    AltitudeReferenceSystem {
        get => this.get_AltitudeReferenceSystem()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeoshapeType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SpatialReferenceId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AltitudeReferenceSystem() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
