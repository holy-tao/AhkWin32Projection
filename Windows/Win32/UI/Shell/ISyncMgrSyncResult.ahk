#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that applications calling ISyncMgrControl can use to get the result of a ISyncMgrControl::StartHandlerSync or ISyncMgrControl::StartItemSync call.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrsyncresult
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSyncResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrSyncResult
     * @type {Guid}
     */
    static IID => Guid("{2b90f17e-5a3e-4b33-bb7f-1bc48056b94d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Result"]

    /**
     * 
     * @param {Integer} nStatus 
     * @param {Integer} cError 
     * @param {Integer} cConflicts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncresult-result
     */
    Result(nStatus, cError, cConflicts) {
        result := ComCall(3, this, "int", nStatus, "uint", cError, "uint", cConflicts, "HRESULT")
        return result
    }
}
