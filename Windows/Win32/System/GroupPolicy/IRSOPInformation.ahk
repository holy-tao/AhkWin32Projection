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
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-irsopinformation-getflags
     */
    GetFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszEventSource 
     * @param {PWSTR} pszEventLogName 
     * @param {PWSTR} pszEventTime 
     * @param {Integer} dwEventID 
     * @param {Pointer<PWSTR>} ppszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-irsopinformation-geteventlogentrytext
     */
    GetEventLogEntryText(pszEventSource, pszEventLogName, pszEventTime, dwEventID, ppszText) {
        pszEventSource := pszEventSource is String ? StrPtr(pszEventSource) : pszEventSource
        pszEventLogName := pszEventLogName is String ? StrPtr(pszEventLogName) : pszEventLogName
        pszEventTime := pszEventTime is String ? StrPtr(pszEventTime) : pszEventTime

        result := ComCall(5, this, "ptr", pszEventSource, "ptr", pszEventLogName, "ptr", pszEventTime, "uint", dwEventID, "ptr", ppszText, "HRESULT")
        return result
    }
}
