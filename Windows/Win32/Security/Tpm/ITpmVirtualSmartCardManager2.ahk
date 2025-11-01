#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITpmVirtualSmartCardManager.ahk

/**
 * @namespace Windows.Win32.Security.Tpm
 * @version v4.0.30319
 */
class ITpmVirtualSmartCardManager2 extends ITpmVirtualSmartCardManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITpmVirtualSmartCardManager2
     * @type {Guid}
     */
    static IID => Guid("{fdf8a2b9-02de-47f4-bc26-aa85ab5e5267}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVirtualSmartCardWithPinPolicy"]

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
     * @param {BOOL} fGenerate 
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback 
     * @param {Pointer<PWSTR>} ppszInstanceId 
     * @param {Pointer<BOOL>} pfNeedReboot 
     * @returns {HRESULT} 
     */
    CreateVirtualSmartCardWithPinPolicy(pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot) {
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        result := ComCall(5, this, "ptr", pszFriendlyName, "char", bAdminAlgId, "char*", pbAdminKey, "uint", cbAdminKey, "char*", pbAdminKcv, "uint", cbAdminKcv, "char*", pbPuk, "uint", cbPuk, "char*", pbPin, "uint", cbPin, "char*", pbPinPolicy, "uint", cbPinPolicy, "int", fGenerate, "ptr", pStatusCallback, "ptr", ppszInstanceId, "ptr", pfNeedReboot, "HRESULT")
        return result
    }
}
