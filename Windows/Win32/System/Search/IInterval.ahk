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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLimits"]

    /**
     * 
     * @param {Pointer<Integer>} pilkLower 
     * @param {Pointer<PROPVARIANT>} ppropvarLower 
     * @param {Pointer<Integer>} pilkUpper 
     * @param {Pointer<PROPVARIANT>} ppropvarUpper 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iinterval-getlimits
     */
    GetLimits(pilkLower, ppropvarLower, pilkUpper, ppropvarUpper) {
        result := ComCall(3, this, "int*", pilkLower, "ptr", ppropvarLower, "int*", pilkUpper, "ptr", ppropvarUpper, "HRESULT")
        return result
    }
}
