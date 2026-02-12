#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeocoordinateSatelliteData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeocoordinateSatelliteData
     * @type {Guid}
     */
    static IID => Guid("{c32a74d9-2608-474c-912c-06dd490f4af7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PositionDilutionOfPrecision", "get_HorizontalDilutionOfPrecision", "get_VerticalDilutionOfPrecision"]

    /**
     * @type {IReference<Float>} 
     */
    PositionDilutionOfPrecision {
        get => this.get_PositionDilutionOfPrecision()
    }

    /**
     * @type {IReference<Float>} 
     */
    HorizontalDilutionOfPrecision {
        get => this.get_HorizontalDilutionOfPrecision()
    }

    /**
     * @type {IReference<Float>} 
     */
    VerticalDilutionOfPrecision {
        get => this.get_VerticalDilutionOfPrecision()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PositionDilutionOfPrecision() {
        result := ComCall(6, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), ppValue)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_HorizontalDilutionOfPrecision() {
        result := ComCall(7, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), ppValue)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_VerticalDilutionOfPrecision() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), ppValue)
    }
}
