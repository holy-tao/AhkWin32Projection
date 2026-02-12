#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_GET_CLUSTER_NETWORK_ID extends IUnknown {

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
     * @param {HNETWORK} hNetwork_ 
     * @param {PWSTR} lpszNetworkId 
     * @param {Pointer<Integer>} lpcchName 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hNetwork_, lpszNetworkId, lpcchName) {
        hNetwork_ := hNetwork_ is Win32Handle ? NumGet(hNetwork_, "ptr") : hNetwork_
        lpszNetworkId := lpszNetworkId is String ? StrPtr(lpszNetworkId) : lpszNetworkId

        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hNetwork_, "ptr", lpszNetworkId, lpcchNameMarshal, lpcchName, "uint")
        return result
    }
}
