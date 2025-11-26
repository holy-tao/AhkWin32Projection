#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ACT_AUTHORIZATION_STATE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface to obtain information and perform operations for an 1667 Addressable Contact Target (ACT).
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienhancedstorageact
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageACT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnhancedStorageACT
     * @type {Guid}
     */
    static IID => Guid("{6e7781f4-e0f2-4239-b976-a01abab52930}")

    /**
     * The class identifier for EnhancedStorageACT
     * @type {Guid}
     */
    static CLSID => Guid("{af076a15-2ece-4ad4-bb21-29f040e176d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Authorize", "Unauthorize", "GetAuthorizationState", "GetMatchingVolume", "GetUniqueIdentity", "GetSilos"]

    /**
     * Associates the Addressable Command Target (ACT) with the Authorized state defined by ACT_AUTHORIZATION_STATE, and ensures the authentication of each individual silo according to the required sequence and logical combination necessary to authorize access to the ACT.
     * @param {Integer} hwndParent Not used.
     * @param {Integer} dwFlags Not used.
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
     * Authorization completed successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authorization operation has failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstorageact-authorize
     */
    Authorize(hwndParent, dwFlags) {
        result := ComCall(3, this, "uint", hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Associates the Addressable Command Target (ACT) with the Unauthorized state defined by ACT_AUTHORIZATION_STATE, and ensures the deauthentication of each individual silo according to the required sequence and logical combination necessary to restrict access to the ACT.
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
     * Unauthorization completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstorageact-unauthorize
     */
    Unauthorize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Returns the current authorization state of the ACT.
     * @returns {ACT_AUTHORIZATION_STATE} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ehstorapi/ns-ehstorapi-act_authorization_state">ACT_AUTHORIZATION_STATE</a> that specifies the current authorization state of the ACT.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstorageact-getauthorizationstate
     */
    GetAuthorizationState() {
        pState := ACT_AUTHORIZATION_STATE()
        result := ComCall(5, this, "ptr", pState, "HRESULT")
        return pState
    }

    /**
     * Returns the volume associated with the Addressable Command Target (ACT).
     * @returns {PWSTR} Pointer to a string that represents the volume associated with the ACT.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstorageact-getmatchingvolume
     */
    GetMatchingVolume() {
        result := ComCall(6, this, "ptr*", &ppwszVolume := 0, "HRESULT")
        return ppwszVolume
    }

    /**
     * Retrieves the unique identity of the Addressable Command Targer (ACT).
     * @returns {PWSTR} Pointer to a string that represents the unique identity of the ACT.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstorageact-getuniqueidentity
     */
    GetUniqueIdentity() {
        result := ComCall(7, this, "ptr*", &ppwszIdentity := 0, "HRESULT")
        return ppwszIdentity
    }

    /**
     * Returns an enumeration of all silos associated with the Addressable Command Target (ACT).
     * @param {Pointer<Pointer<IEnhancedStorageSilo>>} pppIEnhancedStorageSilos Returns an array of one or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstoragesilo">IEnhancedStorageSilo</a> interface pointers associated with  the ACT.
     * @param {Pointer<Integer>} pcEnhancedStorageSilos Count of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstoragesilo">IEnhancedStorageSilo</a> pointers returned. This value indicates the dimension of the  array represented by <i>pppIEnhancedStorageSilos</i>.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Command was sent successfully and all associated silos have been enumerated. 
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
     * Command failed due to insufficient memory allocation.
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
     * <i>pppIEnhancedStorageSilos</i> or <i>pcEnhancedStorageSilos</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstorageact-getsilos
     */
    GetSilos(pppIEnhancedStorageSilos, pcEnhancedStorageSilos) {
        pppIEnhancedStorageSilosMarshal := pppIEnhancedStorageSilos is VarRef ? "ptr*" : "ptr"
        pcEnhancedStorageSilosMarshal := pcEnhancedStorageSilos is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pppIEnhancedStorageSilosMarshal, pppIEnhancedStorageSilos, pcEnhancedStorageSilosMarshal, pcEnhancedStorageSilos, "HRESULT")
        return result
    }
}
