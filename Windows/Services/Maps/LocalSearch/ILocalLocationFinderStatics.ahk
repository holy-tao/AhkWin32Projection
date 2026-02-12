#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\LocalLocationFinderResult.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class ILocalLocationFinderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocalLocationFinderStatics
     * @type {Guid}
     */
    static IID => Guid("{d2ef7344-a0de-48ca-81a8-07c7dcfd37ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindLocalLocationsAsync"]

    /**
     * 
     * @param {HSTRING} searchTerm 
     * @param {Geocircle} searchArea 
     * @param {HSTRING} localCategory 
     * @param {Integer} maxResults 
     * @returns {IAsyncOperation<LocalLocationFinderResult>} 
     */
    FindLocalLocationsAsync(searchTerm, searchArea, localCategory, maxResults) {
        if(searchTerm is String) {
            pin := HSTRING.Create(searchTerm)
            searchTerm := pin.Value
        }
        searchTerm := searchTerm is Win32Handle ? NumGet(searchTerm, "ptr") : searchTerm
        if(localCategory is String) {
            pin := HSTRING.Create(localCategory)
            localCategory := pin.Value
        }
        localCategory := localCategory is Win32Handle ? NumGet(localCategory, "ptr") : localCategory

        result := ComCall(6, this, "ptr", searchTerm, "ptr", searchArea, "ptr", localCategory, "uint", maxResults, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LocalLocationFinderResult, result_)
    }
}
