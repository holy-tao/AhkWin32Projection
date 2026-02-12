#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSTER_DECRYPT extends IUnknown {

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
     * @param {HCLUSCRYPTPROVIDER} hClusCryptProvider_ 
     * @param {Pointer<Integer>} pCryptInput 
     * @param {Integer} cbCryptInput 
     * @param {Pointer<Pointer<Integer>>} ppCryptOutput 
     * @param {Pointer<Integer>} pcbCryptOutput 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hClusCryptProvider_, pCryptInput, cbCryptInput, ppCryptOutput, pcbCryptOutput) {
        hClusCryptProvider_ := hClusCryptProvider_ is Win32Handle ? NumGet(hClusCryptProvider_, "ptr") : hClusCryptProvider_

        pCryptInputMarshal := pCryptInput is VarRef ? "char*" : "ptr"
        ppCryptOutputMarshal := ppCryptOutput is VarRef ? "ptr*" : "ptr"
        pcbCryptOutputMarshal := pcbCryptOutput is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hClusCryptProvider_, pCryptInputMarshal, pCryptInput, "uint", cbCryptInput, ppCryptOutputMarshal, ppCryptOutput, pcbCryptOutputMarshal, pcbCryptOutput, "uint")
        return result
    }
}
