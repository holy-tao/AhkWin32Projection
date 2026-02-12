#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPGetSockOpt function retrieves a socket option.
 * @remarks
 * The **LPWSPGetSockOpt** function retrieves the current value for a socket option associated with a socket of any type, in any state, and stores the result in <i>optval</i>. Options can exist at multiple protocol levels, but they are always present at the uppermost socket' level. Options affect socket operations, such as the routing of packets and OOB data transfer.
 * 
 * The value associated with the selected option is returned in the buffer <i>optval</i>. The integer pointed to by <i>optlen</i> should originally contain the size of this buffer; on return, it will be set to the size of the value returned. For SO_LINGER, this will be the size of a structure linger; for most other options it will be the size of an integer.
 * 
 * The Windows Sockets SPI client is responsible for allocating any memory space pointed to directly or indirectly by any of the parameters it specifies.
 * 
 * If the option was never set with <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsetsockopt">LPWSPSetSockOpt</a></b>, then **LPWSPGetSockOpt** returns the default value for the option.
 * 
 * For more information on socket options, see <b><a href="https://docs.microsoft.com/windows/win32/winsock/socket-options">Socket Options</a></b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspgetsockopt
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPGETSOCKOPT extends IUnknown {

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
     * @param {SOCKET} s 
     * @param {Integer} level 
     * @param {Integer} optname 
     * @param {Pointer} optval 
     * @param {Pointer<Integer>} optlen 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, level, optname, optval, optlen, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        optlenMarshal := optlen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "int", level, "int", optname, "ptr", optval, optlenMarshal, optlen, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
