#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Reads XML data.
 * @remarks
 * The callback function does not return a value unless the number of bytes specified in <i>cbData</i> 
 *  is available or  the last block of data has been read.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-pfn_crypt_xml_data_provider_read
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_XML_DATA_PROVIDER_READ extends IUnknown {

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
     * @param {Pointer<Void>} pvCallbackState 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvCallbackState, pbData, cbData, pcbRead) {
        pvCallbackStateMarshal := pvCallbackState is VarRef ? "ptr" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pvCallbackStateMarshal, pvCallbackState, "ptr", pbData, "uint", cbData, pcbReadMarshal, pcbRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
