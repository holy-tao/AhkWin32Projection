#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Collects the performance data and returns it to the consumer.
 * @remarks
 * If the requested objects specified in the *lpValueName* parameter do not correspond to any of the object indexes that your performance DLL supports, leave the *pData* parameter unchanged (where *pData* refers to the pointer pointed to by *lppData*), and set the *lpcbTotalBytes* and *lpNumObjectTypes* parameters to zero. This indicates that no data was returned.
 * 
 * If you support one or more of the queried objects, determine whether the size of the *pData* buffer as specified by *lpcbTotalBytes* is large enough to store the data. If not, leave *pData* unchanged, and set *lpcbTotalBytes* and *lpNumObjectTypes* to zero. No attempt is made to indicate the required buffer size, because this may change before the next call. Return **ERROR_MORE_DATA**.
 * 
 * If your data collection is time-consuming, you should respond only to queries for specific objects, or costly queries. You should also lower the priority of the thread collecting the data, so that it does not adversely affect system performance. For the query string format, see [Using the Registry Functions to Consume Counter Data](/windows/desktop/PerfCtrs/using-the-registry-functions-to-consume-counter-data).
 * 
 * If the consumer is running on another computer (remotely), then the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa372200(v=vs.85)">OpenPerformanceData</a>, [ClosePerformanceData](/windows/desktop/api/winperf/nc-winperf-pm_close_proc), and **CollectPerformanceData** functions are called in the context of the Winlogon process, which handles the server side of the remote connection. This distinction is important when troubleshooting problems that occur only remotely.
 * 
 * After your function returns successfully, the system can perform some basic tests to ensure the integrity of the data. By default, no tests are performed. If a test fails, the system generates an event log message and the data is discarded to prevent any further problems due to pointers that are not valid. The following registry value controls the test level: `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Perflib\ExtCounterTestLevel`.
 * 
 * The following are the possible test levels for **ExtCounterTestLevel**. 
 * 
 * | Level | Meaning |
 * |-------|---------|
 * | 1 | Test the pointers and buffers of trusted counter DLLs. Sends a copy of the user's buffer. |
 * | 2 | Test pointers and buffer lengths but does not test pointer references or buffer contents. Sends a copy of the user's buffer. |
 * | 3 | Do not test pointers or buffers. Sends a copy of the user's buffer. |
 * | 4 | Do not test pointers or buffers. Sends the user's buffer, not a copy. This is the default value. |
 * 
 * The following tests are performed at levels 1 and 2:
 * 
 * - Verifies that the value of *lpcbTotalBytes* is consistent with the returned buffer pointer, *pData*. If you add the *lpcbTotalBytes* value to the original buffer pointer passed to this function, you should end up with the same buffer pointer returned by this function. If they are not the same, an error message is logged and the data is ignored.
 * - Verify that a buffer overrun did not occur. The system adds a 1-KB guard page before and after the consumer-allocated buffer. If the returned buffer pointer, *pData*, points past the first byte of the appended guard page, then it is assumed that the buffer is not valid and the data is ignored. If the buffer pointer exceeds the end of the buffer, but not the end of the guard page, then a buffer overrun error is logged. If the buffer pointer is past the end of the guard page, then a heap error is logged because the heap that the buffer was allocated from could have been corrupted, causing other memory errors.
 * - Verify that the guard pages have not been corrupted. The 1-KB guard pages that were added before and after the buffer are initialized with a data pattern before this function is called. This data pattern is checked after the collect procedure returns. If any discrepancy is detected, a buffer overrun or other memory error is assumed and the data is ignored.
 * 
 * The following tests are performed only if test level 1 is used:
 * 
 * - Verify that the sum of each object's **TotalByteLength** member is the same as the value of *lpcbTotalBytes*. If not, the data is ignored.
 * - Verify that the **ByteLength** member of each instance is consistent. The lengths are consistent if the next object or end of buffer follows the last instance. If not, the data is ignored.
 * @see https://learn.microsoft.com/windows/win32/api//content/winperf/nc-winperf-pm_collect_proc
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PM_COLLECT_PROC extends IUnknown {

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
     * @param {PWSTR} pValueName 
     * @param {Pointer} ppData 
     * @param {Pointer<Integer>} pcbTotalBytes 
     * @param {Pointer<Integer>} pNumObjectTypes 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pValueName, ppData, pcbTotalBytes, pNumObjectTypes) {
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        pcbTotalBytesMarshal := pcbTotalBytes is VarRef ? "uint*" : "ptr"
        pNumObjectTypesMarshal := pNumObjectTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pValueName, "ptr", ppData, pcbTotalBytesMarshal, pcbTotalBytes, pNumObjectTypesMarshal, pNumObjectTypes, "uint")
        return result
    }
}
