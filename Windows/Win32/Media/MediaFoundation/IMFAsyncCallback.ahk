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
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Pointer<UInt32>} pdwQueue 
     * @returns {HRESULT} 
     */
    GetParameters(pdwFlags, pdwQueue) {
        result := ComCall(3, this, "uint*", pdwFlags, "uint*", pdwQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pAsyncResult 
     * @returns {HRESULT} 
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
