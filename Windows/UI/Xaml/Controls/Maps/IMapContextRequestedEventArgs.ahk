#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\MapElement.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapContextRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapContextRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fdd1b423-c961-4df2-bb57-82ee0f0bb591}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "get_Location", "get_MapElements"]

    /**
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * @type {IVectorView<MapElement>} 
     */
    MapElements {
        get => this.get_MapElements()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        value := POINT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @returns {IVectorView<MapElement>} 
     */
    get_MapElements() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MapElement, value)
    }
}
