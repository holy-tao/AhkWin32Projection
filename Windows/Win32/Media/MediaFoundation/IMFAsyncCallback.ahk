#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface to notify the application when an asynchronous method completes.
 * @remarks
 * 
 * For more information about asynchronous methods in Microsoft Media Foundation, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-callback-methods">Asynchronous Callback Methods</a>.
 *       
 * 
 * This interface is also used to perform  a work item in a Media Foundation work-queue. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queues">Work Queues</a>. 
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfasynccallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAsyncCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAsyncCallback
     * @type {Guid}
     */
    static IID => Guid("{a27003cf-2354-4f2a-8d6a-ab7cff15437e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameters", "Invoke"]

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pdwQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters
     */
    GetParameters(pdwFlags, pdwQueue) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwQueueMarshal := pdwQueue is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pdwQueueMarshal, pdwQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pAsyncResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfasynccallback-invoke
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "HRESULT")
        return result
    }
}
