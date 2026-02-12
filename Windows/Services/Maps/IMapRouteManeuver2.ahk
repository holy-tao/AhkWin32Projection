#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteManeuver2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteManeuver2
     * @type {Guid}
     */
    static IID => Guid("{5d7bcd9c-7c9b-41df-838b-eae21e4b05a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartHeading", "get_EndHeading", "get_StreetName"]

    /**
     * @type {Float} 
     */
    StartHeading {
        get => this.get_StartHeading()
    }

    /**
     * @type {Float} 
     */
    EndHeading {
        get => this.get_EndHeading()
    }

    /**
     * @type {HSTRING} 
     */
    StreetName {
        get => this.get_StreetName()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StartHeading() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EndHeading() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StreetName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
