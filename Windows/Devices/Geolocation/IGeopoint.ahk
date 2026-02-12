#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BasicGeoposition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeopoint extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeopoint
     * @type {Guid}
     */
    static IID => Guid("{6bfa00eb-e56e-49bb-9caf-cbaa78a8bcef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position"]

    /**
     * @type {BasicGeoposition} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_Position() {
        value := BasicGeoposition()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
