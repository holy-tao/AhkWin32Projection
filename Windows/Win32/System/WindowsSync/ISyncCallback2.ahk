#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncCallback.ahk

/**
 * Represents additional application callbacks that are used to notify the application of synchronization events.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isynccallback2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncCallback2 extends ISyncCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncCallback2
     * @type {Guid}
     */
    static IID => Guid("{47ce84af-7442-4ead-8630-12015e030ad7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChangeApplied", "OnChangeFailed"]

    /**
     * 
     * @param {Integer} dwChangesApplied 
     * @param {Integer} dwChangesFailed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback2-onchangeapplied
     */
    OnChangeApplied(dwChangesApplied, dwChangesFailed) {
        result := ComCall(8, this, "uint", dwChangesApplied, "uint", dwChangesFailed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangesApplied 
     * @param {Integer} dwChangesFailed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback2-onchangefailed
     */
    OnChangeFailed(dwChangesApplied, dwChangesFailed) {
        result := ComCall(9, this, "uint", dwChangesApplied, "uint", dwChangesFailed, "HRESULT")
        return result
    }
}
