#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_CLUSTER_REG_ENUM_KEY extends IUnknown {

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
     * @param {Integer} dwIndex 
     * @param {PWSTR} lpszName 
     * @param {Pointer<Integer>} lpcchName 
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
    Invoke(hKey_, dwIndex, lpszName, lpcchName, lpftLastWriteTime) {
        hKey_ := hKey_ is Win32Handle ? NumGet(hKey_, "ptr") : hKey_
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hKey_, "uint", dwIndex, "ptr", lpszName, lpcchNameMarshal, lpcchName, "ptr", lpftLastWriteTime, "int")
        return result
    }
}
