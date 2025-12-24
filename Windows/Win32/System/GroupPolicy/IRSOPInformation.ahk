#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IRSOPInformation interface provides methods for Microsoft Management Console (MMC) extension snap-ins to communicate with the main Resultant Set of Policy (RSoP) snap-in. For more information about MMC, see the Microsoft Management Console.
 * @see https://docs.microsoft.com/windows/win32/api//gpedit/nn-gpedit-irsopinformation
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IRSOPInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRSOPInformation
     * @type {Guid}
     */
    static IID => Guid("{9a5a81b5-d9c7-49ef-9d11-ddf50968c48d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNamespace", "GetFlags", "GetEventLogEntryText"]

    /**
     * 
     * @param {Integer} dwSection 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-irsopinformation-getnamespace
     */
    GetNamespace(dwSection, pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "uint", dwSection, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * The GetFlags method retrieves information about the RSoP user interface session.
     * @param {Pointer<Integer>} pdwFlags Receives a pointer to a value that contains information about the RSoP session. This parameter can be the following value.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-irsopinformation-getflags
     */
    GetFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * The GetEventLogEntryText method returns the text for a specific entry in the event log.
     * @param {PWSTR} pszEventSource Specifies the name of the source (application, service, driver, subsystem) that generated the log entry.
     * @param {PWSTR} pszEventLogName Specifies the name of the event log.
     * @param {PWSTR} pszEventTime Specifies the time the event was logged, in Windows Management Instrumentation (WMI) format. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/date-and-time-format">Date and Time Format</a> in the WMI documentation.
     * @param {Integer} dwEventID Specifies the event ID.
     * @returns {PWSTR} Receives the pointer to a buffer containing the text of the event log entry. The calling application must free the memory allocated for this buffer with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-irsopinformation-geteventlogentrytext
     */
    GetEventLogEntryText(pszEventSource, pszEventLogName, pszEventTime, dwEventID) {
        pszEventSource := pszEventSource is String ? StrPtr(pszEventSource) : pszEventSource
        pszEventLogName := pszEventLogName is String ? StrPtr(pszEventLogName) : pszEventLogName
        pszEventTime := pszEventTime is String ? StrPtr(pszEventTime) : pszEventTime

        result := ComCall(5, this, "ptr", pszEventSource, "ptr", pszEventLogName, "ptr", pszEventTime, "uint", dwEventID, "ptr*", &ppszText := 0, "HRESULT")
        return ppszText
    }
}
