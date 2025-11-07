#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICrmMonitorClerks.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Captures a snapshot of the current state of the CRM and holds a specific CRM clerk.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmmonitor
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmMonitor
     * @type {Guid}
     */
    static IID => Guid("{70c8e443-c7ed-11d1-82fb-00a0c91eede9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClerks", "HoldClerk"]

    /**
     * 
     * @returns {ICrmMonitorClerks} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitor-getclerks
     */
    GetClerks() {
        result := ComCall(3, this, "ptr*", &pClerks := 0, "HRESULT")
        return ICrmMonitorClerks(pClerks)
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitor-holdclerk
     */
    HoldClerk(Index) {
        pItem := VARIANT()
        result := ComCall(4, this, "ptr", Index, "ptr", pItem, "HRESULT")
        return pItem
    }
}
