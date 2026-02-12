#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IStreetsidePanorama extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreetsidePanorama
     * @type {Guid}
     */
    static IID => Guid("{6fe00fd8-ad60-4664-b539-b1069f16c5af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Location"]

    /**
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }
}
