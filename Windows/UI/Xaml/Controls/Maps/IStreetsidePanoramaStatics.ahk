#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\StreetsidePanorama.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IStreetsidePanoramaStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreetsidePanoramaStatics
     * @type {Guid}
     */
    static IID => Guid("{d3b47f69-54b3-4ec5-b2a0-4f8204576507}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindNearbyWithLocationAsync", "FindNearbyWithLocationAndRadiusAsync"]

    /**
     * 
     * @param {Geopoint} location_ 
     * @returns {IAsyncOperation<StreetsidePanorama>} 
     */
    FindNearbyWithLocationAsync(location_) {
        result := ComCall(6, this, "ptr", location_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StreetsidePanorama, operation)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Float} radiusInMeters 
     * @returns {IAsyncOperation<StreetsidePanorama>} 
     */
    FindNearbyWithLocationAndRadiusAsync(location_, radiusInMeters) {
        result := ComCall(7, this, "ptr", location_, "double", radiusInMeters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StreetsidePanorama, operation)
    }
}
