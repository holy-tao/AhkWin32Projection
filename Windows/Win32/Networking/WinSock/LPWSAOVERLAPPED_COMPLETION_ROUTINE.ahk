#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * TBD (LPWSAOVERLAPPED_COMPLETION_ROUTINE)
 * @remarks
 * See [**LPOVERLAPPED_COMPLETION_ROUTINE**](../minwinbase/nc-minwinbase-lpoverlapped_completion_routine.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/winsock2/nc-winsock2-lpwsaoverlapped_completion_routine
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSAOVERLAPPED_COMPLETION_ROUTINE extends IUnknown {

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
     * @param {Integer} dwError 
     * @param {Integer} cbTransferred 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Integer} dwFlags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwError, cbTransferred, lpOverlapped, dwFlags) {
        ComCall(3, this, "uint", dwError, "uint", cbTransferred, "ptr", lpOverlapped, "uint", dwFlags)
    }
}
