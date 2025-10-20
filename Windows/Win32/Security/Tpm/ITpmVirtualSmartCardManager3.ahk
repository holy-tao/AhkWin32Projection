#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITpmVirtualSmartCardManager2.ahk

/**
 * @namespace Windows.Win32.Security.Tpm
 * @version v4.0.30319
 */
class ITpmVirtualSmartCardManager3 extends ITpmVirtualSmartCardManager2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITpmVirtualSmartCardManager3
     * @type {Guid}
     */
    static IID => Guid("{3c745a97-f375-4150-be17-5950f694c699}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVirtualSmartCardWithAttestation"]

    /**
     * 
     * @param {PWSTR} pszFriendlyName 
     * @param {Integer} bAdminAlgId 
     * @param {Pointer<Integer>} pbAdminKey 
     * @param {Integer} cbAdminKey 
     * @param {Pointer<Integer>} pbAdminKcv 
     * @param {Integer} cbAdminKcv 
     * @param {Pointer<Integer>} pbPuk 
     * @param {Integer} cbPuk 
     * @param {Pointer<Integer>} pbPin 
     * @param {Integer} cbPin 
     * @param {Pointer<Integer>} pbPinPolicy 
     * @param {Integer} cbPinPolicy 
     * @param {Integer} attestationType 
     * @param {BOOL} fGenerate 
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback 
     * @param {Pointer<PWSTR>} ppszInstanceId 
     * @returns {HRESULT} 
     */
    CreateVirtualSmartCardWithAttestation(pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, attestationType, fGenerate, pStatusCallback, ppszInstanceId) {
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        result := ComCall(6, this, "ptr", pszFriendlyName, "char", bAdminAlgId, "char*", pbAdminKey, "uint", cbAdminKey, "char*", pbAdminKcv, "uint", cbAdminKcv, "char*", pbPuk, "uint", cbPuk, "char*", pbPin, "uint", cbPin, "char*", pbPinPolicy, "uint", cbPinPolicy, "int", attestationType, "int", fGenerate, "ptr", pStatusCallback, "ptr", ppszInstanceId, "HRESULT")
        return result
    }
}
