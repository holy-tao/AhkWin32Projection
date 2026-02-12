#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CARD_GET_CONTAINER_PROPERTY extends IUnknown {

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
     * @param {Integer} bContainerIndex 
     * @param {PWSTR} wszProperty 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pdwDataLen 
     * @param {Integer} dwFlags 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pCardData, bContainerIndex, wszProperty, pbData, cbData, pdwDataLen, dwFlags) {
        wszProperty := wszProperty is String ? StrPtr(wszProperty) : wszProperty

        pdwDataLenMarshal := pdwDataLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pCardData, "char", bContainerIndex, "ptr", wszProperty, "ptr", pbData, "uint", cbData, pdwDataLenMarshal, pdwDataLen, "uint", dwFlags, "uint")
        return result
    }
}
