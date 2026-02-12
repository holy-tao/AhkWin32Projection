#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_GETACCEPTEXSOCKADDRS extends IUnknown {

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
     * @param {Pointer<Void>} lpOutputBuffer 
     * @param {Integer} dwReceiveDataLength 
     * @param {Integer} dwLocalAddressLength 
     * @param {Integer} dwRemoteAddressLength 
     * @param {Pointer<Pointer<SOCKADDR>>} LocalSockaddr 
     * @param {Pointer<Integer>} LocalSockaddrLength 
     * @param {Pointer<Pointer<SOCKADDR>>} RemoteSockaddr 
     * @param {Pointer<Integer>} RemoteSockaddrLength 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpOutputBuffer, dwReceiveDataLength, dwLocalAddressLength, dwRemoteAddressLength, LocalSockaddr, LocalSockaddrLength, RemoteSockaddr, RemoteSockaddrLength) {
        lpOutputBufferMarshal := lpOutputBuffer is VarRef ? "ptr" : "ptr"
        LocalSockaddrMarshal := LocalSockaddr is VarRef ? "ptr*" : "ptr"
        LocalSockaddrLengthMarshal := LocalSockaddrLength is VarRef ? "int*" : "ptr"
        RemoteSockaddrMarshal := RemoteSockaddr is VarRef ? "ptr*" : "ptr"
        RemoteSockaddrLengthMarshal := RemoteSockaddrLength is VarRef ? "int*" : "ptr"

        ComCall(3, this, lpOutputBufferMarshal, lpOutputBuffer, "uint", dwReceiveDataLength, "uint", dwLocalAddressLength, "uint", dwRemoteAddressLength, LocalSockaddrMarshal, LocalSockaddr, LocalSockaddrLengthMarshal, LocalSockaddrLength, RemoteSockaddrMarshal, RemoteSockaddr, RemoteSockaddrLengthMarshal, RemoteSockaddrLength)
    }
}
