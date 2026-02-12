#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD extends IUnknown {

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
     * @param {PWSTR} lpszClusterName 
     * @param {PWSTR} lpszNewPassword 
     * @param {Integer} dwFlags 
     * @param {Pointer} lpReturnStatusBuffer 
     * @param {Pointer<Integer>} lpcbReturnStatusBufferSize 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpszClusterName, lpszNewPassword, dwFlags, lpReturnStatusBuffer, lpcbReturnStatusBufferSize) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName
        lpszNewPassword := lpszNewPassword is String ? StrPtr(lpszNewPassword) : lpszNewPassword

        lpcbReturnStatusBufferSizeMarshal := lpcbReturnStatusBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", lpszClusterName, "ptr", lpszNewPassword, "uint", dwFlags, "ptr", lpReturnStatusBuffer, lpcbReturnStatusBufferSizeMarshal, lpcbReturnStatusBufferSize, "uint")
        return result
    }
}
