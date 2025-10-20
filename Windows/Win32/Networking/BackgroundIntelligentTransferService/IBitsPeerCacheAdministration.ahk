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
     * 
     * @param {Pointer<UInt32>} pBytes 
     * @returns {HRESULT} 
     */
    GetMaximumCacheSize(pBytes) {
        result := ComCall(3, this, "uint*", pBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Bytes 
     * @returns {HRESULT} 
     */
    SetMaximumCacheSize(Bytes) {
        result := ComCall(4, this, "uint", Bytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pSeconds 
     * @returns {HRESULT} 
     */
    GetMaximumContentAge(pSeconds) {
        result := ComCall(5, this, "uint*", pSeconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     */
    SetMaximumContentAge(Seconds) {
        result := ComCall(6, this, "uint", Seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    GetConfigurationFlags(pFlags) {
        result := ComCall(7, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetConfigurationFlags(Flags) {
        result := ComCall(8, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBitsPeerCacheRecords>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumRecords(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @param {Pointer<IBitsPeerCacheRecord>} ppRecord 
     * @returns {HRESULT} 
     */
    GetRecord(id, ppRecord) {
        result := ComCall(10, this, "ptr", id, "ptr", ppRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearRecords() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @returns {HRESULT} 
     */
    DeleteRecord(id) {
        result := ComCall(12, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} url 
     * @returns {HRESULT} 
     */
    DeleteUrl(url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(13, this, "ptr", url, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBitsPeers>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumPeers(ppEnum) {
        result := ComCall(14, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearPeers() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DiscoverPeers() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
