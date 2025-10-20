#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Handles the notification that indicates a change in the progress of an asynchronous download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadprogresschangedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadProgressChangedCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadProgressChangedCallback
     * @type {Guid}
     */
    static IID => Guid("{8c3f1cdd-6173-4591-aebd-a56a53ca77c1}")

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
     * @param {IDownloadProgressChangedCallbackArgs} callbackArgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogresschangedcallback-invoke
     */
    Invoke(downloadJob, callbackArgs) {
        result := ComCall(3, this, "ptr", downloadJob, "ptr", callbackArgs, "HRESULT")
        return result
    }
}
