#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method to get the limits of an interval.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iinterval
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IInterval extends IUnknown{
    /**
     * The interface identifier for IInterval
     * @type {Guid}
     */
    static IID => Guid("{6bf0a714-3c18-430b-8b5d-83b1c234d3db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pilkLower 
     * @param {Pointer<PROPVARIANT>} ppropvarLower 
     * @param {Pointer<Int32>} pilkUpper 
     * @param {Pointer<PROPVARIANT>} ppropvarUpper 
     * @returns {HRESULT} 
     */
    GetLimits(pilkLower, ppropvarLower, pilkUpper, ppropvarUpper) {
        result := ComCall(3, this, "int*", pilkLower, "ptr", ppropvarLower, "int*", pilkUpper, "ptr", ppropvarUpper, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
