#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface as the top level enumerator for all IEEE 1667 Addressable Contact Targets (ACT).
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienumenhancedstorageact
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnumEnhancedStorageACT extends IUnknown{
    /**
     * The interface identifier for IEnumEnhancedStorageACT
     * @type {Guid}
     */
    static IID => Guid("{09b224bd-1335-4631-a7ff-cfd3a92646d7}")

    /**
     * The class identifier for EnumEnhancedStorageACT
     * @type {Guid}
     */
    static CLSID => Guid("{fe841493-835c-4fa3-b6cc-b4b2d4719848}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnhancedStorageACT>} pppIEnhancedStorageACTs 
     * @param {Pointer<UInt32>} pcEnhancedStorageACTs 
     * @returns {HRESULT} 
     */
    GetACTs(pppIEnhancedStorageACTs, pcEnhancedStorageACTs) {
        result := ComCall(3, this, "ptr", pppIEnhancedStorageACTs, "uint*", pcEnhancedStorageACTs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szVolume 
     * @param {Pointer<IEnhancedStorageACT>} ppIEnhancedStorageACT 
     * @returns {HRESULT} 
     */
    GetMatchingACT(szVolume, ppIEnhancedStorageACT) {
        szVolume := szVolume is String ? StrPtr(szVolume) : szVolume

        result := ComCall(4, this, "ptr", szVolume, "ptr", ppIEnhancedStorageACT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
