#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MapLocationFinderResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapLocationFinderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapLocationFinderStatics
     * @type {Guid}
     */
    static IID => Guid("{318adb5d-1c5d-4f35-a2df-aaca94959517}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindLocationsAtAsync", "FindLocationsAsync", "FindLocationsWithMaxCountAsync"]

    /**
     * 
     * @param {Geopoint} queryPoint 
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     */
    FindLocationsAtAsync(queryPoint) {
        result := ComCall(6, this, "ptr", queryPoint, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapLocationFinderResult, result_)
    }

    /**
     * 
     * @param {HSTRING} searchText 
     * @param {Geopoint} referencePoint 
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     */
    FindLocationsAsync(searchText, referencePoint) {
        if(searchText is String) {
            pin := HSTRING.Create(searchText)
            searchText := pin.Value
        }
        searchText := searchText is Win32Handle ? NumGet(searchText, "ptr") : searchText

        result := ComCall(7, this, "ptr", searchText, "ptr", referencePoint, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapLocationFinderResult, result_)
    }

    /**
     * 
     * @param {HSTRING} searchText 
     * @param {Geopoint} referencePoint 
     * @param {Integer} maxCount 
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     */
    FindLocationsWithMaxCountAsync(searchText, referencePoint, maxCount) {
        if(searchText is String) {
            pin := HSTRING.Create(searchText)
            searchText := pin.Value
        }
        searchText := searchText is Win32Handle ? NumGet(searchText, "ptr") : searchText

        result := ComCall(8, this, "ptr", searchText, "ptr", referencePoint, "uint", maxCount, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapLocationFinderResult, result_)
    }
}
