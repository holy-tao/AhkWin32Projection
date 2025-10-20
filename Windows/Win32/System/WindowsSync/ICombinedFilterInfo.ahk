#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilterInfo.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ICombinedFilterInfo extends ISyncFilterInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICombinedFilterInfo
     * @type {Guid}
     */
    static IID => Guid("{11f9de71-2818-4779-b2ac-42d450565f45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilterCount", "GetFilterInfo", "GetFilterCombinationType"]

    /**
     * 
     * @param {Pointer<Integer>} pdwFilterCount 
     * @returns {HRESULT} 
     */
    GetFilterCount(pdwFilterCount) {
        result := ComCall(4, this, "uint*", pdwFilterCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterIndex 
     * @param {Pointer<ISyncFilterInfo>} ppIFilterInfo 
     * @returns {HRESULT} 
     */
    GetFilterInfo(dwFilterIndex, ppIFilterInfo) {
        result := ComCall(5, this, "uint", dwFilterIndex, "ptr*", ppIFilterInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFilterCombinationType 
     * @returns {HRESULT} 
     */
    GetFilterCombinationType(pFilterCombinationType) {
        result := ComCall(6, this, "int*", pFilterCombinationType, "HRESULT")
        return result
    }
}
