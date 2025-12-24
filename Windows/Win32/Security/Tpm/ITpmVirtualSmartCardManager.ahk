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
     * Creates a TPM virtual smart card with the given parameters.
     * @param {PWSTR} pszFriendlyName Display name of the smart card reader node. This is shown in the Device Manager, but it is not the reader name as seen by the smart card resource manager (SCRM).
     * @param {Integer} bAdminAlgId Algorithm identifier of the admin key. Currently, to work with the inbox GIDS minidriver, this value should be VSC_DEFAULT_ADMIN_ALGORITHM_ID (3-key triple DES with ISO/IEC 9797 padding method 2 in CBC chaining mode).
     * @param {Pointer<Integer>} pbAdminKey Pointer to a byte array that contains the admin key of the virtual smart card to be created.
     * @param {Integer} cbAdminKey Size, in bytes, of the byte array pointed to by the <i>pbAdminKey</i> parameter.
     * @param {Pointer<Integer>} pbAdminKcv Pointer to a byte array that contains the key check value of the admin key. Key check value is defined as the first 3 bytes of the output BLOB when using the admin key to encrypt a block of zeros. If the key check value is not provided, there will be no integrity check for the admin key.
     * @param {Integer} cbAdminKcv Size, in bytes, of the byte array pointed to by the <i>pbAdminKcv</i> parameter.
     * @param {Pointer<Integer>} pbPuk Pointer to a byte array that contains the PIN unlock key (PUK) value of the virtual smart card. It is usually a sequence of ASCII characters with a minimal length of 8 characters. If the PUK is not provided, the virtual smart card will be created without a PUK role and instead will use the challenge/response-based PIN reset through the admin role.
     * @param {Integer} cbPuk Size, in bytes, of the byte array pointed to by the <i>pbPuk</i> parameter.
     * @param {Pointer<Integer>} pbPin Pointer to a byte array that contains the PIN value of the virtual smart card. It is usually a sequence of ASCII characters with a length of 8 characters minimum and 127 characters maximum.
     * @param {Integer} cbPin Size, in bytes, of the byte array pointed to by the <i>pbPin</i> parameter.
     * @param {BOOL} fGenerate Indicates whether the virtual smart card needs to be provisioned with all necessary files required by the base CSP and smart card KSP.
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback">ITpmVirtualSmartCardManagerStatusCallback</a> interface. The TPM virtual smart card manager uses this callback interface to communicate the progress or error during virtual smart card creation. If the <i>pStatusCallback</i> parameter is <b>NULL</b>, no progress is reported to the client before the operation completes.
     * @param {Pointer<PWSTR>} ppszInstanceId Pointer to a pointer to a Unicode buffer to receive the instance ID of the created virtual smart card.
     * @param {Pointer<BOOL>} pfNeedReboot Pointer to a Boolean value to receive whether the requested operation needs to reboot the computer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns a Win32 error code.
     * @see https://docs.microsoft.com/windows/win32/api//tpmvscmgr/nf-tpmvscmgr-itpmvirtualsmartcardmanager-createvirtualsmartcard
     */
    CreateVirtualSmartCard(pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot) {
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        pbAdminKeyMarshal := pbAdminKey is VarRef ? "char*" : "ptr"
        pbAdminKcvMarshal := pbAdminKcv is VarRef ? "char*" : "ptr"
        pbPukMarshal := pbPuk is VarRef ? "char*" : "ptr"
        pbPinMarshal := pbPin is VarRef ? "char*" : "ptr"
        ppszInstanceIdMarshal := ppszInstanceId is VarRef ? "ptr*" : "ptr"
        pfNeedRebootMarshal := pfNeedReboot is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pszFriendlyName, "char", bAdminAlgId, pbAdminKeyMarshal, pbAdminKey, "uint", cbAdminKey, pbAdminKcvMarshal, pbAdminKcv, "uint", cbAdminKcv, pbPukMarshal, pbPuk, "uint", cbPuk, pbPinMarshal, pbPin, "uint", cbPin, "int", fGenerate, "ptr", pStatusCallback, ppszInstanceIdMarshal, ppszInstanceId, pfNeedRebootMarshal, pfNeedReboot, "HRESULT")
        return result
    }

    /**
     * Destroys the TPM virtual smart card that has the given instance ID.
     * @param {PWSTR} pszInstanceId Instance identifier of the TPM virtual smart card that is returned from a successful <a href="https://docs.microsoft.com/windows/desktop/api/tpmvscmgr/nf-tpmvscmgr-itpmvirtualsmartcardmanager-createvirtualsmartcard">CreateVirtualSmartCard</a> method call.
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tpmvscmgr/nn-tpmvscmgr-itpmvirtualsmartcardmanagerstatuscallback">ITpmVirtualSmartCardManagerStatusCallback</a> interface. The TPM virtual smart card manager uses this callback interface to communicate the progress and errors during creation of the virtual smart card. If the <i>pStatusCallback</i> parameter is <b>NULL</b>, no progress is reported to the client before the operation completes.
     * @returns {BOOL} Pointer to a Boolean value to receive whether the requested operation needs to reboot the client computer.
     * @see https://docs.microsoft.com/windows/win32/api//tpmvscmgr/nf-tpmvscmgr-itpmvirtualsmartcardmanager-destroyvirtualsmartcard
     */
    DestroyVirtualSmartCard(pszInstanceId, pStatusCallback) {
        pszInstanceId := pszInstanceId is String ? StrPtr(pszInstanceId) : pszInstanceId

        result := ComCall(4, this, "ptr", pszInstanceId, "ptr", pStatusCallback, "int*", &pfNeedReboot := 0, "HRESULT")
        return pfNeedReboot
    }
}
