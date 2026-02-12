#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPGetQOSByName function initializes a QOS structure based on a named template, or retrieves an enumeration of the available template names.
 * @remarks
 * Clients can use <i>WSPGetQOSByName</i> to initialize a <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/qos-structures">QOS</a></b> structure to a set of known values appropriate for a particular service class or media type. These values are stored in a template that is referenced by a well-known name. The client may retrieve these values by setting the **buf** member of the **WSABUF** indicated by <i>lpQOSName</i> to point to a Unicode string of nonzero length specifying a template name. In this case the usage of <i>lpQOSName</i> is IN only, and results are returned through <i>lpQOS</i>.
 * 
 * Alternatively, the client may use **LPWSPGetQOSByName** to retrieve an enumeration of available template names. The client may do this by setting the **buf** member of the **WSABUF** indicated by <i>lpQOSName</i> to a zero-length null-terminated Unicode string. In this case, the buffer indicated by **buf** is overwritten with a sequence of as many null-terminated Unicode template name strings as are available up to the number of bytes available in **buf** as indicated by the **len** member of the **WSABUF** indicated by <i>lpQOSName</i>. The list of names itself is terminated by a zero-length Unicode name string. When **LPWSPGetQOSByName** is used to retrieve template names, the <i>lpQOS</i> parameter is ignored.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspgetqosbyname
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPGETQOSBYNAME extends IUnknown {

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
     * @param {Pointer<WSABUF>} lpQOSName 
     * @param {Pointer<QOS>} lpQOS 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, lpQOSName, lpQOS, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", lpQOSName, "ptr", lpQOS, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
