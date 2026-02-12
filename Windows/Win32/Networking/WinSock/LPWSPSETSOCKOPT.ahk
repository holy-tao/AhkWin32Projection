#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPSetSockOpt function sets a socket option.
 * @remarks
 * The **LPWSPSetSockOpt** function sets the current value for a socket option associated with a socket of any type, in any state. Although options can exist at multiple protocol levels, they are always present at the uppermost socket level. Options affect socket operations, such as whether broadcast messages can be sent on the socket.
 * 
 * There are two types of socket options: Boolean options that enable or disable a feature or behavior, and options that require an integer value or structure. To enable a Boolean option, <i>optval</i> points to a nonzero integer. To disable the option, <i>optval</i> points to an integer equal to zero. The <i>optlen</i> parameter should be equal to sizeof (int) for Boolean options. For other options, <i>optval</i> points to an integer or structure that contains the desired value for the option, and <i>optlen</i> is the length of the integer or structure.
 * 
 * For more information about socket options, see <b><a href="https://docs.microsoft.com/windows/win32/winsock/socket-options">Socket Options</a></b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspsetsockopt
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPSETSOCKOPT extends IUnknown {

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
     * @param {Integer} optlen 
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

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "int", level, "int", optname, "ptr", optval, "int", optlen, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
