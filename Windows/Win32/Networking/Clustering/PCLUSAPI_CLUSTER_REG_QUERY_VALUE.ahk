#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_CLUSTER_REG_QUERY_VALUE extends IUnknown {

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
     * @param {PWSTR} lpszValueName 
     * @param {Pointer<Integer>} lpdwValueType 
     * @param {Pointer} lpData 
     * @param {Pointer<Integer>} lpcbData 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hKey_, lpszValueName, lpdwValueType, lpData, lpcbData) {
        hKey_ := hKey_ is Win32Handle ? NumGet(hKey_, "ptr") : hKey_
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName

        lpdwValueTypeMarshal := lpdwValueType is VarRef ? "uint*" : "ptr"
        lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hKey_, "ptr", lpszValueName, lpdwValueTypeMarshal, lpdwValueType, "ptr", lpData, lpcbDataMarshal, lpcbData, "int")
        return result
    }
}
