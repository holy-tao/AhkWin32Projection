#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDot11AdHocNetwork.ahk
#Include .\IEnumDot11AdHocNetworks.ahk
#Include .\IEnumDot11AdHocInterfaces.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates and manages 802.11 ad hoc networks.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocmanager
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocManager
     * @type {Guid}
     */
    static IID => Guid("{8f10cc26-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The class identifier for Dot11AdHocManager
     * @type {Guid}
     */
    static CLSID => Guid("{dd06a84f-83bd-4d01-8ab9-2389fea0869e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNetwork", "CommitCreatedNetwork", "GetIEnumDot11AdHocNetworks", "GetIEnumDot11AdHocInterfaces", "GetNetwork"]

    /**
     * 
     * @param {PWSTR} Name 
     * @param {PWSTR} Password 
     * @param {Integer} GeographicalId 
     * @param {IDot11AdHocInterface} pInterface 
     * @param {IDot11AdHocSecuritySettings} pSecurity 
     * @param {Pointer<Guid>} pContextGuid 
     * @returns {IDot11AdHocNetwork} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-createnetwork
     */
    CreateNetwork(Name, Password, GeographicalId, pInterface, pSecurity, pContextGuid) {
        Name := Name is String ? StrPtr(Name) : Name
        Password := Password is String ? StrPtr(Password) : Password

        result := ComCall(3, this, "ptr", Name, "ptr", Password, "int", GeographicalId, "ptr", pInterface, "ptr", pSecurity, "ptr", pContextGuid, "ptr*", &pIAdHoc := 0, "HRESULT")
        return IDot11AdHocNetwork(pIAdHoc)
    }

    /**
     * 
     * @param {IDot11AdHocNetwork} pIAdHoc 
     * @param {BOOLEAN} fSaveProfile 
     * @param {BOOLEAN} fMakeSavedProfileUserSpecific 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-commitcreatednetwork
     */
    CommitCreatedNetwork(pIAdHoc, fSaveProfile, fMakeSavedProfileUserSpecific) {
        result := ComCall(4, this, "ptr", pIAdHoc, "char", fSaveProfile, "char", fMakeSavedProfileUserSpecific, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pContextGuid 
     * @returns {IEnumDot11AdHocNetworks} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-getienumdot11adhocnetworks
     */
    GetIEnumDot11AdHocNetworks(pContextGuid) {
        result := ComCall(5, this, "ptr", pContextGuid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDot11AdHocNetworks(ppEnum)
    }

    /**
     * 
     * @returns {IEnumDot11AdHocInterfaces} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-getienumdot11adhocinterfaces
     */
    GetIEnumDot11AdHocInterfaces() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDot11AdHocInterfaces(ppEnum)
    }

    /**
     * 
     * @param {Pointer<Guid>} NetworkSignature 
     * @returns {IDot11AdHocNetwork} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanager-getnetwork
     */
    GetNetwork(NetworkSignature) {
        result := ComCall(7, this, "ptr", NetworkSignature, "ptr*", &pNetwork := 0, "HRESULT")
        return IDot11AdHocNetwork(pNetwork)
    }
}
