#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\PlaceInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class IPlaceInfoHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaceInfoHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{dd1ca9a7-a9c6-491b-bc09-e80fcea48ee6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromLocalLocation"]

    /**
     * 
     * @param {LocalLocation} location_ 
     * @returns {PlaceInfo} 
     */
    CreateFromLocalLocation(location_) {
        result := ComCall(6, this, "ptr", location_, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }
}
