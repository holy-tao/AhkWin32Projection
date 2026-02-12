#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_MD_IMPORT_SESSION_KEY extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<CARD_DATA>} pCardData 
     * @param {PWSTR} pwszBlobType 
     * @param {PWSTR} pwszAlgId 
     * @param {Pointer<Pointer>} phKey 
     * @param {Pointer} pbInput 
     * @param {Integer} cbInput 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pCardData, pwszBlobType, pwszAlgId, phKey, pbInput, cbInput) {
        pwszBlobType := pwszBlobType is String ? StrPtr(pwszBlobType) : pwszBlobType
        pwszAlgId := pwszAlgId is String ? StrPtr(pwszAlgId) : pwszAlgId

        phKeyMarshal := phKey is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pCardData, "ptr", pwszBlobType, "ptr", pwszAlgId, phKeyMarshal, phKey, "ptr", pbInput, "uint", cbInput, "uint")
        return result
    }
}
