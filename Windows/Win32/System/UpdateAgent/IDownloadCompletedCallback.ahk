#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the callback that is used when an asynchronous download is completed.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadcompletedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadCompletedCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadCompletedCallback
     * @type {Guid}
     */
    static IID => Guid("{77254866-9f5b-4c8e-b9e2-c77a8530d64b}")

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
     * 
     * @param {IDownloadJob} downloadJob 
     * @param {IDownloadCompletedCallbackArgs} callbackArgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadcompletedcallback-invoke
     */
    Invoke(downloadJob, callbackArgs) {
        result := ComCall(3, this, "ptr", downloadJob, "ptr", callbackArgs, "HRESULT")
        return result
    }
}
