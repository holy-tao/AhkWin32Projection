#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\..\Devices\Geolocation\Geopath.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapPolygon2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapPolygon2
     * @type {Guid}
     */
    static IID => Guid("{96c8a11e-636b-4018-9c2e-acc9122a01b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Paths"]

    /**
     * @type {IVector<Geopath>} 
     */
    Paths {
        get => this.get_Paths()
    }

    /**
     * 
     * @returns {IVector<Geopath>} 
     */
    get_Paths() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Geopath, value)
    }
}
