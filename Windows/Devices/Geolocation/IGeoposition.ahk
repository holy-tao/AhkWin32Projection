#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Geocoordinate.ahk
#Include .\CivicAddress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeoposition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeoposition
     * @type {Guid}
     */
    static IID => Guid("{c18d0454-7d41-4ff7-a957-9dffb4ef7f5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Coordinate", "get_CivicAddress"]

    /**
     * @type {Geocoordinate} 
     */
    Coordinate {
        get => this.get_Coordinate()
    }

    /**
     * @type {CivicAddress} 
     */
    CivicAddress {
        get => this.get_CivicAddress()
    }

    /**
     * 
     * @returns {Geocoordinate} 
     */
    get_Coordinate() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geocoordinate(value)
    }

    /**
     * 
     * @returns {CivicAddress} 
     */
    get_CivicAddress() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CivicAddress(value)
    }
}
