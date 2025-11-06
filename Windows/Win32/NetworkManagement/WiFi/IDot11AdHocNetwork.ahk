#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDot11AdHocSecuritySettings.ahk
#Include .\IDot11AdHocInterface.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an available ad hoc network destination within connection range.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocnetwork
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocNetwork extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocNetwork
     * @type {Guid}
     */
    static IID => Guid("{8f10cc29-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "GetSSID", "HasProfile", "GetProfileName", "DeleteProfile", "GetSignalQuality", "GetSecuritySetting", "GetContextGuid", "GetSignature", "GetInterface", "Connect", "Disconnect"]

    /**
     * 
     * @param {Pointer<Integer>} eStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getstatus
     */
    GetStatus(eStatus) {
        eStatusMarshal := eStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, eStatusMarshal, eStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getssid
     */
    GetSSID() {
        result := ComCall(4, this, "ptr*", &ppszwSSID := 0, "HRESULT")
        return ppszwSSID
    }

    /**
     * 
     * @param {Pointer<Integer>} pf11d 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-hasprofile
     */
    HasProfile(pf11d) {
        pf11dMarshal := pf11d is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pf11dMarshal, pf11d, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getprofilename
     */
    GetProfileName() {
        result := ComCall(6, this, "ptr*", &ppszwProfileName := 0, "HRESULT")
        return ppszwProfileName
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-deleteprofile
     */
    DeleteProfile() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puStrengthValue 
     * @param {Pointer<Integer>} puStrengthMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getsignalquality
     */
    GetSignalQuality(puStrengthValue, puStrengthMax) {
        puStrengthValueMarshal := puStrengthValue is VarRef ? "uint*" : "ptr"
        puStrengthMaxMarshal := puStrengthMax is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, puStrengthValueMarshal, puStrengthValue, puStrengthMaxMarshal, puStrengthMax, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDot11AdHocSecuritySettings} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getsecuritysetting
     */
    GetSecuritySetting() {
        result := ComCall(9, this, "ptr*", &pAdHocSecuritySetting := 0, "HRESULT")
        return IDot11AdHocSecuritySettings(pAdHocSecuritySetting)
    }

    /**
     * 
     * @param {Pointer<Guid>} pContextGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getcontextguid
     */
    GetContextGuid(pContextGuid) {
        result := ComCall(10, this, "ptr", pContextGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSignature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getsignature
     */
    GetSignature(pSignature) {
        result := ComCall(11, this, "ptr", pSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDot11AdHocInterface} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-getinterface
     */
    GetInterface() {
        result := ComCall(12, this, "ptr*", &pAdHocInterface := 0, "HRESULT")
        return IDot11AdHocInterface(pAdHocInterface)
    }

    /**
     * 
     * @param {PWSTR} Passphrase 
     * @param {Integer} GeographicalId 
     * @param {BOOLEAN} fSaveProfile 
     * @param {BOOLEAN} fMakeSavedProfileUserSpecific 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-connect
     */
    Connect(Passphrase, GeographicalId, fSaveProfile, fMakeSavedProfileUserSpecific) {
        Passphrase := Passphrase is String ? StrPtr(Passphrase) : Passphrase

        result := ComCall(13, this, "ptr", Passphrase, "int", GeographicalId, "char", fSaveProfile, "char", fMakeSavedProfileUserSpecific, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocnetwork-disconnect
     */
    Disconnect() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
