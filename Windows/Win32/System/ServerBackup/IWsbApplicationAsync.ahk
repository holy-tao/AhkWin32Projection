#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines methods to monitor and control the progress of an asynchronous operation.
 * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nn-wsbapp-iwsbapplicationasync
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class IWsbApplicationAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWsbApplicationAsync
     * @type {Guid}
     */
    static IID => Guid("{0843f6f7-895c-44a6-b0c2-05a5022aa3a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryStatus", "Abort"]

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationasync-querystatus
     */
    QueryStatus(phrResult) {
        result := ComCall(3, this, "ptr", phrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationasync-abort
     */
    Abort() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
