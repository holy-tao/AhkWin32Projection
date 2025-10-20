#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an available ad hoc network destination within connection range.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocnetwork
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocNetwork extends IUnknown{
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
     * 
     * @param {Pointer<Int32>} eStatus 
     * @returns {HRESULT} 
     */
    GetStatus(eStatus) {
        result := ComCall(3, this, "int*", eStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwSSID 
     * @returns {HRESULT} 
     */
    GetSSID(ppszwSSID) {
        result := ComCall(4, this, "ptr", ppszwSSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pf11d 
     * @returns {HRESULT} 
     */
    HasProfile(pf11d) {
        result := ComCall(5, this, "char*", pf11d, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwProfileName 
     * @returns {HRESULT} 
     */
    GetProfileName(ppszwProfileName) {
        result := ComCall(6, this, "ptr", ppszwProfileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteProfile() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puStrengthValue 
     * @param {Pointer<UInt32>} puStrengthMax 
     * @returns {HRESULT} 
     */
    GetSignalQuality(puStrengthValue, puStrengthMax) {
        result := ComCall(8, this, "uint*", puStrengthValue, "uint*", puStrengthMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDot11AdHocSecuritySettings>} pAdHocSecuritySetting 
     * @returns {HRESULT} 
     */
    GetSecuritySetting(pAdHocSecuritySetting) {
        result := ComCall(9, this, "ptr", pAdHocSecuritySetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pContextGuid 
     * @returns {HRESULT} 
     */
    GetContextGuid(pContextGuid) {
        result := ComCall(10, this, "ptr", pContextGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSignature 
     * @returns {HRESULT} 
     */
    GetSignature(pSignature) {
        result := ComCall(11, this, "ptr", pSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDot11AdHocInterface>} pAdHocInterface 
     * @returns {HRESULT} 
     */
    GetInterface(pAdHocInterface) {
        result := ComCall(12, this, "ptr", pAdHocInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Passphrase 
     * @param {Integer} GeographicalId 
     * @param {BOOLEAN} fSaveProfile 
     * @param {BOOLEAN} fMakeSavedProfileUserSpecific 
     * @returns {HRESULT} 
     */
    Connect(Passphrase, GeographicalId, fSaveProfile, fMakeSavedProfileUserSpecific) {
        Passphrase := Passphrase is String ? StrPtr(Passphrase) : Passphrase

        result := ComCall(13, this, "ptr", Passphrase, "int", GeographicalId, "char", fSaveProfile, "char", fMakeSavedProfileUserSpecific, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
