#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_OFFLOAD_MOD_EXPO extends IUnknown {

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
     * @param {Pointer<Integer>} pbBase 
     * @param {Pointer<Integer>} pbExponent 
     * @param {Integer} cbExponent 
     * @param {Pointer<Integer>} pbModulus 
     * @param {Integer} cbModulus 
     * @param {Pointer<Integer>} pbResult 
     * @param {Pointer<Void>} pvOffloadPrivateKey 
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pbBase, pbExponent, cbExponent, pbModulus, cbModulus, pbResult, pvOffloadPrivateKey, dwFlags) {
        pbBaseMarshal := pbBase is VarRef ? "char*" : "ptr"
        pbExponentMarshal := pbExponent is VarRef ? "char*" : "ptr"
        pbModulusMarshal := pbModulus is VarRef ? "char*" : "ptr"
        pbResultMarshal := pbResult is VarRef ? "char*" : "ptr"
        pvOffloadPrivateKeyMarshal := pvOffloadPrivateKey is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pbBaseMarshal, pbBase, pbExponentMarshal, pbExponent, "uint", cbExponent, pbModulusMarshal, pbModulus, "uint", cbModulus, pbResultMarshal, pbResult, pvOffloadPrivateKeyMarshal, pvOffloadPrivateKey, "uint", dwFlags, "int")
        return result
    }
}
