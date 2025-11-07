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
     * @returns {PWSTR} 
     */
    CreateVirtualSmartCardWithAttestation(pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, attestationType, fGenerate, pStatusCallback) {
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        pbAdminKeyMarshal := pbAdminKey is VarRef ? "char*" : "ptr"
        pbAdminKcvMarshal := pbAdminKcv is VarRef ? "char*" : "ptr"
        pbPukMarshal := pbPuk is VarRef ? "char*" : "ptr"
        pbPinMarshal := pbPin is VarRef ? "char*" : "ptr"
        pbPinPolicyMarshal := pbPinPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", pszFriendlyName, "char", bAdminAlgId, pbAdminKeyMarshal, pbAdminKey, "uint", cbAdminKey, pbAdminKcvMarshal, pbAdminKcv, "uint", cbAdminKcv, pbPukMarshal, pbPuk, "uint", cbPuk, pbPinMarshal, pbPin, "uint", cbPin, pbPinPolicyMarshal, pbPinPolicy, "uint", cbPinPolicy, "int", attestationType, "int", fGenerate, "ptr", pStatusCallback, "ptr*", &ppszInstanceId := 0, "HRESULT")
        return ppszInstanceId
    }
}
