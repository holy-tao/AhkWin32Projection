#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CACHE_KEY_COMPARE extends IUnknown {

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
     * @param {Integer} cbKey1 
     * @param {Pointer<Integer>} lpbKey1 
     * @param {Integer} cbKey2 
     * @param {Pointer<Integer>} lpbKey2 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(cbKey1, lpbKey1, cbKey2, lpbKey2) {
        lpbKey1Marshal := lpbKey1 is VarRef ? "char*" : "ptr"
        lpbKey2Marshal := lpbKey2 is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbKey1, lpbKey1Marshal, lpbKey1, "uint", cbKey2, lpbKey2Marshal, lpbKey2, "int")
        return result
    }
}
