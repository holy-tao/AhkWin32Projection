#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IBitsPeerCacheAdministration to manage the pool of peers from which you can download content.
 * @remarks
 * 
  *  You should never have to manage the peer cache; BITS manages the cache for you.
  * 
  * You must have administrator privileges to modify the cache.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibitspeercacheadministration
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBitsPeerCacheAdministration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitsPeerCacheAdministration
     * @type {Guid}
     */
    static IID => Guid("{659cdead-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaximumCacheSize", "SetMaximumCacheSize", "GetMaximumContentAge", "SetMaximumContentAge", "GetConfigurationFlags", "SetConfigurationFlags", "EnumRecords", "GetRecord", "ClearRecords", "DeleteRecord", "DeleteUrl", "EnumPeers", "ClearPeers", "DiscoverPeers"]

    /**
     * 
     * @param {Pointer<Integer>} pBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-getmaximumcachesize
     */
    GetMaximumCacheSize(pBytes) {
        pBytesMarshal := pBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pBytesMarshal, pBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Bytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-setmaximumcachesize
     */
    SetMaximumCacheSize(Bytes) {
        result := ComCall(4, this, "uint", Bytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSeconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-getmaximumcontentage
     */
    GetMaximumContentAge(pSeconds) {
        pSecondsMarshal := pSeconds is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pSecondsMarshal, pSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-setmaximumcontentage
     */
    SetMaximumContentAge(Seconds) {
        result := ComCall(6, this, "uint", Seconds, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-getconfigurationflags
     */
    GetConfigurationFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-setconfigurationflags
     */
    SetConfigurationFlags(Flags) {
        result := ComCall(8, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBitsPeerCacheRecords>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-enumrecords
     */
    EnumRecords(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @param {Pointer<IBitsPeerCacheRecord>} ppRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-getrecord
     */
    GetRecord(id, ppRecord) {
        result := ComCall(10, this, "ptr", id, "ptr*", ppRecord, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-clearrecords
     */
    ClearRecords() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-deleterecord
     */
    DeleteRecord(id) {
        result := ComCall(12, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} url 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-deleteurl
     */
    DeleteUrl(url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(13, this, "ptr", url, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBitsPeers>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-enumpeers
     */
    EnumPeers(ppEnum) {
        result := ComCall(14, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-clearpeers
     */
    ClearPeers() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-discoverpeers
     */
    DiscoverPeers() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
