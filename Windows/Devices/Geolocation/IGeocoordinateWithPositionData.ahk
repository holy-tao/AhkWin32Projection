#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GeocoordinateSatelliteData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeocoordinateWithPositionData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeocoordinateWithPositionData
     * @type {Guid}
     */
    static IID => Guid("{95e634be-dbd6-40ac-b8f2-a65c0340d9a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PositionSource", "get_SatelliteData"]

    /**
     * @type {Integer} 
     */
    PositionSource {
        get => this.get_PositionSource()
    }

    /**
     * @type {GeocoordinateSatelliteData} 
     */
    SatelliteData {
        get => this.get_SatelliteData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionSource() {
        result := ComCall(6, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * 
     * @returns {GeocoordinateSatelliteData} 
     */
    get_SatelliteData() {
        result := ComCall(7, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeocoordinateSatelliteData(ppValue)
    }
}
