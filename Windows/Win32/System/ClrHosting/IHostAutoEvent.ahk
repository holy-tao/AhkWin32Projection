#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostAutoEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostAutoEvent
     * @type {Guid}
     */
    static IID => Guid("{50b0cfce-4063-4278-9673-e5cb4ed0bdb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Wait", "Set"]

    /**
     * Waits for an event to occur for a specified communications device. The set of events that are monitored by this function is contained in the event mask associated with the device handle.
     * @remarks
     * The 
     * <b>WaitCommEvent</b> function monitors a set of events for a specified communications resource. To set and query the current event mask of a communications resource, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommmask">GetCommMask</a> functions.
     * 
     * If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_PENDING</b>, indicating that the operation is executing in the background. When this happens, the system sets the <b>hEvent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure to the not-signaled state before 
     * <b>WaitCommEvent</b> returns, and then it sets it to the signaled state when one of the specified events or an error occurs. The calling process can use one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a> to determine the event object's state and then use the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine the results of the 
     * <b>WaitCommEvent</b> operation. 
     * <b>GetOverlappedResult</b> reports the success or failure of the operation, and the variable pointed to by the <i>lpEvtMask</i> parameter is set to indicate the event that occurred.
     * 
     * If a process attempts to change the device handle's event mask by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> function while an overlapped 
     * <b>WaitCommEvent</b> operation is in progress, 
     * <b>WaitCommEvent</b> returns immediately. The variable pointed to by the <i>lpEvtMask</i> parameter is set to zero.
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-waitcommevent
     */
    Wait(dwMilliseconds, option) {
        result := ComCall(3, this, "uint", dwMilliseconds, "uint", option, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set Large Data (Native Client OLE DB provider)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/set-large-data-ole-db
     */
    Set() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
