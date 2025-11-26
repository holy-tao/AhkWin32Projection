#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnhancedStorageACT.ahk
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
     * Returns an enumeration of all the Addressable Command Targets (ACT) currently connected to the system. If at least one ACT is present, the Enhanced Storage API allocates an array of 1 or more IEnumEnhancedStorageACT pointers.
     * @param {Pointer<Pointer<IEnhancedStorageACT>>} pppIEnhancedStorageACTs Array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstorageact">IEnhancedStorageACT</a> interface pointers that represent the ACTs for all devices connected to the system. This array is allocated within the API.
     * @param {Pointer<Integer>} pcEnhancedStorageACTs Count of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstorageact">IEnhancedStorageACT</a> pointers returned. This is the dimension of the  array represented by <i>pppIEnhancedStorageACTs</i>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more ACTs were found. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pppIEnhancedStorageACTs or pcEnhancedStorageACTs is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operation failed due to insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienumenhancedstorageact-getacts
     */
    GetACTs(pppIEnhancedStorageACTs, pcEnhancedStorageACTs) {
        pppIEnhancedStorageACTsMarshal := pppIEnhancedStorageACTs is VarRef ? "ptr*" : "ptr"
        pcEnhancedStorageACTsMarshal := pcEnhancedStorageACTs is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pppIEnhancedStorageACTsMarshal, pppIEnhancedStorageACTs, pcEnhancedStorageACTsMarshal, pcEnhancedStorageACTs, "HRESULT")
        return result
    }

    /**
     * Returns the Addressable Command Target (ACT) associated with the volume specified via the string supplied by the client.
     * @param {PWSTR} szVolume A string that specifies the volume for which a matching ACT is searched for.
     * @returns {IEnhancedStorageACT} Pointer to an <b>IEnhancedStorageACT</b> interface pointer that represents the matching ACT. If no matching ACT is found the error <b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienumenhancedstorageact-getmatchingact
     */
    GetMatchingACT(szVolume) {
        szVolume := szVolume is String ? StrPtr(szVolume) : szVolume

        result := ComCall(4, this, "ptr", szVolume, "ptr*", &ppIEnhancedStorageACT := 0, "HRESULT")
        return IEnhancedStorageACT(ppIEnhancedStorageACT)
    }
}
