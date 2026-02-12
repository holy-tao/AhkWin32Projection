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
class IGeocoordinateSatelliteData2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeocoordinateSatelliteData2
     * @type {Guid}
     */
    static IID => Guid("{761c8cfd-a19d-5a51-80f5-71676115483e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GeometricDilutionOfPrecision", "get_TimeDilutionOfPrecision"]

    /**
     * @type {IReference<Float>} 
     */
    GeometricDilutionOfPrecision {
        get => this.get_GeometricDilutionOfPrecision()
    }

    /**
     * @type {IReference<Float>} 
     */
    TimeDilutionOfPrecision {
        get => this.get_TimeDilutionOfPrecision()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_GeometricDilutionOfPrecision() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_TimeDilutionOfPrecision() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
