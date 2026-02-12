#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Geoposition.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeovisit extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeovisit
     * @type {Guid}
     */
    static IID => Guid("{b1877a76-9ef6-41ab-a0dd-793ece76e2de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "get_StateChange", "get_Timestamp"]

    /**
     * @type {Geoposition} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {Integer} 
     */
    StateChange {
        get => this.get_StateChange()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {Geoposition} 
     */
    get_Position() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geoposition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StateChange() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
