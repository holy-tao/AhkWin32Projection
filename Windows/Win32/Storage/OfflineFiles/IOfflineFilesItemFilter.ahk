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
     * Provides flags to control flag-based filtering of items.
     * @param {Pointer<Integer>} pullFlags Receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/offlinefiles/offline-files-filter-flags">Offline Files Filter Flags</a> 
     *        bit values to be used in the filter evaluation.
     * 
     * A bit value of 1 means that the corresponding data condition in the item must be 
     *        <b>TRUE</b> for a filter match.  A bit value of 0 means the corresponding data condition in 
     *        the item must be <b>FALSE</b> for a filter match.
     * @param {Pointer<Integer>} pullMask Receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/offlinefiles/offline-files-filter-flags">Offline Files Filter Flags</a> 
     *        bit values identifying which flags are to be evaluated.
     * 
     * A bit value of 1 means "evaluate the corresponding data" while a bit value of 0 means 
     *        "do not evaluate the corresponding data."
     * @returns {HRESULT} Returns <b>S_OK</b> if the filter supports flag filtering and the flag filtering 
     *        information is provided.
     * 
     * Returns <b>E_NOTIMPL</b> if flag filtering is not supported.
     * 
     * Any other error value causes the creation of the enumerator to fail.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesitemfilter-getfilterflags
     */
    GetFilterFlags(pullFlags, pullMask) {
        pullFlagsMarshal := pullFlags is VarRef ? "uint*" : "ptr"
        pullMaskMarshal := pullMask is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pullFlagsMarshal, pullFlags, pullMaskMarshal, pullMask, "HRESULT")
        return result
    }

    /**
     * Provides time-value-comparison semantics to control filtering of items based on time.
     * @param {Pointer<FILETIME>} pftTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the UTC time value that the item is to be compared with.
     * @param {Pointer<BOOL>} pbEvalTimeOfDay Receives a Boolean value indicating whether the time-of-day part of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> value is to be considered in the item evaluation.  If the flag value is <b>TRUE</b>, the time-of-day is considered.  If the flag value is <b>FALSE</b>, the time-of-day information is stripped from all time values involved in the evaluation; leaving only the year, month, and day.
     * 
     * This can be very helpful when the granularity of filtering is a day.
     * @param {Pointer<Integer>} pTimeType Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_time">OFFLINEFILES_ITEM_TIME</a> enumeration value that indicates which time value associated with the cache item is to be used in the evaluation.
     * 
     * Only one value is to be provided.  This is not a mask.
     * @param {Pointer<Integer>} pCompare Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_compare">OFFLINEFILES_COMPARE</a> enumeration value that indicates the type of logical comparison to perform between the selected item time and the filter time pointed to by the <i>pftTime</i> parameter.
     * @returns {HRESULT} Returns <b>S_OK</b> if the filter supports time filtering and the time filtering information is provided.
     * 
     * Returns <b>E_NOTIMPL</b> if time filtering is not supported.
     * 
     * Any other error value causes the creation of the enumerator to fail.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesitemfilter-gettimefilter
     */
    GetTimeFilter(pftTime, pbEvalTimeOfDay, pTimeType, pCompare) {
        pbEvalTimeOfDayMarshal := pbEvalTimeOfDay is VarRef ? "int*" : "ptr"
        pTimeTypeMarshal := pTimeType is VarRef ? "int*" : "ptr"
        pCompareMarshal := pCompare is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pftTime, pbEvalTimeOfDayMarshal, pbEvalTimeOfDay, pTimeTypeMarshal, pTimeType, pCompareMarshal, pCompare, "HRESULT")
        return result
    }

    /**
     * Provides a filter pattern string to limit enumerated items based on item name patterns.
     * @param {PWSTR} pszPattern Receives the filter pattern string. Pattern strings can contain the * and ? wildcard characters.
     * 
     * Examples:
     * 
     * <ul>
     * <li>*.DOC</li>
     * <li>ABC.*</li>
     * <li>AB?.??2</li>
     * </ul>
     * @param {Integer} cchPattern Specifies the maximum length in characters of the buffer receiving the pattern string.  This value is currently <b>MAX_PATH</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if the filter supports pattern filtering and the filter string is successfully copied to the pszPattern buffer.
     * 
     * Returns <b>E_NOTIMPL</b> if pattern filtering is not supported.
     * 
     * Any other error value causes the creation of the enumerator to fail.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesitemfilter-getpatternfilter
     */
    GetPatternFilter(pszPattern, cchPattern) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(5, this, "ptr", pszPattern, "uint", cchPattern, "HRESULT")
        return result
    }
}
