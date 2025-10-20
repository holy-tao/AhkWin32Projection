#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an instance of a filter to be applied to an enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesitemfilter
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesItemFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesItemFilter
     * @type {Guid}
     */
    static IID => Guid("{f4b5a26c-dc05-4f20-ada4-551f1077be5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilterFlags", "GetTimeFilter", "GetPatternFilter"]

    /**
     * 
     * @param {Pointer<Integer>} pullFlags 
     * @param {Pointer<Integer>} pullMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitemfilter-getfilterflags
     */
    GetFilterFlags(pullFlags, pullMask) {
        result := ComCall(3, this, "uint*", pullFlags, "uint*", pullMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftTime 
     * @param {Pointer<BOOL>} pbEvalTimeOfDay 
     * @param {Pointer<Integer>} pTimeType 
     * @param {Pointer<Integer>} pCompare 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitemfilter-gettimefilter
     */
    GetTimeFilter(pftTime, pbEvalTimeOfDay, pTimeType, pCompare) {
        result := ComCall(4, this, "ptr", pftTime, "ptr", pbEvalTimeOfDay, "int*", pTimeType, "int*", pCompare, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPattern 
     * @param {Integer} cchPattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesitemfilter-getpatternfilter
     */
    GetPatternFilter(pszPattern, cchPattern) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(5, this, "ptr", pszPattern, "uint", cchPattern, "HRESULT")
        return result
    }
}
