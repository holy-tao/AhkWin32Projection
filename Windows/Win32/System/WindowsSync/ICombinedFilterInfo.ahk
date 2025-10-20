#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilterInfo.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ICombinedFilterInfo extends ISyncFilterInfo{
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
     * 
     * @param {Pointer<UInt32>} pdwFilterCount 
     * @returns {HRESULT} 
     */
    GetFilterCount(pdwFilterCount) {
        result := ComCall(4, this, "uint*", pdwFilterCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFilterIndex 
     * @param {Pointer<ISyncFilterInfo>} ppIFilterInfo 
     * @returns {HRESULT} 
     */
    GetFilterInfo(dwFilterIndex, ppIFilterInfo) {
        result := ComCall(5, this, "uint", dwFilterIndex, "ptr", ppIFilterInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFilterCombinationType 
     * @returns {HRESULT} 
     */
    GetFilterCombinationType(pFilterCombinationType) {
        result := ComCall(6, this, "int*", pFilterCombinationType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
