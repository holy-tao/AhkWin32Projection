#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_GET_CLUSTER_GROUP_STATE extends IUnknown {

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
     * @param {HGROUP} hGroup_ 
     * @param {PWSTR} lpszNodeName 
     * @param {Pointer<Integer>} lpcchNodeName 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hGroup_, lpszNodeName, lpcchNodeName) {
        hGroup_ := hGroup_ is Win32Handle ? NumGet(hGroup_, "ptr") : hGroup_
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        lpcchNodeNameMarshal := lpcchNodeName is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hGroup_, "ptr", lpszNodeName, lpcchNodeNameMarshal, lpcchNodeName, "int")
        return result
    }
}
