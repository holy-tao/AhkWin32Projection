#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpDataKey.ahk
#Include .\IEnumSpObjectTokens.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectTokenCategory extends ISpDataKey{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpObjectTokenCategory
     * @type {Guid}
     */
    static IID => Guid("{2d3d3845-39af-4850-bbf9-40b49780011d}")

    /**
     * The class identifier for SpObjectTokenCategory
     * @type {Guid}
     */
    static CLSID => Guid("{a910187f-0c7a-45ac-92cc-59edafb77b53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetId", "GetId", "GetDataKey", "EnumTokens", "SetDefaultTokenId", "GetDefaultTokenId"]

    /**
     * Sets the specified identifier string in the volume's metadata.
     * @param {PWSTR} pszCategoryId 
     * @param {BOOL} fCreateIfNotExist 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                  | Description                                                                                                     |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                  | The method was successful.<br/>                                                                           |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl> | This drive is locked by BitLocker Drive Encryption. You must unlock this volume from Control Panel. <br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl> | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/>                    |
     * @see https://learn.microsoft.com/windows/win32/SecProv/setidentificationfield-win32-encryptablevolume
     */
    SetId(pszCategoryId, fCreateIfNotExist) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId

        result := ComCall(15, this, "ptr", pszCategoryId, "int", fCreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * Returns the identifier string available in the volume's metadata.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getidentificationfield-win32-encryptablevolume
     */
    GetId() {
        result := ComCall(16, this, "ptr*", &ppszCoMemCategoryId := 0, "HRESULT")
        return ppszCoMemCategoryId
    }

    /**
     * 
     * @param {Integer} spdkl 
     * @returns {ISpDataKey} 
     */
    GetDataKey(spdkl) {
        result := ComCall(17, this, "int", spdkl, "ptr*", &ppDataKey := 0, "HRESULT")
        return ISpDataKey(ppDataKey)
    }

    /**
     * 
     * @param {PWSTR} pzsReqAttribs 
     * @param {PWSTR} pszOptAttribs 
     * @returns {IEnumSpObjectTokens} 
     */
    EnumTokens(pzsReqAttribs, pszOptAttribs) {
        pzsReqAttribs := pzsReqAttribs is String ? StrPtr(pzsReqAttribs) : pzsReqAttribs
        pszOptAttribs := pszOptAttribs is String ? StrPtr(pszOptAttribs) : pszOptAttribs

        result := ComCall(18, this, "ptr", pzsReqAttribs, "ptr", pszOptAttribs, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSpObjectTokens(ppEnum)
    }

    /**
     * 
     * @param {PWSTR} pszTokenId 
     * @returns {HRESULT} 
     */
    SetDefaultTokenId(pszTokenId) {
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(19, this, "ptr", pszTokenId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetDefaultTokenId() {
        result := ComCall(20, this, "ptr*", &ppszCoMemTokenId := 0, "HRESULT")
        return ppszCoMemTokenId
    }
}
