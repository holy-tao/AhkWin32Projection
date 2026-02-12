#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceLaneInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceLaneInfo
     * @type {Guid}
     */
    static IID => Guid("{8404d114-6581-43b7-ac15-c9079bf90df1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LaneMarkers", "get_IsOnRoute"]

    /**
     * @type {Integer} 
     */
    LaneMarkers {
        get => this.get_LaneMarkers()
    }

    /**
     * @type {Boolean} 
     */
    IsOnRoute {
        get => this.get_IsOnRoute()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaneMarkers() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnRoute() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
