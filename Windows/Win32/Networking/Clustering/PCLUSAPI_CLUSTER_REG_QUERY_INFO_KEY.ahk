#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY extends IUnknown {

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
     * @param {HKEY} hKey_ 
     * @param {Pointer<Integer>} lpcSubKeys 
     * @param {Pointer<Integer>} lpcbMaxSubKeyLen 
     * @param {Pointer<Integer>} lpcValues 
     * @param {Pointer<Integer>} lpcbMaxValueNameLen 
     * @param {Pointer<Integer>} lpcbMaxValueLen 
     * @param {Pointer<Integer>} lpcbSecurityDescriptor 
     * @param {Pointer<FILETIME>} lpftLastWriteTime 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hKey_, lpcSubKeys, lpcbMaxSubKeyLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
        hKey_ := hKey_ is Win32Handle ? NumGet(hKey_, "ptr") : hKey_

        lpcSubKeysMarshal := lpcSubKeys is VarRef ? "uint*" : "ptr"
        lpcbMaxSubKeyLenMarshal := lpcbMaxSubKeyLen is VarRef ? "uint*" : "ptr"
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
        lpcbMaxValueNameLenMarshal := lpcbMaxValueNameLen is VarRef ? "uint*" : "ptr"
        lpcbMaxValueLenMarshal := lpcbMaxValueLen is VarRef ? "uint*" : "ptr"
        lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hKey_, lpcSubKeysMarshal, lpcSubKeys, lpcbMaxSubKeyLenMarshal, lpcbMaxSubKeyLen, lpcValuesMarshal, lpcValues, lpcbMaxValueNameLenMarshal, lpcbMaxValueNameLen, lpcbMaxValueLenMarshal, lpcbMaxValueLen, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, "ptr", lpftLastWriteTime, "int")
        return result
    }
}
