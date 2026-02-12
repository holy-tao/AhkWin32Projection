#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_ACCEPTEX extends IUnknown {

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
     * @param {SOCKET} sListenSocket 
     * @param {SOCKET} sAcceptSocket 
     * @param {Pointer<Void>} lpOutputBuffer 
     * @param {Integer} dwReceiveDataLength 
     * @param {Integer} dwLocalAddressLength 
     * @param {Integer} dwRemoteAddressLength 
     * @param {Pointer<Integer>} lpdwBytesReceived 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sListenSocket, sAcceptSocket, lpOutputBuffer, dwReceiveDataLength, dwLocalAddressLength, dwRemoteAddressLength, lpdwBytesReceived, lpOverlapped) {
        sListenSocket := sListenSocket is Win32Handle ? NumGet(sListenSocket, "ptr") : sListenSocket
        sAcceptSocket := sAcceptSocket is Win32Handle ? NumGet(sAcceptSocket, "ptr") : sAcceptSocket

        lpOutputBufferMarshal := lpOutputBuffer is VarRef ? "ptr" : "ptr"
        lpdwBytesReceivedMarshal := lpdwBytesReceived is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", sListenSocket, "ptr", sAcceptSocket, lpOutputBufferMarshal, lpOutputBuffer, "uint", dwReceiveDataLength, "uint", dwLocalAddressLength, "uint", dwRemoteAddressLength, lpdwBytesReceivedMarshal, lpdwBytesReceived, "ptr", lpOverlapped, "int")
        return result
    }
}
