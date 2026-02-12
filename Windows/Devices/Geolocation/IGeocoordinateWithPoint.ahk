#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Geopoint.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeocoordinateWithPoint extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeocoordinateWithPoint
     * @type {Guid}
     */
    static IID => Guid("{feea0525-d22c-4d46-b527-0b96066fc7db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Point"]

    /**
     * @type {Geopoint} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Point() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }
}
