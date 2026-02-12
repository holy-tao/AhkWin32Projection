#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VenueData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeoposition2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeoposition2
     * @type {Guid}
     */
    static IID => Guid("{7f62f697-8671-4b0d-86f8-474a8496187c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VenueData"]

    /**
     * @type {VenueData} 
     */
    VenueData {
        get => this.get_VenueData()
    }

    /**
     * 
     * @returns {VenueData} 
     */
    get_VenueData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VenueData(value)
    }
}
