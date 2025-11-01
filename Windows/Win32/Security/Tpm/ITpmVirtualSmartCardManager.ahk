#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages the TPM virtual smart cards.
 * @see https://docs.microsoft.com/windows/win32/api//tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanager
 * @namespace Windows.Win32.Security.Tpm
 * @version v4.0.30319
 */
class ITpmVirtualSmartCardManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITpmVirtualSmartCardManager
     * @type {Guid}
     */
    static IID => Guid("{112b1dff-d9dc-41f7-869f-d67fee7cb591}")

    /**
     * The class identifier for TpmVirtualSmartCardManager
     * @type {Guid}
     */
    static CLSID => Guid("{16a18e86-7f6e-4c20-ad89-4ffc0db7a96a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVirtualSmartCard", "DestroyVirtualSmartCard"]

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
     * @param {BOOL} fGenerate 
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback 
     * @param {Pointer<PWSTR>} ppszInstanceId 
     * @param {Pointer<BOOL>} pfNeedReboot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/nf-tpmvscmgr-itpmvirtualsmartcardmanager-createvirtualsmartcard
     */
    CreateVirtualSmartCard(pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot) {
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        result := ComCall(3, this, "ptr", pszFriendlyName, "char", bAdminAlgId, "char*", pbAdminKey, "uint", cbAdminKey, "char*", pbAdminKcv, "uint", cbAdminKcv, "char*", pbPuk, "uint", cbPuk, "char*", pbPin, "uint", cbPin, "int", fGenerate, "ptr", pStatusCallback, "ptr", ppszInstanceId, "ptr", pfNeedReboot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszInstanceId 
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback 
     * @param {Pointer<BOOL>} pfNeedReboot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tpmvscmgr/nf-tpmvscmgr-itpmvirtualsmartcardmanager-destroyvirtualsmartcard
     */
    DestroyVirtualSmartCard(pszInstanceId, pStatusCallback, pfNeedReboot) {
        pszInstanceId := pszInstanceId is String ? StrPtr(pszInstanceId) : pszInstanceId

        result := ComCall(4, this, "ptr", pszInstanceId, "ptr", pStatusCallback, "ptr", pfNeedReboot, "HRESULT")
        return result
    }
}
