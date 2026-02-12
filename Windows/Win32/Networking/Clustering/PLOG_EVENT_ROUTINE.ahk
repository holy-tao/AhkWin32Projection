#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Records an event in the cluster log.
 * @remarks
 * The <i>LogEvent</i> callback function is implemented by the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> and is called by a 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> to report events and errors to the cluster log. 
 *      Resource DLLs receive a pointer to the <i>LogEvent</i> callback 
 *      function in the <i>LogEvent</i> parameter to their 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a> entry-point function.
 * 
 * <i>LogEvent</i> does not write entries to the event log. To 
 *      report events in the event log, a resource DLL must call the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-reporteventa">ReportEvent</a> function.
 * 
 * The format of the logged message appears as follows:
 * 
 * <i>ResourceTypeName</i><b>
 * </b><i>ResourceName</i><b>: </b><i>message</i>
 * 
 * <i>ResourceTypeName</i> is the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource type</a>, such as 
 *      "Generic Application". The specific resource name is the user-friendly name for the specific 
 *      resource, and message is the message delivered by the resource DLL to the Resource Monitor.
 * 
 * The log entry size is limited to 500 characters.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-plog_event_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PLOG_EVENT_ROUTINE extends IUnknown {

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
     * @param {Pointer} ResourceHandle 
     * @param {Integer} LogLevel 
     * @param {PWSTR} FormatString 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceHandle, LogLevel, FormatString) {
        FormatString := FormatString is String ? StrPtr(FormatString) : FormatString

        ComCall(3, this, "ptr", ResourceHandle, "int", LogLevel, "ptr", FormatString)
    }
}
