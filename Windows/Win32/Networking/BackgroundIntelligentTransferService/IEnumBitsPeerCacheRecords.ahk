#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBitsPeerCacheRecord.ahk
#Include .\IEnumBitsPeerCacheRecords.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IEnumBitsPeerCacheRecords to enumerate the records of the cache.
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ienumbitspeercacherecords
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IEnumBitsPeerCacheRecords extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumBitsPeerCacheRecords
     * @type {Guid}
     */
    static IID => Guid("{659cdea4-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "GetCount"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {IBitsPeerCacheRecord} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IBitsPeerCacheRecord(rgelt)
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumBitsPeerCacheRecords} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumBitsPeerCacheRecords(ppenum)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }
}
