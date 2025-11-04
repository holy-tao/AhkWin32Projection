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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetACTs", "GetMatchingACT"]

    /**
     * 
     * @param {Pointer<Pointer<IEnhancedStorageACT>>} pppIEnhancedStorageACTs 
     * @param {Pointer<Integer>} pcEnhancedStorageACTs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienumenhancedstorageact-getacts
     */
    GetACTs(pppIEnhancedStorageACTs, pcEnhancedStorageACTs) {
        pppIEnhancedStorageACTsMarshal := pppIEnhancedStorageACTs is VarRef ? "ptr*" : "ptr"
        pcEnhancedStorageACTsMarshal := pcEnhancedStorageACTs is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pppIEnhancedStorageACTsMarshal, pppIEnhancedStorageACTs, pcEnhancedStorageACTsMarshal, pcEnhancedStorageACTs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szVolume 
     * @param {Pointer<IEnhancedStorageACT>} ppIEnhancedStorageACT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienumenhancedstorageact-getmatchingact
     */
    GetMatchingACT(szVolume, ppIEnhancedStorageACT) {
        szVolume := szVolume is String ? StrPtr(szVolume) : szVolume

        result := ComCall(4, this, "ptr", szVolume, "ptr*", ppIEnhancedStorageACT, "HRESULT")
        return result
    }
}
