#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_GET_CLUSTER_NOTIFY_V2 extends IUnknown {

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
     * @param {HCHANGE} hChange_ 
     * @param {Pointer<Pointer>} lpdwNotifyKey 
     * @param {Pointer<NOTIFY_FILTER_AND_TYPE>} pFilterAndType 
     * @param {Pointer<Integer>} buffer_ 
     * @param {Pointer<Integer>} lpcchBufferSize 
     * @param {PWSTR} lpszObjectId 
     * @param {Pointer<Integer>} lpcchObjectId 
     * @param {PWSTR} lpszParentId 
     * @param {Pointer<Integer>} lpcchParentId 
     * @param {PWSTR} lpszName 
     * @param {Pointer<Integer>} lpcchName 
     * @param {PWSTR} lpszType 
     * @param {Pointer<Integer>} lpcchType 
     * @param {Integer} dwMilliseconds 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hChange_, lpdwNotifyKey, pFilterAndType, buffer_, lpcchBufferSize, lpszObjectId, lpcchObjectId, lpszParentId, lpcchParentId, lpszName, lpcchName, lpszType, lpcchType, dwMilliseconds) {
        hChange_ := hChange_ is Win32Handle ? NumGet(hChange_, "ptr") : hChange_
        lpszObjectId := lpszObjectId is String ? StrPtr(lpszObjectId) : lpszObjectId
        lpszParentId := lpszParentId is String ? StrPtr(lpszParentId) : lpszParentId
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        lpszType := lpszType is String ? StrPtr(lpszType) : lpszType

        lpdwNotifyKeyMarshal := lpdwNotifyKey is VarRef ? "ptr*" : "ptr"
        buffer_Marshal := buffer_ is VarRef ? "char*" : "ptr"
        lpcchBufferSizeMarshal := lpcchBufferSize is VarRef ? "uint*" : "ptr"
        lpcchObjectIdMarshal := lpcchObjectId is VarRef ? "uint*" : "ptr"
        lpcchParentIdMarshal := lpcchParentId is VarRef ? "uint*" : "ptr"
        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"
        lpcchTypeMarshal := lpcchType is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hChange_, lpdwNotifyKeyMarshal, lpdwNotifyKey, "ptr", pFilterAndType, buffer_Marshal, buffer_, lpcchBufferSizeMarshal, lpcchBufferSize, "ptr", lpszObjectId, lpcchObjectIdMarshal, lpcchObjectId, "ptr", lpszParentId, lpcchParentIdMarshal, lpcchParentId, "ptr", lpszName, lpcchNameMarshal, lpcchName, "ptr", lpszType, lpcchTypeMarshal, lpcchType, "uint", dwMilliseconds, "uint")
        return result
    }
}
