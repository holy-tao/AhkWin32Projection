#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GuidanceRoute.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceRouteStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceRouteStatics
     * @type {Guid}
     */
    static IID => Guid("{f56d926a-55ed-49c1-b09c-4b8223b50db3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanCreateFromMapRoute", "TryCreateFromMapRoute"]

    /**
     * 
     * @param {MapRoute} mapRoute_ 
     * @returns {Boolean} 
     */
    CanCreateFromMapRoute(mapRoute_) {
        result := ComCall(6, this, "ptr", mapRoute_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {MapRoute} mapRoute_ 
     * @returns {GuidanceRoute} 
     */
    TryCreateFromMapRoute(mapRoute_) {
        result := ComCall(7, this, "ptr", mapRoute_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceRoute(result_)
    }
}
